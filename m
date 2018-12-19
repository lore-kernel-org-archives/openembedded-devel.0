Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE396D1E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:41:13 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id x10so19769139wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+7ihBZ3dK0T3JiYpEmcNso07BU8nYpHLLqHZVmib7yg=;
	b=gvHLfb/ZfEyybENsD57WCMqLH5EWquzaRjaGGMUTCu1jmYA0SOBV+w6DrcQxBtfOMa
	OOqkl6LAFO+131OIHdnXy+rGK7piqfqCtX1bYPKcLtoHs6JeqpaMCe6sBRGNZYI3Z6qF
	K1WMTCrQG7V84neHRFNuTzkxwkw0S+TbrxEBGvKA5g5oXWBj7pqZSQK0GY48TeTyRpNB
	/WsUIcAIKgK894C8on2duHWexhkoaDWE+NfxqkT7rJYcPIA+PPyiW7XYy4j9qMwUQ7rV
	M3TeNURjA2sNLCDQbLg+WPfXWkJcudGFQyD7uH/ja1FBZatgU2aX068HtMkgXCQNRx8y
	qpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+7ihBZ3dK0T3JiYpEmcNso07BU8nYpHLLqHZVmib7yg=;
	b=qMElEdwbwXfMp9Mc28t2A8Uty8lLJJ8r4ZeYrI3GpE80b7PHPrDBDnREtZhAdpe3YU
	Xy1LSKtIrnP1E+CGBtzzQh/nr8/49uDeTc94YO9JxBZSMWvX4dfeCWkSb3nnOVYRGU+Z
	936XqIvyrF1kzEcATPOYvse7JDr16omaryiCbtaxhHRgqLJMOmSe12PzODGDzlEIIcFH
	Yac5fMg6WfjW8QyC9KYBOmnGF/5+k9qglxYTzFTAdY0YzmRHB9/vYuSD0ixgJPDkcR/X
	PtzsiIQIvqsQHdzYajg4dLGFEcqqMEpK9vQ/U8YTyBjAmQDxnoZ7/j82bNVf3Is9jJmQ
	+skQ==
X-Gm-Message-State: AA+aEWYmv7vJYJnRXzx3XCShfawokcFDwEQ3u/cvsRU8LsqFErVi+t7g
	2tcst/CBVRVYWn1XjKz0fxXoUPwV
X-Google-Smtp-Source: AFSGD/XoT0IIRgGCnMx1/qeiKqzs1fOzXic13R55PrUAahMrSrgU0fSbsCWWu84hj/eeH4kHzh21GQ==
X-Received: by 2002:adf:83e7:: with SMTP id 94mr1260135wre.278.1545230474241; 
	Wed, 19 Dec 2018 06:41:14 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id v1sm7737763wrr.88.2018.12.19.06.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:41:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:12 +0000
Message-Id: <20181219144113.31057-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219144113.31057-1-Martin.Jansa@gmail.com>
References: <20181219144113.31057-1-Martin.Jansa@gmail.com>
Subject: [PATCH][thud][meta-oe 2/3] geoip: update geolite database checksum
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
X-List-Received-Date: Wed, 19 Dec 2018 14:41:14 -0000

From: Changqing Li <changqing.li@windriver.com>

Geolite database checksum changed today, so update it
to the lastest one.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/geoip/geoip_1.6.12.bb     | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 57f0b67ddb..c3ce4d88a9 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -8,11 +8,13 @@ using reverse DNS lookups."
 HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "libdevel"
 
+GEOIP_DATABASE_VERSION = "20181205"
+
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz \
            file://run-ptest \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
@@ -20,14 +22,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
 SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
-SRC_URI[GeoIPv6-dat.sha256sum] = "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
+SRC_URI[GeoIPv6-dat.md5sum] = "52d6aa0aac1adbfa5eb7fa4742197c11"
+SRC_URI[GeoIPv6.sha256sum] = "416ac92fcc35a21d5efbb32e5c88e609c37aec1aa1af6247d088b8da1af6e9bf"
 
 SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
 SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "6734ccdc644fc0ba76eb276dce73d005"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
 
 LICENSE = "LGPL-2.1"
 
@@ -44,10 +46,10 @@ EXTRA_OECONF = "--disable-static               \
 do_install() {
     make DESTDIR=${D} install
     install -d ${D}/${datadir}/GeoIP
-    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
-    install ${WORKDIR}/GeoIPv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoIPv6.dat
-    install ${WORKDIR}/GeoLiteCity.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCity.dat
-    install ${WORKDIR}/GeoLiteCityv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
+    install ${WORKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIP.dat
+    install ${WORKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIPv6.dat
+    install ${WORKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCity.dat
+    install ${WORKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
     ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
 }
 
-- 
2.17.1


