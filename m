Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1A67C5E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 20:35:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m1so5420973wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2019 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=U1BqU3aKC6NKN9qIVB7WEVTF8MroXnZc/g3lcI2gyDU=;
	b=TGiewGYPUmT+/YfZyjrLd1sYvgmojXHkTuU/1an3pBdj1f7GBkDVyCKmsrMiRqaYqQ
	8xglhce8fHQ0ZdXZGQ6f2djaKFfVmRgc9WIInjnbb4wtJRbup/jiqxgfFeVHfPOUBtiC
	1DC0y71ZhZa1BniVF/bWJudNcHKNnccDNFi9syWYCXBwDU2hRvScHNg5RnyC8tmlMWzt
	OTazQnqVxP0PPxWXp+ZkcM/4ma4yo6DguBpquHajCF4bIt9MIjOQamRcBmRf//d/RaU7
	rg/czkcXRDx1y8O8ZgU3Sd++YWTbr/UMxe66Op+oCM9mBDwAa+/j2+b+rgVy4jXvWGHd
	xgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U1BqU3aKC6NKN9qIVB7WEVTF8MroXnZc/g3lcI2gyDU=;
	b=jnR8svs2n/U7ydjrK5CMooxte7WFIit+O/8NVt0dK0duxlRxtaYLhhoGKTOe2qHmL2
	+zbYdRuCRhoP/UyHA+O7EpWdFaJcqhI90ZTVpm72koEWSuey5C3FYOxTp78MW7DzgcpC
	TtS//hTtRk156JWFc5TwSUiF5Y9TfZIEi6LHay/7+TJtDFSB1KJ0MpMh6y767Wbjiwq9
	MghPxPty+PJg2gEGS7ifi+nJqX97qfD3aUMKwXgQxY99duh+bQigLmztkx7Q4pWnsFHa
	u/eZ2tL5cV0GdGddFJXSDf3yENZHJUieqfcWhL8biBPqoWggul3MlStfBOHYZ+goctjt
	cWqQ==
X-Gm-Message-State: AHQUAuby7+jZ9mWCZe9pFyw64pyURWWg37xZmnbwjcoRHZ95xZZ9VuW9
	3zAyDhksog01rKrRE/ZCmVajTtWX
X-Google-Smtp-Source: AHgI3Ib9HjBcTRrHcbJKXkE0559RFGAz3s9Zty3L5+6+fMz/F6HsOTb639P82MUOCTFqt0/qkPoLAw==
X-Received: by 2002:a7b:c458:: with SMTP id l24mr277210wmi.16.1549658138834;
	Fri, 08 Feb 2019 12:35:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F02D8847C49AEC1D0D8828A.dip0.t-ipconnect.de.
	[2003:f0:7f02:d884:7c49:aec1:d0d8:828a])
	by smtp.gmail.com with ESMTPSA id
	c18sm5026978wre.32.2019.02.08.12.35.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Feb 2019 12:35:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2019 21:35:28 +0100
Message-Id: <20190208203528.28261-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208203528.28261-1-schnitzeltony@gmail.com>
References: <20190208203528.28261-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ftgl: initial add 2.1.3-rc5
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
X-List-Received-Date: Fri, 08 Feb 2019 20:35:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have this in meta-qt5-extra for a while but now it is required by upcoming
chromium-bsi (meta-games). So move a layer 'up'.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-use-pkg-config-to-find-freetype2.patch | 38 +++++++++++++++++++
 ....am-remove-useless-and-breaking-code.patch | 38 +++++++++++++++++++
 .../recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb   | 24 ++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
 create mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch
 create mode 100644 meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
new file mode 100644
index 000000000..cf03cd0f2
--- /dev/null
+++ b/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
@@ -0,0 +1,38 @@
+From 8bb183926078b6dd54048fb6820838fe7b6e6163 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 23 Oct 2016 22:46:43 +0200
+Subject: [PATCH] use pkg-config to find freetype2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 53560ea..b5bb6a3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,8 +41,13 @@ AC_CHECK_FUNCS(strndup)
+ 
+ AC_PATH_X
+ 
+-AC_CHECK_FT2([9.0.3],[],
+-             [AC_MSG_ERROR([FreeType2 is required to compile this library])])
++PKG_CHECK_MODULES(FT2, freetype2,
++    CFLAGS="$CFLAGS $FT2_CFLAGS"
++    LIBS="$LIBS $FT2_LIBS",
++    AC_MSG_ERROR([FreeType2 is required to compile this library])
++)
++AC_SUBST([FT2_CFLAGS])
++AC_SUBST([FT2_LIBS])
+ 
+ AC_PATH_XTRA
+ 
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch
new file mode 100644
index 000000000..830783e20
--- /dev/null
+++ b/meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch
@@ -0,0 +1,38 @@
+From daabb4110661c4358ec73293d5c0b2106f567c1f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 23 Oct 2016 23:54:14 +0200
+Subject: [PATCH] Makefile.am: remove useless and breaking code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 89a8a7f..e582a34 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -24,15 +24,6 @@ EXTRA_DIST = \
+ 	m4 \
+ 	$(NULL)
+ 
+-# Print out an informative summary.
+-all-local:
+-	@$(ECHO) "Done."
+-	@$(ECHO)
+-	@if test "x$(MAKECMDGOALS)" = "xall-am" -o "x$(.TARGETS)" = "xall-am" -o "x$(MAKECMDGOALS)" = "x" -o "x$(.TARGETS)" = "x" ; then \
+-	  $(ECHO) "---" ;\
+-	  $(ECHO) "Run 'make install' to begin installation into $(prefix)" ;\
+-	fi
+-	@$(ECHO)
+ 
+ # Upload documentation
+ DOC = docs/html docs/latex/ftgl.pdf
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
new file mode 100644
index 000000000..4af3803f1
--- /dev/null
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "OpenGL frontend to Freetype 2"
+HOMEPAGE = "https://sourceforge.net/projects/ftgl/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
+
+inherit autotools pkgconfig
+
+DEPENDS += " \
+    freetype \
+    freeglut \
+"
+
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+    file://0001-use-pkg-config-to-find-freetype2.patch \
+    file://0002-Makefile.am-remove-useless-and-breaking-code.patch \
+"
+SRC_URI[md5sum] = "c7879018cde844059495b3029b0b6503"
+SRC_URI[sha256sum] = "521ff7bd62c459ff5372e269c223e2a6107a6a99a36afdc2ae634a973af70c59"
+
+S = "${WORKDIR}/ftgl-2.1.3~rc5"
+
+# undefined reference to symbol 'sin@@GLIBC_2.4'
+CFLAGS += "-lm"
-- 
2.20.1


