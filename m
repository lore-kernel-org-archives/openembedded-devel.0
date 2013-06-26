Return-Path: <phil@blackmoth.com.au>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id DD97A6A8EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:13:20 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so13482193pbb.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=AMv0o1nlf872nG/J8fyxSNmU5tjNzAcdDul8RGvQ0uU=;
	b=CWGnUW52B2b9ctG4Pq2cuphwVC3ks7UHi7l2rlaQbWh5b516Jnus4N4zpMAGxOkNNB
	8GMVfIa2h1wIsM6tX2rJPD3mxxbj2m8FL//2r9TJn1NNhGvTpiD2uJdivIsgJRTIzl/G
	o4o470op3vHrk2zC+8Ph1rS04/xTCyhskBCZMOy0lagpBE+VqFex7MYyXuaV5VFz9iW4
	/6JnXq3HnLyPiWueYidBPqfOga6nSRwaQVb8yQE90H6Nprx8v7atRIly2hLRz92etDjb
	pqgBUf1xTo+TYsxCDq7/27sPw63vkLt4lfDGNyEs7mjPhEA8+WyvEVdopNwHx1QwlwAl
	/QRw==
X-Received: by 10.68.217.137 with SMTP id oy9mr1700034pbc.130.1372212802160;
	Tue, 25 Jun 2013 19:13:22 -0700 (PDT)
Received: from localhost.localdomain
	(ppp118-208-157-139.lns20.bne1.internode.on.net. [118.208.157.139])
	by mx.google.com with ESMTPSA id pl9sm25741844pbc.5.2013.06.25.19.13.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 19:13:21 -0700 (PDT)
From: Philip Craig <phil@blackmoth.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jun 2013 12:13:02 +1000
Message-Id: <1372212782-28979-1-git-send-email-phil@blackmoth.com.au>
X-Mailer: git-send-email 1.8.2
X-Gm-Message-State: ALoCoQnXWG1keA3iBPH6b7fpNe+UAfxw0v4IBcNFEM5PdOgqrKBWeLmTrJUiP2eldHs3eX1E5Bxq
Subject: [meta-qt5][PATCH] qtbase: disable fontconfig support by default
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
X-List-Received-Date: Wed, 26 Jun 2013 02:13:21 -0000

Currently fontconfig support is autodetected. It is better to be
deterministic. Since qtbase-fonts is not installed where fontconfig
will find it, it seems that current users are not using fontconfig.

Signed-off-by: Philip Craig <phil@blackmoth.com.au>
---
 recipes-qt/qt5/qtbase.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index ee4094b..f521a30 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -21,7 +21,7 @@ SRC_URI += " \
     file://0020-Use-BGRA-extension-in-bindTexture.patch \
 "
 
-DEPENDS += "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS}"
+DEPENDS += "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS} ${FONTCONFIG_DEPENDS}"
 
 # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and dbus/dbus.h
 # XCB_DEPENDS += "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
@@ -52,6 +52,11 @@ QT_GLFLAGS ?= "-opengl"
 TSLIB_DEPENDS ?= ""
 QT_TSLIB ?= "-no-tslib"
 
+# FONTCONFIG_DEPENDS = "fontconfig"
+# QT_FONTCONFIG = "-fontconfig"
+FONTCONFIG_DEPENDS ?= ""
+QT_FONTCONFIG ?= "-no-fontconfig"
+
 QT_WIDGETS ?= "-widgets"
 QT_XML ?= "-xmlpatterns"
 QT_WEBKIT ?= "-webkit"
@@ -87,6 +92,7 @@ QT_CONFIG_FLAGS += " \
     ${QT_TESTS} \
     ${QT_EXAMPLES} \
     ${QT_TSLIB} \
+    ${QT_FONTCONFIG} \
 "
 
 INC_PR = "r2"
-- 
1.8.2


