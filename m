Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id CAC89787B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 20:14:18 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id t201so6366688vke.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=L45kz/c5OOc2deJtup7GVxZ7GRJe5KUx4yEuk7nInpM=;
	b=OneZyziM3mIii4GFvoqCnJiJbq4vTpIaq1YnkHDsEj6twJVQv5IdiCQRH3M4hzMBvU
	cBu/jn19qugEc9vOfwX4DWAzTR8VXUgEuGYZJGFp/yzljuus0dCdGwysqNUELtm1I+Qo
	5mWuCMuzcaqvDoCrQGAEYfOfuieawad0bNDHs4YSi0rrP3UABd9hoFOmzPkT9E8kfgF5
	E+p4SmaUOq29CoKbQG+OUqikJeCTWlBsigAeE26I9+f89ii4n0HZ6CQtoRTr+qq7+hlO
	jDjpCvsCng1Lhge5ZOaSE7fonnvOtRNzIdE41GaoCPW05dpX9lhpWS5u1vCNe8vTnqAg
	USeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L45kz/c5OOc2deJtup7GVxZ7GRJe5KUx4yEuk7nInpM=;
	b=tHRoFag/vjT8oB8IaaLb61cWWWxXkHtH66NTuWGAuD/O6BICzHaU1lufsG0zRIaW+N
	BOJLmf8YGX+7EmaGY5cpBv8dFZN6sO4wBrsserC6e1u0bfdNp7owyjM7O73wzVgCyPRU
	bNBN5a9oov/daEYxirKZrY1Oy0tnwEB7BbqMWAbXsQbE3PM3jgR5KrTtbvvktKDTQ73V
	vPXGJIwivRUBBUZB/m2rQFZ2iEmiW1Uew99l90coi6+fTjJ1owSUW5bbbrRGw/uHTVnt
	e77G8Odc/rh4FHBY6uOp6THLIXV/qCNe6uTnOCG7Mzi1uDM81V98S41HrMy57ocKUi+g
	pmZA==
X-Gm-Message-State: APf1xPDcCel0qVmADCOtmr/a99pMHUTcs/E6bYfR2Sq4ScTETgUnA3ef
	XlSdE1z5fWPLSSacPG3l+O3MIvM0
X-Google-Smtp-Source: AH8x224zS9eMuP74CRals35gdXFnPGxMYT0tEkCGdD3tbN3pjy5jEwMPNE6X/COVkru7ed2z/xv+Jg==
X-Received: by 10.31.148.199 with SMTP id w190mr12166608vkd.130.1519071259662; 
	Mon, 19 Feb 2018 12:14:19 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id q5sm8274696uaj.17.2018.02.19.12.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Feb 2018 12:14:19 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Feb 2018 14:14:10 -0600
Message-Id: <1519071250-14245-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Mon, 19 Feb 2018 20:14:18 -0000

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
 .../recipes-multimedia/gstreamer-1.0/gstd.inc      | 25 +++++++++
 .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   |  3 ++
 3 files changed, 91 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
new file mode 100644
index 0000000..10ee5bc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Gstreamer Daemon 1.0"
+SUMMARY = "GStreamer framework for controlling audio and video streaming using TCP connection messages"
+HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
+SECTION = "multimedia"
+LICENSE = "GPLv2+"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
+
+SRCBRANCH ?= "master"
+SRCREV = "097a086a8606dcb368c7d38c7ec4fefc2497401b"
+SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
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
index 0000000..94f6b57
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
@@ -0,0 +1,3 @@
+require gstd.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
1.9.1


