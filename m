Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8113.1795739787703845503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=daCZk99Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04b676219so41512045ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739787; x=1796344587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1BzY0fZqoYgNObc4gtWyGx31zG6bhSnrfQXVJrRtis=;
        b=daCZk99QlLv+ChUkc0MnjMjuZxksVkNkpbru3fARDhUX99lJofmzV05W0MIxgw9/w4
         xQ9d0XT+uvanQc7n/rKDDtyTe4MmEnqVU5iN2ddLXaB3ajomUhj8J3BEvZcagaBuxeXn
         8VMnYRGJbFJk8K4G6JmAaGYFEKL4NHB/T2toLOiF7MGsdAj/0uQZohQn1PXjTwSDLnLT
         3yOOTqSsK9OSyXBqF5Bwk/GHAq9RdDZwzEydb53dM/qcDRhU24EDyph9pLWNljNwIH+S
         sJmLuQ7WGhaWgKEqN9bwV1t4WYIt+Xpv3TG4xm2II19c0zZBMhIiP9ZkETymSa0rfKir
         s26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739787; x=1796344587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1BzY0fZqoYgNObc4gtWyGx31zG6bhSnrfQXVJrRtis=;
        b=JamEEnGBbvp5c/AgrHblZRyl/xvXnRvrdu9BfsaMD4pH1NnL4CA3IvD0De62ls+yPt
         1QmQXkoCCW5TU5CVe60tTMiK4XXHjdJwfq7HeNZrdWfDPJYetVNnhkrRl0F0RoyZI3eS
         uU+BoxPuAOldtSRdxg/fmvMxiVpsHbZJtdBlyk+BMbRQn8e9zXEIX4kxrUkMrg8rSrUQ
         +x+pcEEOXjcvdT/VNK6xuqbieOgF6I/UoRNXXxuZnQU7sGZIvzNBNt+iO21fBy/2pSD1
         rYALlc7su4emb+CsdFOkNsB7L0oKfplMHw7qTizbUY7NH/habw/w6pwHd2fjXOKMjDtV
         LnmQ==
X-Gm-Message-State: APuU4Z/6c0ccBdh6qE/RqKe8YRhF8lefKA4p+GogTwQ+jgTqvyvNnKqp
	Yw+6Ux0pGKO7VHbOrcHVBOfuaQTQoSU3zGXSuh+XdXlY5g7MZvRZKpd2bvt2QU3n
X-Gm-Gg: AZFdTZdQtjEaF93uoSfL5WGPJJ3OoLK1wpHJ/hN30I9IRl9NFk8MSeID32TQik5rVWE
	sldxM8isb/QWWAtPcyj0AB7vqpQzonyy69mPA5BKjAWQhkrGIv4B0D72Zqw2qXwzSJWuetQWRfN
	cEKJwbv7+XVmGOCzIY7/pSmT0Ft76GcX/b39jCWGyn0TAkP8gf79Jjb7x3jrX3zzyZQ4I9mRbKe
	yWd/T7KmEFhPip82EB0PqnTtpYQ9QSXN5sYQ+SS8NGwEhshuEFeW9fMJGZD2+UWuASljRRUO//P
	XBtzqxEkSfYhwqKitcfVGPI1a2Acjvgi/ubYKM8W56j7EICdgwAgVIyhcayoSAr9h97ziYbJqIa
	np1CN3ERCjotXjrJorRKx3CKNuvvpt+7SkWu5L5OUq0C8DAM8QM/bgTto6qEK5kike3MsnLFetT
	XNWJLGn9q5ZVFkGOMB2VLO1GGiJeRG9o3V9maxeiwLJ2xzT2yVEau8UbaM7kXcM1GjXATVzDxj2
	bViwjm+heIopneks1iv+5gK80HqMAtnt9QhRvFMSq1WQcPVFcQ0bY82BkWaUc/z9UQSpi9QoSGJ
	KwcrnEIF1cb3pJMToEWXXunxYCJWj1j8VQbiK54G/TgC9P9eHfM1nWz6D2/qUzVek7zOs8LHpJh
	FWR1x+dhUTObRCw2lsvT1UZeqeP2PGYs7zgmS0hvS5pEDx9VxJpglD9hamVSZ6v1VMlF/xvojKJ
	GmpIEla6sG8V8OyVODa2pHSpSikaZRuf35NdB/mcYRQDhsEQc5JB13Nbhx/UcMRPTHJCASh2uQ5
	6lbGkuzgN0Rlkghts7oxOIxWeyMUKPigv0WQqt+mHWl4ZCAIdRLuuISsPu1UcnJvNWcsn05Fw3S
	KBNK
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr214235725ad.7.1795739786898;
        Thu, 26 Nov 2026 16:36:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/39] kpatch: upgrade 0.9.1 -> 0.9.11
Date: Thu, 26 Nov 2026 16:35:22 -0800
Message-ID: <20261127003543.2167775-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133188
Content-Type: text/plain; charset="utf-8"

Notable changes since 0.9.1:
- Add ARM64 support to kpatch-build (and DYNAMIC_FTRACE_WITH_CALL_OPS
  handling); cross compiling is enabled through the CROSS_COMPILE and
  TARGET_ARCH environment variables.
- Add -R/--non-replace and --version options; set C standard to gnu11;
  reject CONFIG_X86_KERNEL_IBT kernels as unsupported.
- Support kernel namespaces (.modinfo), the new livepatch stack_order
  sysfs attribute and gcc 14 sympos handling.
- Fix paravirt handling for Linux v6.8+, ppc64le trampolines, s390
  PIE flags and out-of-tree module builds.
- New distro support (Photon, Anolis, OpenCloudOS, Amazon Linux).

Switch from a pinned commit to tag=v${PV} and rename kpatch_git.bb to
kpatch_0.9.11.bb. Drop 0001-kpatch-build-add-cross-compilation-support
since upstream has native cross compile support now, and refresh
0002-kpatch-build-allow-overriding-of-distro-name for the new option
parsing. Add UPSTREAM_CHECK_GITTAGREGEX.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch.inc      |   5 +-
 ...-build-add-cross-compilation-support.patch | 105 ------------------
 ...uild-allow-overriding-of-distro-name.patch |  48 ++++----
 .../{kpatch_git.bb => kpatch_0.9.11.bb}       |   5 +-
 4 files changed, 28 insertions(+), 135 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
 rename meta-oe/recipes-kernel/kpatch/{kpatch_git.bb => kpatch_0.9.11.bb} (65%)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index 8ab0a28f9d..a3fa13bdad 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -3,11 +3,12 @@ DESCRIPTION = "kpatch is a Linux dynamic kernel patching infrastructure which al
 LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 DEPENDS = "elfutils bash"
 
-SRC_URI = "git://github.com/dynup/kpatch.git;protocol=https;branch=master \
-	file://0001-kpatch-build-add-cross-compilation-support.patch \
+SRC_URI = "git://github.com/dynup/kpatch.git;protocol=https;branch=master;tag=v${PV} \
 	file://0002-kpatch-build-allow-overriding-of-distro-name.patch \
 	"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 EXTRA_OEMAKE = " \
 	PREFIX=${prefix} \
 	BINDIR=${D}${bindir} \
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
deleted file mode 100644
index 348d82acc1..0000000000
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 21909e3f9096fa8e4825df8c65114ee92ab3d532 Mon Sep 17 00:00:00 2001
-From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-Date: Wed, 7 Aug 2019 02:57:35 +0900
-Subject: [PATCH] kpatch-build: add cross-compilation support
-
-This patch introduces new option for kpatch-build
-script "--cross-compile" which can be used for
-specifying cross-complier prefix.
-It allows to build live patches not only on
-target system, but also on hosts for a target other
-than the one on which the compiler is running
-
-Also removed quotes in exec lines, so it is
-possible to pass multy-component strings like
-"ccache x86_64-xelinux-linux-" as cross-compiler
-
-Upstream-Status: Pending
-
-Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
----
- kpatch-build/kpatch-build | 13 +++++++++++--
- kpatch-build/kpatch-gcc   |  4 ++--
- 2 files changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
-index 9ef3809..463dab1 100755
---- a/kpatch-build/kpatch-build
-+++ b/kpatch-build/kpatch-build
-@@ -198,7 +198,7 @@ gcc_version_check() {
- 	# gcc --version varies between distributions therefore extract version
- 	# by compiling a test file and compare it to vmlinux's version.
- 	echo 'void main(void) {}' > "$c"
--	out="$(gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
-+	out="$(${KPATCH_CROSS_COMPILE}gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
- 	gccver="$(gcc_version_from_file "$o")"
- 	if [[ -n "$OOT_MODULE" ]]; then
- 		kgccver="$(gcc_version_from_file "$OOT_MODULE")"
-@@ -411,6 +411,8 @@ usage() {
- 	echo "		                   (can be specified multiple times)" >&2
- 	echo "		-e, --oot-module   Enable patching out-of-tree module," >&2
- 	echo "		                   specify current version of module" >&2
-+	echo "		--cross-compile    Specify the prefix used for all executables" >&2
-+	echo "		                   used during compilation" >&2
- 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
-	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
-	echo "		                   (not recommended)" >&2
-@@ -416,7 +418,7 @@ usage() {
- 	echo "		                   (not recommended)" >&2
- }
- 
--options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
-+options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
- 
- eval set -- "$options"
- 
-@@ -479,6 +481,10 @@ while [[ $# -gt 0 ]]; do
- 		OOT_MODULE="$(readlink -f "$2")"
- 		shift
- 		;;
-+	--cross-compile)
-+		KPATCH_CROSS_COMPILE="$2"
-+		shift
-+		;;
- 	--skip-cleanup)
- 		echo "Skipping cleanup"
- 		SKIPCLEANUP=1
-@@ -757,6 +763,8 @@ if [[ $DEBUG -ge 4 ]]; then
- 	export KPATCH_GCC_DEBUG=1
- fi
- 
-+export KPATCH_CROSS_COMPILE
-+
- echo "Building original source"
- [[ -n "$OOT_MODULE" ]] || ./scripts/setlocalversion --save-scmversion || die
- unset KPATCH_GCC_TEMPDIR
-@@ -940,6 +948,7 @@ fi
- KPATCH_BUILD="$KPATCH_BUILD" KPATCH_NAME="$MODNAME" \
- KBUILD_EXTRA_SYMBOLS="$KBUILD_EXTRA_SYMBOLS" \
- KPATCH_LDFLAGS="$KPATCH_LDFLAGS" \
-+CROSS_COMPILE="$KPATCH_CROSS_COMPILE" \
- 	make 2>&1 | logger || die
- 
- if ! "$KPATCH_MODULE"; then
-diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
-index 9663290..56e6c8f 100755
---- a/kpatch-build/kpatch-gcc
-+++ b/kpatch-build/kpatch-gcc
-@@ -8,7 +8,7 @@ TOOLCHAINCMD="$1"
- shift
- 
- if [[ -z "$KPATCH_GCC_TEMPDIR" ]]; then
--	exec "$TOOLCHAINCMD" "$@"
-+	exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "$@"
- fi
- 
- declare -a args=("$@")
-@@ -84,4 +84,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
- 	done
- fi
- 
--exec "$TOOLCHAINCMD" "${args[@]}"
-+exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
index 0cc3684134..29f7a5c611 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
@@ -19,27 +19,28 @@ Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
-index 39933fc..c0258a2 100755
 --- a/kpatch-build/kpatch-build
 +++ b/kpatch-build/kpatch-build
-@@ -413,12 +413,13 @@ usage() {
- 	echo "		                   specify current version of module" >&2
- 	echo "		--cross-compile    Specify the prefix used for all executables" >&2
- 	echo "		                   used during compilation" >&2
-+	echo "		--distro           Override distro name" >&2
- 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
- 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
- 	echo "		                   (not recommended)" >&2
- }
+@@ -753,6 +753,7 @@ usage() {
+ 	echo "		                        specify current version of module" >&2
+ 	echo "		--oot-module-src        Specify out-of-tree module source directory" >&2
+ 	echo "		-R, --non-replace       Disable replace patch (replace is on by default)" >&2
++	echo "		--distro                Override distro name" >&2
+ 	echo "		--skip-cleanup          Skip post-build cleanup" >&2
+ 	echo "		--skip-compiler-check   Skip compiler version matching check" >&2
+ 	echo "		                        (not recommended)" >&2
+@@ -763,7 +764,7 @@ if ! command -v gawk &> /dev/null; then
+ 	die "gawk not installed"
+ fi
  
--options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
-+options="$(getopt -o ha:r:s:c:v:j:t:n:o:de: -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,debug,cross-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
+-options="$(getopt -o ha:r:s:c:v:j:t:n:o:dR -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,oot-module-src:,debug,skip-gcc-check,skip-compiler-check,skip-cleanup,non-replace,version" -- "$@")" || die "getopt failed"
++options="$(getopt -o ha:r:s:c:v:j:t:n:o:dR -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,oot-module:,oot-module-src:,debug,distro:,skip-gcc-check,skip-compiler-check,skip-cleanup,non-replace,version" -- "$@")" || die "getopt failed"
  
  eval set -- "$options"
  
-@@ -485,6 +486,10 @@ while [[ $# -gt 0 ]]; do
- 		KPATCH_CROSS_COMPILE="$2"
- 		shift
+@@ -834,6 +835,10 @@ while [[ $# -gt 0 ]]; do
+ 	-R|--non-replace)
+ 		KLP_REPLACE=0
  		;;
 +	--distro)
 +		DISTRO="$2"
@@ -48,15 +49,14 @@ index 39933fc..c0258a2 100755
  	--skip-cleanup)
  		echo "Skipping cleanup"
  		SKIPCLEANUP=1
-@@ -613,7 +613,7 @@ fi
- # Don't check external file.
+@@ -869,7 +874,7 @@ trace_on
  # shellcheck disable=SC1090
- [[ -f "$RELEASE_FILE" ]] && source "$RELEASE_FILE"
--DISTRO="$ID"
-+DISTRO="${DISTRO:-${ID}}"
- if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
- 	[[ -z "$VMLINUX" ]] && VMLINUX="/usr/lib/debug/lib/modules/$ARCHVERSION/vmlinux"
- 	[[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not installed"
+ if [[ -z "$USERSRCDIR" ]] && [[ -f "$RELEASE_FILE" ]]; then
+ 	source "$RELEASE_FILE"
+-	DISTRO="$ID"
++	DISTRO="${DISTRO:-${ID}}"
+ fi
+ 
+ 
 -- 
 2.7.4
-
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_0.9.11.bb
similarity index 65%
rename from meta-oe/recipes-kernel/kpatch/kpatch_git.bb
rename to meta-oe/recipes-kernel/kpatch/kpatch_0.9.11.bb
index 6521830b7a..f19043e456 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_0.9.11.bb
@@ -2,9 +2,6 @@ require kpatch.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "0c3c21930895f6582a5c9d9d797f7e11ff41ffb2"
-
-PV = "0.9.1"
-
+SRCREV = "bea635fbbeb11c5f0f5c0d4ffce34c2e9d2e8a6a"
 
 BBCLASSEXTEND = "native nativesdk"
