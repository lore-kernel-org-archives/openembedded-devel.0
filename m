Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyRD-0006WN-Su
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:19:44 +0100
Received: by mail-vx0-f175.google.com with SMTP id fl15so1582129vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=/J5JDWrZzL8GRJNVbVQT6OMOTAH5jhsFcKJ3JE3mols=;
	b=NmB/7HBYf7LKA9FScztzMcTlUSyMeIseF9WlGgeLi7wJmCD8STemYTQyIKSy2N4m5c
	RCgxDHy9AmJLS9J1TeL/5WR5AXjp9B7IomGMJ/3H9d6Yko65748xv0ZEK9vC0MXq1ErZ
	DTlknzg0iCdFJNE7dlfi5fKHkKRt6vx5SM6JM=
MIME-Version: 1.0
Received: by 10.52.67.229 with SMTP id q5mr774831vdt.14.1329387091901; Thu, 16
	Feb 2012 02:11:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:11:31 -0800 (PST)
In-Reply-To: <1329357796-27398-9-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-9-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:11:31 -0200
X-Google-Sender-Auth: otwbztaDTk-cRhlubCKi16RJ4bo
Message-ID: <CAP9ODKoop7cfuAXeJU+C2qY1GXNpMwMXavJ7a-jCXy4P_C4s4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 08/22] connman: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:19:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../connman/connman_0.78.bbappend                  |    7 +------
>  1 files changed, 1 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
> b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
> index d6f756c..eacd7d9 100644
> --- a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
> +++ b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
> @@ -2,12 +2,7 @@ inherit systemd
>
>  EXTRA_OECONF +=3D "--with-systemdunitdir=3D${base_libdir}/systemd/system=
/"
>
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PRINC :=3D "${@int(PRINC) + 2}"
>
>  SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN}-systemd =3D "connman.service"
> -
> -# systemd files
> -PACKAGES =3D+ "${PN}-systemd"
> -FILES_${PN}-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_${PN}-systemd +=3D "${PN}"
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

