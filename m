Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id AB405772C0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 09:26:47 +0000 (UTC)
Received: by wmww144 with SMTP id w144so60009131wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8m+97FZSTGLegLwl0LIDvsdottpvC93mtTJGrThLzu8=;
	b=jpUUflezdOxjftRKKniJNGD5GOPEuSjb/Hypd/jaCpguXvJKAXbr/JWldZuU+SZsnk
	rYepE67G+/v4ZD8gRlWsh2cDsBZ0lxS/nKYwhk6NhD48BSI0cEhplW6XAbZpH2lJHG7L
	UhFav46dfNjJTWTNrqBb0U1i/4eGi1mEWnjbi2Kky2T5QEygTIBXTSvi2gCAd6rhStnX
	zKIc3t6ccVSNjMba03SDOdXV9c3VW58yFVBosKkouNtnghkR7z5DYJmnd/beCXhaqNS3
	QS7XtfhAahGLI2R27xSJJNM8LPyKOvJgzYomxEN1tOI+bTdaGZ1fOqBiPIb4FT1SSaE9
	WJjQ==
X-Received: by 10.28.10.13 with SMTP id 13mr8603275wmk.30.1447493207294;
	Sat, 14 Nov 2015 01:26:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c4sm12241620wjs.36.2015.11.14.01.26.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 01:26:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Nov 2015 10:27:16 +0100
Message-Id: <1447493236-23670-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-efl] efl: add dependency on libunwind
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
X-List-Received-Date: Sat, 14 Nov 2015 09:26:48 -0000

* optional dependency added to efl in:
  commit 664708b817ab0cdc7177df3743b5d9c9ab7dd2b0
  Author: Carsten Haitzler (Rasterman) <raster@rasterman.com>
  Date:   Tue May 5 11:35:16 2015 +0900
  Subject: eina - start a much improved eina dbug infra and have eina_log use it
* fixes:
efl-1.15.1: edje rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-input-evas rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: eo rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: libeet rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: efreet-trash rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-ipc rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: eina rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-x rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: emotion rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-imf-evas rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: libemotion rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: efl rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-input rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-file rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ethumb rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-con rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: evas rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: efreet-mime rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: eeze rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: libefreet rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: embryo rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-evas rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-imf rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: ecore-audio rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: eldbus rdepends on libunwind, but it isn't a build dependency? [build-deps]
efl-1.15.1: eio rdepends on libunwind, but it isn't a build dependency? [build-deps]
enjoy-0.1.0+gitrAUTOINC+aa8fec69e8: enjoy rdepends on libunwind, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 945ca6b..1120460 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & BSD & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca7873210523dcfd32694b94286dca60"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux"
+DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux libunwind"
 
 inherit efl gettext pkgconfig
 
-- 
2.6.3


