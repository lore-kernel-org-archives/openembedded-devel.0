Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99522C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:44:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.841.1636746253333786250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=izuxojOP;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id u1so17358470wru.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IiUJqdtw+oD/ixWIl1LDIj7q121zNYHtM3h2yMzsjRE=;
        b=izuxojOPjbJA2m18oO7xoC2hp7N0af90daIxIOs5hCAboJAE6sPnPPSY3IGPKzs1Ht
         gbXNH9U93ajNt6g26YbLt9ojm9EosMth+zs2eDRRLvMWZ6KvZXOLZD6SlpillDqb2kdK
         w24Zo+XPEyutPBrhy4Qe6yf9GoJwCMjbM/rQmBIjFj/8GsP0sGggKiSZop5kU5vXFF94
         sXVUxEa4hWHR5WmjUtDYHZt5zMG6Wb5ZF9RnvmAcoPRZMcia0EJ6TZeBDmpSfJC1OgZ/
         iAX49ga7EiDW1J4XuFeHXU8IC0LJ+Ys9jUMjg/NMRrbA8X4MFKIbb9/Aop10PX/rHDRf
         kT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IiUJqdtw+oD/ixWIl1LDIj7q121zNYHtM3h2yMzsjRE=;
        b=w2aIUpdB66ah/ul4e5oXRpZTae3I267tUqscLEkMTodk0cmZfc8Sfj3HbRV6cYoyii
         4t1Hlgz08U14Ndn5a6JgKhRK5wtv8oeFn8YbFoQQ0w8b/vGgUkMgL7RTfWObiyP4hUiK
         Zte91OKU5sDDXgZI9tAApyxOlm3iynTkKYf9Gaw1QuqL3nNPn71bZ02gkl88nEOXUz2q
         bZ4v/wh1vfnmqpaKwstcGpE1S/GtmCMxfnRTq1wqOyZH61UyhwDSRgKAIK9PfUKrTn4o
         ddLhE84gLiwbV6m7WdbQlbURyQRuveiRJdHlkuLceT5wIWFXR5+rO26uTLngI1cr+kcR
         peTQ==
X-Gm-Message-State: AOAM531CD7wr3tt/66+V5VtmYCsD+aSz0QjtAoJbURNeBPMvYpjPbE9s
	kYR7MYLOMuUPmWcrHLvoYXcpyAMGfX8tWw==
X-Google-Smtp-Source: 
 ABdhPJwMbWGp9g89+7Y/5+i34X5TLxF/1KlH3WkpSiINc1ExxFD2BuUb/0Bo+53lkNrQkw7LYZ66RQ==
X-Received: by 2002:adf:ec90:: with SMTP id
 z16mr22298341wrn.247.1636746251700;
        Fri, 12 Nov 2021 11:44:11 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c17sm6927535wmk.23.2021.11.12.11.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:44:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] open-vpm-tools: update 11.2.5 -> 11.3.5
Date: Fri, 12 Nov 2021 20:44:08 +0100
Message-Id: <20211112194408.1496194-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211112194408.1496194-1-alex@linutronix.de>
References: <20211112194408.1496194-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 19:44:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93925

Drop
0001-hgfsmounter-Makefile.am-support-usrmerge.patch
(file no longer present)
0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
(issue fixed upstream)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-Add-resolv_compat.h-for-musl-builds.patch |  8 ++--
 ...mounter-Makefile.am-support-usrmerge.patch | 33 ---------------
 ...latile-qualifier-exposed-incorrectly.patch | 29 -------------
 ...ux-Consider-64bit-time_t-possibility.patch | 23 ++++------
 ...7-Fix-subdir-objects-configure-error.patch | 22 +++++++---
 ...012-Use-off64_t-instead-of-__off64_t.patch |  7 ++--
 ...ools_11.2.5.bb => open-vm-tools_11.3.5.bb} | 42 +++++++++----------
 7 files changed, 52 insertions(+), 112 deletions(-)
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_11.2.5.bb => open-vm-tools_11.3.5.bb} (74%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
index aa7a5607c..c09bc1252 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
@@ -1,4 +1,4 @@
-From c0c36ba5dd7047710e4c3135f147ce4119021200 Mon Sep 17 00:00:00 2001
+From f93b680ec1a816ffe90d5f1bce609f8bf68a456e Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Wed, 14 Apr 2021 10:24:52 -0400
 Subject: [PATCH] Add resolv_compat.h for musl builds
@@ -10,6 +10,7 @@ https://gitweb.gentoo.org/proj/musl.git/tree/dev-qt/qtwebengine/files/qtwebengin
 Upstream-Status: Pending
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
 ---
  open-vm-tools/lib/nicInfo/nicInfoPosix.c  |  4 +++
  open-vm-tools/lib/nicInfo/resolv_compat.h | 30 +++++++++++++++++++++++
@@ -17,7 +18,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  create mode 100644 open-vm-tools/lib/nicInfo/resolv_compat.h
 
 diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
-index 8710c542..25f3146e 100644
+index c56b73cf..8ae3b2f7 100644
 --- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 +++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 @@ -70,6 +70,10 @@
@@ -67,6 +68,3 @@ index 00000000..d768464b
 +}
 +#endif
 +
--- 
-2.30.2
-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
deleted file mode 100644
index 82443ee66..000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 33798f3e484ebd3470e9da791b73b4b90ba12bc3 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 14 Jan 2020 15:04:03 +0800
-Subject: [PATCH] hgfsmounter/Makefile.am: support usrmerge
-
-There is a do_package error when enable usrmerge feature due to the
-hardcoded sbin directory. Remove this piece of code because we already
-create the symbolic link in do_install.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- open-vm-tools/hgfsmounter/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/open-vm-tools/hgfsmounter/Makefile.am b/open-vm-tools/hgfsmounter/Makefile.am
-index 7c1ba1a..58bd3f8 100644
---- a/open-vm-tools/hgfsmounter/Makefile.am
-+++ b/open-vm-tools/hgfsmounter/Makefile.am
-@@ -39,9 +39,6 @@ uninstall-hook:
- 	rm -f $(DESTDIR)$(sbindir)/mount_vmhgfs
- else
- install-exec-hook:
--	-$(MKDIR_P) $(DESTDIR)/sbin
--	-$(LN_S) $(DESTDIR)$(sbindir)/mount.vmhgfs \
--		$(DESTDIR)/sbin/mount.vmhgfs &> /dev/null
- uninstall-hook:
- 	rm -f $(DESTDIR)/sbin/mount.vmhgfs
- endif !FREEBSD
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
deleted file mode 100644
index fdcd7d614..000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 524fd4db646b4ac2155074b4cedf8436a8ff726d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Apr 2021 06:58:31 -0700
-Subject: [PATCH] pollGtk: Fix volatile qualifier exposed incorrectly
-
-GCC11 flags it
-
-Fixes
-glib-2.0/glib/gatomic.h:117:5: error: argument 2 of '__atomic_load' discards 'volatile' qualifier [-Werror=incompatible-pointer-types]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- open-vm-tools/lib/pollGtk/pollGtk.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/open-vm-tools/lib/pollGtk/pollGtk.c b/open-vm-tools/lib/pollGtk/pollGtk.c
-index 4ccaeda6..336a8bf1 100644
---- a/open-vm-tools/lib/pollGtk/pollGtk.c
-+++ b/open-vm-tools/lib/pollGtk/pollGtk.c
-@@ -127,7 +127,7 @@ typedef struct Poll {
- } Poll;
- 
- static Poll *pollState;
--static volatile gsize inited = 0;
-+static gsize inited = 0;
- 
- static VMwareStatus
- PollGtkCallback(PollClassSet classSet,   // IN
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
index efada7aaf..97a4136ca 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
@@ -1,7 +1,7 @@
-From deba3b87a9bfad007f94b840c9ccd6f1c78c2e98 Mon Sep 17 00:00:00 2001
+From c6836386549fb8f017761ce17a237fa42901434c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 24 Mar 2021 17:36:26 -0400
-Subject: [PATCH 1/2] hgfsServerLinux: Consider 64bit time_t possibility
+Subject: [PATCH] hgfsServerLinux: Consider 64bit time_t possibility
 
 Upstream-Status: Pending
 
@@ -10,20 +10,21 @@ Refit for open-vm-tools-11.2.5.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
 ---
- .../lib/hgfsServer/hgfsServerLinux.c          | 19 +++++--------------
- 1 file changed, 5 insertions(+), 14 deletions(-)
+ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 14 --------------
+ 1 file changed, 14 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index 62aeee6d..ba2e5624 100644
+index f5cc80b7..5a79d645 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-@@ -2566,20 +2566,11 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
+@@ -2566,20 +2566,6 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
     LOG(4, "%s: done, permissions %o%o%o%o, size %"FMT64"u\n", __FUNCTION__,
         attr->specialPerms, attr->ownerPerms, attr->groupPerms,
         attr->otherPerms, attr->size);
 -#ifdef __FreeBSD__
--#   if !defined(VM_X86_64) && __FreeBSD_version >= 500043
+-#   if !defined(VM_X86_64) && !defined(VM_ARM_64) && __FreeBSD_version >= 500043
 -#      define FMTTIMET ""
 -#   else
 -#      define FMTTIMET "l"
@@ -36,14 +37,6 @@ index 62aeee6d..ba2e5624 100644
 -       stats->st_atime, attr->accessTime, stats->st_mtime, attr->writeTime,
 -       stats->st_ctime, attr->attrChangeTime);
 -#undef FMTTIMET
-+   //LOG(4, ("access: %jd/%"FMT64"u \nwrite: %jd/%"FMT64"u \n"
-+   //        "attr: %jd/%"FMT64"u\n",
-+   //        (intmax_t)stats->st_atime, attr->accessTime,
-+   //        (intmax_t)stats->st_mtime, attr->writeTime,
-+   //        (intmax_t)stats->st_ctime, attr->attrChangeTime));
  
     attr->userId = stats->st_uid;
     attr->groupId = stats->st_gid;
--- 
-2.30.2
-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
index 11be2d4a0..fd7ebce05 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
@@ -1,4 +1,4 @@
-From cf1284fda8fb22a2b27cb2ce7962f166166e74c3 Mon Sep 17 00:00:00 2001
+From 294a3f14b74f2020a5cf3ccc2b6adabbcfce4151 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:48:04 -0700
 Subject: [PATCH] Fix subdir objects configure error
@@ -6,19 +6,29 @@ Subject: [PATCH] Fix subdir objects configure error
 Fix build on musl while here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- open-vm-tools/configure.ac | 1 +
- 1 file changed, 1 insertion(+)
+ open-vm-tools/configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 71e684bb..b76a7966 100644
+index 005814ef..edf1f21a 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
-@@ -303,6 +303,7 @@ AC_ARG_ENABLE(
+@@ -326,7 +326,6 @@ AC_ARG_ENABLE(
     [],
     [enable_resolutionkms="auto"])
  
+-
+ AC_ARG_ENABLE(
+    vmwgfxctrl,
+    AS_HELP_STRING(
+@@ -335,7 +334,7 @@ AC_ARG_ENABLE(
+    [],
+    [enable_vmwgfxctrl="auto"])
+ 
+-AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([subdir-objects])
- AM_INIT_AUTOMAKE
  
  ###
+ ### Constants
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
index d69b74e23..5e37d7617 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
@@ -1,4 +1,4 @@
-From 123c690f12f560022305b0cf19499e7f81a690ae Mon Sep 17 00:00:00 2001
+From 80b1c4236549b0194d1f0d6e9be887e3a5850843 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 27 Aug 2018 23:22:21 -0700
 Subject: [PATCH] Use off64_t instead of __off64_t
@@ -8,12 +8,13 @@ unknown type name '__off64_t'
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  open-vm-tools/lib/file/fileIOPosix.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/lib/file/fileIOPosix.c b/open-vm-tools/lib/file/fileIOPosix.c
-index 23108279..bcd2ddc5 100644
+index 82c0aa18..e9154541 100644
 --- a/open-vm-tools/lib/file/fileIOPosix.c
 +++ b/open-vm-tools/lib/file/fileIOPosix.c
 @@ -206,10 +206,10 @@ static AlignedPool alignedPool;
@@ -27,5 +28,5 @@ index 23108279..bcd2ddc5 100644
 -                          __off64_t offset) __attribute__ ((weak));
 +                          off64_t offset) __attribute__ ((weak));
     #else
-       #error "Large file support unavailable. Aborting."
+       #error "Large file support is unavailable."
     #endif
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
similarity index 74%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 20b064c9e..38034c304 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -26,31 +26,31 @@ LICENSE:modules/linux = "GPL-2.0"
 LICENSE:modules/solaris = "CDDL-1.0"
 
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=master \
-    file://tools.conf \
-    file://vmtoolsd.service \
-    file://vmtoolsd.init \
-    file://0001-configure.ac-don-t-use-dnet-config.patch;patchdir=.. \
-    file://0003-Use-configure-test-for-struct-timespec.patch;patchdir=.. \
-    file://0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch;patchdir=.. \
-    file://0005-Use-configure-to-test-for-feature-instead-of-platfor.patch;patchdir=.. \
-    file://0006-Use-configure-test-for-sys-stat.h-include.patch;patchdir=.. \
-    file://0007-Fix-subdir-objects-configure-error.patch;patchdir=.. \
-    file://0008-include-poll.h-instead-of-sys-poll.h.patch;patchdir=.. \
-    file://0009-Rename-poll.h-to-vm_poll.h.patch;patchdir=.. \
-    file://0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch;patchdir=.. \
-    file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
-    file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
-    file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
-    file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
-    file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
-    file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
-    file://0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch;patchdir=.. \
-"
+           file://tools.conf \
+           file://vmtoolsd.service \
+           file://vmtoolsd.init \
+           file://0001-configure.ac-don-t-use-dnet-config.patch;patchdir=.. \
+           file://0003-Use-configure-test-for-struct-timespec.patch;patchdir=.. \
+           file://0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch;patchdir=.. \
+           file://0005-Use-configure-to-test-for-feature-instead-of-platfor.patch;patchdir=.. \
+           file://0006-Use-configure-test-for-sys-stat.h-include.patch;patchdir=.. \
+           file://0007-Fix-subdir-objects-configure-error.patch;patchdir=.. \
+           file://0008-include-poll.h-instead-of-sys-poll.h.patch;patchdir=.. \
+           file://0009-Rename-poll.h-to-vm_poll.h.patch;patchdir=.. \
+           file://0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch;patchdir=.. \
+           file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
+           file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
+           file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
+           file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
+           file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
+           "
+
+UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "7ae57c3c7c1f68c74637ad009673dae94ee52570"
+SRCREV = "87abba1ce2356fc860eb9d0777d8e9de47427358"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.20.1


