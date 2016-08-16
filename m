Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EA2AE605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:31:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9956469"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 11:30:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 19ACB42BC507
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 11:30:56 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 11:30:54 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 23:30:53 -0400
Message-ID: <1471318253-1673-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 19ACB42BC507.A6E37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] geoipupdate: 2.2.1 -> 2.2.2
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
X-List-Received-Date: Tue, 16 Aug 2016 03:31:06 -0000
Content-Type: text/plain

Upgrade geoipupdate from 2.2.1 to 2.2.2.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../geoip/{geoipupdate-2.2.1 => geoipupdate-2.2.2}/GeoIP.conf     | 0
 .../{geoipupdate-2.2.1 => geoipupdate-2.2.2}/geoipupdate.cron     | 0
 .../geoip/{geoipupdate_2.2.1.bb => geoipupdate_2.2.2.bb}          | 8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.2.1 => geoipupdate-2.2.2}/GeoIP.conf (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.2.1 => geoipupdate-2.2.2}/geoipupdate.cron (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate_2.2.1.bb => geoipupdate_2.2.2.bb} (72%)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.2.2/GeoIP.conf
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.2.1/GeoIP.conf
rename to meta-networking/recipes-support/geoip/geoipupdate-2.2.2/GeoIP.conf
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.2.2/geoipupdate.cron
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.2.1/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate-2.2.2/geoipupdate.cron
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
similarity index 72%
rename from meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb
rename to meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
index 7a3a002..3bc936a 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.2.2.bb
@@ -6,18 +6,18 @@ SECTION = "net"
 
 DEPENDS = "zlib curl"
 
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.2.1/geoipupdate-2.2.1.tar.gz \
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.2.2/geoipupdate-2.2.2.tar.gz \
            file://GeoIP.conf \
            file://geoipupdate.cron \
           "
 
-SRC_URI[md5sum] = "abfd4bb9dd7fd489c103888dde5f2a57"
-SRC_URI[sha256sum] = "9547c42cc8620b2c3040fd8df95e8ee45c8b6ebcca7737d641f9526104d5f446"
+SRC_URI[md5sum] = "06284bd7bcb298d078d794eb630dae55"
+SRC_URI[sha256sum] = "156ab7604255a9c62c4a442c76d48d024ac813c6542639bffa93b28e2a781621"
 
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=5ca3d911ed549b0756b03410ff77fa62 \
+file://ChangeLog.md;md5=8ebf6f27a39125c3d600c90914b4034a \
 "
 
 inherit autotools
-- 
2.7.4




