Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1RuMWH-0006GF-58
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Feb 2012 12:14:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 10FBD2C802;
	Mon,  6 Feb 2012 11:04:56 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7blyMXBqC+MJ; Mon,  6 Feb 2012 11:04:47 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 50AB92C793;
	Mon,  6 Feb 2012 11:04:46 +0000 (UTC)
Message-ID: <4F2FB40E.5030107@gmail.com>
Date: Mon, 06 Feb 2012 12:05:50 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1327969319-19246-1-git-send-email-ulf@emagii.com>
	<1327969319-19246-2-git-send-email-ulf@emagii.com>
In-Reply-To: <1327969319-19246-2-git-send-email-ulf@emagii.com>
Cc: Ulf Samuelsson <ulf@emagii.com>
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
X-List-Received-Date: Mon, 06 Feb 2012 11:14:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

ulf@emagii.com ha scritto, Il 31/01/2012 01:21:
> From: Ulf Samuelsson <ulf@emagii.com>
> 
> Earlier fakeroot recipes are not longer available
> at the download source.
> Upgrade to latest version.
> 
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  .../fakeroot-1.18.2/0001-quiet-getopt-check.patch  |   30 ++++++++++++++++++++
>  .../fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch |   30 ++++++++++++++++++++
>  recipes/fakeroot/fakeroot-native_1.18.2.bb         |   21 ++++++++++++++
>  recipes/fakeroot/fakeroot_1.18.2.bb                |   20 +++++++++++++
>  4 files changed, 101 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-check.patch
>  create mode 100644 recipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch
>  create mode 100644 recipes/fakeroot/fakeroot-native_1.18.2.bb
>  create mode 100644 recipes/fakeroot/fakeroot_1.18.2.bb
> 
> diff --git a/recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-check.patch b/recipes/fakeroot/fakeroot-1.18.2/0001-quiet-getopt-check.patch
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
> + 
> + libfound=no
> + 
> +-GETOPTEST=`getopt --version`
> ++GETOPTEST=`getopt --version 2> /dev/null`
> + case $GETOPTEST in
> + getopt*) # GNU getopt
> +     FAKE_TEMP=`getopt -l lib: -l faked: -l unknown-is-real -l fd-base: -l version -l help -- +l:f:i:s:ub:vh "$@"`
> +-- 
> +1.7.5.4
> +
> diff --git a/recipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch b/recipes/fakeroot/fakeroot-1.18.2/0002-fix-prefix.patch
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
> + 
> + # strip /bin/fakeroot to find install prefix
> +-FAKEROOT_PREFIX=@prefix@
> +-FAKEROOT_BINDIR=@bindir@
> ++FAKEROOT_BINDIR=`dirname $0`
> ++FAKEROOT_PREFIX=`dirname ${FAKEROOT_BINDIR}`
> + 
> + USEABSLIBPATH=@LDPRELOADABS@
> + LIB=lib@fakeroot_transformed@@DLSUFFIX@
> +-- 
> +1.7.5.4
> +
> diff --git a/recipes/fakeroot/fakeroot-native_1.18.2.bb b/recipes/fakeroot/fakeroot-native_1.18.2.bb
> new file mode 100644
> index 0000000..21911a1
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot-native_1.18.2.bb
> @@ -0,0 +1,21 @@
> +require fakeroot_${PV}.bb
> +
> +RDEPENDS_${PN} = "util-linux-native"
> +
> +SRC_URI += "file://0002-fix-prefix.patch "
> +S = "${WORKDIR}/fakeroot-${PV}"
> +
> +inherit native
> +
> +EXTRA_OECONF = " --program-prefix="
> +
> +# Compatability for the rare systems not using or having SYSV
> +python () {
> +    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
> +        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
> +}
> +
> +do_stage_append () {
> +    oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
> +}
> +
> diff --git a/recipes/fakeroot/fakeroot_1.18.2.bb b/recipes/fakeroot/fakeroot_1.18.2.bb
> new file mode 100644
> index 0000000..83192b5
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot_1.18.2.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Gives a fake root environment"
> +HOMEPAGE = "http://fakeroot.alioth.debian.org/"
> +SECTION = "base"
> +LICENSE = "GPL"
> +# fakeroot needs getopt which is provided by the util-linux package
> +RDEPENDS_${PN} = "util-linux"
> +
> +require fakeroot.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit autotools
> +
> +SRC_URI =+ "\
> +	${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
> +	file://0001-quiet-getopt-check.patch \
> +	"
> +
> +SRC_URI[md5sum] = "79f32331358ad58499704ea5e19fd0ae"
> +SRC_URI[sha256sum] = "9dc942e3ef2ec83c6e6fe59de05da6ab54f39948be64803f37721adab4c6aed8"


Ulf,
thank you again for your patch.
It works with a charm.

Please push it ASAP
I already did it in my own branch mckoan/kaeilos-2011

commit 3e454402452998cac95a0f02de78ad6c51949ac8
Author: Marco Cavallini <m.cavallini@koansoftware.com>
Date:   Thu Feb 2 10:18:56 2012 +0100

    fakeroot_1.18.2: Upgrade to latest version.

     * Earlier fakeroot recipes are not longer available
     * at the download source.
     * http://patches.openembedded.org/patch/20365/
     * From: Ulf Samuelsson <ulf@emagii.com>


--
Marco


