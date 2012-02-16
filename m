Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyLr-0005GD-Tu
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:14:13 +0100
Received: by vbbff1 with SMTP id ff1so1547320vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=GAzQRlNzePdPnp2f/OxbeRSGFhiDoXVhwSMmmgATdWI=;
	b=E0T84rf7bvST2FuSmaL/GNRcxWpouk6D7VaLxUHgNUIdlLMfhVghujdECqz173zd5f
	+57x5ZKCFQg1CkpsLIPzfbla0SLUPVm6NfcDhfl9IcSafZRH8zx8flnavQrK01PYLT7N
	mcM/g66Zm25wpWgYNgiOm8DvuIgUcvcX5+O/g=
MIME-Version: 1.0
Received: by 10.52.66.225 with SMTP id i1mr742341vdt.65.1329386758798; Thu, 16
	Feb 2012 02:05:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:05:58 -0800 (PST)
In-Reply-To: <1329357796-27398-10-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-10-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:05:58 -0200
X-Google-Sender-Auth: _K1CEhNHBxd2WgQKTsTAWca_fB0
Message-ID: <CAP9ODKpfzNO7UxG-NQ3ntuV47Ed-c9djrQ0KsQADzdMqBw_CjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 09/22] dropbear: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:14:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../dropbear/dropbear_2011.54.bbappend             |   11 +----------
>  1 files changed, 1 insertions(+), 10 deletions(-)
>
> diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
> b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
> index 899e1fc..96cc8bd 100644
> --- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
> +++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
> @@ -1,6 +1,6 @@
>  inherit systemd
>
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PRINC :=3D "${@int(PRINC) + 2}"
>
>  # look for files in the layer first
>  FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> @@ -13,14 +13,5 @@ SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN}-systemd =3D "dropbear.socket"
>
>  do_install_append() {
> -       install -d ${D}${base_libdir}/systemd/system
> -       install -m 0644 ${WORKDIR}/dropbearkey.service
> ${D}${base_libdir}/systemd/system/
> -       install -m 0644 ${WORKDIR}/dropbear@.service
> ${D}${base_libdir}/systemd/system/
> -       install -m 0644 ${WORKDIR}/dropbear.socket
> ${D}${base_libdir}/systemd/system/
>        ln -sf /dev/null ${D}${base_libdir}/systemd/system/dropbear.servic=
e
>  }
> -
> -PACKAGES +=3D "${PN}-systemd"
> -
> -RDEPENDS_${PN}-systemd +=3D "dropbear"
> -FILES_${PN}-systemd =3D "${base_libdir}/systemd"
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

