Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id E402B78866
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 23:40:34 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id c14so392963uak.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 15:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uFmGdIMl0kL6fq3gJtUu8SNZs7EEEeyKQH0dRMO8KnM=;
	b=BPcRonB0dcHD0WgvrnapXVQvCDav9OXE9mko6UkS07O8MGI0gTM8jMxbNGe7whV3Qo
	knxBUtMkW5ZrXok26SxLEP1cRgrYZE0LFgMlOf/KGyI9w49hoii3VMoxsuNqBbktUaad
	/6rZ5eOn5s0amw099xlg0XQlkVIcWamg3YzwicwFgIBUDYcjBY9uuEnFtB46ozj0CKhV
	GiSoHO/dLeV3ZXVEBqDzfOLbe/Y229Z5nkj/2YE+y+9S9nAC8twZ/as7ArQdvmadwM0D
	UvH+UFhIrnDTflzq9uD+cjw4YGkY4EQfJ+Muov/SkmUW8KYLcrBJS2gZ45rhHBHLuVKr
	X96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uFmGdIMl0kL6fq3gJtUu8SNZs7EEEeyKQH0dRMO8KnM=;
	b=EBgMetM1G9tUpbrsYP7UaKjhYsxJjK64AL00Z3e3Ym8yYklGNNY0yM+b74hEaqgeRi
	kpIBdr9U7Bxc+Hyhi13FhV3HBx2fYzj3nRm5hUMO8dFy3iQCK1aOo93efz+D31u5GPRo
	5PwCG6Enid8/zeH4DY8oQXmfLP5T3Y6+xa9vWuCmNSqXeQg6a/s0aVw48F4Tu3X1wPe/
	KIlzrk9VEpyZW+jt+MalU0F0ivMd8cbHyjGzWfO+vb8MSsj8E2j1uLFF3DOdxrmCA0n0
	1Imlo1MmG+enY1ctX7sm8jb7ROnknzUv2EizH0f3vYVB2Vq2H6B0RMOEuYnNYRU7y/Nm
	kNLw==
X-Gm-Message-State: APf1xPD53jpypJNkKUz2pqEgdTf7j3/FZrYtp0Du/53Q/QQv7SFWbJB5
	cnizzMi1lCfRr/MvXnQ/hmcgmbF2
X-Google-Smtp-Source: AG47ELtUppCbzvfuV+iKtdeWq0BYqw4j71P09Exju+05j+1g057+PIhCfG84FrNH0Pie0DYsuBHvyA==
X-Received: by 10.176.23.37 with SMTP id j37mr12445812uaf.153.1519774835614;
	Tue, 27 Feb 2018 15:40:35 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id
	r129sm119105vkf.36.2018.02.27.15.40.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Feb 2018 15:40:34 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 17:40:24 -0600
Message-Id: <1519774824-30065-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v4] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Tue, 27 Feb 2018 23:40:35 -0000

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
 .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   | 27 ++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
new file mode 100644
index 0000000..ddc1831
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
@@ -0,0 +1,63 @@
+From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
+From: Carlos <carlos.rodriguez@ridgerun.com>
+Date: Fri, 15 Dec 2017 10:14:05 -0600
+Subject: [PATCH] gstd:yocto compatibility
+
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
index 0000000..ae5a9c6
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
+${S}/autogen.sh
+oe_runconf
+}
-- 
1.9.1


