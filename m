Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B38F60745
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Oct 2016 20:17:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f193so7087586wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Oct 2016 13:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TO6UwXEqxD/Jldg5DmMlyrKmfg2KHffQc1uMDAp7ntU=;
	b=B6yCG/0sCqmM13wYNk3KK/j1ynwaHQSjrSzpvrr4ARGToIkoQOToXWGJWkBCNo248R
	dy9hCVawI9IabD6GFQ/RL892UlmiNK6oPMp6TSxEpRtZVnwizRtzmBXsq7zxSJ9/Oifi
	QVLPLiXgVQOTnVaYv0dKIXlBjWbD/wM9u7y6NRo5AyCJTPOc1fuPs/eW6bww1V61xp+O
	efSoh5FG76t6o/LrnzXqypsATiP4BYvjisounDw2bOKmGtpS39MqQIL5Ate6Le7Sr7hD
	wWqpVxfs14MPJw9JtGz5YZ5bBrBBizC87PXVwdvW53/tr5O9Xvei3SP+6E6z6aAeI6ls
	BnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TO6UwXEqxD/Jldg5DmMlyrKmfg2KHffQc1uMDAp7ntU=;
	b=AtwG+7kxbZigNzV+Y45eeivAyLFpPeiVcoQpCXBUPdboSeJcvaM6wlL7Vq0/jkN7KU
	qZqUkdCV7R98dxWy7LUIwnxfTxA4wk/swGHtrB0eVm9T20FT7IxiosKRD+RyDYBoproR
	5OTgIA1rWO4jV5Dy2QR5zN2t10jFcza734H29K8Hxk5ZoyY6OEvo0JD7oKhw0nNAG62p
	RE7NRT87HpERWv5xA7o5RPMZRyAOMiUWHfNfQa8YfOrSb6Zv5X+X5RXlw+F5nge1f6IR
	2DQDcOngHyc5OPGKznmieESzrBzzdtbz/jF530vcBwXDPe788pgpo41zHaa3gh5LH4/3
	wp1w==
X-Gm-Message-State: AA6/9RmVIJbyL0VwdM6ZUZ+I8LfHjy7Ion9bWhjh5GxVUslPNfOAsS2YcxeUTVQ0uDWBlw==
X-Received: by 10.28.74.21 with SMTP id x21mr7013586wma.16.1475439427580;
	Sun, 02 Oct 2016 13:17:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A22AF.dip0.t-ipconnect.de.
	[91.10.34.175]) by smtp.googlemail.com with ESMTPSA id
	q65sm15423508wmd.24.2016.10.02.13.17.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Oct 2016 13:17:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Oct 2016 22:16:52 +0200
Message-Id: <1475439412-4117-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] gst-plugins-base: fix rare but annoying build errors
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
X-List-Received-Date: Sun, 02 Oct 2016 20:17:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As mentioned long ago in [1] for me gst-plugins-base failed when rebuilding.
Before this patch I had no other choice but to build from scratch.

When error occured I saw

in config.log:
GLIB_CFLAGS='-pthread line /home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/include/glib-2.0 -I/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/glib-2.0/include'

and build failed with:
| arm-angstrom-linux-gnueabi-gcc: error: line: No such file or directory

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106528.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...l.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch | 32 ++++++++++++++++++++++
 .../gstreamer-0.10/gst-plugins-base_0.10.36.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
new file mode 100644
index 0000000..29fbec5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
@@ -0,0 +1,32 @@
+From 5478eafecf618cd8e742cc1b96d688a2c7ce5a79 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 2 Oct 2016 21:49:33 +0200
+Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+we are definitely not one of those poor souls mentioned
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ common/m4/gst-glib2.m4 | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
+index b01f02f..4569ae5 100644
+--- a/common/m4/gst-glib2.m4
++++ b/common/m4/gst-glib2.m4
+@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
+   fi
+ 
+   dnl for the poor souls who for example have glib in /usr/local
+-  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
+ 
+   AC_SUBST(GLIB_EXTRA_CFLAGS)
+ ])
+-- 
+2.5.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index e2dbb17..eefd993 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -11,6 +11,7 @@ DEPENDS += "alsa-lib libogg libvorbis libtheora util-linux tremor glib-2.0-nativ
 SRC_URI += "file://gst-plugins-base-tremor.patch \
             file://configure.ac-fix-subparse-plugin.patch \
             file://audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch \
+            file://0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch \
 "
 
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
-- 
2.5.5


