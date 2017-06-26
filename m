Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 773E26AC00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 01:35:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20471176"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2017 09:35:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9A7AC47E637C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 09:35:42 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 26 Jun 2017 09:35:46 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jun 2017 09:35:22 +0800
Message-ID: <1498440922-4858-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 9A7AC47E637C.A76FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: susanbian <bianyq@cn.fujitsu.com>
Subject: [meta-networking] [PATCH] geoipupdate 2.2.2 -> 2.4.0
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
X-List-Received-Date: Mon, 26 Jun 2017 01:35:46 -0000
Content-Type: text/plain

From: susanbian <bianyq@cn.fujitsu.com>

Upgrade geoipupdate from 2.2.2 to 2.4.0

License checksum changed, since the following function are added.
1. database directory is writable
2. ${datarootdir}/GeoIP is now created on make install.
3. prints out additional information from the server when download reques results.

Signed-off-by: susanbian <bianyq@cn.fujitsu.com>
---
 .../{geoipupdate-2.2.2 => geoipupdate-2.4.0}/GeoIP.conf   |  0
 .../geoipupdate.cron                                      |  0
 .../geoip/{geoipupdate_2.2.2.bb => geoipupdate_2.4.0.bb}  | 15 +++++++++------
 3 files changed, 9 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.2.2 => geoipupdate-2.4.0}/GeoIP.conf (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.2.2 => geoipupdate-2.4.0}/geoipupdate.cron (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate_2.2.2.bb => geoipupdate_2.4.0.bb} (62%)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.2/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.4.0/GeoIP.conf
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.2.2/GeoIP.conf
rename to meta-networking/recipes-support/geoip/geoipupdate-2.4.0/GeoIP.conf
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.2/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.4.0/geoipupdate.cron
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.2.2/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate-2.4.0/geoipupdate.cron
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.4.0.bb
similarity index 62%
rename from meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
rename to meta-networking/recipes-support/geoip/geoipupdate_2.4.0.bb
index 3bc936a..3e045bb 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.4.0.bb
@@ -6,20 +6,23 @@ SECTION = "net"
 
 DEPENDS = "zlib curl"
 
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.2.2/geoipupdate-2.2.2.tar.gz \
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.4.0/geoipupdate-2.4.0.tar.gz \
            file://GeoIP.conf \
            file://geoipupdate.cron \
           "
-
-SRC_URI[md5sum] = "06284bd7bcb298d078d794eb630dae55"
-SRC_URI[sha256sum] = "156ab7604255a9c62c4a442c76d48d024ac813c6542639bffa93b28e2a781621"
+SRC_URI[md5sum] = "02f9712fb80e8e979d3d54cda7f7704f"
+SRC_URI[sha256sum] = "8b4e88ce8d84e9c75bc681704d19ec5c63c54f01e945f7669f97fb0df7e13952"
 
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=8ebf6f27a39125c3d600c90914b4034a \
+file://ChangeLog.md;md5=334337b6ecbb65093bae66b3ae21c8c2 \
+"
+FILES_${PN} = "/usr/share/GeoIP \
+              /etc/GeoIP.conf \
+             /etc/cron.d/geoipupdate.cron \
+             /usr/bin/geoipupdate \
 "
-
 inherit autotools
 
 do_install_append() {
-- 
2.7.4




