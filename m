Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PayW5-0002ws-HB
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 23:41:09 +0100
Received: by gxk20 with SMTP id 20so7168868gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 14:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=yHJt8uZAVYL52ejoEcCbbFT0K4ENSbjQ6utQ0NZFND8=;
	b=lXFiQsLbIQgOsUfopjwwHo3tZzQG9PY1i6YcNsakobJABJHWjGCSubXIpW5KFEdXMz
	rSvnnS3silWE0ZKZusA7PNnUMFyocLMVqD1K5oFC3H27iSHo0N+K/XwNKNkNDG4Xw8uM
	OOlx2qQYz0RuBkrDhbdcxb6eEntbGlIu8QqrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lvzJUaX+e9JFWq6KOVctlzmXmKT7j6tqXjhajGfVcDHRyW/MEfdETeGmGnNAhgymZM
	+jKr0Yg+4X/LougoWkcMzYUYI8pEDpajznTxliYu+rRl0oIddRh2aY6QJtCehmjNqAP+
	MSm8LDaScZ+/BLmmd6i4gg4yf8ubdl+nS5NVw=
Received: by 10.90.83.6 with SMTP id g6mr664772agb.4.1294353643692; Thu, 06
	Jan 2011 14:40:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 6 Jan 2011 14:40:23 -0800 (PST)
In-Reply-To: <1294318110-23521-4-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-4-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jan 2011 14:40:23 -0800
Message-ID: <AANLkTim+nR4Mfm4cB=tBCtc-QfeiaM0TNbHri6NAaY19@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] gcc: replace unconditional SRC_URI_append with SRC_URI +=
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
X-List-Received-Date: Thu, 06 Jan 2011 22:41:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 6, 2011 at 4:48 AM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> * Fixes missing leading whitespace character at some locations
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Khem Raj <raj.khem@gmail.com>

for sanity can you make sure that these patches are being picked up?
by doing bitbake -c patch

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/gcc/gcc-3.4.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc-3.4.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc-4.0.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc-canadian-sdk_4.2.4.bb | =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.2.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.2.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.2.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.3.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.3.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.3.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.4.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.4.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.4.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_4.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/gcc/gcc_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A016 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
> index 99e680f..8a3ce02 100644
> --- a/recipes/gcc/gcc-3.4.4.inc
> +++ b/recipes/gcc/gcc-3.4.4.inc
> @@ -26,7 +26,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-cross-fixincl.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-posix-open-fix.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> -SRC_URI_append =3D " file://zecke-no-host-includes.patch "
> +SRC_URI +=3D "file://zecke-no-host-includes.patch"
>
> =C2=A0SRC_URI[archive.md5sum] =3D "b594ff4ea4fbef4ba9220887de713dfe"
> =C2=A0SRC_URI[archive.sha256sum] =3D "3444179840638cb8664e8e53604900c4521=
d29d57785a5091202ee4937d8d0fd"
> diff --git a/recipes/gcc/gcc-3.4.6.inc b/recipes/gcc/gcc-3.4.6.inc
> index 5296f26..3991cdc 100644
> --- a/recipes/gcc/gcc-3.4.6.inc
> +++ b/recipes/gcc/gcc-3.4.6.inc
> @@ -23,7 +23,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
>
> =C2=A0SRC_URI +=3D "file://gcc34-configure.in.patch"
> =C2=A0SRC_URI +=3D "file://gcc34-thumb-support.patch"
> -SRC_URI_append =3D " file://zecke-no-host-includes.patch "
> +SRC_URI +=3D "file://zecke-no-host-includes.patch"
>
> =C2=A0SRC_URI[archive.md5sum] =3D "4a21ac777d4b5617283ce488b808da7b"
> =C2=A0SRC_URI[archive.sha256sum] =3D "7791a601878b765669022b8b3409fba33cc=
72f9e39340fec8af6d0e6f72dec39"
> diff --git a/recipes/gcc/gcc-4.0.2.inc b/recipes/gcc/gcc-4.0.2.inc
> index 63f9772..9d3c660 100644
> --- a/recipes/gcc/gcc-4.0.2.inc
> +++ b/recipes/gcc/gcc-4.0.2.inc
> @@ -13,7 +13,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://zecke-xgcc-cpp.patch "
>
> =C2=A0# uclibc patches below
> -SRC_URI_append =3D " file://100-uclibc-conf.patch =C2=A0 \
> +SRC_URI +=3D "file://100-uclibc-conf.patch =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://200-uclibc-locale.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://301-missing-execinfo_h.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://302-c99-snprintf.patch =C2=A0\
> diff --git a/recipes/gcc/gcc-canadian-sdk_4.2.4.bb b/recipes/gcc/gcc-cana=
dian-sdk_4.2.4.bb
> index 7a1402f..08a4c95 100644
> --- a/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
> +++ b/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
> @@ -14,7 +14,7 @@ DEPENDS =3D "gmp-canadian mpfr-canadian"
> =C2=A0require gcc-configure-canadian-sdk.inc
> =C2=A0require gcc-package-sdk.inc
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch \
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pr22=
133-mingw-path-fixup.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pr33=
281-mingw-host-fragment.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pr35=
916-mingw-__USE_MINGW_ACCESS-everywhere.patch \
> diff --git a/recipes/gcc/gcc_4.2.2.bb b/recipes/gcc/gcc_4.2.2.bb
> index 30713f8..4822da9 100644
> --- a/recipes/gcc/gcc_4.2.2.bb
> +++ b/recipes/gcc/gcc_4.2.2.bb
> @@ -4,6 +4,6 @@ require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> =C2=A0require gcc-package-target.inc
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> diff --git a/recipes/gcc/gcc_4.2.3.bb b/recipes/gcc/gcc_4.2.3.bb
> index 6fe3028..a174e11 100644
> --- a/recipes/gcc/gcc_4.2.3.bb
> +++ b/recipes/gcc/gcc_4.2.3.bb
> @@ -4,7 +4,7 @@ require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> =C2=A0require gcc-package-target.inc
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
>
> diff --git a/recipes/gcc/gcc_4.2.4.bb b/recipes/gcc/gcc_4.2.4.bb
> index 6fe3028..a174e11 100644
> --- a/recipes/gcc/gcc_4.2.4.bb
> +++ b/recipes/gcc/gcc_4.2.4.bb
> @@ -4,7 +4,7 @@ require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> =C2=A0require gcc-package-target.inc
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
>
> diff --git a/recipes/gcc/gcc_4.3.1.bb b/recipes/gcc/gcc_4.3.1.bb
> index 442c273..38ae714 100644
> --- a/recipes/gcc/gcc_4.3.1.bb
> +++ b/recipes/gcc/gcc_4.3.1.bb
> @@ -4,7 +4,7 @@ require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> =C2=A0require gcc-package-target.inc
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
>
> diff --git a/recipes/gcc/gcc_4.3.2.bb b/recipes/gcc/gcc_4.3.2.bb
> index c73dfc1..998f58c 100644
> --- a/recipes/gcc/gcc_4.3.2.bb
> +++ b/recipes/gcc/gcc_4.3.2.bb
> @@ -8,6 +8,6 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> diff --git a/recipes/gcc/gcc_4.3.3.bb b/recipes/gcc/gcc_4.3.3.bb
> index 274f474..263969a 100644
> --- a/recipes/gcc/gcc_4.3.3.bb
> +++ b/recipes/gcc/gcc_4.3.3.bb
> @@ -8,7 +8,7 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
>
> diff --git a/recipes/gcc/gcc_4.3.4.bb b/recipes/gcc/gcc_4.3.4.bb
> index ec20085..57ced16 100644
> --- a/recipes/gcc/gcc_4.3.4.bb
> +++ b/recipes/gcc/gcc_4.3.4.bb
> @@ -8,6 +8,6 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> diff --git a/recipes/gcc/gcc_4.4.1.bb b/recipes/gcc/gcc_4.4.1.bb
> index 52b09cf..30ab402 100644
> --- a/recipes/gcc/gcc_4.4.1.bb
> +++ b/recipes/gcc/gcc_4.4.1.bb
> @@ -8,7 +8,7 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
>
> diff --git a/recipes/gcc/gcc_4.4.2.bb b/recipes/gcc/gcc_4.4.2.bb
> index d1d50ad..55f05b5 100644
> --- a/recipes/gcc/gcc_4.4.2.bb
> +++ b/recipes/gcc/gcc_4.4.2.bb
> @@ -8,7 +8,7 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
>
> diff --git a/recipes/gcc/gcc_4.4.4.bb b/recipes/gcc/gcc_4.4.4.bb
> index 271e9d1..6aeac2f 100644
> --- a/recipes/gcc/gcc_4.4.4.bb
> +++ b/recipes/gcc/gcc_4.4.4.bb
> @@ -8,6 +8,6 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> diff --git a/recipes/gcc/gcc_4.5.bb b/recipes/gcc/gcc_4.5.bb
> index ad71ada..bc59b14 100644
> --- a/recipes/gcc/gcc_4.5.bb
> +++ b/recipes/gcc/gcc_4.5.bb
> @@ -10,6 +10,6 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto-wr=
apper \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> diff --git a/recipes/gcc/gcc_svn.bb b/recipes/gcc/gcc_svn.bb
> index 9b69a23..0332174 100644
> --- a/recipes/gcc/gcc_svn.bb
> +++ b/recipes/gcc/gcc_svn.bb
> @@ -8,6 +8,6 @@ FILES_${PN} +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${gcclibdir}/${TARGET_SYS}/*/*.o \
> =C2=A0"
>
> -SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +SRC_URI +=3D "file://fortran-cross-compile-hack.patch"
>
> =C2=A0ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> --
> 1.7.2.3
>
>


