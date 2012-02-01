Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Rsbln-0006uY-Qz
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 16:06:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 660512C799
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2012 14:57:59 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkcNTJ60T-A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2012 14:57:52 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 8527C2C793
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2012 14:57:51 +0000 (UTC)
Message-ID: <4F295325.2030200@gmail.com>
Date: Wed, 01 Feb 2012 15:58:45 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1327969319-19246-1-git-send-email-ulf@emagii.com>
	<1327969319-19246-2-git-send-email-ulf@emagii.com>
In-Reply-To: <1327969319-19246-2-git-send-email-ulf@emagii.com>
Subject: Re: [PATCH 2/2] fakeroot(-native)_1.18.2.bb: Bump version
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
X-List-Received-Date: Wed, 01 Feb 2012 15:06:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ulf@emagii.com ha scritto, Il 31/01/2012 01:21:
> From: Ulf Samuelsson <ulf@emagii.com>
>=20
> Earlier fakeroot recipes are not longer available
> at the download source.
> Upgrade to latest version.
>=20
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  .../fakeroot-1.18.2/0001-quiet-getopt-check.patch  |   30 ++++++++++++=
++++++++
>  .../fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch |   30 ++++++++++++=
++++++++
>  recipes/fakeroot/fakeroot-native_1.18.2.bb         |   21 ++++++++++++=
++
>  recipes/fakeroot/fakeroot_1.18.2.bb                |   20 ++++++++++++=
+
>  4 files changed, 101 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-=
check.patch
>  create mode 100644 recipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.pa=
tch
>  create mode 100644 recipes/fakeroot/fakeroot-native_1.18.2.bb
>  create mode 100644 recipes/fakeroot/fakeroot_1.18.2.bb
>=20
> diff --git a/recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-check.p=
atch b/recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-check.patch
> new file mode 100644
> index 0000000..d0e00f7
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-check.patch
> @@ -0,0 +1,30 @@
> +From 1470e989b3136d1baef7e0e852849e6cf0638deb Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf@emagii.com>
> +Date: Mon, 30 Jan 2012 22:43:53 +0100
> +Subject: [PATCH 1/2] quiet getopt check
> +
> +busybox provided getopt prints the help-text on stderr
> +
> +Imported from an earlier version of fakeroot in openembedded
> +
> +Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> +---
> + scripts/fakeroot.in |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/scripts/fakeroot.in b/scripts/fakeroot.in
> +index 324a9dc..7e501bd 100755
> +--- a/scripts/fakeroot.in
> ++++ b/scripts/fakeroot.in
> +@@ -43,7 +43,7 @@ export FAKED_MODE
> +=20
> + libfound=3Dno
> +=20
> +-GETOPTEST=3D`getopt --version`
> ++GETOPTEST=3D`getopt --version 2> /dev/null`
> + case $GETOPTEST in
> + getopt*) # GNU getopt
> +     FAKE_TEMP=3D`getopt -l lib: -l faked: -l unknown-is-real -l fd-ba=
se: -l version -l help -- +l:f:i:s:ub:vh "$@"`
> +--=20
> +1.7.5.4
> +
> diff --git a/recipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch b/r=
ecipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch
> new file mode 100644
> index 0000000..7aae9c8
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch
> @@ -0,0 +1,30 @@
> +From 6bc2fc6d3907df936ed476591d09d9fe029e22ed Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf@emagii.com>
> +Date: Mon, 30 Jan 2012 22:42:08 +0100
> +Subject: [PATCH 2/2] fix prefix
> +
> +Ported from an earlier recipe in openembedded
> +
> +Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> +---
> + scripts/fakeroot.in |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/scripts/fakeroot.in b/scripts/fakeroot.in
> +index 7e501bd..9a0e750 100755
> +--- a/scripts/fakeroot.in
> ++++ b/scripts/fakeroot.in
> +@@ -30,8 +30,8 @@ fatal ()
> + }
> +=20
> + # strip /bin/fakeroot to find install prefix
> +-FAKEROOT_PREFIX=3D@prefix@
> +-FAKEROOT_BINDIR=3D@bindir@
> ++FAKEROOT_BINDIR=3D`dirname $0`
> ++FAKEROOT_PREFIX=3D`dirname ${FAKEROOT_BINDIR}`
> +=20
> + USEABSLIBPATH=3D@LDPRELOADABS@
> + LIB=3Dlib@fakeroot_transformed@@DLSUFFIX@
> +--=20
> +1.7.5.4
> +
> diff --git a/recipes/fakeroot/fakeroot-native_1.18.2.bb b/recipes/faker=
oot/fakeroot-native_1.18.2.bb
> new file mode 100644
> index 0000000..21911a1
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot-native_1.18.2.bb
> @@ -0,0 +1,21 @@
> +require fakeroot_${PV}.bb
> +
> +RDEPENDS_${PN} =3D "util-linux-native"
> +
> +SRC_URI +=3D "file://0002-fix-prefix.patch "
> +S =3D "${WORKDIR}/fakeroot-${PV}"
> +
> +inherit native
> +
> +EXTRA_OECONF =3D " --program-prefix=3D"
> +
> +# Compatability for the rare systems not using or having SYSV
> +python () {
> +    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOS=
T_NONSYSV', d, True) !=3D '0':
> +        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=3Dtcp --program-pr=
efix=3D ', d)
> +}
> +
> +do_stage_append () {
> +    oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
> +}
> +
> diff --git a/recipes/fakeroot/fakeroot_1.18.2.bb b/recipes/fakeroot/fak=
eroot_1.18.2.bb
> new file mode 100644
> index 0000000..83192b5
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot_1.18.2.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Gives a fake root environment"
> +HOMEPAGE =3D "http://fakeroot.alioth.debian.org/"
> +SECTION =3D "base"
> +LICENSE =3D "GPL"
> +# fakeroot needs getopt which is provided by the util-linux package
> +RDEPENDS_${PN} =3D "util-linux"
> +
> +require fakeroot.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +inherit autotools
> +
> +SRC_URI =3D+ "\
> +	${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
> +	file://0001-quiet-getopt-check.patch \
> +	"
> +
> +SRC_URI[md5sum] =3D "79f32331358ad58499704ea5e19fd0ae"
> +SRC_URI[sha256sum] =3D "9dc942e3ef2ec83c6e6fe59de05da6ab54f39948be6480=
3f37721adab4c6aed8"


Thank you for your patch.

Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>



Cordiali Saluti / Kindest Regards / Mit freundlichen Gr=C3=BC=C3=9Fen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



