Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 589 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 16:44:07 UTC
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1E07780A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=10339; q=dns/txt;
	s=iport; t=1517503450; x=1518713050;
	h=from:to:subject:date:message-id;
	bh=zmZ2Qk1Hy2N1CRfpPYTb5LHYf9aMmCPln7ls18wKNCU=;
	b=aB6xyBAm6jSvBz6Vz+bdsiYvGPUYLPiydjCRzOthpeF9BbUfsQdRDlde
	FuA62d+68jNdSGYEvjHRlnHYiJFVt6TzTFk7VVBvfmLADa919tcGrDUql
	Ag9NG5qRJ+MuIdsoyHBXR7iXBz8DUHHNhT3C/XIS4BwYeyzfwOVfCzjNl 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ByAQDVQHNa/xbLJq1cGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYQodSiOeI5VmEKCAgoYDYggFQEBAQEBAQEBAmsohSMBB4EkAwE?=
	=?us-ascii?q?CVychijUQrTyKazKEaYNshGCDZQIBAQGBVoYUBYpfh2aBdY9piBmHOIYdAoMDk?=
	=?us-ascii?q?SyNaYoCgTw1I4FQMxoIGxVKCoITCYJMARsZgW8/NwGMSAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.46,444,1511827200"; 
   d="scan'208";a="1750367"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 16:34:18 +0000
Received: from localhost ([10.61.164.41])
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w11GYIvC021085
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Feb 2018 16:34:18 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Feb 2018 18:34:18 +0200
Message-Id: <1517502858-19348-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] recipes-kernel: add kpatch dynamic kernel patching infrastructure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 16:44:09 -0000

kpatch is a Linux dynamic kernel patching infrastructure
which allows you to patch a running kernel without
rebooting or restarting any processes

Currently it is enabled and tested on x86-64 systems,
although can be extended to PPC64 as well.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---

v2: no code changes, moved from oe-core to meta-oe
v1: http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146913.html

 meta-oe/recipes-kernel/kpatch/kpatch.inc           |  49 ++++++++++
 ...patch-build-add-cross-compilation-support.patch | 103 +++++++++++++++++++++
 ...tch-build-allow-overriding-of-distro-name.patch |  62 +++++++++++++
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb        |  11 +++
 4 files changed, 225 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch.inc
 create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
 create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
 create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch_git.bb

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
new file mode 100644
index 0000000..b1e73e9
--- /dev/null
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -0,0 +1,49 @@
+SUMMARY = "Linux dynamic kernel patching infrastructure"
+DESCRIPTION = "kpatch is a Linux dynamic kernel patching infrastructure which allows you to patch a running kernel without rebooting or restarting any processes."
+LICENSE = "GPLv2 & LGPLv2"
+DEPENDS = "elfutils bash"
+
+SRC_URI = "git://github.com/dynup/kpatch.git;protocol=https \
+	file://0001-kpatch-build-add-cross-compilation-support.patch \
+	file://0002-kpatch-build-allow-overriding-of-distro-name.patch \
+	"
+
+EXTRA_OEMAKE = " \
+	PREFIX=${prefix} \
+	BINDIR=${D}${bindir} \
+	SBINDIR=${D}${sbindir} \
+	LIBDIR=${D}${libdir} \
+	MANDIR=${D}${mandir}/man1 \
+	SYSTEMDDIR=${D}${systemd_system_unitdir} \
+	DESTDIR=${D} \
+	BUILDMOD=no \
+	CC='${CC}' \
+	"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+	oe_runmake install
+}
+
+PACKAGES =+ "kpatch-build"
+PROVIDES += "kpatch-build"
+
+COMPATIBLE_HOST = "(x86_64).*-linux"
+
+RDEPENDS_${PN} = "bash binutils"
+RDEPENDS_kpatch-build = "bash glibc-utils"
+
+FILES_${PN} = " \
+	${sbindir}/kpatch \
+	${systemd_system_unitdir}/kpatch.service \
+	${mandir}/man1/kpatch.1.gz \
+	"
+FILES_kpatch-build = " \
+	${bindir}/kpatch-build \
+	${libexecdir}/* \
+	${datadir}/kpatch \
+	${mandir}/man1/kpatch-build.1.gz \
+	"
+
+SYSTEMD_SERVICE_${PN} = "kpatch.service"
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
new file mode 100644
index 0000000..459fb21
--- /dev/null
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
@@ -0,0 +1,103 @@
+From a9a80a1f4df65892a0269295ce8a64b06f2ff61d Mon Sep 17 00:00:00 2001
+From: Ruslan Bilovol <rbilovol@cisco.com>
+Date: Tue, 19 Dec 2017 15:59:04 +0200
+Subject: [PATCH] kpatch-build: add cross-compilation support
+
+This patch introduces new option for kpatch-build
+script "--cross-compile" which can be used for
+specifying cross-complier prefix.
+It allows to build live patches not only on
+target system, but also on hosts for a target other
+than the one on which the compiler is running
+
+Also removed quotes in exec lines, so it is
+possible to pass multy-component strings like
+"ccache x86_64-xelinux-linux-" as cross-compiler
+
+Upstream-Status: Pending
+
+Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
+---
+ kpatch-build/kpatch-build | 13 +++++++++++--
+ kpatch-build/kpatch-gcc   |  4 ++--
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
+index 166ecbd..af24cc4 100755
+--- a/kpatch-build/kpatch-build
++++ b/kpatch-build/kpatch-build
+@@ -195,7 +195,7 @@ gcc_version_check() {
+ 	# gcc --version varies between distributions therefore extract version
+ 	# by compiling a test file and compare it to vmlinux's version.
+ 	echo 'void main(void) {}' > "$c"
+-	out="$(gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
++	out="$(${KPATCH_CROSS_COMPILE}gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
+ 	gccver="$(gcc_version_from_file "$o")"
+ 	kgccver="$(gcc_version_from_file "$VMLINUX")"
+ 	rm -f "$c" "$o"
+@@ -381,12 +381,14 @@ usage() {
+ 	echo "		-d, --debug        Enable 'xtrace' and keep scratch files" >&2
+ 	echo "		                   in <CACHEDIR>/tmp" >&2
+ 	echo "		                   (can be specified multiple times)" >&2
++	echo "		--cross-compile    Specify the prefix used for all executables" >&2
++	echo "		                   used during compilation" >&2
+ 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
+ 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
+ 	echo "		                   (not recommended)" >&2
+ }
+ 
+-options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
++options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
+ 
+ eval set -- "$options"
+ 
+@@ -444,6 +446,10 @@ while [[ $# -gt 0 ]]; do
+ 			echo "DEBUG mode enabled"
+ 		fi
+ 		;;
++	--cross-compile)
++		KPATCH_CROSS_COMPILE="$2"
++		shift
++		;;
+ 	--skip-cleanup)
+ 		echo "Skipping cleanup"
+ 		SKIPCLEANUP=1
+@@ -691,6 +697,8 @@ if [[ $DEBUG -ge 4 ]]; then
+ 	export KPATCH_GCC_DEBUG=1
+ fi
+ 
++export KPATCH_CROSS_COMPILE
++
+ echo "Building original kernel"
+ ./scripts/setlocalversion --save-scmversion || die
+ make mrproper 2>&1 | logger || die
+@@ -840,6 +848,7 @@ cd "$TEMPDIR/patch" || die
+ KPATCH_BUILD="$SRCDIR" KPATCH_NAME="$MODNAME" \
+ KBUILD_EXTRA_SYMBOLS="$KBUILD_EXTRA_SYMBOLS" \
+ KPATCH_LDFLAGS="$KPATCH_LDFLAGS" \
++CROSS_COMPILE="$KPATCH_CROSS_COMPILE" \
+ 	make 2>&1 | logger || die
+ 
+ if ! "$KPATCH_MODULE"; then
+diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
+index 6ba133c..3937948 100755
+--- a/kpatch-build/kpatch-gcc
++++ b/kpatch-build/kpatch-gcc
+@@ -8,7 +8,7 @@ TOOLCHAINCMD="$1"
+ shift
+ 
+ if [[ -z "$KPATCH_GCC_TEMPDIR" ]]; then
+-	exec "$TOOLCHAINCMD" "$@"
++	exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "$@"
+ fi
+ 
+ declare -a args=("$@")
+@@ -80,4 +80,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
+ 	done
+ fi
+ 
+-exec "$TOOLCHAINCMD" "${args[@]}"
++exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
new file mode 100644
index 0000000..a9d8a7f
--- /dev/null
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
@@ -0,0 +1,62 @@
+From d418d716dae1e2a05131dfb42a19a4da2fc8a85d Mon Sep 17 00:00:00 2001
+From: Ruslan Bilovol <rbilovol@cisco.com>
+Date: Tue, 2 Jan 2018 14:50:03 +0200
+Subject: [PATCH] kpatch-build: allow overriding of distro name
+
+It is sometimes useful to have ability to override
+distro name, for example during cross-compilation
+build when livepatch modules will be ran on the
+target which differs from host.
+
+This patch adds a new --distro option which
+implements all needed functionality
+
+Upstream-Status: Pending
+
+Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
+---
+ kpatch-build/kpatch-build | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
+index af24cc4..4f9f78d 100755
+--- a/kpatch-build/kpatch-build
++++ b/kpatch-build/kpatch-build
+@@ -383,12 +383,13 @@ usage() {
+ 	echo "		                   (can be specified multiple times)" >&2
+ 	echo "		--cross-compile    Specify the prefix used for all executables" >&2
+ 	echo "		                   used during compilation" >&2
++	echo "		--distro           Override distro name" >&2
+ 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
+ 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
+ 	echo "		                   (not recommended)" >&2
+ }
+ 
+-options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
++options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
+ 
+ eval set -- "$options"
+ 
+@@ -450,6 +451,10 @@ while [[ $# -gt 0 ]]; do
+ 		KPATCH_CROSS_COMPILE="$2"
+ 		shift
+ 		;;
++	--distro)
++		DISTRO="$2"
++		shift
++		;;
+ 	--skip-cleanup)
+ 		echo "Skipping cleanup"
+ 		SKIPCLEANUP=1
+@@ -526,7 +531,7 @@ fi
+ # Don't check external file.
+ # shellcheck disable=SC1091
+ source /etc/os-release
+-DISTRO="$ID"
++DISTRO="${DISTRO:-${ID}}"
+ if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
+ 	[[ -z "$VMLINUX" ]] && VMLINUX="/usr/lib/debug/lib/modules/$ARCHVERSION/vmlinux"
+ 	[[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not installed"
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
new file mode 100644
index 0000000..e495e28
--- /dev/null
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -0,0 +1,11 @@
+require kpatch.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "db6efbb8c7e90d2b761272cf563047119072768f"
+
+PV = "0.5.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


