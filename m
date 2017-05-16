Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3751671994
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 03:48:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18893435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 May 2017 11:48:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 288FC47C6139
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:48:12 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 16 May 2017 11:48:11 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 May 2017 11:47:54 +0800
Message-ID: <1494906474-41373-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 288FC47C6139.A809B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] geoipupdate: 2.2.2 -> 2.3.1
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
X-List-Received-Date: Tue, 16 May 2017 03:48:17 -0000
Content-Type: text/plain

1) Upgrade geoipupdate from 2.2.2 to 2.3.1.
2) License checksum changed,since the license checksum file "ChangeLog.md" were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../geoip/{geoipupdate-2.2.2 => geoipupdate-2.3.1}/GeoIP.conf     | 0
 .../{geoipupdate-2.2.2 => geoipupdate-2.3.1}/geoipupdate.cron     | 0
 .../geoip/{geoipupdate_2.2.2.bb => geoipupdate_2.3.1.bb}          | 8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.2.2 => geoipupdate-2.3.1}/GeoIP.conf (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.2.2 => geoipupdate-2.3.1}/geoipupdate.cron (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate_2.2.2.bb => geoipupdate_2.3.1.bb} (72%)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.2/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.3.1/GeoIP.conf
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.2.2/GeoIP.conf
rename to meta-networking/recipes-support/geoip/geoipupdate-2.3.1/GeoIP.conf
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.2/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.3.1/geoipupdate.cron
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.2.2/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate-2.3.1/geoipupdate.cron
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.3.1.bb
similarity index 72%
rename from meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
rename to meta-networking/recipes-support/geoip/geoipupdate_2.3.1.bb
index 3bc936a..5271779 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.3.1.bb
@@ -6,18 +6,18 @@ SECTION = "net"
 
 DEPENDS = "zlib curl"
 
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.2.2/geoipupdate-2.2.2.tar.gz \
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v${PV}/geoipupdate-${PV}.tar.gz \
            file://GeoIP.conf \
            file://geoipupdate.cron \
           "
 
-SRC_URI[md5sum] = "06284bd7bcb298d078d794eb630dae55"
-SRC_URI[sha256sum] = "156ab7604255a9c62c4a442c76d48d024ac813c6542639bffa93b28e2a781621"
+SRC_URI[md5sum] = "94de6553bc213703ae07542089c280bc"
+SRC_URI[sha256sum] = "4f71e911774c4fd32e217889c242d2c311fa5ffd3df56be48a2d1aedfe2e671c"
 
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=8ebf6f27a39125c3d600c90914b4034a \
+file://ChangeLog.md;md5=ca457cc1427b57972707b741adb7fe1d \
 "
 
 inherit autotools
-- 
2.7.4




