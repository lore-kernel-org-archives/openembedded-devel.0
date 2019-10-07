Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCF687D5EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 01:44:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q7so7585487pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Oct 2019 18:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VI8uS9irZPYpDgkd8/QR+d7S7UNhLgkMDqlzUk81dh4=;
	b=fLpFVY/pGSntOKr0JZMZRvmADZPFKKvOcPKz1Bc7uI52jq6ALqk6O7QytvayYZLRf+
	Hj26t265pkmnFXu4F9NJcz4nmFqbdNCfex/KQTPpyMjxwok5w1myqnpD0Kdb9lJNEl0L
	eMnDgatZgKInFEuK+lC/ydp0iVgAbV19IvaWFlxBn9DarBrpqwaiy0//bK2f4ulK+/0O
	/cRNPUB9gGZrRxeCrHPuMZRvI6f6rQSWD6vd4dHgr7Nbra4rSi72sf9rf+z0azL2DH2G
	LS2273hFWNIOgoNchN0elEf9G8JlW/r8lvU7voDbcShC5gvPhj/S9a1BpyQFm8apCqr1
	svtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VI8uS9irZPYpDgkd8/QR+d7S7UNhLgkMDqlzUk81dh4=;
	b=EblBgkp0og9fHgbbuslRsoRA7n+o0KYnfp6FykFmccF5bw1eN7b94X/ittLiGyBgtd
	JfbW/YnOVDX6mu+gyvX79A/M0afBvJellYdRo1JosNcU3zxCREhquK3s239/bmUt/S/g
	Ta4vMOIkcJa5nYiME04XOgB+x6pyaCWFWEDpCVdBXkGNwzj6k+wG9Hcn849uwSprm8p/
	1lUPLP8LQvateBMdeZf5MJ5ALz9E/NPxyJeLePuqBQIDjFMyO/VSVb7I25pI/Mps96nl
	1saCt0O+/vZiJ0JOMQhJ+7L9FqMJVsjW2T+5UhLIq/nlZF/JW2HVQEsCqyhB+HZiurS/
	lySA==
X-Gm-Message-State: APjAAAWlh5Ug0iRQgK8uaQRnCj9Qvgh1I+vqf1Nf0xHzMhQ90QikX2lc
	ygrtdMed0kMhkbzQuZ5KUhK4jh8nsDw=
X-Google-Smtp-Source: APXvYqwVhR4GT7kiqgSJjiCuRrjMHAA9XboTf91tfWvKP9UsoCHfRxT6lMLKWA8/Gco5N/ev2NSTlw==
X-Received: by 2002:a17:90a:bb8e:: with SMTP id
	v14mr29418013pjr.84.1570412642913; 
	Sun, 06 Oct 2019 18:44:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	c6sm16183125pgk.65.2019.10.06.18.44.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 18:44:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Oct 2019 18:43:48 -0700
Message-Id: <20191007014348.992099-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pmdk: Update to 1.7
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
X-List-Received-Date: Mon, 07 Oct 2019 01:44:02 -0000
Content-Transfer-Encoding: 8bit

- Examples can be disabled via makefile argument, so drop the patch to
  disble building them and instead disable building via makefile
  argument
- Add a patch to control secure_getenv definition spill into linux/musl
  case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...reeBSD__-to-control-secure_getenv-de.patch | 33 ++++++++++++++++++
 ...03-Makefile-Don-t-build-the-examples.patch | 34 -------------------
 .../pmdk/{pmdk_1.6.bb => pmdk_1.7.bb}         |  6 ++--
 3 files changed, 36 insertions(+), 37 deletions(-)
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.6.bb => pmdk_1.7.bb} (84%)

diff --git a/meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch b/meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch
new file mode 100644
index 0000000000..33f25b6a6b
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch
@@ -0,0 +1,33 @@
+From 7d0732d69a774e28bc46b8b487d9f61bdd8afbff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Oct 2019 18:15:44 -0700
+Subject: [PATCH] os_posix: Use __FreeBSD__ to control secure_getenv definition
+
+__USE_GNU does not cover all Linux platforms, e.g. when using musl as C
+library, __USE_GNU may not be defined but it does provide secure_getenv
+so instead of narrowing the else condition, lets speicifically check for
+FreeBSD being the platform, since that seems to be the intention here
+anyway
+
+Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/3999]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/os_posix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/os_posix.c b/src/common/os_posix.c
+index a9a37ef84..052db2383 100644
+--- a/src/common/os_posix.c
++++ b/src/common/os_posix.c
+@@ -346,7 +346,7 @@ os_setenv(const char *name, const char *value, int overwrite)
+ /*
+  * secure_getenv -- provide GNU secure_getenv for FreeBSD
+  */
+-#ifndef __USE_GNU
++#if defined(__FreeBSD__)
+ static char *
+ secure_getenv(const char *name)
+ {
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
deleted file mode 100644
index dbe9c45e11..0000000000
--- a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ac24c78f5aa62ba43bb87b74301b659bcc506f11 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 18 Jul 2019 15:40:22 +0800
-Subject: [PATCH] Makefile: Don't build the examples
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [disable feature]
----
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 773ab1387..58912f0ab 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -37,13 +37,13 @@ include $(TOP)/src/common.inc
- 
- TARGETS = libpmem libvmem libpmemblk libpmemlog libpmemobj libpmempool\
- 		  libvmmalloc tools
--ALL_TARGETS = $(TARGETS) common librpmem examples benchmarks
-+ALL_TARGETS = $(TARGETS) common librpmem benchmarks
- 
- SCOPE_DIRS = $(TARGETS) common librpmem rpmem_common
- 
- DEBUG_RELEASE_TARGETS = common libpmem libvmem libpmemblk libpmemlog libpmemobj\
- 	libpmempool libvmmalloc librpmem
--RELEASE_TARGETS = tools examples benchmarks
-+RELEASE_TARGETS = tools benchmarks
- 
- CLEAN_NO_JE_TARGETS = $(ALL_TARGETS) rpmem_common test
- CLEAN_TARGETS = $(CLEAN_NO_JE_TARGETS) jemalloc
--- 
-2.14.4
-
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
similarity index 84%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
index c8688b2c63..96da266e65 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
@@ -14,10 +14,10 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/pmem/pmdk.git \
            file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
            file://0002-Makefile-Don-t-install-the-docs.patch \
-           file://0003-Makefile-Don-t-build-the-examples.patch \
+           file://0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch \
           "
 
-SRCREV = "695e6eba28c53a69a0ef7bad3cc0f45c21ef3e00"
+SRCREV = "bc5e309485df61c452d08367e4b13ba9dfed5071"
 
 inherit autotools-brokensep pkgconfig
 
@@ -26,7 +26,7 @@ inherit autotools-brokensep pkgconfig
 # | If you meant to cross compile, use `--host'.
 #
 # Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
-EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=${baselib}"
+EXTRA_OEMAKE = "BUILD_EXAMPLES='n' HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=${baselib}"
 
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
-- 
2.23.0


