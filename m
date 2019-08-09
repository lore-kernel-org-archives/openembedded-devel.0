Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A3CFF7F3EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:35:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,364,1559491200"; d="scan'208";a="73296304"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 16:35:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7AD4A4CE0301
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 16:35:38 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 16:35:38 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Aug 2019 16:34:56 +0800
Message-ID: <20190809083456.31145-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 7AD4A4CE0301.AAF1E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] kpatch: upgrade 0.61 -> 0.71
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
X-List-Received-Date: Fri, 09 Aug 2019 08:35:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Refresh the following patch:
	kpatch/0001-kpatch-build-add-cross-compilation-support.patch
	kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...patch-build-add-cross-compilation-support.patch | 52 ++++++++++++----------
 ...tch-build-allow-overriding-of-distro-name.patch | 24 +++++-----
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb        |  4 +-
 3 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
index ab3b127..348d82a 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
@@ -1,6 +1,6 @@
-From 70de3fecbc551907c4fd504cfff385c73be8db75 Mon Sep 17 00:00:00 2001
-From: Ruslan Bilovol <rbilovol@cisco.com>
-Date: Tue, 19 Dec 2017 15:59:04 +0200
+From 21909e3f9096fa8e4825df8c65114ee92ab3d532 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 7 Aug 2019 02:57:35 +0900
 Subject: [PATCH] kpatch-build: add cross-compilation support
 
 This patch introduces new option for kpatch-build
@@ -17,44 +17,45 @@ possible to pass multy-component strings like
 Upstream-Status: Pending
 
 Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
-
 ---
  kpatch-build/kpatch-build | 13 +++++++++++--
  kpatch-build/kpatch-gcc   |  4 ++--
  2 files changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
-index a76913f..4a011aa 100755
+index 9ef3809..463dab1 100755
 --- a/kpatch-build/kpatch-build
 +++ b/kpatch-build/kpatch-build
-@@ -197,7 +197,7 @@ gcc_version_check() {
+@@ -198,7 +198,7 @@ gcc_version_check() {
  	# gcc --version varies between distributions therefore extract version
  	# by compiling a test file and compare it to vmlinux's version.
  	echo 'void main(void) {}' > "$c"
 -	out="$(gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
 +	out="$(${KPATCH_CROSS_COMPILE}gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
  	gccver="$(gcc_version_from_file "$o")"
- 	kgccver="$(gcc_version_from_file "$VMLINUX")"
- 	rm -f "$c" "$o"
-@@ -392,12 +392,14 @@ usage() {
- 	echo "		-d, --debug        Enable 'xtrace' and keep scratch files" >&2
- 	echo "		                   in <CACHEDIR>/tmp" >&2
+ 	if [[ -n "$OOT_MODULE" ]]; then
+ 		kgccver="$(gcc_version_from_file "$OOT_MODULE")"
+@@ -411,6 +411,8 @@ usage() {
  	echo "		                   (can be specified multiple times)" >&2
+ 	echo "		-e, --oot-module   Enable patching out-of-tree module," >&2
+ 	echo "		                   specify current version of module" >&2
 +	echo "		--cross-compile    Specify the prefix used for all executables" >&2
 +	echo "		                   used during compilation" >&2
  	echo "		--skip-cleanup     Skip post-build cleanup" >&2
- 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
+	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
+	echo "		                   (not recommended)" >&2
+@@ -416,7 +418,7 @@ usage() {
  	echo "		                   (not recommended)" >&2
  }
  
--options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
-+options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
+-options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
++options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
  
  eval set -- "$options"
  
-@@ -455,6 +457,10 @@ while [[ $# -gt 0 ]]; do
- 			echo "DEBUG mode enabled"
- 		fi
+@@ -479,6 +481,10 @@ while [[ $# -gt 0 ]]; do
+ 		OOT_MODULE="$(readlink -f "$2")"
+ 		shift
  		;;
 +	--cross-compile)
 +		KPATCH_CROSS_COMPILE="$2"
@@ -63,17 +64,17 @@ index a76913f..4a011aa 100755
  	--skip-cleanup)
  		echo "Skipping cleanup"
  		SKIPCLEANUP=1
-@@ -710,6 +716,8 @@ if [[ $DEBUG -ge 4 ]]; then
+@@ -757,6 +763,8 @@ if [[ $DEBUG -ge 4 ]]; then
  	export KPATCH_GCC_DEBUG=1
  fi
  
 +export KPATCH_CROSS_COMPILE
 +
- echo "Building original kernel"
- ./scripts/setlocalversion --save-scmversion || die
+ echo "Building original source"
+ [[ -n "$OOT_MODULE" ]] || ./scripts/setlocalversion --save-scmversion || die
  unset KPATCH_GCC_TEMPDIR
-@@ -874,6 +882,7 @@ cd "$TEMPDIR/patch" || die
- KPATCH_BUILD="$SRCDIR" KPATCH_NAME="$MODNAME" \
+@@ -940,6 +948,7 @@ fi
+ KPATCH_BUILD="$KPATCH_BUILD" KPATCH_NAME="$MODNAME" \
  KBUILD_EXTRA_SYMBOLS="$KBUILD_EXTRA_SYMBOLS" \
  KPATCH_LDFLAGS="$KPATCH_LDFLAGS" \
 +CROSS_COMPILE="$KPATCH_CROSS_COMPILE" \
@@ -81,7 +82,7 @@ index a76913f..4a011aa 100755
  
  if ! "$KPATCH_MODULE"; then
 diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
-index 2d56da1..59a4255 100755
+index 9663290..56e6c8f 100755
 --- a/kpatch-build/kpatch-gcc
 +++ b/kpatch-build/kpatch-gcc
 @@ -8,7 +8,7 @@ TOOLCHAINCMD="$1"
@@ -93,9 +94,12 @@ index 2d56da1..59a4255 100755
  fi
  
  declare -a args=("$@")
-@@ -82,4 +82,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
+@@ -84,4 +84,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
  	done
  fi
  
 -exec "$TOOLCHAINCMD" "${args[@]}"
 +exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
index 13cdc6b..603a147 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
@@ -1,6 +1,6 @@
-From 15838a86d5ea94fa05976ea32fd847b18261b403 Mon Sep 17 00:00:00 2001
-From: Ruslan Bilovol <rbilovol@cisco.com>
-Date: Tue, 2 Jan 2018 14:50:03 +0200
+From 4143fa0092fe4cafee10b24a97d3ad0b41ab7a30 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 7 Aug 2019 03:24:39 +0900
 Subject: [PATCH] kpatch-build: allow overriding of distro name
 
 It is sometimes useful to have ability to override
@@ -14,17 +14,16 @@ implements all needed functionality
 Upstream-Status: Pending
 
 Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
-
 ---
  kpatch-build/kpatch-build | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
-index 4a011aa..eb6cd64 100755
+index 39933fc..c0258a2 100755
 --- a/kpatch-build/kpatch-build
 +++ b/kpatch-build/kpatch-build
-@@ -394,12 +394,13 @@ usage() {
- 	echo "		                   (can be specified multiple times)" >&2
+@@ -413,12 +413,13 @@ usage() {
+ 	echo "		                   specify current version of module" >&2
  	echo "		--cross-compile    Specify the prefix used for all executables" >&2
  	echo "		                   used during compilation" >&2
 +	echo "		--distro           Override distro name" >&2
@@ -33,12 +32,12 @@ index 4a011aa..eb6cd64 100755
  	echo "		                   (not recommended)" >&2
  }
  
--options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
-+options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
+-options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
++options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,cross-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
  
  eval set -- "$options"
  
-@@ -461,6 +462,10 @@ while [[ $# -gt 0 ]]; do
+@@ -485,6 +486,10 @@ while [[ $# -gt 0 ]]; do
  		KPATCH_CROSS_COMPILE="$2"
  		shift
  		;;
@@ -49,7 +48,7 @@ index 4a011aa..eb6cd64 100755
  	--skip-cleanup)
  		echo "Skipping cleanup"
  		SKIPCLEANUP=1
-@@ -539,7 +544,7 @@ fi
+@@ -571,7 +576,7 @@ fi
  # Don't check external file.
  # shellcheck disable=SC1091
  source /etc/os-release
@@ -58,3 +57,6 @@ index 4a011aa..eb6cd64 100755
  if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
  	[[ -z "$VMLINUX" ]] && VMLINUX="/usr/lib/debug/lib/modules/$ARCHVERSION/vmlinux"
  	[[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not installed"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
index 024cca6..dc24794 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -2,9 +2,9 @@ require kpatch.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "7f550f01bd308cf058ae782327d29c8916cc5602"
+SRCREV = "d7c5810e2a6acacfa5fec1e38d2f75af8e8c818c"
 
-PV = "0.6.1+git${SRCPV}"
+PV = "0.7.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




