Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0F49673BB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:10:01 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so11201126igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 21:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BJ/59d3SEAod/mmvTMfAjhsXo7wRcO3CBpGQpxZhHjI=;
	b=WOQ1sJP5+Tvx1mjUP9zzcix1ucYflHcKe16NeVqKuOecDXBwhJcEhypxWc0idCXsHw
	8vC+3bS77SvL52g90X00E2gchDMyVFpqaV0cJJZKBE8nV9XJ+O8OB8FkVjcm+lfGubWO
	rHMwWeLfmod+RHHc5HR0YHq8SIPTgduaGqB5lHnQoceAF90Lqi6BMBUZ8lrP2kbcTRNa
	C1FMkyQnlXvmmqV5+D83UbMXMkS3p67SzsOZrS426Fmxx6VInpJp+dHd8MypH93RHpuo
	zKq5hmSMGiEg8KLWmzlyD6K5dcEv1T4ky26XNs+r+Zxcu+9psFbJiu4zfx4SRy9oNEP/
	yB8g==
X-Received: by 10.50.141.164 with SMTP id rp4mr17876445igb.2.1430194202826;
	Mon, 27 Apr 2015 21:10:02 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id w2sm6521727igl.22.2015.04.27.21.10.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 21:10:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2015 04:09:54 +0000
Message-Id: <1430194195-1325-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430194195-1325-1-git-send-email-raj.khem@gmail.com>
References: <1430194195-1325-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-browser][PATCH 2/3 V3] chromium: Remove use of deprecated udev logging API
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
X-List-Received-Date: Tue, 28 Apr 2015 04:10:02 -0000

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


