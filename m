Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1AAF6D458
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 02:20:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB52Kg0L014470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Dec 2018 18:20:42 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Dec 2018 18:20:42 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Dec 2018 10:20:40 +0800
Message-ID: <1543976440-49415-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] geoip: update geolite database checksum
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
X-List-Received-Date: Wed, 05 Dec 2018 02:20:42 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Geolite database checksum changed today, so update it
to the lastest one.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/geoip/geoip_1.6.12.bb          | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 57f0b67..a63386c 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -9,10 +9,10 @@ HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "libdevel"
 
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181205.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181205.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181205.gz \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181205.gz \
            file://run-ptest \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
@@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
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
 
@@ -44,10 +44,10 @@ EXTRA_OECONF = "--disable-static               \
 do_install() {
     make DESTDIR=${D} install
     install -d ${D}/${datadir}/GeoIP
-    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
-    install ${WORKDIR}/GeoIPv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoIPv6.dat
-    install ${WORKDIR}/GeoLiteCity.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCity.dat
-    install ${WORKDIR}/GeoLiteCityv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
+    install ${WORKDIR}/GeoIP.dat.20181205 ${D}/${datadir}/GeoIP/GeoIP.dat
+    install ${WORKDIR}/GeoIPv6.dat.20181205 ${D}/${datadir}/GeoIP/GeoIPv6.dat
+    install ${WORKDIR}/GeoLiteCity.dat.20181205 ${D}/${datadir}/GeoIP/GeoLiteCity.dat
+    install ${WORKDIR}/GeoLiteCityv6.dat.20181205 ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
     ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
 }
 
-- 
2.7.4


