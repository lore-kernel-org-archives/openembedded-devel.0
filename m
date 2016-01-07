Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 135796FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:02:56 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so103523144wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6opPYCNC9EAfk1xuiK08Pwblsz+c/BGACAJkWbHBYgk=;
	b=QyXMDQcarGkH3c/NMkINtLIKnqXE+5f0ZZCn2hqBTLjHhlSLcn6lh8QrqwFGPjQ/Ob
	004E+dJ1D0AANLqWanFy2+WgZXD3iFeQ0h9Ke0oz0wlf651a1G4S+qpSl1HOjCg5DDsN
	uIxtVx0WOdMP3JuU5YaKdccwlZA5FRaQzjHToMKM4HilvovNQAcnQ6DdHikv6aiUgri+
	Dn+eV/X/oD0hxWiiJ5WQOJ07XvYvfNR+O2Vls34WQLTdI/eGDOcU7AfTOQhvEt9z+nb2
	GNXMnjMPrL6+tByFqu2ScyKEvpEjjjqJiBMm+PSw87K+ckZutlmOUYzat2xLyscQ4IuJ
	p5+g==
X-Received: by 10.194.243.6 with SMTP id wu6mr112450706wjc.14.1452182577238;
	Thu, 07 Jan 2016 08:02:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w73sm14143988wmw.21.2016.01.07.08.02.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 08:02:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 17:03:18 +0100
Message-Id: <1452182598-17070-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1452182598-17070-1-git-send-email-Martin.Jansa@gmail.com>
References: <1452182598-17070-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/2] navit: disable qt4 support by default
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
X-List-Received-Date: Thu, 07 Jan 2016 16:02:57 -0000

* now with qt4 moved to separate meta-qt4 we shouldn't enable it by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index 26b91b3..1c0bfda 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed539d099d6ce08de6ea0dfed9ecb333 \
 SECTION = "x11/applications"
 DEPENDS = "glib-2.0 gd gypsy librsvg-native"
 RDEPENDS_${PN} = " ${PN}-icons ${PN}-config "
-RDEPENDS_${PN}-gui-qml = "qt4-plugin-imageformat-svg"
 RRECOMMENDS_${PN} = "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-internal ${PN}-graphics-gtk"
 RSUGGESTS_${PN} = "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-qt ${PN}-maptool"
 
@@ -20,12 +19,12 @@ PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
 
 inherit autotools gettext pkgconfig
 
-PACKAGECONFIG ?= "qt"
+PACKAGECONFIG ?= ""
 PACKAGECONFIG[fribidi] = "--enable-fribidi,--disable-fribidi,fribidi"
 PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
 PACKAGECONFIG[sdl] = "--enable-graphics-sdl,--disable-graphics-sdl,libsdl"
 PACKAGECONFIG[gtk] = "--enable-graphics-gtk-drawing-area --enable-gui-gtk,--disable-graphics-gtk-drawing-area --disable-gui-gtk,gtk+"
-PACKAGECONFIG[qt] = "--enable-graphics-qt-qpainter --enable-gui-qml,--disable-graphics-qt-qpainter --disable-gui-qml,qt4-x11-free"
+PACKAGECONFIG[qt] = "--enable-graphics-qt-qpainter --enable-gui-qml,--disable-graphics-qt-qpainter --disable-gui-qml,qt4-x11-free,qt4-plugin-imageformat-svg"
 
 EXTRA_OECONF += " \
     --disable-binding-python \
-- 
2.7.0


