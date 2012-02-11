Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCwz-0002XL-3I
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:25:13 +0100
Received: by eaal10 with SMTP id l10so984362eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=v6YGnbtq3iCqwLBLAehjxQbJ9plmfcGyTPXeZT88Ilw=;
	b=jDDSAmzlp6b/aAVHYdiIF8GuuRXU+CptVYfSNH5h0ypmuIM5GU7tWkAUgne+jOG/bq
	2fYiDj3HB2juWzEs4yJ3HaG20r1kkUqJKkMKGSUXOh8m5P/dDPFD3B4RKuhYjFzqCuFj
	tFdZvm8fz5mdYIEZYfZHoMbE2iRSNUh6q+g84=
MIME-Version: 1.0
Received: by 10.14.206.133 with SMTP id l5mr3160921eeo.22.1328966226281; Sat,
	11 Feb 2012 05:17:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:17:06 -0800 (PST)
In-Reply-To: <1328925603-2967-5-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-5-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:17:06 -0200
X-Google-Sender-Auth: tV9pyjVsPzUnxm_DNNX14h30RHI
Message-ID: <CAP9ODKrz_VcrV00kiigLMtJuUvW5onT_v1NYHqgr-=bwb63hkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 5/7] automatically install all *.service and *.socket supplied in recipe's SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Feb 2012 13:25:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sat, Feb 11, 2012 at 00:00, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/systemd.bbclass |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/classes/systemd.bbclass
> b/meta-oe/classes/systemd.bbclass
> index ffcabe9..3c1ed14 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -74,6 +74,17 @@ python __anonymous() {
>     systemd_after_parse(d)
>  }
>
> +# automatically install all *.service and *.socket supplied in recipe's
> SRC_URI
> +do_install_append() {
> +    install -d ${D}${base_libdir}/systemd/system
> +    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o
> -name '*.socket'` ; do
> +       # ensure installing systemd-files only (e.g not avahi *.service)
> +       if grep -q '\[Unit\]' $service ; then
> +               install -m 644 $service ${D}${base_libdir}/systemd/system
> +       fi
> +    done
> +}
> +
>  python populate_packages_prepend () {
>        def systemd_prepost_instrm(pkg):
>                bb.debug(1, 'adding systemd calls to postinst/postrm for
> %s' % pkg)
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

