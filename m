Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfIJD-0003qi-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 21:37:43 +0100
Received: by gyh20 with SMTP id 20so12146gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 12:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=bYnmc8O5BM3Fvr8Ow5PXYnbsWC2WMV5Kh53s8SpPqkE=;
	b=kaLpC/oyZreZRbWcB/stE8P3oqPyitr57SRY98MnlOZhq2pA2erlF+r0nk/QWorvW8
	jqo0G/jZXStpTO5Ld0yUF64gwY+VMtWclc1f8+eRaoPzc5Ar8LOyC5VES5He3BE363ca
	vWLuJs/hIET1NCBCVvDZ+6frkS3q9b7jztWtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AK1iEJ6nB8bx8JEf6oT2jwTCwIfb5fUr/w9v2MGh7owDgDiGRF62T069Wsi9pwnbpE
	hdyfUjPjY/gz91Z971vr+HR5j4kIG9sPcJKkI6g5BGL376f3WForzwzvEeeNj+RQQYq3
	wAbzMfFCw8+ITMHs7SzDqwuqgCvyKaEuG01vw=
Received: by 10.42.173.198 with SMTP id s6mr3575644icz.206.1295383019684; Tue,
	18 Jan 2011 12:36:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 18 Jan 2011 12:36:39 -0800 (PST)
In-Reply-To: <1295363929-13246-3-git-send-email-kergoth@gmail.com>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-3-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 12:36:39 -0800
Message-ID: <AANLkTikaBY6kvWmtngekD-5fbOD_kTzvzqvWzSu0FEKe@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/4] Add install wrapper rather than coreutils-native
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
X-List-Received-Date: Tue, 18 Jan 2011 20:37:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 7:18 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0bin/darwin/cp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A0bin/darwin/sed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0bin/install =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 28 ++++++++++++++++++++++++++++
> =C2=A0classes/base.bbclass =C2=A0 =C2=A0 =C2=A0 | =C2=A0 28 +++++++++----=
---------------
> =C2=A0classes/gpe.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0classes/gpephone.bbclass =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/twin/twin_0.4.6.bb | =C2=A0 =C2=A01 -
> =C2=A07 files changed, 41 insertions(+), 24 deletions(-)
> =C2=A0create mode 100755 bin/install
>
> diff --git a/bin/darwin/cp b/bin/darwin/cp
> index 0a523b7..a753557 100755
> --- a/bin/darwin/cp
> +++ b/bin/darwin/cp
> @@ -7,7 +7,7 @@
> =C2=A0# - Otherwise, we stick to what SuSv3 defines
>
>
> -source $(dirname $0)/wrapper.sh
> +source $(dirname $0)/../wrapper.sh
>
> =C2=A0saved=3D""
> =C2=A0while getopts fpaRHLP opt; do
> diff --git a/bin/darwin/sed b/bin/darwin/sed
> index 2200bd1..5c830e4 100755
> --- a/bin/darwin/sed
> +++ b/bin/darwin/sed
> @@ -21,7 +21,7 @@
> =C2=A0# to reimplement -i internally in this script on some platforms.
>
>
> -source $(dirname $0)/wrapper.sh
> +source $(dirname $0)/../wrapper.sh
>
> =C2=A0case `uname -s` in
> =C2=A0 =C2=A0 Darwin)
> diff --git a/bin/install b/bin/install
> new file mode 100755
> index 0000000..4ad8172
> --- /dev/null
> +++ b/bin/install
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +source $(dirname $0)/wrapper.sh
> +
> +saved=3D""
> +while getopts dbCcMpSsvB:f:g:m:o: opt; do
> + =C2=A0 =C2=A0case "$opt" in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0s)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ignore strip argument
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0B|f|g|m|o)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save "-$opt"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save "$OPTARG"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0\?)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save "-$opt"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0esac
> +done
> +shift $(($OPTIND - 1))
> +for arg; do
> + =C2=A0 =C2=A0save "$arg"
> +done
> +
> +exec_real
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 6fa292e..8804ec0 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -55,33 +55,23 @@ oe_runmake() {
> =C2=A0}
>
> =C2=A0def base_deps(d):
> - =C2=A0 =C2=A0 =C2=A0 #
> - =C2=A0 =C2=A0 =C2=A0 # Ideally this will check a flag so we will operat=
e properly in
> - =C2=A0 =C2=A0 =C2=A0 # the case where host =3D=3D build =3D=3D target, =
for now we don't work in
> - =C2=A0 =C2=A0 =C2=A0 # that case though.
> - =C2=A0 =C2=A0 =C2=A0 #
> - =C2=A0 =C2=A0 =C2=A0 deps =3D "coreutils-native"
> - =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('PN', d, True) in ("shasum-nativ=
e", "coreutils-native"):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D ""
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# INHIBIT_DEFAULT_DEPS doesn't apply to the pa=
tch command. =C2=A0Whether or =C2=A0not
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# we need that built is the responsibility of =
the patch function / class, not
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# the application.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', =
d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bb.data.getVar=
('HOST_SYS', d, 1) !=3D
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.=
getVar('BUILD_SYS', d, 1)):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 deps +=3D " virtual/${TARGET_PREFIX}gcc virtual/libc "
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.=
getVar('BUILD_SYS', d, 1)):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return "virtual/${TARGET_PREFIX}gcc virtual/libc"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif bb.data.inher=
its_class('native', d) and \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.getVar('PN', d, True) not in =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0("linux-libc-headers-native", "quilt-=
native",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"unifdef-native", "shasum-native",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"coreutils-native"):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 deps +=3D " linux-libc-headers-native"
> - =C2=A0 =C2=A0 =C2=A0 return deps
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"unifdef-native", "shasum-native")=
:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return "linux-libc-headers-native"
> + =C2=A0 =C2=A0 =C2=A0 return ""
>
> -DEPENDS_prepend=3D"${@base_deps(d)} "
> -DEPENDS_virtclass-native_prepend=3D"${@base_deps(d)} "
> -DEPENDS_virtclass-nativesdk_prepend=3D"${@base_deps(d)} "
> +DEPENDS_prepend =3D "${@base_deps(d)} "
> +DEPENDS_virtclass-native_prepend =3D "${@base_deps(d)} "
> +DEPENDS_virtclass-nativesdk_prepend =3D "${@base_deps(d)} "
>
>
> =C2=A0SCENEFUNCS +=3D "base_scenefunction"
> @@ -89,7 +79,7 @@ SCENEFUNCS +=3D "base_scenefunction"
> =C2=A0python base_scenefunction () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0stamp =3D bb.data.getVar('STAMP', d, 1) + ".ne=
edclean"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(stamp):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func("do=
_clean", d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func("do=
_clean", d)
> =C2=A0}
>
> =C2=A0python base_do_setscene () {
> diff --git a/classes/gpe.bbclass b/classes/gpe.bbclass
> index a9ddec3..7e042ee 100644
> --- a/classes/gpe.bbclass
> +++ b/classes/gpe.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_prepend =3D "coreutils-native virtual/libintl intltool-native "
> +DEPENDS_prepend =3D "virtual/libintl intltool-native "
> =C2=A0GPE_TARBALL_SUFFIX ?=3D "gz"
> =C2=A0SRC_URI =3D "${GPE_MIRROR}/${PN}-${PV}.tar.${GPE_TARBALL_SUFFIX}"
> =C2=A0FILES_${PN} +=3D "${datadir}/gpe ${datadir}/application-registry"
> diff --git a/classes/gpephone.bbclass b/classes/gpephone.bbclass
> index 57867b5..dffbaa9 100644
> --- a/classes/gpephone.bbclass
> +++ b/classes/gpephone.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_prepend =3D "coreutils-native virtual/libintl intltool-native "
> +DEPENDS_prepend =3D "virtual/libintl intltool-native "
> =C2=A0GPE_TARBALL_SUFFIX ?=3D "gz"
> =C2=A0SRC_URI =3D "${GPEPHONE_MIRROR}/${PN}-${PV}/${PN}-${PV}.tar.${GPE_T=
ARBALL_SUFFIX}"
> =C2=A0FILES_${PN} +=3D "${datadir}/gpe ${datadir}/application-registry"
> diff --git a/recipes/twin/twin_0.4.6.bb b/recipes/twin/twin_0.4.6.bb
> index c6c3fbd..3ea36f8 100644
> --- a/recipes/twin/twin_0.4.6.bb
> +++ b/recipes/twin/twin_0.4.6.bb
> @@ -1,7 +1,6 @@
> =C2=A0DESCRIPTION =3D "Twin is a text-mode windowing environment: it draw=
s and manages text windows on a text-mode display, like X11 does for graphi=
cal windows. It has a built-in window manager and terminal emulator, and ca=
n be used as server for remote clients in the same style as X11. It can dis=
play on Linux console, on X11 and inside itself."
> =C2=A0SECTION =3D "console/utils"
>
> -DEPENDS =3D "coreutils-native"
> =C2=A0LICENSE =3D "GPL LGPL"
> =C2=A0SRC_URI =3D "http://linuz.sns.it/~max/twin/twin-0.4.6.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cross_compile.patch"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


