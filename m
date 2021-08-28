Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.3421.1630156884818620496
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 06:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Ac3Cc8W5;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630156885;
  x=1661692885;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5IDQELwoBAoPinSR494AihstTWe8sOyeQk4qZhkTzGw=;
  b=Ac3Cc8W5jcRfyHw9DP3FoAfYH7wcEnujEJeZ9WWoThwHd5B6ZMpL9K5Z
   RwDNS/nTtasEzVqCUjq0z4wpq8T99H/MAJGCJ4LX59ErMgec+FlHLlf2E
   PH6KCGMWC5Oa06lyPPIwk1eBFyS5XBTyENQOzOJpdP2B+v+yrCo7Qrnn2
   vhMSJGWzV4+mruX/Ozw5fBYYnPHvYzBCpK+DCPJIvw+UZsiL5Ti3BuyVb
   0x7iEoERFMfrsJtOxDBzOKaDACGJMc3YltrBfQR7q1Bv7wViig9P5Nf9h
   iZZWbFX7ZDlpJETLssVAjir8TGaXxfNyUMWrlMX6yUEA0J4BcqBMHb5vp
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] gpsd: Correct the installation of gpsd.hotplug if systemd is not enabled
Date: Sat, 28 Aug 2021 15:21:19 +0200
Message-ID: <20210828132120.26395-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ect-the-installation-of-gpsd.hotplug.patch | 29 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch
new file mode 100644
index 000000000..172f47825
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch
@@ -0,0 +1,29 @@
+From c7183b2cc4a42f6ca7c2dc687ee7881efe9aeb73 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Sat, 28 Aug 2021 14:22:02 +0200
+Subject: [PATCH] SConscript: Correct the installation of gpsd.hotplug
+
+Without this, `scons systemd=false && scons udev-install` fails with:
+
+  cp .../gpsd/gpsd-3.23.1~dev/gpsd.hotplug /home/pkj/gpsd/foobar/lib/udev
+  cp: cannot stat '.../gpsd/gpsd-3.23.1~dev/gpsd.hotplug': No such file or directory
+
+Upstream-Status: Submitted [https://gitlab.com/gpsd/gpsd/-/merge_requests/277]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ SConscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/SConscript b/SConscript
+index 1cd3354e1..e578012f5 100644
+--- a/SConscript
++++ b/SConscript
+@@ -3060,7 +3060,7 @@ if env['systemd']:
+     hotplug_wrapper_install = []
+ else:
+     hotplug_wrapper_install = [
+-        'cp $SRCDIR/gpsd.hotplug ' + DESTDIR + env['udevdir'],
++        'cp $SRCDIR/../gpsd.hotplug ' + DESTDIR + env['udevdir'],
+         'chmod a+x ' + DESTDIR + env['udevdir'] + '/gpsd.hotplug'
+     ]
+ 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
index bf5e0efed..98f0e67a8 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
@@ -6,6 +6,7 @@ DEPENDS = "dbus ncurses python3 pps-tools"
 PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+    file://0001-SConscript-Correct-the-installation-of-gpsd.hotplug.patch \
     file://gpsd.init \
 "
 SRC_URI[md5sum] = "b4f96cb01cbc06542b1cb66b3296078d"
