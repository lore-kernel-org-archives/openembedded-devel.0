Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF5378271
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:13 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e7so66961262pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E544ANv7tf/M5MoKbRbhHhFmZkLh338qIQPaBDKGtx4=;
	b=CU0etTQ5Q4VcyQr4eldEni6tjeIbRd2VJ+QYTF2c1rOU9OOMSPPwY09iqc4L3BZuUw
	zh3aloCC1/cPPFdaR9enfvJV0hpK3JXKy69lg3nbqikqVsPZJB2m+2xdtZqyklP2p4nI
	J53k2olyBLtiYALJzicFRI+djhlNGvTQyhRbLf2hO/9BuSPCvlrhdtSXMjYhr+9e1hYd
	9CATdjAI4hs86uq67AI9oMVO5ikPYdJ62rA7so1cTDXUjmf05TnRYQf/420/hWP3ZC63
	ryyWXkLHEWdem2cvfLF1CxKpCIfmUF9EwvLTB881RJR4Ia32+wYk75szPBChrle5g8OV
	7+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E544ANv7tf/M5MoKbRbhHhFmZkLh338qIQPaBDKGtx4=;
	b=KgQWzDyb/nWduA4zeVbgV1ci+ZNNY+3aznbqGY+1yrzf2Pu6yGwd2VXF2QCRHOvx9k
	g3s8rlWSy3Ia3rij3g7OjgMOyMrfJYQV1aXgUSgXR8EqlbXfp6i14bOGtAcq7JqRViRH
	HybSdautHGQsX8XHa8KcHFNjKQ7FmYkCvi0NRNByMLecOZlkTUX9E7yhGyqGDohJg0uG
	D7MktMuSU7kmEiQIOoI9IfZ+2tqtNnTiuxt9UZPcPkaVokqodT0WfkxXn27UBzaIzF30
	CKFzXT+CXkAAgZ+bcL3JbpCn5/6kujTk0o/kWc1F7x5RDKJneKkPv8JBy0NA0RmvY3IR
	0png==
X-Gm-Message-State: AKS2vOxfToMKg3a5gl+7AgzGfdjzKbZ/xkUlRSWGrCib9VaXUjWV+KWb
	Z6WnKddMeAMK2ZgV
X-Received: by 10.98.88.132 with SMTP id m126mr22253583pfb.180.1498827612815; 
	Fri, 30 Jun 2017 06:00:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:42 -0700
Message-Id: <20170630125957.3342-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 02/17] gst-plugins-gl_0.10.3.bb: Fix build on rpi/userland
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:14 -0000

see https://www.raspberrypi.org/forums/viewtopic.php?t=7090

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gst-plugins-gl/rpi-egl-gles2-dep.patch         | 22 ++++++++++++++++++++++
 .../gstreamer-0.10/gst-plugins-gl_0.10.3.bb        |  4 +++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
new file mode 100644
index 000000000..7db1c5afc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
@@ -0,0 +1,22 @@
+Check for header and library separately and check for GLESv2 before egl
+this is to overcome an annoying issue with rpi/userland where egl depends
+on sysmbols from libGLESv2
+
+-Khem
+Index: gst-plugins-gl-0.10.3/configure.ac
+===================================================================
+--- gst-plugins-gl-0.10.3.orig/configure.ac
++++ gst-plugins-gl-0.10.3/configure.ac
+@@ -183,8 +183,10 @@ case $host in
+     else
+       AC_CHECK_HEADERS([EGL/egl.h], [HAVE_EGL=yes], [HAVE_EGL=no])
+       if test "x$HAVE_EGL" = "xyes"; then
+-        AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h,, AC_MSG_ERROR([EGL is required]))
+-        AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.h,, AC_MSG_ERROR([OpenGLES2 is required]))
++        AC_CHECK_HEADERS([GLES2/gl2.h],, AC_MSG_ERROR([OpenGLES2 is required]))
++        AC_CHECK_LIB(GLESv2,[glTexImage2D],, AC_MSG_ERROR([OpenGLES2 is required]))
++        AC_CHECK_HEADERS([EGL/egl.h],, AC_MSG_ERROR([EGL is required]))
++        AC_CHECK_LIB(EGL,[eglGetError],, AC_MSG_ERROR([EGL is required]))
+         GL_LIBS="$LIBS $X_LIBS -lEGL -lGLESv2"
+         GL_BACKEND=x11ES2
+         GL_TYPE=gles
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
index 6859f338e..bb69bfe9f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 SRC_URI[md5sum] = "ac70ede13f79978d56eaed8abaa3c938"
 SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
 
-SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
+SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch \
+             file://rpi-egl-gles2-dep.patch \
+"
 
 DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
 
-- 
2.13.2


