Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id ED9B46C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 00:27:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j10so3837979wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 16:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a/zj1GS02WptDFL3WtWZWAevFg6LirdXddlFFyi2ipY=;
	b=FA7RKa1ZI46eftxiKoOFd5IBEj3DZyWnchXx8oUMWbOBlqNROEMo2dV7ChZVunvqFA
	PkWfFsTKqcq2f4+QbbDDBgu4B7aRRAthMHGkILjKTBuehAFq9I0SRqfOujkYm4lFJ+nD
	hUkNNUNM6PDf7DdQy13wFViiYhUaX+cQizVcpWUHwjxloKH4cGk+8/sXh+SiFDDML8K7
	XbtFKs0ntJIbYSDdEKERDVBOTxN8l/T5fQ+LAZB2Pq952JyI1gJIykWg1PhZuUxNocXm
	NgfdG2GKyJegT2cTrFo5fP4CnpV0dyM2pBkI4ILAW1fAr4PkvhcekZDn2eQijLPvvm2q
	dXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a/zj1GS02WptDFL3WtWZWAevFg6LirdXddlFFyi2ipY=;
	b=oN4C1SUorahXtgUiAtHZElWTZz91t2gJkaGo07Jwld28q6ryWVBY4GfgqzNSFR38lC
	59xc7h3J8FlhUQacOExQ39unS/iRHJyNrxkwmVFqHCC3TkfHtmiYSKf9qToeanJZ82ck
	MAwsw9f93YB0p89KCZjhgV2dGGXbUdyQjp7apVD5CLWHQLUAq14EUkWPLMw/s8jKgxvi
	XA7aj4LS99dtqnW1vkXxDFIGRflkktfebWalaFcZMQzhc95h+WT0eAKl/vHA1xi5jntX
	ayu3gkl13cKHsvMEMYs+JAxxvC59m0FU4dKVBiDy8CvGmQ3sfRoDiixca+btmlPrU66m
	AjdA==
X-Gm-Message-State: AA+aEWa0dBFSLGvW7TbPUoLVNzzyz9ZHk3gpr8Az1saxA3y5MDC7vl5d
	+Xmsz2pAPaBVgMUkirf+1s7sO3Wo
X-Google-Smtp-Source: AFSGD/ViEkgvtNRrSFMGWOl609jc3i8cU5by2DjfuqXW+ajBHNBsd3curzk6MV9sXrUREArFkbaqsg==
X-Received: by 2002:adf:80cf:: with SMTP id 73mr697366wrl.57.1542760021385;
	Tue, 20 Nov 2018 16:27:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b13sm15787006wrn.28.2018.11.20.16.26.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 16:27:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 00:26:58 +0000
Message-Id: <20181121002658.4391-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] vboxguestdrivers: upgrade to 5.2.22
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
X-List-Received-Date: Wed, 21 Nov 2018 00:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

VirtualBox 5.2.22 (released November 09 2018)

This is a maintenance release. The following items were fixed and/or added:

Audio: fixed a regression in the Core Audio backend causing a hang when returning from host sleep when processing input buffers
Audio: fixed a potential crash in the HDA emulation if a stream has no valid mixer sink attached -- thanks to Rink Springer (rink@…) (bug #17664)
Windows hosts: fixed an incompatibility with recent versions of Windows 10 (bug #17977)
Windows hosts: fixed a number of bridged networking driver crashes (bug #18046)
Linux Additions: disable 3D for recent guests using Wayland (bug #18116)
Linux Additions: fix for rebuilding kernel modules for new kernels on RPM guests
Linux Additions: further fixes for Linux 4.19
Linux Additions: fixed errors rebuilding initrd files with dracut on EL 6 (bug #18055)
Linux Additions: fixed 5.2.20 regression: guests not remembering the screen size after shutdown and restart (bug #18078)

VirtualBox 5.2.20 (released October 16 2018)

This is a maintenance release. The following items were fixed and/or added:

VMM: fixed task switches triggered by INTn instruction (bug #17979)
Storage: fixed connecting to certain iSCSI targets (bug #17507)
Storage: fixed handling of flush requests when configured to be ignored when the host I/O cache is used (bug #17573)
Drag and drop: implemented support for UNC paths (bug #17146)
Drag and drop: fixed resuming operation when restoring from a saved state (bug #17649)
Drag and drop: fixed copying files with long file names (> 248 characters) from guests to Windows hosts (bug #17447)
Drag and drop: fixed handling files with Unicode names on Windows guests (bug #15501)
Drag and drop: fixed copying empty (0-byte) files to / from guests (bugs #14863 + #17443)
Drag and drop: fixed copying over files from hosts to Linux guests (bug #16025)
Networking: restore connectivity for guests bridged to host adapters that were unavailable temporarily (Windows hosts, bug #17090)
Guest Control: fixed hang when using --wait-stdout and/or --wait-stderr (bug #17386). Needs updating Guest Additions
Video recording: fixed starting video recording on VM power up (bug #17307)
Linux Additions: various build fixes for kernel modules on recent distributions, and made sure modules end up in initramfs files
Linux Additions: build fixes for 4.19, thank you Larry Finger
Linux Additions: various small fixes for video driver

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vboxguestdrivers/kernel-4.18.patch        | 33 -------------------
 ...s_5.2.18.bb => vboxguestdrivers_5.2.22.bb} |  8 +++--
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.18.bb => vboxguestdrivers_5.2.22.bb} (92%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch
deleted file mode 100644
index 93eaa3d6c1..0000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Description: Fix build failure with new kernel 4.18
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-
-Upstream-Status:Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: vbox_module/vboxsf/utils.c
-===================================================================
---- vbox_module.orig/vboxsf/utils.c
-+++ vbox_module/vboxsf/utils.c
-@@ -50,7 +50,11 @@ static void sf_timespec_from_ftime(RTTIM
-     RTTimeSpecSetNano(ts, t);
- }
- #else /* >= 2.6.0 */
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 18, 0)
- static void sf_ftime_from_timespec(struct timespec *tv, RTTIMESPEC *ts)
-+#else
-+static void sf_ftime_from_timespec(struct timespec64 *tv, RTTIMESPEC *ts)
-+#endif
- {
-     int64_t t = RTTimeSpecGetNano(ts);
-     int64_t nsec;
-@@ -60,7 +64,11 @@ static void sf_ftime_from_timespec(struc
-     tv->tv_nsec = nsec;
- }
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 18, 0)
- static void sf_timespec_from_ftime(RTTIMESPEC *ts, struct timespec *tv)
-+#else
-+static void sf_timespec_from_ftime(RTTIMESPEC *ts, struct timespec64 *tv)
-+#endif
- {
-     int64_t t = (int64_t)tv->tv_nsec + (int64_t)tv->tv_sec * 1000000000;
-     RTTimeSpecSetNano(ts, t);
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
similarity index 92%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
index 2a4cc387f7..e394f34c76 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
@@ -13,10 +13,9 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://kernel-4.18.patch \
 "
-SRC_URI[md5sum] = "d8e291525b84569356773eef507c49ce"
-SRC_URI[sha256sum] = "ed0a7efd56c7f39fae79c7ec3321473da412ef0d7914457b66f42679d513efcf"
+SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
+SRC_URI[sha256sum] = "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
 
 S = "${WORKDIR}/vbox_module"
 
@@ -25,6 +24,9 @@ export BUILD_TARGET_ARCH_x86-64="amd64"
 
 EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
 
+# otherwise 5.2.22 builds just vboxguest
+MAKE_TARGETS = "all"
+
 addtask export_sources before do_patch after do_unpack
 
 do_export_sources() {
-- 
2.17.1


