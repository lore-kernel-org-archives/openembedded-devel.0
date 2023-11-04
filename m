Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0FBC10F09
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.2291.1699061896179611884
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UFJuEak/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q5OViUIb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b97fb111b-f95f90ad-af44-44d6-ae1f-392f85e1e8f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EMKdOiZ8YDzMpAKoGEJH1iY8aMctL3Y4+QjmPCKQWQc=;
	b=UFJuEak/tBpxVS8OqyrgnY57/wF+vgRg0F9I8u1iDqQ3wan0Nt9PmsmclnPhFkRr
	b04bOc4GgXM+4t/VvFXDwNYEMqTWmzc1FKMoscLx4LejxXvJPG94xi3lQStZret9eT1
	R63RJ9e4sDYKbobT2QHQXj7hHIfHpPUbmMGz5Cdw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EMKdOiZ8YDzMpAKoGEJH1iY8aMctL3Y4+QjmPCKQWQc=;
	b=q5OViUIbiU186sziK4FFRGoGtivNSvXG0+PxgpNji6EyiavV6NdQLIvo35i9Jwzo
	oZuf2C9XHP++1QoMw/sp2W0WN7h2mJMX3ulwVGfVvf/lXSQ1j7iQO+m/93b+UdndG38
	vIfu+kJLVLlSGHDAuXaUaQubXTroqmj+vSl65tAQ=
Content-Type: multipart/mixed; boundary="===============1835533195037774261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-greenlet: upgrading to 3.0.1 SUCCEEDED
Message-ID: <0101018b97fb111b-f95f90ad-af44-44d6-ae1f-392f85e1e8f6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106132

--===============1835533195037774261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-greenlet* to *3.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-greenlet-upgrade-2.0.2-3.0.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From bb21e6accd81353a3030a924a5c57456d69e5cb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:36:31 +0000
Subject: [PATCH] python3-greenlet: upgrade 2.0.2 -> 3.0.1

---
 ...ng-register-storage-class-keyword-ev.patch | 247 ------------------
 ...let_2.0.2.bb => python3-greenlet_3.0.1.bb} |   4 +-
 2 files changed, 2 insertions(+), 249 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch
 rename meta-python/recipes-devtools/python/{python3-greenlet_2.0.2.bb => python3-greenlet_3.0.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch
deleted file mode 100644
index 2a6ddd472..000000000
--- a/meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch
+++ /dev/null
@@ -1,247 +0,0 @@
-From 74d8c5ecdc677a7a412c7f782fe8488a5d987333 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 5 Feb 2023 19:05:45 -0800
-Subject: [PATCH] cleanup: Drop using 'register' storage class keyword everywhere
-
-This has been dropped in c++17 and newer
-
-Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/347]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/greenlet/platform/switch_alpha_unix.h    | 4 ++--
- src/greenlet/platform/switch_arm32_gcc.h     | 2 +-
- src/greenlet/platform/switch_arm32_ios.h     | 2 +-
- src/greenlet/platform/switch_csky_gcc.h      | 2 +-
- src/greenlet/platform/switch_mips_unix.h     | 4 ++--
- src/greenlet/platform/switch_ppc64_aix.h     | 4 ++--
- src/greenlet/platform/switch_ppc64_linux.h   | 4 ++--
- src/greenlet/platform/switch_ppc_aix.h       | 4 ++--
- src/greenlet/platform/switch_ppc_linux.h     | 4 ++--
- src/greenlet/platform/switch_ppc_macosx.h    | 4 ++--
- src/greenlet/platform/switch_ppc_unix.h      | 4 ++--
- src/greenlet/platform/switch_s390_unix.h     | 4 ++--
- src/greenlet/platform/switch_sparc_sun_gcc.h | 4 ++--
- src/greenlet/platform/switch_x32_unix.h      | 4 ++--
- src/greenlet/platform/switch_x86_unix.h      | 2 +-
- 15 files changed, 26 insertions(+), 26 deletions(-)
-
-diff --git a/src/greenlet/platform/switch_alpha_unix.h b/src/greenlet/platform/switch_alpha_unix.h
-index 216619f..7e07abf 100644
---- a/src/greenlet/platform/switch_alpha_unix.h
-+++ b/src/greenlet/platform/switch_alpha_unix.h
-@@ -9,8 +9,8 @@
- static int
- slp_switch(void)
- {
--  register int ret;
--  register long *stackref, stsizediff;
-+  int ret;
-+  long *stackref, stsizediff;
-   __asm__ volatile ("" : : : REGS_TO_SAVE);
-   __asm__ volatile ("mov $30, %0" : "=r" (stackref) : );
-   {
-diff --git a/src/greenlet/platform/switch_arm32_gcc.h b/src/greenlet/platform/switch_arm32_gcc.h
-index 035d6b9..655003a 100644
---- a/src/greenlet/platform/switch_arm32_gcc.h
-+++ b/src/greenlet/platform/switch_arm32_gcc.h
-@@ -56,7 +56,7 @@ __attribute__((optimize("no-omit-frame-pointer")))
- slp_switch(void)
- {
-         void *fp;
--        register int *stackref, stsizediff;
-+        int *stackref, stsizediff;
-         int result;
-         __asm__ volatile ("" : : : REGS_TO_SAVE);
-         __asm__ volatile ("mov r0," REG_FP "\n\tstr r0,%0" : "=m" (fp) : : "r0");
-diff --git a/src/greenlet/platform/switch_arm32_ios.h b/src/greenlet/platform/switch_arm32_ios.h
-index e993707..9e640e1 100644
---- a/src/greenlet/platform/switch_arm32_ios.h
-+++ b/src/greenlet/platform/switch_arm32_ios.h
-@@ -38,7 +38,7 @@ __attribute__((optimize("no-omit-frame-pointer")))
- slp_switch(void)
- {
-         void *fp;
--        register int *stackref, stsizediff, result;
-+        int *stackref, stsizediff, result;
-         __asm__ volatile ("" : : : REGS_TO_SAVE);
-         __asm__ volatile ("str " REG_FP ",%0" : "=m" (fp));
-         __asm__ ("mov %0," REG_SP : "=r" (stackref));
-diff --git a/src/greenlet/platform/switch_csky_gcc.h b/src/greenlet/platform/switch_csky_gcc.h
-index 7486b94..ac469d3 100644
---- a/src/greenlet/platform/switch_csky_gcc.h
-+++ b/src/greenlet/platform/switch_csky_gcc.h
-@@ -23,7 +23,7 @@ __attribute__((optimize("no-omit-frame-pointer")))
- #endif
- slp_switch(void)
- {
--        register int *stackref, stsizediff;
-+        int *stackref, stsizediff;
-         int result;
- 
-         __asm__ volatile ("" : : : REGS_TO_SAVE);
-diff --git a/src/greenlet/platform/switch_mips_unix.h b/src/greenlet/platform/switch_mips_unix.h
-index 1916b26..b9003e9 100644
---- a/src/greenlet/platform/switch_mips_unix.h
-+++ b/src/greenlet/platform/switch_mips_unix.h
-@@ -19,8 +19,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
- #ifdef __mips64
-     uint64_t gpsave;
- #endif
-diff --git a/src/greenlet/platform/switch_ppc64_aix.h b/src/greenlet/platform/switch_ppc64_aix.h
-index e07b8de..e7e0b87 100644
---- a/src/greenlet/platform/switch_ppc64_aix.h
-+++ b/src/greenlet/platform/switch_ppc64_aix.h
-@@ -74,8 +74,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register long *stackref, stsizediff;
-+    int err;
-+    long *stackref, stsizediff;
-     void * toc;
-     void * r30;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-diff --git a/src/greenlet/platform/switch_ppc64_linux.h b/src/greenlet/platform/switch_ppc64_linux.h
-index 88e6847..3c324d0 100644
---- a/src/greenlet/platform/switch_ppc64_linux.h
-+++ b/src/greenlet/platform/switch_ppc64_linux.h
-@@ -76,8 +76,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register long *stackref, stsizediff;
-+    int err;
-+    long *stackref, stsizediff;
-     void * toc;
-     void * r30;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-diff --git a/src/greenlet/platform/switch_ppc_aix.h b/src/greenlet/platform/switch_ppc_aix.h
-index c7d476f..6d93c13 100644
---- a/src/greenlet/platform/switch_ppc_aix.h
-+++ b/src/greenlet/platform/switch_ppc_aix.h
-@@ -53,8 +53,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-     __asm__ ("mr %0, 1" : "=r" (stackref) : );
-     {
-diff --git a/src/greenlet/platform/switch_ppc_linux.h b/src/greenlet/platform/switch_ppc_linux.h
-index 0a71255..e83ad70 100644
---- a/src/greenlet/platform/switch_ppc_linux.h
-+++ b/src/greenlet/platform/switch_ppc_linux.h
-@@ -49,8 +49,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-     __asm__ ("mr %0, 1" : "=r" (stackref) : );
-     {
-diff --git a/src/greenlet/platform/switch_ppc_macosx.h b/src/greenlet/platform/switch_ppc_macosx.h
-index 56e573f..d6e5a03 100644
---- a/src/greenlet/platform/switch_ppc_macosx.h
-+++ b/src/greenlet/platform/switch_ppc_macosx.h
-@@ -46,8 +46,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-     __asm__ ("; asm block 2\n\tmr %0, r1" : "=g" (stackref) : );
-     {
-diff --git a/src/greenlet/platform/switch_ppc_unix.h b/src/greenlet/platform/switch_ppc_unix.h
-index 2b3d307..ca590a5 100644
---- a/src/greenlet/platform/switch_ppc_unix.h
-+++ b/src/greenlet/platform/switch_ppc_unix.h
-@@ -47,8 +47,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-     __asm__ ("mr %0, 1" : "=g" (stackref) : );
-     {
-diff --git a/src/greenlet/platform/switch_s390_unix.h b/src/greenlet/platform/switch_s390_unix.h
-index 6641854..9199367 100644
---- a/src/greenlet/platform/switch_s390_unix.h
-+++ b/src/greenlet/platform/switch_s390_unix.h
-@@ -36,8 +36,8 @@
- static int
- slp_switch(void)
- {
--    register int ret;
--    register long *stackref, stsizediff;
-+    int ret;
-+    long *stackref, stsizediff;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
- #ifdef __s390x__
-     __asm__ volatile ("lgr %0, 15" : "=r" (stackref) : );
-diff --git a/src/greenlet/platform/switch_sparc_sun_gcc.h b/src/greenlet/platform/switch_sparc_sun_gcc.h
-index 652b57f..96990c3 100644
---- a/src/greenlet/platform/switch_sparc_sun_gcc.h
-+++ b/src/greenlet/platform/switch_sparc_sun_gcc.h
-@@ -51,8 +51,8 @@
- static int
- slp_switch(void)
- {
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
- 
-     /* Put current stack pointer into stackref.
-      * Register spilling is done in save/restore.
-diff --git a/src/greenlet/platform/switch_x32_unix.h b/src/greenlet/platform/switch_x32_unix.h
-index cb14ec1..893369c 100644
---- a/src/greenlet/platform/switch_x32_unix.h
-+++ b/src/greenlet/platform/switch_x32_unix.h
-@@ -22,8 +22,8 @@ slp_switch(void)
-     void* ebx;
-     unsigned int csr;
-     unsigned short cw;
--    register int err;
--    register int *stackref, stsizediff;
-+    int err;
-+    int *stackref, stsizediff;
-     __asm__ volatile ("" : : : REGS_TO_SAVE);
-     __asm__ volatile ("fstcw %0" : "=m" (cw));
-     __asm__ volatile ("stmxcsr %0" : "=m" (csr));
-diff --git a/src/greenlet/platform/switch_x86_unix.h b/src/greenlet/platform/switch_x86_unix.h
-index 3a95186..493fa6b 100644
---- a/src/greenlet/platform/switch_x86_unix.h
-+++ b/src/greenlet/platform/switch_x86_unix.h
-@@ -51,7 +51,7 @@ slp_switch(void)
- #endif
-     void *ebp, *ebx;
-     unsigned short cw;
--    register int *stackref, stsizediff;
-+    int *stackref, stsizediff;
-     __asm__ volatile ("" : : : "esi", "edi");
-     __asm__ volatile ("fstcw %0" : "=m" (cw));
-     __asm__ volatile ("movl %%ebp, %0" : "=m" (ebp));
--- 
-2.39.1
-
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_2.0.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenlet_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
index a2e036a89..fbabf12a3 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI += "file://0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch"
-SRC_URI[sha256sum] = "e7c8dc13af7db097bed64a051d2dd49e9f0af495c26995c00a9ee842690d34c0"
+SRC_URI += "${PYPI_SRC_URI}"
+SRC_URI[sha256sum] = "816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd6eb0696acb24005b"
 
 inherit pypi setuptools3
-- 
2.39.2


--===============1835533195037774261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-greenlet: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-2.0.2.tar.gz;downloadfilename=greenlet-2.0.2.tar.gz file://0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch" to "https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-3.0.1.tar.gz;downloadfilename=greenlet-3.0.1.tar.gz https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-3.0.1.tar.gz;downloadfilename=greenlet-3.0.1.tar.gz"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-dbg: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-dbg: PKGSIZE changed from 722792 to 778552 (+8%)
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-dbg: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-dev: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-dev: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-doc: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-doc: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-locale: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-locale: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-src: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-src: PKGSIZE changed from 244425 to 241453 (-1%)
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-src: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-src: FILELIST: directory renamed /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/platform -> /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/platform, directory renamed /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/tests -> /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/tests, removed "/usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_refs.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_internal.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_exceptions.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_cpython_compat.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_allocator.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_slp_switch.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_thread_support.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet.h /usr/src/de
 bug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_thread_state.hpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet.cpp /usr/src/debug/python3-greenlet/2.0.2-r0/src/greenlet/greenlet_greenlet.hpp", added "/usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_refs.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TStackState.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TPythonState.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_slp_switch.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TUserGreenlet.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_exceptions.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TGreenlet.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TGreenletGlobals.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TBrokenGreenlet.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenl
 et/greenlet_thread_state.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TThreadStateDestroy.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_greenlet.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_internal.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_thread_support.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet_allocator.hpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TExceptionState.cpp /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/greenlet.h /usr/src/debug/python3-greenlet/3.0.1-r0/src/greenlet/TMainGreenlet.cpp"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-staticdev: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet-staticdev: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet: PKGV changed from 2.0.2 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet: PKGSIZE changed from 795980 to 858422 (+8%)
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet: PV changed from "2.0.2" to "3.0.1"
packages/core2-64-poky-linux/python3-greenlet/python3-greenlet: FILELIST: directory renamed /usr/lib/python3.11/site-packages/greenlet-2.0.2.dist-info -> /usr/lib/python3.11/site-packages/greenlet-3.0.1.dist-info, added "/usr/lib/python3.11/site-packages/greenlet/TStackState.cpp /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_cpp_exception.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_clearing_run_switches.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_initialstub_already_started.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/TGreenletGlobals.cpp /usr/lib/python3.11/site-packages/greenlet/greenlet_cpython_add_pending.hpp /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenlets2.py /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_gre
 enlets2.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/TGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/platform/switch_loongarch64_linux.h /usr/lib/python3.11/site-packages/greenlet/TUserGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/TThreadStateDestroy.cpp /usr/lib/python3.11/site-packages/greenlet/TMainGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/TBrokenGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_two_greenlets.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_slp_switch.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_two_greenlets.py /usr/lib/python3.11/site-packages/greenlet/TExceptionState.cpp /usr/lib/python3.11/site-packages/greenlet/tests/fail_cpp_exception.py /usr/lib/python3.11/site-packages/greenlet/tests/fail_slp_switch.py /usr/lib/python3.11/site-packages/greenlet/tests/fail_clearing_run_switches.py /usr/lib/python3.11/site-packa
 ges/greenlet/tests/fail_switch_three_greenlets.py /usr/lib/python3.11/site-packages/greenlet/tests/fail_initialstub_already_started.py /usr/lib/python3.11/site-packages/greenlet/TPythonState.cpp"
Changes to packages/core2-64-poky-linux/python3-greenlet (sysroot):
  /usr/lib/python3.11/site-packages/greenlet-2.0.2.dist-info moved to /usr/lib/python3.11/site-packages/greenlet-3.0.1.dist-info
  /usr/lib/python3.11/site-packages/greenlet/greenlet_cpython_add_pending.hpp was added
  /usr/lib/python3.11/site-packages/greenlet/platform/switch_loongarch64_linux.h was added
  /usr/lib/python3.11/site-packages/greenlet/TBrokenGreenlet.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_clearing_run_switches.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_cpp_exception.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_initialstub_already_started.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_slp_switch.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenlets2.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenlets.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_two_greenlets.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_clearing_run_switches.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_cpp_exception.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_initialstub_already_started.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_slp_switch.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets2.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_two_greenlets.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/TExceptionState.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TGreenlet.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TGreenletGlobals.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TMainGreenlet.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TPythonState.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TStackState.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TThreadStateDestroy.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TUserGreenlet.cpp was added

--===============1835533195037774261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-greenlet/python3-greenlet: FILELIST: directory renamed /usr/lib/python3.11/site-packages/greenlet-2.0.2.dist-info -> /usr/lib/python3.11/site-packages/greenlet-3.0.1.dist-info, added "/usr/lib/python3.11/site-packages/greenlet/TGreenletGlobals.cpp /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_clearing_run_switches.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/fail_clearing_run_switches.py /usr/lib/python3.11/site-packages/greenlet/TMainGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/TUserGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/platform/switch_loongarch64_linux.h /usr/lib/python3.11/site-packages/greenlet/TThreadStateDestroy.cpp /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_cpp_exception.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/TExceptionState.cpp /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets.cpython-311.py
 c /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenlets.py /usr/lib/python3.11/site-packages/greenlet/greenlet_cpython_add_pending.hpp /usr/lib/python3.11/site-packages/greenlet/tests/fail_cpp_exception.py /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets2.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_two_greenlets.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/fail_initialstub_already_started.py /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_initialstub_already_started.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/TBrokenGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/TGreenlet.cpp /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_slp_switch.cpython-311.pyc /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_two_greenlets.py /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenl
 ets2.py /usr/lib/python3.11/site-packages/greenlet/TPythonState.cpp /usr/lib/python3.11/site-packages/greenlet/TStackState.cpp /usr/lib/python3.11/site-packages/greenlet/tests/fail_slp_switch.py"
Changes to packages/core2-64-poky-linux/python3-greenlet (sysroot):
  /usr/lib/python3.11/site-packages/greenlet-2.0.2.dist-info moved to /usr/lib/python3.11/site-packages/greenlet-3.0.1.dist-info
  /usr/lib/python3.11/site-packages/greenlet/greenlet_cpython_add_pending.hpp was added
  /usr/lib/python3.11/site-packages/greenlet/platform/switch_loongarch64_linux.h was added
  /usr/lib/python3.11/site-packages/greenlet/TBrokenGreenlet.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_clearing_run_switches.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_cpp_exception.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_initialstub_already_started.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_slp_switch.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenlets2.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_three_greenlets.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/fail_switch_two_greenlets.py was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_clearing_run_switches.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_cpp_exception.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_initialstub_already_started.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_slp_switch.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets2.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_three_greenlets.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/tests/__pycache__/fail_switch_two_greenlets.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/greenlet/TExceptionState.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TGreenlet.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TGreenletGlobals.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TMainGreenlet.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TPythonState.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TStackState.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TThreadStateDestroy.cpp was added
  /usr/lib/python3.11/site-packages/greenlet/TUserGreenlet.cpp was added

--===============1835533195037774261==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-greenlet-upgrade-2.0.2-3.0.1.patch"

RnJvbSBiYjIxZTZhY2NkODEzNTNhMzAzMGE5MjRhNWM1NzQ1NmQ2OWU1Y2IxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMTozNjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ3JlZW5sZXQ6IHVwZ3JhZGUgMi4wLjIgLT4gMy4wLjEKCi0tLQogLi4ubmctcmVnaXN0
ZXItc3RvcmFnZS1jbGFzcy1rZXl3b3JkLWV2LnBhdGNoIHwgMjQ3IC0tLS0tLS0tLS0tLS0tLS0t
LQogLi4ubGV0XzIuMC4yLmJiID0+IHB5dGhvbjMtZ3JlZW5sZXRfMy4wLjEuYmJ9IHwgICA0ICst
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjQ5IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZ3JlZW5sZXQvMDAwMS1jbGVhbnVwLURyb3AtdXNpbmctcmVnaXN0ZXItc3RvcmFnZS1jbGFz
cy1rZXl3b3JkLWV2LnBhdGNoCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtZ3JlZW5sZXRfMi4wLjIuYmIgPT4gcHl0aG9uMy1ncmVlbmxldF8zLjAu
MS5iYn0gKDY1JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWdyZWVubGV0LzAwMDEtY2xlYW51cC1Ecm9wLXVzaW5nLXJlZ2lzdGVyLXN0
b3JhZ2UtY2xhc3Mta2V5d29yZC1ldi5wYXRjaCBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ3JlZW5sZXQvMDAwMS1jbGVhbnVwLURyb3AtdXNpbmctcmVnaXN0
ZXItc3RvcmFnZS1jbGFzcy1rZXl3b3JkLWV2LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAyYTZkZGQ0NzIuLjAwMDAwMDAwMAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWdyZWVubGV0LzAwMDEtY2xlYW51cC1Ecm9wLXVzaW5nLXJl
Z2lzdGVyLXN0b3JhZ2UtY2xhc3Mta2V5d29yZC1ldi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDI0NyArMCwwIEBACi1Gcm9tIDc0ZDhjNWVjZGM2NzdhN2E0MTJjN2Y3ODJmZTg0ODhhNWQ5ODcz
MzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgotRGF0ZTogU3VuLCA1IEZlYiAyMDIzIDE5OjA1OjQ1IC0wODAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGNsZWFudXA6IERyb3AgdXNpbmcgJ3JlZ2lzdGVyJyBzdG9yYWdlIGNsYXNzIGtleXdv
cmQgZXZlcnl3aGVyZQotCi1UaGlzIGhhcyBiZWVuIGRyb3BwZWQgaW4gYysrMTcgYW5kIG5ld2Vy
Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcHl0aG9u
LWdyZWVubGV0L2dyZWVubGV0L3B1bGwvMzQ3XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIHNyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfYWxw
aGFfdW5peC5oICAgIHwgNCArKy0tCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hcm0z
Ml9nY2MuaCAgICAgfCAyICstCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hcm0zMl9p
b3MuaCAgICAgfCAyICstCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9jc2t5X2djYy5o
ICAgICAgfCAyICstCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9taXBzX3VuaXguaCAg
ICAgfCA0ICsrLS0KLSBzcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3BwYzY0X2FpeC5oICAg
ICB8IDQgKystLQotIHNyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBjNjRfbGludXguaCAg
IHwgNCArKy0tCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9wcGNfYWl4LmggICAgICAg
fCA0ICsrLS0KLSBzcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3BwY19saW51eC5oICAgICB8
IDQgKystLQotIHNyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBjX21hY29zeC5oICAgIHwg
NCArKy0tCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9wcGNfdW5peC5oICAgICAgfCA0
ICsrLS0KLSBzcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3MzOTBfdW5peC5oICAgICB8IDQg
KystLQotIHNyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfc3BhcmNfc3VuX2djYy5oIHwgNCAr
Ky0tCi0gc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF94MzJfdW5peC5oICAgICAgfCA0ICsr
LS0KLSBzcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3g4Nl91bml4LmggICAgICB8IDIgKy0K
LSAxNSBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKLQot
ZGlmZiAtLWdpdCBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfYWxwaGFfdW5peC5oIGIv
c3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hbHBoYV91bml4LmgKLWluZGV4IDIxNjYxOWYu
LjdlMDdhYmYgMTAwNjQ0Ci0tLS0gYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX2FscGhh
X3VuaXguaAotKysrIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hbHBoYV91bml4LmgK
LUBAIC05LDggKzksOCBAQAotIHN0YXRpYyBpbnQKLSBzbHBfc3dpdGNoKHZvaWQpCi0gewotLSAg
cmVnaXN0ZXIgaW50IHJldDsKLS0gIHJlZ2lzdGVyIGxvbmcgKnN0YWNrcmVmLCBzdHNpemVkaWZm
OwotKyAgaW50IHJldDsKLSsgIGxvbmcgKnN0YWNrcmVmLCBzdHNpemVkaWZmOwotICAgX19hc21f
XyB2b2xhdGlsZSAoIiIgOiA6IDogUkVHU19UT19TQVZFKTsKLSAgIF9fYXNtX18gdm9sYXRpbGUg
KCJtb3YgJDMwLCAlMCIgOiAiPXIiIChzdGFja3JlZikgOiApOwotICAgewotZGlmZiAtLWdpdCBh
L3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfYXJtMzJfZ2NjLmggYi9zcmMvZ3JlZW5sZXQv
cGxhdGZvcm0vc3dpdGNoX2FybTMyX2djYy5oCi1pbmRleCAwMzVkNmI5Li42NTUwMDNhIDEwMDY0
NAotLS0tIGEvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hcm0zMl9nY2MuaAotKysrIGIv
c3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hcm0zMl9nY2MuaAotQEAgLTU2LDcgKzU2LDcg
QEAgX19hdHRyaWJ1dGVfXygob3B0aW1pemUoIm5vLW9taXQtZnJhbWUtcG9pbnRlciIpKSkKLSBz
bHBfc3dpdGNoKHZvaWQpCi0gewotICAgICAgICAgdm9pZCAqZnA7Ci0tICAgICAgICByZWdpc3Rl
ciBpbnQgKnN0YWNrcmVmLCBzdHNpemVkaWZmOwotKyAgICAgICAgaW50ICpzdGFja3JlZiwgc3Rz
aXplZGlmZjsKLSAgICAgICAgIGludCByZXN1bHQ7Ci0gICAgICAgICBfX2FzbV9fIHZvbGF0aWxl
ICgiIiA6IDogOiBSRUdTX1RPX1NBVkUpOwotICAgICAgICAgX19hc21fXyB2b2xhdGlsZSAoIm1v
diByMCwiIFJFR19GUCAiXG5cdHN0ciByMCwlMCIgOiAiPW0iIChmcCkgOiA6ICJyMCIpOwotZGlm
ZiAtLWdpdCBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfYXJtMzJfaW9zLmggYi9zcmMv
Z3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX2FybTMyX2lvcy5oCi1pbmRleCBlOTkzNzA3Li45ZTY0
MGUxIDEwMDY0NAotLS0tIGEvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hcm0zMl9pb3Mu
aAotKysrIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9hcm0zMl9pb3MuaAotQEAgLTM4
LDcgKzM4LDcgQEAgX19hdHRyaWJ1dGVfXygob3B0aW1pemUoIm5vLW9taXQtZnJhbWUtcG9pbnRl
ciIpKSkKLSBzbHBfc3dpdGNoKHZvaWQpCi0gewotICAgICAgICAgdm9pZCAqZnA7Ci0tICAgICAg
ICByZWdpc3RlciBpbnQgKnN0YWNrcmVmLCBzdHNpemVkaWZmLCByZXN1bHQ7Ci0rICAgICAgICBp
bnQgKnN0YWNrcmVmLCBzdHNpemVkaWZmLCByZXN1bHQ7Ci0gICAgICAgICBfX2FzbV9fIHZvbGF0
aWxlICgiIiA6IDogOiBSRUdTX1RPX1NBVkUpOwotICAgICAgICAgX19hc21fXyB2b2xhdGlsZSAo
InN0ciAiIFJFR19GUCAiLCUwIiA6ICI9bSIgKGZwKSk7Ci0gICAgICAgICBfX2FzbV9fICgibW92
ICUwLCIgUkVHX1NQIDogIj1yIiAoc3RhY2tyZWYpKTsKLWRpZmYgLS1naXQgYS9zcmMvZ3JlZW5s
ZXQvcGxhdGZvcm0vc3dpdGNoX2Nza3lfZ2NjLmggYi9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dp
dGNoX2Nza3lfZ2NjLmgKLWluZGV4IDc0ODZiOTQuLmFjNDY5ZDMgMTAwNjQ0Ci0tLS0gYS9zcmMv
Z3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX2Nza3lfZ2NjLmgKLSsrKyBiL3NyYy9ncmVlbmxldC9w
bGF0Zm9ybS9zd2l0Y2hfY3NreV9nY2MuaAotQEAgLTIzLDcgKzIzLDcgQEAgX19hdHRyaWJ1dGVf
Xygob3B0aW1pemUoIm5vLW9taXQtZnJhbWUtcG9pbnRlciIpKSkKLSAjZW5kaWYKLSBzbHBfc3dp
dGNoKHZvaWQpCi0gewotLSAgICAgICAgcmVnaXN0ZXIgaW50ICpzdGFja3JlZiwgc3RzaXplZGlm
ZjsKLSsgICAgICAgIGludCAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0gICAgICAgICBpbnQgcmVz
dWx0OwotIAotICAgICAgICAgX19hc21fXyB2b2xhdGlsZSAoIiIgOiA6IDogUkVHU19UT19TQVZF
KTsKLWRpZmYgLS1naXQgYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX21pcHNfdW5peC5o
IGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9taXBzX3VuaXguaAotaW5kZXggMTkxNmIy
Ni4uYjkwMDNlOSAxMDA2NDQKLS0tLSBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfbWlw
c191bml4LmgKLSsrKyBiL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfbWlwc191bml4LmgK
LUBAIC0xOSw4ICsxOSw4IEBACi0gc3RhdGljIGludAotIHNscF9zd2l0Y2godm9pZCkKLSB7Ci0t
ICAgIHJlZ2lzdGVyIGludCBlcnI7Ci0tICAgIHJlZ2lzdGVyIGludCAqc3RhY2tyZWYsIHN0c2l6
ZWRpZmY7Ci0rICAgIGludCBlcnI7Ci0rICAgIGludCAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0g
I2lmZGVmIF9fbWlwczY0Ci0gICAgIHVpbnQ2NF90IGdwc2F2ZTsKLSAjZW5kaWYKLWRpZmYgLS1n
aXQgYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3BwYzY0X2FpeC5oIGIvc3JjL2dyZWVu
bGV0L3BsYXRmb3JtL3N3aXRjaF9wcGM2NF9haXguaAotaW5kZXggZTA3YjhkZS4uZTdlMGI4NyAx
MDA2NDQKLS0tLSBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBjNjRfYWl4LmgKLSsr
KyBiL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBjNjRfYWl4LmgKLUBAIC03NCw4ICs3
NCw4IEBACi0gc3RhdGljIGludAotIHNscF9zd2l0Y2godm9pZCkKLSB7Ci0tICAgIHJlZ2lzdGVy
IGludCBlcnI7Ci0tICAgIHJlZ2lzdGVyIGxvbmcgKnN0YWNrcmVmLCBzdHNpemVkaWZmOwotKyAg
ICBpbnQgZXJyOwotKyAgICBsb25nICpzdGFja3JlZiwgc3RzaXplZGlmZjsKLSAgICAgdm9pZCAq
IHRvYzsKLSAgICAgdm9pZCAqIHIzMDsKLSAgICAgX19hc21fXyB2b2xhdGlsZSAoIiIgOiA6IDog
UkVHU19UT19TQVZFKTsKLWRpZmYgLS1naXQgYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNo
X3BwYzY0X2xpbnV4LmggYi9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3BwYzY0X2xpbnV4
LmgKLWluZGV4IDg4ZTY4NDcuLjNjMzI0ZDAgMTAwNjQ0Ci0tLS0gYS9zcmMvZ3JlZW5sZXQvcGxh
dGZvcm0vc3dpdGNoX3BwYzY0X2xpbnV4LmgKLSsrKyBiL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9z
d2l0Y2hfcHBjNjRfbGludXguaAotQEAgLTc2LDggKzc2LDggQEAKLSBzdGF0aWMgaW50Ci0gc2xw
X3N3aXRjaCh2b2lkKQotIHsKLS0gICAgcmVnaXN0ZXIgaW50IGVycjsKLS0gICAgcmVnaXN0ZXIg
bG9uZyAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0rICAgIGludCBlcnI7Ci0rICAgIGxvbmcgKnN0
YWNrcmVmLCBzdHNpemVkaWZmOwotICAgICB2b2lkICogdG9jOwotICAgICB2b2lkICogcjMwOwot
ICAgICBfX2FzbV9fIHZvbGF0aWxlICgiIiA6IDogOiBSRUdTX1RPX1NBVkUpOwotZGlmZiAtLWdp
dCBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBjX2FpeC5oIGIvc3JjL2dyZWVubGV0
L3BsYXRmb3JtL3N3aXRjaF9wcGNfYWl4LmgKLWluZGV4IGM3ZDQ3NmYuLjZkOTNjMTMgMTAwNjQ0
Ci0tLS0gYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3BwY19haXguaAotKysrIGIvc3Jj
L2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9wcGNfYWl4LmgKLUBAIC01Myw4ICs1Myw4IEBACi0g
c3RhdGljIGludAotIHNscF9zd2l0Y2godm9pZCkKLSB7Ci0tICAgIHJlZ2lzdGVyIGludCBlcnI7
Ci0tICAgIHJlZ2lzdGVyIGludCAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0rICAgIGludCBlcnI7
Ci0rICAgIGludCAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0gICAgIF9fYXNtX18gdm9sYXRpbGUg
KCIiIDogOiA6IFJFR1NfVE9fU0FWRSk7Ci0gICAgIF9fYXNtX18gKCJtciAlMCwgMSIgOiAiPXIi
IChzdGFja3JlZikgOiApOwotICAgICB7Ci1kaWZmIC0tZ2l0IGEvc3JjL2dyZWVubGV0L3BsYXRm
b3JtL3N3aXRjaF9wcGNfbGludXguaCBiL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBj
X2xpbnV4LmgKLWluZGV4IDBhNzEyNTUuLmU4M2FkNzAgMTAwNjQ0Ci0tLS0gYS9zcmMvZ3JlZW5s
ZXQvcGxhdGZvcm0vc3dpdGNoX3BwY19saW51eC5oCi0rKysgYi9zcmMvZ3JlZW5sZXQvcGxhdGZv
cm0vc3dpdGNoX3BwY19saW51eC5oCi1AQCAtNDksOCArNDksOCBAQAotIHN0YXRpYyBpbnQKLSBz
bHBfc3dpdGNoKHZvaWQpCi0gewotLSAgICByZWdpc3RlciBpbnQgZXJyOwotLSAgICByZWdpc3Rl
ciBpbnQgKnN0YWNrcmVmLCBzdHNpemVkaWZmOwotKyAgICBpbnQgZXJyOwotKyAgICBpbnQgKnN0
YWNrcmVmLCBzdHNpemVkaWZmOwotICAgICBfX2FzbV9fIHZvbGF0aWxlICgiIiA6IDogOiBSRUdT
X1RPX1NBVkUpOwotICAgICBfX2FzbV9fICgibXIgJTAsIDEiIDogIj1yIiAoc3RhY2tyZWYpIDog
KTsKLSAgICAgewotZGlmZiAtLWdpdCBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfcHBj
X21hY29zeC5oIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9wcGNfbWFjb3N4LmgKLWlu
ZGV4IDU2ZTU3M2YuLmQ2ZTVhMDMgMTAwNjQ0Ci0tLS0gYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0v
c3dpdGNoX3BwY19tYWNvc3guaAotKysrIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9w
cGNfbWFjb3N4LmgKLUBAIC00Niw4ICs0Niw4IEBACi0gc3RhdGljIGludAotIHNscF9zd2l0Y2go
dm9pZCkKLSB7Ci0tICAgIHJlZ2lzdGVyIGludCBlcnI7Ci0tICAgIHJlZ2lzdGVyIGludCAqc3Rh
Y2tyZWYsIHN0c2l6ZWRpZmY7Ci0rICAgIGludCBlcnI7Ci0rICAgIGludCAqc3RhY2tyZWYsIHN0
c2l6ZWRpZmY7Ci0gICAgIF9fYXNtX18gdm9sYXRpbGUgKCIiIDogOiA6IFJFR1NfVE9fU0FWRSk7
Ci0gICAgIF9fYXNtX18gKCI7IGFzbSBibG9jayAyXG5cdG1yICUwLCByMSIgOiAiPWciIChzdGFj
a3JlZikgOiApOwotICAgICB7Ci1kaWZmIC0tZ2l0IGEvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3
aXRjaF9wcGNfdW5peC5oIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9wcGNfdW5peC5o
Ci1pbmRleCAyYjNkMzA3Li5jYTU5MGE1IDEwMDY0NAotLS0tIGEvc3JjL2dyZWVubGV0L3BsYXRm
b3JtL3N3aXRjaF9wcGNfdW5peC5oCi0rKysgYi9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNo
X3BwY191bml4LmgKLUBAIC00Nyw4ICs0Nyw4IEBACi0gc3RhdGljIGludAotIHNscF9zd2l0Y2go
dm9pZCkKLSB7Ci0tICAgIHJlZ2lzdGVyIGludCBlcnI7Ci0tICAgIHJlZ2lzdGVyIGludCAqc3Rh
Y2tyZWYsIHN0c2l6ZWRpZmY7Ci0rICAgIGludCBlcnI7Ci0rICAgIGludCAqc3RhY2tyZWYsIHN0
c2l6ZWRpZmY7Ci0gICAgIF9fYXNtX18gdm9sYXRpbGUgKCIiIDogOiA6IFJFR1NfVE9fU0FWRSk7
Ci0gICAgIF9fYXNtX18gKCJtciAlMCwgMSIgOiAiPWciIChzdGFja3JlZikgOiApOwotICAgICB7
Ci1kaWZmIC0tZ2l0IGEvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9zMzkwX3VuaXguaCBi
L3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfczM5MF91bml4LmgKLWluZGV4IDY2NDE4NTQu
LjkxOTkzNjcgMTAwNjQ0Ci0tLS0gYS9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3MzOTBf
dW5peC5oCi0rKysgYi9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3MzOTBfdW5peC5oCi1A
QCAtMzYsOCArMzYsOCBAQAotIHN0YXRpYyBpbnQKLSBzbHBfc3dpdGNoKHZvaWQpCi0gewotLSAg
ICByZWdpc3RlciBpbnQgcmV0OwotLSAgICByZWdpc3RlciBsb25nICpzdGFja3JlZiwgc3RzaXpl
ZGlmZjsKLSsgICAgaW50IHJldDsKLSsgICAgbG9uZyAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0g
ICAgIF9fYXNtX18gdm9sYXRpbGUgKCIiIDogOiA6IFJFR1NfVE9fU0FWRSk7Ci0gI2lmZGVmIF9f
czM5MHhfXwotICAgICBfX2FzbV9fIHZvbGF0aWxlICgibGdyICUwLCAxNSIgOiAiPXIiIChzdGFj
a3JlZikgOiApOwotZGlmZiAtLWdpdCBhL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hfc3Bh
cmNfc3VuX2djYy5oIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF9zcGFyY19zdW5fZ2Nj
LmgKLWluZGV4IDY1MmI1N2YuLjk2OTkwYzMgMTAwNjQ0Ci0tLS0gYS9zcmMvZ3JlZW5sZXQvcGxh
dGZvcm0vc3dpdGNoX3NwYXJjX3N1bl9nY2MuaAotKysrIGIvc3JjL2dyZWVubGV0L3BsYXRmb3Jt
L3N3aXRjaF9zcGFyY19zdW5fZ2NjLmgKLUBAIC01MSw4ICs1MSw4IEBACi0gc3RhdGljIGludAot
IHNscF9zd2l0Y2godm9pZCkKLSB7Ci0tICAgIHJlZ2lzdGVyIGludCBlcnI7Ci0tICAgIHJlZ2lz
dGVyIGludCAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0rICAgIGludCBlcnI7Ci0rICAgIGludCAq
c3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0gCi0gICAgIC8qIFB1dCBjdXJyZW50IHN0YWNrIHBvaW50
ZXIgaW50byBzdGFja3JlZi4KLSAgICAgICogUmVnaXN0ZXIgc3BpbGxpbmcgaXMgZG9uZSBpbiBz
YXZlL3Jlc3RvcmUuCi1kaWZmIC0tZ2l0IGEvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF94
MzJfdW5peC5oIGIvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3aXRjaF94MzJfdW5peC5oCi1pbmRl
eCBjYjE0ZWMxLi44OTMzNjljIDEwMDY0NAotLS0tIGEvc3JjL2dyZWVubGV0L3BsYXRmb3JtL3N3
aXRjaF94MzJfdW5peC5oCi0rKysgYi9zcmMvZ3JlZW5sZXQvcGxhdGZvcm0vc3dpdGNoX3gzMl91
bml4LmgKLUBAIC0yMiw4ICsyMiw4IEBAIHNscF9zd2l0Y2godm9pZCkKLSAgICAgdm9pZCogZWJ4
OwotICAgICB1bnNpZ25lZCBpbnQgY3NyOwotICAgICB1bnNpZ25lZCBzaG9ydCBjdzsKLS0gICAg
cmVnaXN0ZXIgaW50IGVycjsKLS0gICAgcmVnaXN0ZXIgaW50ICpzdGFja3JlZiwgc3RzaXplZGlm
ZjsKLSsgICAgaW50IGVycjsKLSsgICAgaW50ICpzdGFja3JlZiwgc3RzaXplZGlmZjsKLSAgICAg
X19hc21fXyB2b2xhdGlsZSAoIiIgOiA6IDogUkVHU19UT19TQVZFKTsKLSAgICAgX19hc21fXyB2
b2xhdGlsZSAoImZzdGN3ICUwIiA6ICI9bSIgKGN3KSk7Ci0gICAgIF9fYXNtX18gdm9sYXRpbGUg
KCJzdG14Y3NyICUwIiA6ICI9bSIgKGNzcikpOwotZGlmZiAtLWdpdCBhL3NyYy9ncmVlbmxldC9w
bGF0Zm9ybS9zd2l0Y2hfeDg2X3VuaXguaCBiL3NyYy9ncmVlbmxldC9wbGF0Zm9ybS9zd2l0Y2hf
eDg2X3VuaXguaAotaW5kZXggM2E5NTE4Ni4uNDkzZmE2YiAxMDA2NDQKLS0tLSBhL3NyYy9ncmVl
bmxldC9wbGF0Zm9ybS9zd2l0Y2hfeDg2X3VuaXguaAotKysrIGIvc3JjL2dyZWVubGV0L3BsYXRm
b3JtL3N3aXRjaF94ODZfdW5peC5oCi1AQCAtNTEsNyArNTEsNyBAQCBzbHBfc3dpdGNoKHZvaWQp
Ci0gI2VuZGlmCi0gICAgIHZvaWQgKmVicCwgKmVieDsKLSAgICAgdW5zaWduZWQgc2hvcnQgY3c7
Ci0tICAgIHJlZ2lzdGVyIGludCAqc3RhY2tyZWYsIHN0c2l6ZWRpZmY7Ci0rICAgIGludCAqc3Rh
Y2tyZWYsIHN0c2l6ZWRpZmY7Ci0gICAgIF9fYXNtX18gdm9sYXRpbGUgKCIiIDogOiA6ICJlc2ki
LCAiZWRpIik7Ci0gICAgIF9fYXNtX18gdm9sYXRpbGUgKCJmc3RjdyAlMCIgOiAiPW0iIChjdykp
OwotICAgICBfX2FzbV9fIHZvbGF0aWxlICgibW92bCAlJWVicCwgJTAiIDogIj1tIiAoZWJwKSk7
Ci0tLSAKLTIuMzkuMQotCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWdyZWVubGV0XzIuMC4yLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1ncmVlbmxldF8zLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDY1JQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWdyZWVubGV0XzIuMC4yLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWdyZWVubGV0XzMuMC4xLmJiCmluZGV4IGEyZTAzNmE4OS4uZmJh
YmYxMmEzIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWdyZWVubGV0XzIuMC4yLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ3JlZW5sZXRfMy4wLjEuYmIKQEAgLTQsNyArNCw3IEBAIExJQ0VO
U0UgPSAiTUlUICYgUFNGLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWU5NTY2OGQ2OGU0MzI5MDg1YzdhYjM1MzVlNmE3YWVlIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOU0UuUFNGO21kNT1jMTA2OTMxZDk0MjllZGEwNDkyNjE3ZjAzN2I4ZjY5
YSIKIAotU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtY2xlYW51cC1Ecm9wLXVzaW5nLXJlZ2lzdGVy
LXN0b3JhZ2UtY2xhc3Mta2V5d29yZC1ldi5wYXRjaCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJl
N2M4ZGMxM2FmN2RiMDk3YmVkNjRhMDUxZDJkZDQ5ZTlmMGFmNDk1YzI2OTk1YzAwYTllZTg0MjY5
MGQzNGMwIgorU1JDX1VSSSArPSAiJHtQWVBJX1NSQ19VUkl9IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjgxNmJkOTQ4OGE5NGNiYTc4ZDkzZTFhYmI1ODAwMGU4MjY2ZmE5Y2MyYWE5Y2NkZDZlYjA2
OTZhY2IyNDAwNWIiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwotLSAKMi4zOS4yCgo=

--===============1835533195037774261==--

