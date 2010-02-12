Received: from mail-iw0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ng20O-00053B-W0
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 21:20:52 +0100
Received: by iwn12 with SMTP id 12so3016801iwn.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 12:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ji2Un87gwRo8ZZEL/1jGo7CBVcvwPF/NaHzr/1C20Ao=;
	b=GPYAYPksRbTfETgc9ruQsbKz3FfupHIpwnsO6NVwkbqBnuSWtQdlOqIdS0d2cy7LwI
	uYyf8JrbjXLLx6AYSjDRI6k/Xjmw8/sWFECMcdux4HdVJxUbM5Wtq86t2vD2LrSispxI
	G+yE/eH0RmupLmPYcsbV4fnuKu9eFLQpot3lE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=w58WrFoyF1K0FsiUvpIE9SdLU8Hr5GzOwXXCz9QHKOXW6x/PZ3DUSJWDO8Y6DpDC3n
	a+uW1+cD2Pbugd6vyEE9qNTsRu5tMWJk6LnI4w833Gv7EAinD7QvPBCLM2CMlcMD9vQG
	XlYSZrWJQZJJe2/9bAXljlsIBM3bI2zPU7ATo=
MIME-Version: 1.0
Received: by 10.231.167.4 with SMTP id o4mr15427iby.66.1266005892998; Fri, 12 
	Feb 2010 12:18:12 -0800 (PST)
In-Reply-To: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
References: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
Date: Fri, 12 Feb 2010 12:18:12 -0800
Message-ID: <19c1b8a91002121218q3ab4aaa2h7bd8ea01724e9a26@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.182
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc:
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
X-List-Received-Date: Fri, 12 Feb 2010 20:20:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2010 at 5:05 AM, Thomas Zimmermann <ml@vdm-design.de> wrote=
:
> * ldd has shebang #!/bin/bash: so add bash RDEPNDS
> * add libpthread_nonshared.a to eglibc-dev, needed for building
> =A0multithreaded apps on the device

patch is ok.

> ---
> =A0recipes/eglibc/eglibc-package.bbclass | =A0 =A03 ++-
> =A0recipes/eglibc/eglibc.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A02 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglib=
c-package.bbclass
> index fcaba47..7187363 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -45,10 +45,11 @@ libc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${ba=
se_libdir}/libcrypt-*.so ${ba
>
> =A0FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional(=
'USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> =A0FILES_ldd =3D "${bindir}/ldd"
> +RDEPENDS_ldd =3D "bash"
> =A0FILES_libsegfault =3D "${base_libdir}/libSegFault*"
> =A0FILES_eglibc-extra-nss =3D "${base_libdir}/libnss*"
> =A0FILES_sln =3D "/sbin/sln"
> -FILES_eglibc-dev_append =3D " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/l=
ibc_nonshared.a"
> +FILES_eglibc-dev_append =3D " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/l=
ibc_nonshared.a ${libdir}/libpthread_nonshared.a"
> =A0FILES_nscd =3D "${sbindir}/nscd*"
> =A0FILES_eglibc-utils =3D "${bindir}/* ${sbindir}/*"
> =A0FILES_eglibc-gconv =3D "${libdir}/gconv/*"
> diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
> index 356b838..5c06ae6 100644
> --- a/recipes/eglibc/eglibc.inc
> +++ b/recipes/eglibc/eglibc.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.eglibc.org/home"
> =A0SECTION =3D "libs"
> =A0PRIORITY =3D "required"
> =A0LICENSE =3D "LGPL"
> -INC_PR =3D "r8"
> +INC_PR =3D "r9"
> =A0# nptl needs unwind support in gcc, which can't be built without glibc=
.
> =A0DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-heade=
rs"
> =A0#this leads to circular deps, so lets not add it yet
> --
> 1.6.6.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


