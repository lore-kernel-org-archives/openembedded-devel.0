Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 53C1C6017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 21:59:00 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so2168716wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LP3ih7xf4CcrQ9tx0XcShVAKloc0kFl8SMhbDxGjqEU=;
	b=mStcblu9DZcR4WUAlD8Lh3sXx5UjcLOWj6d0bOWWvh+2yDXq4M4YT1+/m2SHydGa3D
	wwY4vfg6wewmkDRk6XQ45+UV2zfvd/y73JQuKOTyEVjef1mzURXj3eLSzYuRejjRRcRi
	n6+b9yfslb7xEgADmjnoQHijZ+tnJ3zXNQkigpEY4o7/FXxqaSY71TF4/M3y1Va4lK3m
	tGZ3TDI24NL3NpfKu/lR8zJvpr23DlYyTtGUqv0OBbmBMgHVRJQFkKBolM6vL3jqNk65
	wWGgydqsXgWtV+Y7BtPIgZXOAE2/YuZJPsHCGZmBObUOVBaWY2K8wiVDhqdrJOdQ/IJr
	qFcQ==
X-Received: by 10.180.211.76 with SMTP id na12mr17267333wic.55.1412200741814; 
	Wed, 01 Oct 2014 14:59:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gt7sm3106416wib.18.2014.10.01.14.59.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 14:59:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 23:59:54 +0200
Message-Id: <1412200794-476-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-efl][PATCH] efl: add dependency on libxdamage
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
X-List-Received-Date: Wed, 01 Oct 2014 21:59:04 -0000

* as reported by Pieter, it's usually pulled through gstreamer1.0 which
  is enabled by default, but when disable it can fail to find Xdamage.h

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index c82780b..82f8dfe 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT BSD LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
+DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
 
 inherit efl gettext pkgconfig
 
-- 
2.1.1


