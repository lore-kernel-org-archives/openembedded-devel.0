Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id A189B6028B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 21:31:58 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so1153105pad.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=TiA5GtKmBXslzSxogD/ExPt/YEm2wjDLCGB1X6owY9k=;
	b=UOylpLkrG8jtT77p4d0R0A7pwBMJpTxbRHsvijiJ2sRuR1KkFw0MkDUbgtJMILwlfT
	UjomWUqbDh+zk8H/8q7aoo1+9FemMuvduF7yrBApKO1vpMW5p2VBVrwtwuOqDaBFlOKZ
	PJ9X2nfcH9L+n2LCikYBXbC43/H47dpFHREmt+lMA2oJUFoVyH2kGjzQQfoFGxxaDVHC
	P2yrZt0CFXIkKFcOnESQvTdC0UPS1X5FwHharT3VWC+pKXOkaIjG1DbOwrfWKgMezpdw
	PJlvnuXb/7h7FpZbL21UCRSb0wYcY1Oi73uHUd1TPyh1Mr/MN60GJRQx28Sy9iV8gxFK
	Ut0g==
X-Received: by 10.66.122.99 with SMTP id lr3mr45792132pab.187.1374701519222;
	Wed, 24 Jul 2013 14:31:59 -0700 (PDT)
Received: from localhost (222-154-231-245.adsl.xtra.co.nz. [222.154.231.245])
	by mx.google.com with ESMTPSA id
	qb15sm53492325pab.13.2013.07.24.14.31.56 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 14:31:58 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
From: Christian Gagneraud <chgans@gna.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jul 2013 09:31:47 +1200
Message-Id: <1374701507-26976-1-git-send-email-chgans@gna.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][dylan][PATCH] qtbase.inc: Fix qtbase-tools runtime depencency on perl
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
X-List-Received-Date: Wed, 24 Jul 2013 21:31:59 -0000

While building a custom rootfs using poky, meta-oe, meta-ti and meta-qt5 (all on Dylan branch), I got the following error:
[...]
| Computing transaction...error: Can't install qtbase-tools-5.0.2-r2.0@armv7a_vfp_neon: no package provides /usr/bin/perl
[...]

qtbase-tools seems to depends on perl (at runtime), but this wasn't specified in any bb file, this patch fixes it.

Signed-off-by: Christian Gagneraud <chgans@gna.org>
---
 recipes-qt/qt5/qtbase.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index f521a30..a72a3d6 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -23,6 +23,8 @@ SRC_URI += " \
 
 DEPENDS += "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS} ${FONTCONFIG_DEPENDS}"
 
+RDEPENDS_${PN}-tools += "perl"
+
 # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and dbus/dbus.h
 # XCB_DEPENDS += "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
 # reenable when we switch to "-qt-xcb" and build of 
-- 
1.8.1.2


