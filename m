Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5811378881
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:11:07 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id f5so1736701uam.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=MWaDkm09iWW3DbtZm08XdjN11b3fK4vXTWbxKx7Dgnc=;
	b=gDivQymvFEDh5hCJWhksZ+II50C45gH4yzleymF2oTgMd4X1nupAC+MJNcMqgus8KH
	59NSE7piNZqkltHd94QmO1F8hM8ioh0mmvus5a7t104czacuYj1pf4TOaS54xy9v2ZpB
	uKLjN5tWUSCkn+s+iw6xszQrAovOTic8FXXzB754Jc02xs7snRQKINR2mLZ4gzM0np4K
	Icvv+u032MQRf3+4NKX1mgoLVFUZ+CD/HYq1dchutNNsABYIsOI9v4uNSHTaLwH0gu/6
	vMw4eYdnJmnfxoNss5eZr9pU4cS/WLtshpLTq/RXH0zvIOBTsglsz+vQg4Pw8iCj+net
	wQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MWaDkm09iWW3DbtZm08XdjN11b3fK4vXTWbxKx7Dgnc=;
	b=mIPtC9f2yZLlGlg4jiBcIQ+en+5z2VnRT74h+NPpymVcJ9OcHvKwB2drJ15pVtfXrs
	GUPw/W4fU5RXFHdyafpzuceJ8wzgH9ab2tcYAhO9BQSWypN9/q/mAeDvHA4PWTtaYBlt
	P3CYQHEEug25/IhYgFup3zQFgkMBD1fUwSTR4FHtMlt4tVyaTqQ8u2b4XNKPlAEaJodA
	grNRQ+NbQYsGlzZ7mDJGw4SNUFHvhlPCiHzvl/GOvD4qpuYJxvP7LXNte2wyaDU9+do5
	2V4fIVjy4Es7wNBfUcWmJVKhJD1Nw7lXLBxqiw9arb51O4W6JT0qqnq3eQLu4l9BsaEK
	nnHA==
X-Gm-Message-State: APf1xPDrVWj+vbtDPrn5Go1VW8GuHszi4S1WFRvfd7+9IfGmi1SYHGYs
	un/atRatZ9nghvW2NF0syTN2MkUB
X-Google-Smtp-Source: AG47ELtE6/7rzI1xNvljSB73VLLOltICI0l4A7OnGpmr6F4GqSygpBxbw08mkWSzu7ItoddwRhMSxA==
X-Received: by 10.176.75.6 with SMTP id h6mr14077014uaf.112.1519830669003;
	Wed, 28 Feb 2018 07:11:09 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id i7sm708718vka.18.2018.02.28.07.11.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Feb 2018 07:11:08 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 09:11:01 -0600
Message-Id: <1519830661-28223-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v5] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 15:11:08 -0000

GStreamer Daemon, also called gstd, is a GStreamer framework
for controlling audio and video streaming using TCP connection
messages. Qt applications, web interfaces, and GStreamer element
test suites show different ways the framework can be utilized.
GStreamer Daemon is gst-launch on steroids where you can create a
GStreamer pipeline, play, pause, change speed, skip around, and
even change element parameter settings all while the pipeline
is active.

Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
---
 .../gstd/0001-gstd-yocto-compatibility.patch       | 65 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   | 27 +++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
new file mode 100644
index 0000000..8e13242
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
@@ -0,0 +1,65 @@
+From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
+From: Carlos <carlos.rodriguez@ridgerun.com>
+Date: Fri, 15 Dec 2017 10:14:05 -0600
+Subject: [PATCH] gstd:yocto compatibility
+
+Upstream-Status: Submitted
+Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
+---
+ autogen.sh                      | 8 +++++++-
+ docs/reference/gstd/Makefile.am | 2 +-
+ gstd/Makefile.am                | 2 +-
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 66dbd42..793ee2f 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -21,7 +21,11 @@
+ # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leave them
+ # unset and get the defaults
+ 
+-gtkdocize || exit 1
++test -n "$srcdir" || srcdir=`dirname "$0"`
++test -n "$srcdir" || srcdir=.
++
++olddir=`pwd`
++cd "$srcdir"
+ 
+ autoreconf --verbose --force --install || {
+  echo 'autogen.sh failed';
+@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
+ echo
+ echo "Now run './configure' with your system settings followed by 'make' to compile this module."
+ echo
++
++cd "$olddir"
+diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
+index f860fa1..153a13b 100644
+--- a/docs/reference/gstd/Makefile.am
++++ b/docs/reference/gstd/Makefile.am
+@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
+ 
+ 
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+-include $(top_srcdir)/docs/gtk-doc.make
++# include $(top_srcdir)/docs/gtk-doc.make
+ 
+ # Comment this out if you want 'make check' to test you doc status
+ # and run some sanity checks
+diff --git a/gstd/Makefile.am b/gstd/Makefile.am
+index 13c551d..11fe202 100644
+--- a/gstd/Makefile.am
++++ b/gstd/Makefile.am
+@@ -49,7 +49,7 @@ bin_PROGRAMS = gstd
+ 
+ gstd_SOURCES = gstd.c
+ gstd_CFLAGS = $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
+-gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl,$(libdir)
++gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
+ gstd_LDADD = libgstd-core.la
+ 
+ gstdincludedir = $(includedir)/gstd
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
new file mode 100644
index 0000000..61540a4
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Gstreamer Daemon 1.0"
+DESCRIPTION = "GStreamer framework for controlling audio and video streaming using TCP connection messages"
+HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
+SECTION = "multimedia"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
+
+SRCBRANCH ?= "master"
+SRCREV = "097a086a8606dcb368c7d38c7ec4fefc2497401b"
+SRC_URI = "git://github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
+	   file://0001-gstd-yocto-compatibility.patch"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG_CONFARGS = " \
+	--disable-gtk-doc \
+"
+
+inherit autotools pkgconfig gettext
+
+do_configure() {
+        ${S}/autogen.sh
+        oe_runconf
+}
-- 
1.9.1


