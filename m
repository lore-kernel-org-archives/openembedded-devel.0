Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3D66A727E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:33:41 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so67417217igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BJ/59d3SEAod/mmvTMfAjhsXo7wRcO3CBpGQpxZhHjI=;
	b=HdCppKDykf3/2FfyVJoS9RHWKpUNM+Ux6C9ZszOr+4efFZ7z0iZhRMHW8XX8LTfpB5
	nFifMitKfN0SQZz2CBY9iYZLowNVBJrtswV6fAnbQ/tEWtrR2BxvzV+QiJEE6CyDbkmw
	q1fYBd8gxKTvhoOMipz/dCPg6AhRl2SxWEDUuXschO/1fWFR+wxvMJrmVfGSmwV3l2WF
	HXh0aJVV06fbNFOFiBoGNANUxohFgKgCOElcT15VxCIOYUeau/1UQxgtaKJQ5vXNk0Ru
	Tbt+4tZD/i8DZ1nXteG5QigDJ6vxFqxMNYqPtk9GzrUy43plcJXIBoJXn9nB4sNSIw2A
	tZ3A==
X-Received: by 10.50.41.8 with SMTP id b8mr14635708igl.38.1430156023119;
	Mon, 27 Apr 2015 10:33:43 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id x4sm6262392iod.26.2015.04.27.10.33.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 10:33:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 17:33:36 +0000
Message-Id: <1430156016-26989-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430156016-26989-1-git-send-email-raj.khem@gmail.com>
References: <1430156016-26989-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-browser][PATCH 2/2 V2] chromium: Remove use of deprecated udev logging API
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 17:33:48 -0000

in systemd >= 218 libudev deprecated support for udev_set_log_fn
see
https://github.com/systemd/systemd/commit/25e773eeb4f853804e1bf0dbd9a184f23e9b2a97

Change-Id: If6e3742bd2a70685f2521f134d5965bf2d1f8f72
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../chromium/chromium-40/0010-systemd-218.patch    | 39 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch

diff --git a/recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch b/recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch
new file mode 100644
index 0000000..3aec8d0
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch
@@ -0,0 +1,39 @@
+Remove use of udev_set_log_priority API its gone in systemd >= 218
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: chromium-40.0.2214.91/ui/events/ozone/device/udev/device_manager_udev.cc
+===================================================================
+--- chromium-40.0.2214.91.orig/ui/events/ozone/device/udev/device_manager_udev.cc
++++ chromium-40.0.2214.91/ui/events/ozone/device/udev/device_manager_udev.cc
+@@ -33,29 +33,9 @@ enum {
+   SYS_LOG_DEBUG = 7,
+ };
+ 
+-// Log handler for messages generated from libudev.
+-void UdevLog(struct udev* udev,
+-             int priority,
+-             const char* file,
+-             int line,
+-             const char* fn,
+-             const char* format,
+-             va_list args) {
+-  if (priority <= SYS_LOG_ERR)
+-    LOG(ERROR) << "libudev: " << fn << ": " << base::StringPrintV(format, args);
+-  else if (priority <= SYS_LOG_INFO)
+-    VLOG(1) << "libudev: " << fn << ": " << base::StringPrintV(format, args);
+-  else  // SYS_LOG_DEBUG
+-    VLOG(2) << "libudev: " << fn << ": " << base::StringPrintV(format, args);
+-}
+-
+ // Create libudev context.
+ device::ScopedUdevPtr UdevCreate() {
+   struct udev* udev = udev_new();
+-  if (udev) {
+-    udev_set_log_fn(udev, UdevLog);
+-    udev_set_log_priority(udev, SYS_LOG_DEBUG);
+-  }
+   return device::ScopedUdevPtr(udev);
+ }
+ 
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 3a5108e..53af755 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -91,6 +91,7 @@ SRC_URI[sha256sum] = "f72fda9ff1ea256ab911610ee532eadf8303137d431f2481d01d3d60e5
 
 OZONE_WAYLAND_EXTRA_PATCHES += " \
         file://chromium-40/0005-Remove-X-libraries-from-GYP-files.patch \
+        file://chromium-40/0010-systemd-218.patch \
 "
 OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
 OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
-- 
2.1.4


