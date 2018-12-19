Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 390C86C42C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:41:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j2so19806651wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WghFQBGBKhg34yGpUGir4IBuT0en9ttSCr00G5RzFjE=;
	b=dmIvVMBW58EaCu4Rm9DCUlU8cSTQEIvNSpFmKdAgFb5VSCp9S/gc7vGScgxFtjoe/e
	dIf7daz7v4IPmrOgfBpMzTiu8vIE8dlE6gEups5oj/aXioQFEkp7YrLfm8wgYA/UJ/wN
	YpGtaV3gqu1Q6upBhtck4GXoqtse4w411m8meYBThFPjYe2h1OLHl95k73n0sKxCcwgE
	+hj5hMObL6EknjhTBTVxQL5lOyWYuFdzK+SvvZnW5CSKOz7Y+FHOiL9hCBrx2bzaFjD3
	NeLyMNDZFL1YeTANuqPXHqdl5W4XNEBVELNpqXcOLhWBJGmIDySK/KeF2O+7zhFNd7T6
	1nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WghFQBGBKhg34yGpUGir4IBuT0en9ttSCr00G5RzFjE=;
	b=f6wqFBBcDaanZbtCodjI6uglhUKdjGHptmwfy45xddc81hXHxJs/zH2IsTvefEcslV
	mu7Mv3BjIwDRtejutcugQ9FgfbJBO4sMarXr7SScwEkdUTxuTL612o1tmvse2gtLcv6u
	zekg0/ySmdvp/hN1E6p4DdQTYjWc1g72/HT90Vz+pG/eQDDab53CX3Yl+o3zjkmliMCr
	XxZTwxGxizj7RJJppcuE6h1VJz4qYTIqGzV/7LALs+wbasFibCQw0vyYa/R31tZby6Jw
	64JsbaS/CgAJ8VjSgFYfJjnUReVg1HLOwCaKe//GfwJUGSs/ADqiDF6RYGODb4z0K+3I
	vwOQ==
X-Gm-Message-State: AA+aEWb9kKtrluohsNbG8q6r3qiDrWv4aZGRmEOK0yHceEttUrvtdesC
	N3+2dj/1n2mWTwhgypAmPFd3AVKt
X-Google-Smtp-Source: AFSGD/UVn0PHfr9y5wiY2XqW64Bcov1DCFTP0MpYlInYYUbHafY9YN9maNJam4115dkiiu9NTnU5hA==
X-Received: by 2002:a5d:6105:: with SMTP id v5mr18523335wrt.63.1545230472701; 
	Wed, 19 Dec 2018 06:41:12 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o8sm5569398wrx.15.2018.12.19.06.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:41:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:11 +0000
Message-Id: <20181219144113.31057-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][thud][meta-oe 1/3] geoip: add downloadfilename for geoip database files
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
X-List-Received-Date: Wed, 19 Dec 2018 14:41:12 -0000

From: Changqing Li <changqing.li@windriver.com>

previous change of checksum don't trigger archive to re-downloaded,
, which will cause checksum mismatch. add downloadfilename to
trigger re-download.

1. for user with PREMIRROR, another benefit is it can still compile
success event upstream checksum change frequently.
2. but for user don't use PREMIRROR, if upstream checksum changed,
still might have checksum mismatch problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/geoip/geoip_1.6.12.bb     | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 1e1a7ff677..57f0b67ddb 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -9,10 +9,10 @@ HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "libdevel"
 
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
-           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz \
            file://run-ptest \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
@@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
 SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
-SRC_URI[GeoIPv6-dat.sha256sum] = "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
+SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
+SRC_URI[GeoIPv6-dat.sha256sum] = "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
 
 SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
 SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
 
 LICENSE = "LGPL-2.1"
 
@@ -44,10 +44,10 @@ EXTRA_OECONF = "--disable-static               \
 do_install() {
     make DESTDIR=${D} install
     install -d ${D}/${datadir}/GeoIP
-    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
-    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
-    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
-    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
+    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
+    install ${WORKDIR}/GeoIPv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoIPv6.dat
+    install ${WORKDIR}/GeoLiteCity.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCity.dat
+    install ${WORKDIR}/GeoLiteCityv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
     ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
 }
 
-- 
2.17.1


