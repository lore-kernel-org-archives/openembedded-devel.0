Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6797B74C0D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:35 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id a11-v6so5423713pff.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WzGg8MRTxvYXMwlqHDHkRdMI5YyJYVMT5odBcoar2eI=;
	b=XEmnXcu688dbUYzgG/AMkMbm96xTN6eGgsAFPjU94pOnbQvSBdBstT1w7K/+kW1xvO
	HSir6Fp45IEPq9Pmx6djWXA4tjc6GwR4WrUrdEdQEbcqyQXd4J8axCWH1FqivdS6czyh
	Ue07xBzUpHt2K+TmdcDK1K0zvpimxN5PvLCipKiRrLpqToe9E80MCP12+cPgdH9OdUpR
	De2rbaaleTUH2CpHyaZLw7ssNS5pvp6mgJ7pZ5+xe+Ps4p21P01Prx1dx25UrDrPT70j
	xbYt+g3LG1KmU0Y0r+kUHknpWp5RkP1dVFhFu09iT3+8cnpeCBvyVw48CqoweO5S5i7f
	gIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WzGg8MRTxvYXMwlqHDHkRdMI5YyJYVMT5odBcoar2eI=;
	b=rf3v01c3iGDBQSx1qdMyXpk3V9b54zoq34kTF8M9GS9MyqdmLUHS1BZ9BFOIppZPcV
	MDFColLHcB2cVO3rtnJaM5QSHMZu7HEaT0V5jhBlT11aX+gO0K8jUmEdoQoNUBCYNpfA
	QfE5WjFsQRs6lKFOAddf7OxCK+mSgm+FAbGbLhMCHreV621XhDit6UJPXzSHDnyCQmF9
	OLdeE+T2tkkRdxOCM9KTlXW+W7d9x+/vJqF00NT8NAoo8sZ23iseVmVCVYVR36jx/yTp
	GrSKFnPAnc8CT5hVzArjGYJsmdZv6VZvKlgsLwAU2Bf+9VxrHeT5g6Dj++W/x7eBkRa/
	XlsA==
X-Gm-Message-State: APt69E3LNOeAvT8lIlQJZEXJSNnCR1z8CJcE5vbWIkcHWdDfxBBfdauc
	3aJMCsDTvCaPaoA6uF1SVqKFCA==
X-Google-Smtp-Source: ADUXVKJFDb/RamvOsMR2U1qAdH/QqjDOjrmkwFWwIJQHJB5493tAAPg0Ib11T7IaqlBPWRN17Agn/g==
X-Received: by 2002:a65:61cc:: with SMTP id
	j12-v6mr4495524pgv.299.1529867975986; 
	Sun, 24 Jun 2018 12:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:32 -0700
Message-Id: <20180624191845.31082-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/20] kpatch: Upgrade to 0.6.1 release
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch.inc      |  1 +
 ...-build-add-cross-compilation-support.patch | 24 +++++++++----------
 ...uild-allow-overriding-of-distro-name.patch | 14 +++++------
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb   |  4 ++--
 4 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index b1e73e9542..e2e9511464 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -38,6 +38,7 @@ FILES_${PN} = " \
 	${sbindir}/kpatch \
 	${systemd_system_unitdir}/kpatch.service \
 	${mandir}/man1/kpatch.1.gz \
+	${sysconfdir}/init/kpatch.conf \
 	"
 FILES_kpatch-build = " \
 	${bindir}/kpatch-build \
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
index 459fb21977..ab3b127641 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
@@ -1,4 +1,4 @@
-From a9a80a1f4df65892a0269295ce8a64b06f2ff61d Mon Sep 17 00:00:00 2001
+From 70de3fecbc551907c4fd504cfff385c73be8db75 Mon Sep 17 00:00:00 2001
 From: Ruslan Bilovol <rbilovol@cisco.com>
 Date: Tue, 19 Dec 2017 15:59:04 +0200
 Subject: [PATCH] kpatch-build: add cross-compilation support
@@ -17,16 +17,17 @@ possible to pass multy-component strings like
 Upstream-Status: Pending
 
 Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
+
 ---
  kpatch-build/kpatch-build | 13 +++++++++++--
  kpatch-build/kpatch-gcc   |  4 ++--
  2 files changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
-index 166ecbd..af24cc4 100755
+index a76913f..4a011aa 100755
 --- a/kpatch-build/kpatch-build
 +++ b/kpatch-build/kpatch-build
-@@ -195,7 +195,7 @@ gcc_version_check() {
+@@ -197,7 +197,7 @@ gcc_version_check() {
  	# gcc --version varies between distributions therefore extract version
  	# by compiling a test file and compare it to vmlinux's version.
  	echo 'void main(void) {}' > "$c"
@@ -35,7 +36,7 @@ index 166ecbd..af24cc4 100755
  	gccver="$(gcc_version_from_file "$o")"
  	kgccver="$(gcc_version_from_file "$VMLINUX")"
  	rm -f "$c" "$o"
-@@ -381,12 +381,14 @@ usage() {
+@@ -392,12 +392,14 @@ usage() {
  	echo "		-d, --debug        Enable 'xtrace' and keep scratch files" >&2
  	echo "		                   in <CACHEDIR>/tmp" >&2
  	echo "		                   (can be specified multiple times)" >&2
@@ -51,7 +52,7 @@ index 166ecbd..af24cc4 100755
  
  eval set -- "$options"
  
-@@ -444,6 +446,10 @@ while [[ $# -gt 0 ]]; do
+@@ -455,6 +457,10 @@ while [[ $# -gt 0 ]]; do
  			echo "DEBUG mode enabled"
  		fi
  		;;
@@ -62,7 +63,7 @@ index 166ecbd..af24cc4 100755
  	--skip-cleanup)
  		echo "Skipping cleanup"
  		SKIPCLEANUP=1
-@@ -691,6 +697,8 @@ if [[ $DEBUG -ge 4 ]]; then
+@@ -710,6 +716,8 @@ if [[ $DEBUG -ge 4 ]]; then
  	export KPATCH_GCC_DEBUG=1
  fi
  
@@ -70,8 +71,8 @@ index 166ecbd..af24cc4 100755
 +
  echo "Building original kernel"
  ./scripts/setlocalversion --save-scmversion || die
- make mrproper 2>&1 | logger || die
-@@ -840,6 +848,7 @@ cd "$TEMPDIR/patch" || die
+ unset KPATCH_GCC_TEMPDIR
+@@ -874,6 +882,7 @@ cd "$TEMPDIR/patch" || die
  KPATCH_BUILD="$SRCDIR" KPATCH_NAME="$MODNAME" \
  KBUILD_EXTRA_SYMBOLS="$KBUILD_EXTRA_SYMBOLS" \
  KPATCH_LDFLAGS="$KPATCH_LDFLAGS" \
@@ -80,7 +81,7 @@ index 166ecbd..af24cc4 100755
  
  if ! "$KPATCH_MODULE"; then
 diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
-index 6ba133c..3937948 100755
+index 2d56da1..59a4255 100755
 --- a/kpatch-build/kpatch-gcc
 +++ b/kpatch-build/kpatch-gcc
 @@ -8,7 +8,7 @@ TOOLCHAINCMD="$1"
@@ -92,12 +93,9 @@ index 6ba133c..3937948 100755
  fi
  
  declare -a args=("$@")
-@@ -80,4 +80,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
+@@ -82,4 +82,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
  	done
  fi
  
 -exec "$TOOLCHAINCMD" "${args[@]}"
 +exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
index a9d8a7f2c5..13cdc6bfb4 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
@@ -1,4 +1,4 @@
-From d418d716dae1e2a05131dfb42a19a4da2fc8a85d Mon Sep 17 00:00:00 2001
+From 15838a86d5ea94fa05976ea32fd847b18261b403 Mon Sep 17 00:00:00 2001
 From: Ruslan Bilovol <rbilovol@cisco.com>
 Date: Tue, 2 Jan 2018 14:50:03 +0200
 Subject: [PATCH] kpatch-build: allow overriding of distro name
@@ -14,15 +14,16 @@ implements all needed functionality
 Upstream-Status: Pending
 
 Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
+
 ---
  kpatch-build/kpatch-build | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
-index af24cc4..4f9f78d 100755
+index 4a011aa..eb6cd64 100755
 --- a/kpatch-build/kpatch-build
 +++ b/kpatch-build/kpatch-build
-@@ -383,12 +383,13 @@ usage() {
+@@ -394,12 +394,13 @@ usage() {
  	echo "		                   (can be specified multiple times)" >&2
  	echo "		--cross-compile    Specify the prefix used for all executables" >&2
  	echo "		                   used during compilation" >&2
@@ -37,7 +38,7 @@ index af24cc4..4f9f78d 100755
  
  eval set -- "$options"
  
-@@ -450,6 +451,10 @@ while [[ $# -gt 0 ]]; do
+@@ -461,6 +462,10 @@ while [[ $# -gt 0 ]]; do
  		KPATCH_CROSS_COMPILE="$2"
  		shift
  		;;
@@ -48,7 +49,7 @@ index af24cc4..4f9f78d 100755
  	--skip-cleanup)
  		echo "Skipping cleanup"
  		SKIPCLEANUP=1
-@@ -526,7 +531,7 @@ fi
+@@ -539,7 +544,7 @@ fi
  # Don't check external file.
  # shellcheck disable=SC1091
  source /etc/os-release
@@ -57,6 +58,3 @@ index af24cc4..4f9f78d 100755
  if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
  	[[ -z "$VMLINUX" ]] && VMLINUX="/usr/lib/debug/lib/modules/$ARCHVERSION/vmlinux"
  	[[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not installed"
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
index e495e2882c..024cca6553 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -2,9 +2,9 @@ require kpatch.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "db6efbb8c7e90d2b761272cf563047119072768f"
+SRCREV = "7f550f01bd308cf058ae782327d29c8916cc5602"
 
-PV = "0.5.0+git${SRCPV}"
+PV = "0.6.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


