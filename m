Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id C13DC600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:38 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so185892011wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wn73dU/zrfOxo9jWf6uuet4wcOmPVte4f/kBJXGlGe4=;
	b=ZYHiwdeN/PfEl/L+UWXoyhBsjlj2ei05eqzsX6YP/Vli9j7jIVBbeTaHXnwgOyUZCc
	ZvI/Zb/3Hq3KGprL/02O/CRZqfEx+QoHbsWc+Clrn0jjAi3bylDDndN1IcR+z/nwJUis
	ahq6uHkUiNh1vn4IwUHyK2daKs/yAE10ShCM9F9ul3wrfjfM/oqgnKs5K0+hyeeU5Gbg
	/RMg3VAlQY3J8EPE+AXSjyXOuZU+t3CQoU1PNsWfigpwgU3s6XEyGdpUHNwM6Jb3LgWj
	7Y0cN7NywRkTtUMsoN601FCqzZS1ErZ2okvwovFMvZhMs6g2gQvCHaWdMwNUDvnY/snp
	njhQ==
X-Received: by 10.194.58.177 with SMTP id s17mr46584167wjq.102.1444170638437; 
	Tue, 06 Oct 2015 15:30:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jt3sm31977747wjc.12.2015.10.06.15.30.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:35 +0200
Message-Id: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [PATCH][meta-oe 1/8] Revert "gst123: move to nonworking directory"
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
X-List-Received-Date: Tue, 06 Oct 2015 22:30:39 -0000

* Use PNBLACKLIST instead

This reverts commit b6643c81bdee1165cdd5f301570c4e6fe58a18d3.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/files/display.patch                  | 60 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb   | 17 ++++++
 .../nonworking/gstreamer/files/display.patch       | 60 ----------------------
 .../nonworking/gstreamer/gst123_0.3.1.bb           | 15 ------
 4 files changed, 77 insertions(+), 75 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/nonworking/gstreamer/files/display.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/nonworking/gstreamer/gst123_0.3.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch b/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
new file mode 100644
index 0000000..61b0e6c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3e46d2e501da68d929bb5f26900a292a5fc04a1f Mon Sep 17 00:00:00 2001
+From: Stefan Westerfeld <stefan@space.twc.de>
+Date: Mon, 23 Apr 2012 03:10:22 +0200
+Subject: [PATCH] Fix time display updates (broken by introduction of quiet
+ mode).
+
+---
+ src/gst123.cc |    1 +
+ src/msg.cc    |    7 +++++++
+ src/msg.h     |    1 +
+ 3 files changed, 9 insertions(+)
+
+diff --git a/src/gst123.cc b/src/gst123.cc
+index 20e91e5..ce5876d 100644
+--- a/src/gst123.cc
++++ b/src/gst123.cc
+@@ -640,6 +640,7 @@ cb_print_position (gpointer *data)
+       else
+         blanks += "         ";
+       Msg::print ("%s%s\r", status.c_str(), blanks.c_str());
++      Msg::flush();
+     }
+ 
+   /* call me again */
+diff --git a/src/msg.cc b/src/msg.cc
+index 547cd90..33cada2 100644
+--- a/src/msg.cc
++++ b/src/msg.cc
+@@ -41,6 +41,13 @@ print (const char *format, ...)
+     }
+ }
+ 
++void
++flush()
++{
++  if (!Options::the().quiet)
++    fflush (stdout);
++}
++
+ }
+ 
+ }
+diff --git a/src/msg.h b/src/msg.h
+index e0ced24..5bebac0 100644
+--- a/src/msg.h
++++ b/src/msg.h
+@@ -27,6 +27,7 @@ namespace Msg
+ {
+ 
+ void print (const char *format, ...);
++void flush();
+ 
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
new file mode 100644
index 0000000..47f1d9f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Flexible CLI player in the spirit of mpg123, based on GStreamer"
+HOMEPAGE = "http://space.twc.de/~stefan/gst123.php"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
+
+DEPENDS = "libx11 gstreamer gst-plugins-base gtk+ ncurses"
+
+SRC_URI = "http://space.twc.de/~stefan/gst123/${BPN}-${PV}.tar.bz2 \
+           file://display.patch"
+
+SRC_URI[md5sum] = "1e77767c9d6fecee5641f95804f160fe"
+SRC_URI[sha256sum] = "89d1de025eca0466c125dcd6a11b64341bdf98ee4c03c3e5a12321d77cb8b0ce"
+
+inherit autotools
+
+PNBLACKLIST[gst123] ?= "gst123 is still "sometimes" using wrong sysroot"
diff --git a/meta-multimedia/recipes-multimedia/nonworking/gstreamer/files/display.patch b/meta-multimedia/recipes-multimedia/nonworking/gstreamer/files/display.patch
deleted file mode 100644
index 61b0e6c..0000000
--- a/meta-multimedia/recipes-multimedia/nonworking/gstreamer/files/display.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 3e46d2e501da68d929bb5f26900a292a5fc04a1f Mon Sep 17 00:00:00 2001
-From: Stefan Westerfeld <stefan@space.twc.de>
-Date: Mon, 23 Apr 2012 03:10:22 +0200
-Subject: [PATCH] Fix time display updates (broken by introduction of quiet
- mode).
-
----
- src/gst123.cc |    1 +
- src/msg.cc    |    7 +++++++
- src/msg.h     |    1 +
- 3 files changed, 9 insertions(+)
-
-diff --git a/src/gst123.cc b/src/gst123.cc
-index 20e91e5..ce5876d 100644
---- a/src/gst123.cc
-+++ b/src/gst123.cc
-@@ -640,6 +640,7 @@ cb_print_position (gpointer *data)
-       else
-         blanks += "         ";
-       Msg::print ("%s%s\r", status.c_str(), blanks.c_str());
-+      Msg::flush();
-     }
- 
-   /* call me again */
-diff --git a/src/msg.cc b/src/msg.cc
-index 547cd90..33cada2 100644
---- a/src/msg.cc
-+++ b/src/msg.cc
-@@ -41,6 +41,13 @@ print (const char *format, ...)
-     }
- }
- 
-+void
-+flush()
-+{
-+  if (!Options::the().quiet)
-+    fflush (stdout);
-+}
-+
- }
- 
- }
-diff --git a/src/msg.h b/src/msg.h
-index e0ced24..5bebac0 100644
---- a/src/msg.h
-+++ b/src/msg.h
-@@ -27,6 +27,7 @@ namespace Msg
- {
- 
- void print (const char *format, ...);
-+void flush();
- 
- }
- 
--- 
-1.7.9.5
-
diff --git a/meta-multimedia/recipes-multimedia/nonworking/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/nonworking/gstreamer/gst123_0.3.1.bb
deleted file mode 100644
index 6c495b2..0000000
--- a/meta-multimedia/recipes-multimedia/nonworking/gstreamer/gst123_0.3.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Flexible CLI player in the spirit of mpg123, based on GStreamer"
-HOMEPAGE = "http://space.twc.de/~stefan/gst123.php"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
-
-DEPENDS = "libx11 gstreamer gst-plugins-base gtk+ ncurses"
-
-SRC_URI = "http://space.twc.de/~stefan/gst123/${BPN}-${PV}.tar.bz2 \
-           file://display.patch"
-
-SRC_URI[md5sum] = "1e77767c9d6fecee5641f95804f160fe"
-SRC_URI[sha256sum] = "89d1de025eca0466c125dcd6a11b64341bdf98ee4c03c3e5a12321d77cb8b0ce"
-
-inherit autotools
-- 
2.6.0


