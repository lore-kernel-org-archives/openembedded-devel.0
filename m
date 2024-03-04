Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85454C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 20:13:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1929.1709583209217838901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 12:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=zrV3CRTa;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412e90ef887so5219545e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 12:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709583207; x=1710188007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSBwN2eMdutPOJ8ZNKnxlp84FPo4PvxBm9DqnLzO4rs=;
        b=zrV3CRTaJy1PZpSvvw1nToGIhv2YdQgtqq/ZXmyNuy48kI8OVMCwGObVZebmgTJoB9
         BLLIDWo9kA4SIVCr2KANAFW8XCUq3KFq693qL+6vV3UUpmtX0T4/MRm9UUH3/htLLBwO
         P7dAtfYbqpuw2qBh4kcoHUf76wt5/9hVllgWonsKWVJ9zawt7AKFe/OcLGonhG0OIdh+
         dHVDv7fn4krJBE269llloYW+7FO3M9RQCAeYJlS/PzM9sagYrTKG8Q0ZmDoUdmECpl1N
         GfScvsfgFPmsyJTpQWuv9tED+i7pHVaQp//m5etolIPNJ0Cjl5KTPN5GD4PJu4TPHS5G
         LZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709583207; x=1710188007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSBwN2eMdutPOJ8ZNKnxlp84FPo4PvxBm9DqnLzO4rs=;
        b=uq0rbXrb7ZuuSSdkZF6eh0XiwwF1UoWAuJsGv5/m4GbSWv7uJbpDYA9q9NepG1gOoD
         t4b9FUjYTEIGKImzSA+kYcqHjD7iq70MgLdDpo8isdziIlZ8wgH3wu5slpkYcSPendL/
         vWTF3R8WOqFI/h6QhtC2H+Su+ANqnSuFjcxqzg7FobF1OePYoMr+xkPKg95AKI1p9MbB
         CQkdCSeFY+F1Gh1NSj4a66fmXa5k6bg/UT2in80XqCGUWpB3HRiZU0IU6EQ35z38MMqs
         yEN3DPa299jfbFVRCyBHXwzwpY7NiDz/XS+gpmZks7qZCfGrkXd/+mUnLAF/7GsOAQRs
         j5bQ==
X-Gm-Message-State: AOJu0YzVtrNd1XGuyVj9D+UKfSufVKeIKF8ZB4hELnqRZmeXu8CKx72U
	OuAmThVQXc1+PT58RPNGgah1ZRRp7v7jJC1DUajXhj7mIHj8GXGxIGEExBgi3nqIcc6a4WkOuN+
	3AWysuw==
X-Google-Smtp-Source: AGHT+IECPRF5bOdwNgj70Wc/sXKH/nomzLxtsmOgB2wPyDZdqleb7b3cKt3X0pJtXLSgMaWDLZSfOg==
X-Received: by 2002:a05:600c:4448:b0:412:eaa9:9f0a with SMTP id v8-20020a05600c444800b00412eaa99f0amr317850wmn.24.1709583206793;
        Mon, 04 Mar 2024 12:13:26 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id y10-20020adff14a000000b0033e1be7f3d8sm10649018wro.70.2024.03.04.12.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 12:13:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] drbd-utils: Fix a udev rule reproducibility
Date: Mon,  4 Mar 2024 21:13:12 +0100
Message-Id: <20240304201312.1089609-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 20:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109102

drbd-utils configure step check the build host udev version to enable
or disable the target udev rule. This leads to a clear
non-reproducibility.

This patch fixes this by adding a configure option to the configure step
which allows to skip the udev version checks and unconditionally enable
the udev rule.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-an-option-to-disable-host-udev-vers.patch | 55 +++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_9.22.0.bb |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
new file mode 100644
index 0000000000..5e03ff7b32
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
@@ -0,0 +1,55 @@
+From 50749a5b0eb0becb39a4edb5fe844b13bbeb5836 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sat, 2 Mar 2024 16:23:07 +0100
+Subject: [PATCH] configure.ac: Add an option to disable host udev version
+ checks
+
+In cross-compilation environment, the build host might have an outdated
+udev or no udev at all. But the user may still want to build with the
+enabled udev rule (for its udev-enabled target).
+
+This patch adds a "--disable-udevchecks" option the disable build host
+udev version check at configure-time and unconditionally install the
+enabled udev rule. Without this new option, the behavior stays the same
+(checks enabled).
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Submitted [https://lists.linbit.com/pipermail/drbd-dev/2024-March/007201.html]
+---
+ configure.ac | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d5a0e733..da083240 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],
+ 	[AS_HELP_STRING([--with-udev],
+ 			[Enable udev integration])],
+ 	[WITH_UDEV=$withval])
++AC_ARG_ENABLE([udevchecks],
++	[AS_HELP_STRING([--disable-udevchecks],
++			[Disable host udev version checks])],
++	[],
++	[enable_udevchecks=yes])
+ AC_ARG_WITH([xen],
+ 	[AS_HELP_STRING([--with-xen],
+ 			[Enable Xen integration])],
+@@ -309,7 +314,7 @@ if test -z $GIT; then
+    AC_MSG_WARN(Cannot update buildtag without git. You may safely ignore this warning when building from a tarball.)
+ fi
+ 
+-if test $UDEVADM = false && test $UDEVINFO = false; then
++if test "x$enable_udevchecks" != "xno" && test $UDEVADM = false && test $UDEVINFO = false; then
+    if test "$WITH_UDEV" = "yes"; then
+      AC_MSG_WARN([udev support enabled, but neither udevadm nor udevinfo found on this system.])
+    fi
+@@ -413,7 +418,7 @@ dnl default.
+ test -z $INITDIR && INITDIR="$sysconfdir/init.d"
+ 
+ dnl Our udev rules file is known to work only with udev >= 85
+-if test "$WITH_UDEV" = "yes"; then
++if test "x$enable_udevchecks" != "xno" && test "$WITH_UDEV" = "yes"; then
+    udev_version=$( set -- $($UDEVADM version); echo $1 )
+    if test -z "$udev_version"; then
+ 	udev_version=$( set -- $($UDEVINFO -V); echo $3 )
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
index 960260fd39..65a43d9b26 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
            file://0001-replace-off64_t-with-off_t.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
+           file://0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch \
            "
 SRC_URI:append:libc-musl = " file://0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch "
 SRCREV_drbd-utils = "409097fe02187f83790b88ac3e0d94f3c167adab"
@@ -39,6 +40,7 @@ EXTRA_OECONF = " \
                 --with-initscripttype=both    \
                 --with-systemdunitdir=${systemd_unitdir}/system \
                 --without-manual \
+                --disable-udevchecks \
                "
 
 # If we have inherited reproducible_build, we want to use it.
-- 
2.39.2


