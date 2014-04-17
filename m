Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7BB65D0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 08:59:56 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so380142eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y6zJ8Vpx9kaTpcsCWcDFoAo7v59ZT+Jwrcf9xt7l1l4=;
	b=A1Cb9d2f1kU3thLOZXE/iW8g0959fgDLqF4miTVCwKkfNZJRW+8M2d5AfTw02bI7wm
	5g00crjg5htX+GYFmi+ylowMG8cw7eKIak4XiGGkFR2UpE9KyULRebNWs6T9t6ec/XAo
	IaUUV9m1oXpcBtAtOfCvxfXAu6Rw4NfBb4vNRpCxjrtt6hjE8bCyTEgvdorpfu4tlr+5
	4uytDxwll9klkhmBuGU+HSu7b1Nr7F6JVZH/8fT2sTOp/s6aeLjy+pJFHAGrudZZShk5
	tVPmgkETCldunIwfcczhNzXUQCi3d/g7MzUE6b/sOMh9MP49tj0x/zlZaGqZwDHd1/k1
	cxew==
X-Gm-Message-State: ALoCoQmIjtclfQe+CIgG2MWmtNwXuFH1sA0kmCdMJdA/sAkaHXr+hbe7HqgVhL/LUypwDcDJY6zJ
X-Received: by 10.14.179.193 with SMTP id h41mr12388742eem.27.1397725196709;
	Thu, 17 Apr 2014 01:59:56 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id 48sm65460626eei.24.2014.04.17.01.59.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Apr 2014 01:59:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Apr 2014 10:59:47 +0200
Message-Id: <1397725187-28708-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] gimp, gegl, babl: change SRC_URI to http
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
X-List-Received-Date: Thu, 17 Apr 2014 08:59:57 -0000

The FTP server on ftp.gimp.org hasn't been working for a few weeks now,
so switch to http which does work.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/babl/babl_0.1.10.bb | 2 +-
 meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb  | 2 +-
 meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
index 1ef4956..dbff746 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 inherit gnome
 
-SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "9e1542ab5c0b12ea3af076a9a2f02d79"
 SRC_URI[sha256sum] = "943fc36ceac7dd25bc928256bc7b535a42989c6b971578146869eee5fe5955f4"
 
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
index 9d8d190..bd40946 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
 PACKAGECONFIG[avformat] = "--with-libavformat,--without-libavformat,libav"
 
-SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "32b00002f1f1e316115c4ed922e1dec8"
 SRC_URI[sha256sum] = "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9b1d9a6480dd8d426"
 
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
index b70148e..68a669c 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
@@ -8,7 +8,7 @@ DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff webk
 
 inherit gnome
 
-SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
+SRC_URI = "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
            file://freetype.patch \
           "
 SRC_URI[md5sum] = "84c964aab7044489af69f7319bb59b47"
-- 
1.9.0


