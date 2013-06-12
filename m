Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id AEAF16A990
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 07:08:27 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so5900326pbb.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 00:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RMo63V1CgPuLKxb+eLFRvYk7U/2OBhNdJSrFdtEpgTM=;
	b=ZyRc9fGY4sjcwdKZpRrrTCFASa/WqFBeMYQSrNx5o34ILu5v7f0lccurO42l67Sqmt
	xDSEhsoo9fnvoe6/C710s8fTWUIxB/6TiAG4f1FZnjBc+5UY+SJ8C9+Z7fPOsXxekt2a
	pr0+qSkhOQiCydz/Sj4WpZovuvQaIJJyC0gwlqUx28H+axofTKQRCZnbMwi3vaxjyGrq
	hnabp+bvQt6QlA09tADBM3GjTeM4ZcLHjOTHZ68Wd2Vi6ox/sbcS2c5r3ACCiB5nZVrl
	L+25sxSbsHNUS4kmybG6PIDUHxyR53/lwW9LxClP+mIYYet5FMs9FNuviuUy2sVmBRgc
	zMMw==
X-Received: by 10.66.252.67 with SMTP id zq3mr22848999pac.186.1371020908435;
	Wed, 12 Jun 2013 00:08:28 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	pm7sm18003767pbb.31.2013.06.12.00.08.27 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 00:08:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jun 2013 00:06:12 -0700
Message-Id: <1371020772-20936-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] gnome-session: Fix build on 64bit targets
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
X-List-Received-Date: Wed, 12 Jun 2013 07:08:27 -0000

use more portable G_GINT64_FORMAT instead of lld printf format

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-session/use_G_GINT64_FORMAT.patch        |   61 ++++++++++++++++++++
 .../gnome-session/gnome-session_2.32.1.bb          |    2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session/use_G_GINT64_FORMAT.patch

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session/use_G_GINT64_FORMAT.patch b/meta-gnome/recipes-gnome/gnome-session/gnome-session/use_G_GINT64_FORMAT.patch
new file mode 100644
index 0000000..b09f8d2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session/use_G_GINT64_FORMAT.patch
@@ -0,0 +1,61 @@
+This patch fixes the build errors when building gnome-session for 64bit target using gcc 4.8
+
+| gs-idle-monitor.c: In function 'handle_alarm_notify_event':
+| gs-idle-monitor.c:196:9: error: format '%lld' expects argument of type 'long long int', but argument 5 has type 'gint64' [-Werror=format=]
+|          g_debug ("Watch %d fired, idle time = %lld",
+|          ^
+| gs-idle-monitor.c: In function '_xsync_alarm_set':
+| gs-idle-monitor.c:453:17: error: format '%lld' expects argument of type 'long long int', but argument 4 has type 'gint64' [-Werror=format=]
+|                  g_debug ("GSIdleMonitor: updating alarm for positive transition wait=%lld",
+|                  ^
+| gs-idle-monitor.c:457:17: error: format '%lld' expects argument of type 'long long int', but argument 4 has type 'gint64' [-Werror=format=]
+|                  g_debug ("GSIdleMonitor: creating new alarm for positive transition wait=%lld",
+|                  ^
+| gs-idle-monitor.c:464:17: error: format '%lld' expects argument of type 'long long int', but argument 4 has type 'gint64' [-Werror=format=]
+|                  g_debug ("GSIdleMonitor: updating alarm for negative transition wait=%lld",
+|                  ^
+| gs-idle-monitor.c:468:17: error: format '%lld' expects argument of type 'long long int', but argument 4 has type 'gint64' [-Werror=format=]
+
+Upstream-Status: Unknown
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gnome-session-2.32.1/gnome-session/gs-idle-monitor.c
+===================================================================
+--- gnome-session-2.32.1.orig/gnome-session/gs-idle-monitor.c	2010-11-17 03:17:04.000000000 -0800
++++ gnome-session-2.32.1/gnome-session/gs-idle-monitor.c	2013-06-11 23:33:12.239960082 -0700
+@@ -193,7 +193,7 @@
+                 return;
+         }
+ 
+-        g_debug ("Watch %d fired, idle time = %lld",
++        g_debug ("Watch %d fired, idle time = %" G_GINT64_FORMAT "",
+                  watch->id,
+                  _xsyncvalue_to_int64 (alarm_event->counter_value));
+ 
+@@ -450,22 +450,22 @@
+ 
+         attr.trigger.test_type = XSyncPositiveTransition;
+         if (watch->xalarm_positive != None) {
+-                g_debug ("GSIdleMonitor: updating alarm for positive transition wait=%lld",
++                g_debug ("GSIdleMonitor: updating alarm for positive transition wait=%" G_GINT64_FORMAT "",
+                          _xsyncvalue_to_int64 (attr.trigger.wait_value));
+                 XSyncChangeAlarm (GDK_DISPLAY (), watch->xalarm_positive, flags, &attr);
+         } else {
+-                g_debug ("GSIdleMonitor: creating new alarm for positive transition wait=%lld",
++                g_debug ("GSIdleMonitor: creating new alarm for positive transition wait=%" G_GINT64_FORMAT "",
+                          _xsyncvalue_to_int64 (attr.trigger.wait_value));
+                 watch->xalarm_positive = XSyncCreateAlarm (GDK_DISPLAY (), flags, &attr);
+         }
+ 
+         attr.trigger.test_type = XSyncNegativeTransition;
+         if (watch->xalarm_negative != None) {
+-                g_debug ("GSIdleMonitor: updating alarm for negative transition wait=%lld",
++                g_debug ("GSIdleMonitor: updating alarm for negative transition wait=%" G_GINT64_FORMAT "",
+                          _xsyncvalue_to_int64 (attr.trigger.wait_value));
+                 XSyncChangeAlarm (GDK_DISPLAY (), watch->xalarm_negative, flags, &attr);
+         } else {
+-                g_debug ("GSIdleMonitor: creating new alarm for negative transition wait=%lld",
++                g_debug ("GSIdleMonitor: creating new alarm for negative transition wait=%" G_GINT64_FORMAT "",
+                          _xsyncvalue_to_int64 (attr.trigger.wait_value));
+                 watch->xalarm_negative = XSyncCreateAlarm (GDK_DISPLAY (), flags, &attr);
+         }
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index 93b0284..73f1ad5 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -9,6 +9,8 @@ DEPENDS = "libxtst gtk+ glib-2.0 upower dbus-glib gconf pango gdk-pixbuf-native
 
 inherit gnome
 
+SRC_URI += "file://use_G_GINT64_FORMAT.patch"
+
 SRC_URI[archive.md5sum] = "222bad6b446cb19a6b9028ea24538002"
 SRC_URI[archive.sha256sum] = "22d93ce433fcf9c7ce6b5f36dd81f64e692ea0e41faaa0f61159ddac28c3686a"
 
-- 
1.7.9.5


