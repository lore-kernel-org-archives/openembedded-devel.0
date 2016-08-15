Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4747680A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:20:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so10343783wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tOMgP5LwolzIoEOTPGLX9qa0i8efZx22IfHoAF5QUDE=;
	b=WTNJqe4AOnasrEvUrqLXiqKkMPhD8uQ+sIdls55dGTazpUVnnF5rtPzHHXddoelfL8
	E8h3IpKHj6i8UdyAlY1R2zChhCVySSR2o5dVyHeiFtooltvdKzlm46SR0tB5vbo/6Cq5
	kp2FJZel4gzGKee4CBR3+Gzt4nmXUVDFUx5bc3FGTUbVoWFduY/u/PockWI5yVfdCk35
	FhT+zSKS66VlkgZXJz9JpbT9kpoFUl3piCf0pH7J9cueU2QmjwfyDvKST79HgA2ooocO
	TSM+9GtJGv04suk1jgZ5mKJoa3cU3l1XB/18U0uVyeyb76PmhwZhbq+5VlOh9YOLtkBp
	mHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tOMgP5LwolzIoEOTPGLX9qa0i8efZx22IfHoAF5QUDE=;
	b=D0SeEFs+YTGzF3V/IXMHwVRdeRxirX6LxwZXKcvojHL04Wv2TrROwfQQe5wXhVir4w
	ji/HeFLhZOaQnLL+cx79kymgGH8dNF/zFnlOzftUIFGTz04KzDyJ3WSkHUJX+jgO+i/o
	bghSBQzgEyjUxJLUTsrDviMO94nY7lepWiuUcisra8Ez3a8dX0HHVw5U4huXMk1TrG7+
	vTl/PIqG4JRdqpM7wmp/JBKkxm0bkM++aCvqMlha+MKSaCQVu1TZ0YEhfmfQwEWkyNIz
	JsAi07eaQZIwnL/+ZH+LXJSutpCP06LNUEWih51FRkJsgzeDveBAHcVUsQ+28/EGh1Ik
	GYCA==
X-Gm-Message-State: AEkoouvBjLSgB59ra22K+xv/bF6H9kfQEKl0ow9Jo2mgJ+PLlLAkyCc9XknLVu55B/wWXQ==
X-Received: by 10.194.58.112 with SMTP id p16mr30794143wjq.24.1471256452997;
	Mon, 15 Aug 2016 03:20:52 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	x133sm15814291wmf.16.2016.08.15.03.20.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:20:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:40 +0200
Message-Id: <20160815102049.3291-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/11] geoclue: add missing intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:20:53 -0000

* fixes:
  | checking pkg-config is at least version 0.22... yes
  | ../geoclue-2.0.0/configure: line 16260: syntax error near unexpected token `0.40.0'
  | ../geoclue-2.0.0/configure: line 16260: `IT_PROG_INTLTOOL(0.40.0)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
index 5e3d04e..90e8533 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
@@ -8,13 +8,13 @@ SECTION = "console/network"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
 
-DEPENDS = "glib-2.0 dbus dbus-glib json-glib libsoup-2.4"
+DEPENDS = "glib-2.0 dbus dbus-glib json-glib libsoup-2.4 intltool-native"
 
 inherit autotools pkgconfig gtk-doc
 
 SRC_URI = " \
-  http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-${PV}.tar.xz \
-  file://soup-session-fix.patch \
+    http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-${PV}.tar.xz \
+    file://soup-session-fix.patch \
 "
 
 SRC_URI[md5sum] = "401ff99d530b177c62afacef0a33efd9"
@@ -23,11 +23,11 @@ SRC_URI[sha256sum] = "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe1f01350bceda
 PACKAGECONFIG[geoip] = "--enable-geoip-server,--disable-geoip-server,geoip"
 
 EXTRA_OECONF += " \
-  --with-dbus-service-user=root \
-  --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
+    --with-dbus-service-user=root \
+    --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
 "
 
 FILES_${PN} += " \
-  ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
-  ${datadir}/geoclue-2.0/geoclue-interface.xml \
+    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
+    ${datadir}/geoclue-2.0/geoclue-interface.xml \
 "
-- 
2.9.2


