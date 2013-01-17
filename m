Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvtuJ-0005yG-IK
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 19:10:14 +0100
Received: from mail-bk0-f70.google.com ([209.85.214.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2013 09:54:18 -0800
Received: by mail-bk0-f70.google.com with SMTP id jc3so3119828bkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 09:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=6BqOd9rGPY2nG3Oi43GhzS4FdPT3sLCtk+wygkBMU1c=;
	b=F6Oe3+oG2LtR11awHDvj9V3ldwZ4xw6RsfqIm7VeYIIProIaTnCnEcPOQo9LMwdYTs
	XFcpwQ6NQE5/jZ1UBfQhE2kGXoDp7e03LZAk4pUaVvxNBNnDogi9AD4VledFrsbbb9M/
	4R/VQzVMjVUkxCJ8OIlJyi/QuHfliUZkeipi6SXIfSX8XA+MHXoUOyRXfzwE8zaqGFWi
	E0GOv/bu0xzjN+KLdi97Oofa0eF0e2xcaQuVewpS1lmvAL6IWOR78NC4EeJpQCQHx8mk
	0K+yT1ixkU1fY31GZrBSgUE2U+fxCys5SwYZp/2iF5FufHf+btmxDbgdpDxM863nC500
	7noA==
X-Received: by 10.180.85.165 with SMTP id i5mr9667689wiz.11.1358445256632;
	Thu, 17 Jan 2013 09:54:16 -0800 (PST)
X-Received: by 10.180.85.165 with SMTP id i5mr9667592wiz.11.1358445255377;
	Thu, 17 Jan 2013 09:54:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm3349462wib.8.2013.01.17.09.54.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:54:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2013 17:52:12 +0000
Message-Id: <1358445132-13498-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnPZn1HpVvNiBCcyK14Hbg6/BW8ibpAJbWSojwiNXqeSKAnMwDUbigLNrC1Bb/iQWV9RtDgKTcV4eiKXjA2OOYkj1+wXPHaY4LjbgxlGLEiHxPOiv9JtIN8EFWQyJW75wTFg8DbZJZ6ojqOLSHae055S5jLKCPy74EZ563yDxMHow1hlPTnH/WUk34KRfjoDU4eMca8
Cc: Wayne Tams <wayne.tams@simpleaudio.com>
Subject: [meta-multimedia][PATCH] gst-rtsp: add GStreamer RTSP server/library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 18:10:14 -0000

From: Wayne Tams <wayne.tams@simpleaudio.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |   34 ++++++++++++++++++++
 .../gstreamer/gst-rtsp_0.10.8.bb                   |   16 +++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
new file mode 100644
index 0000000..3afca4e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
@@ -0,0 +1,34 @@
+index gst-rtsp_0.10.8/bindings/python/Makefile.am
+--- gst-rtsp_0.10.8.orig/bindings/python/Makefile.am
++++ gst-rtsp_0.10.8/bindings/python/Makefile.am
+@@ -14,7 +14,7 @@ defs_DATA = $(DEFS)
+ defsdir = $(pkgdatadir)/$(GST_MAJORMINOR)/defs
+ OVERRIDES = rtspserver.override
+
+-INCLUDES = -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
++AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
+
+ rtspserver_la_CFLAGS = -I$(top_srcdir)/src \
+         $(PYGOBJECT_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
+index gst-rtsp_0.10.8/examples/Makefile.am
+--- gst-rtsp_0.10.8.orig/examples/Makefile.am
++++ gst-rtsp_0.10.8/examples/Makefile.am
+@@ -1,6 +1,6 @@
+ noinst_PROGRAMS = test-video test-ogg test-mp4 test-readme test-launch test-sdp test-uri test-auth
+
+-INCLUDES = -I$(top_srcdir) -I$(srcdir)
++AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir)
+
+ AM_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
+ AM_LDFLAGS = \
+index gst-rtsp_0.10.8/tests/Makefile.am
+--- gst-rtsp_0.10.8.orig/tests/Makefile.am
++++ gst-rtsp_0.10.8/tests/Makefile.am
+@@ -1,6 +1,6 @@
+ noinst_PROGRAMS = test-cleanup
+
+-INCLUDES = -I$(top_srcdir) -I$(srcdir)
++AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir)
+
+ AM_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
+ AM_LDFLAGS = \
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
new file mode 100644
index 0000000..40872f5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "GStreamer RTSP server"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch"
+SRC_URI[md5sum] = "b511af07000595f63c3a705946221643"
+SRC_URI[sha256sum] = "9915887cf8515bda87462c69738646afb715b597613edc7340477ccab63a6617"
+
+DEPENDS = "gst-plugins-base gstreamer"
+
+# Configure always checks for Python so inherit pythonnative. Better solution
+# would be to disable the checks entirely.
+inherit autotools pythonnative gettext
+
+FILES_${PN}-dev += "${datadir}/vala/vapi/"
-- 
1.7.10.4



