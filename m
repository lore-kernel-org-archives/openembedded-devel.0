Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D935A65CF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 02:40:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55526315"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 10:36:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t052dTwD026523
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 10:39:30 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 5 Jan 2015 10:40:01 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Jan 2015 10:39:20 +0800
Message-ID: <1420425561-36741-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-networking][PATCH 1/2] GeoIP: add recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 02:40:03 -0000
Content-Type: text/plain

From: leimh <leimaohui@cn.fujitsu.com>

GeoIP app allow you to look up information about a given IP address.

Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
---
 .../recipes-support/geoip/geoip_1.6.0.bb           | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-support/geoip/geoip_1.6.0.bb

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
new file mode 100644
index 0000000..d1bdae9
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
@@ -0,0 +1,58 @@
+SUMMARY = "C library for country/city/organization to IP address or hostname mapping"
+DESCRIPTION = "GeoIP is a C library that enables the user to find the country that any IP\
+address or hostname originates from. It uses a file based database that is\
+accurate as of March 2003. This database simply contains IP blocks as keys, and\
+countries as values. This database should be more complete and accurate than\
+using reverse DNS lookups."
+
+HOMEPAGE = "http://dev.maxmind.com/geoip/"
+SECTION = "Development/Libraries"
+
+SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarball \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
+           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
+           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
+"
+
+SRC_URI[tarball.md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
+SRC_URI[tarball.sha256sum] = "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
+
+SRC_URI[GeoIP-dat.md5sum] = "53416cd33e556a8048ac522fc9a98e05"
+SRC_URI[GeoIP-dat.sha256sum] = "a423a0c87bf9a78ef8d68153b424987c6bbddec85b5f784ca747706f4df10361"
+
+SRC_URI[GeoIPv6-dat.md5sum] = "f1a4abf4015c0300267f4717c9d7ead2"
+SRC_URI[GeoIPv6-dat.sha256sum] = "1a8e61732e39ac9d9acc20d648b2530d7bd0ff1c250f51fd18148931fbfe2830"
+
+SRC_URI[GeoLiteCity-dat.md5sum] = "48af3b8a204d7c5f8e42a4f5f4dd1874"
+SRC_URI[GeoLiteCity-dat.sha256sum] = "2f3f62f171c333cdd4e68534585e51978cb3a12dc7b269786f50daf10071d7d6"
+
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "a42504adfd8030c3a10f749191598b4a"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "4a5eeaa4a9107e6ccdbe94ad1c7c987dc70cd250cd40624ada1e3a03836bbbdb"
+
+
+LICENSE = "LGPL-2.1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d5d53d6b948c064f4070183180a4fa89 \
+                    file://LICENSE;md5=f04db71812ba70aaba8b38da91984cd2 "
+
+S = "${WORKDIR}/GeoIP-1.6.0"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-static               \
+                --disable-dependency-tracking  "
+
+do_install() {
+    make DESTDIR=${D} install
+    install -d ${D}/${datadir}/GeoIP
+    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
+    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
+    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
+    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
+}
+
+PACKAGES =+ "${PN}-database"
+FILES_${PN}-database = ""
+FILES_${PN}-database += "${datadir}/GeoIP/*"
+
-- 
1.8.4.2


