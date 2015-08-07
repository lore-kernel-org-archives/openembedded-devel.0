Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B15AD7670E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 02:17:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99367115"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 10:21:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t772FwG5007591
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Aug 2015 10:15:58 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 10:17:53 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Aug 2015 10:17:40 +0800
Message-ID: <1438913860-3406-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E8011BCB9246@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E8011BCB9246@G08CNEXMBPEKD03.g08.fujitsu.local>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH v3] geoip: upgrade 1.6.0 -> 1.6.6
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
X-List-Received-Date: Fri, 07 Aug 2015 02:17:59 -0000
Content-Type: text/plain

*Modify SRC_URI.
*Modify chksum of file COPYING and LICENSE,since year changed,
and the LICENSE explanation for file base64.c, md5.c and types.h
was deleted.But the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/geoip/{geoip_1.6.0.bb => geoip_1.6.6.bb} | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoip_1.6.0.bb => geoip_1.6.6.bb} (84%)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
similarity index 84%
rename from meta-networking/recipes-support/geoip/geoip_1.6.0.bb
rename to meta-networking/recipes-support/geoip/geoip_1.6.6.bb
index f1b2aac..5037ae3 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
@@ -8,15 +8,13 @@ using reverse DNS lookups."
 HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "libdevel"
 
-SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarball \
+SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
 "
-
-SRC_URI[tarball.md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
-SRC_URI[tarball.sha256sum] = "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
+SRCREV = "ed3f3e2b87fba05a8f2a5b9b1328e7d55be8bf30"
 
 SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
 SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
@@ -32,10 +30,10 @@ SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c7
 
 LICENSE = "LGPL-2.1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d5d53d6b948c064f4070183180a4fa89 \
-                    file://LICENSE;md5=f04db71812ba70aaba8b38da91984cd2 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
+                    file://LICENSE;md5=0388276749a542b0d611601fa7c1dcc8 "
 
-S = "${WORKDIR}/GeoIP-1.6.0"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
1.8.4.2


