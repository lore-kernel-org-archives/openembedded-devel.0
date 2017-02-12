Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5438D71E4B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:32 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v77so81441816wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6wk29CU9VfC8xmi9WgUUV7OOuKkdhjW1j1GflLub58c=;
	b=I/DmO5bu+Wtvj4a0q6g46GVhvWZOs0//jXpvHl2660yWjPquDxdYC9kz1GbiV0ipn/
	cApEwMIh+KVNpYnW/84oBp6DIWHXg7i4gnshxDexY3jOqPNZhog7P9fOcyMjRdYE1vdK
	0vJVTFlGw1DiVxpdnjk3/gD5TJvawunHCoHHrhNzl7Y6Q8OErRHkQCXpj63wxRZNvgC8
	4Y6KMdwjY81OOw8WNc+HYbqyvzOLrPIuWKpzAbSOmhpbT5cQ41iS3adZXOjfxxCvx4AX
	RkDrTqFsyrQTq6VlzqCE5BC65oM8CuIapYPd4/GEEVsFAmKrmMdIhDUZq3TS9SjA762K
	W2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6wk29CU9VfC8xmi9WgUUV7OOuKkdhjW1j1GflLub58c=;
	b=PFad2WbojWLHNfg5YYW+Z5Cfp8J3FZ6rBmZJoBE9DbRFjoS9PBBHipbYZ0bqrL05gi
	2hpVm4kZCFFgcDuzJ5H8pD00oAf/bXIJBbjxo73UUqlnrZ7w0JdVLdrZTHUfiJfGTUYA
	rlRTE6HItg7W1K6tBIrgFm9YDfCS3u99pinCVUxgAf1MlpQ0ag5aVCMOjX+BZSprWQnF
	tDjWMTdYxz/RF0r8I9b3/8eYSmhCnMleNoAid+VA1aCC5tIPRFJthe4O6HGLtf7xZhvS
	tcZlw5yuuMy04dx33X+f3joL148thmQcDdhIsn5C8vIZXVWFvGvxE84Id9I3OPwmTANz
	BMng==
X-Gm-Message-State: AMke39mQ4oP3YbEK9ZjofjFG40EZQJH8ojtyerMyHRT6W931lOak71A8UKM7aBHkYCJ5lQ==
X-Received: by 10.28.214.137 with SMTP id n131mr14816187wmg.120.1486933352074; 
	Sun, 12 Feb 2017 13:02:32 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:09 +0100
Message-Id: <20170212210216.867-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] libglade: fix build and cleanup
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...re.in-remove-deprecated-GNOME_COMMON_INIT.patch | 30 ++++++++++++++++++++++
 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb   | 11 +++++---
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch

diff --git a/meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch b/meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch
new file mode 100644
index 0000000..4738274
--- /dev/null
+++ b/meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch
@@ -0,0 +1,30 @@
+From ceefcb19cebf8bc3d45ee502f8eabd3bc5bd0aac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sat, 11 Feb 2017 16:42:12 +0100
+Subject: [PATCH] configure.in: remove deprecated GNOME_COMMON_INIT
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 8905f1c..3901398 100644
+--- a/configure.in
++++ b/configure.in
+@@ -15,7 +15,6 @@ AC_CONFIG_HEADERS([config.h])
+ 
+ AM_INIT_AUTOMAKE([1.9 no-dist-gzip dist-bzip2])
+ 
+-GNOME_COMMON_INIT
+ 
+ if test "$enable_debug" != "no"; then
+   AC_DEFINE([DEBUG],[1],[enable use of LIBGLADE_DEBUG environment variable])
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb b/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
index 8cd023a..b730d5b 100644
--- a/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -15,17 +15,22 @@ inherit autotools pkgconfig gnomebase gtk-doc distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 GNOME_COMPRESS_TYPE="bz2"
 
-SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
+SRC_URI += " \
+    file://glade-cruft.patch \
+    file://no-xml2.patch \
+    file://python_environment.patch \
+    file://0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch \
+"
 
 SRC_URI[archive.md5sum] = "d1776b40f4e166b5e9c107f1c8fe4139"
 SRC_URI[archive.sha256sum] = "64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec"
 
 EXTRA_OECONF += "--without-libxml2 --disable-gtk-doc"
 
-CFLAGS += "-lz"
+CFLAGS += "-lz -lgmodule-2.0"
 
 PACKAGES += " ${PN}-data"
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-data = "${datadir}/xml/libglade/glade-2.0.dtd"
 FILES_${PN}-dev += "${bindir}/libglade-convert"
-#RDEPENDS_${PN} = "${PN}-data"
+
-- 
2.9.3


