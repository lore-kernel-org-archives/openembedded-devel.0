Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4F836784F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 05:41:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36779439"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Feb 2018 13:41:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FAF749F19C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 13:41:01 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:41:03 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Feb 2018 13:40:46 +0800
Message-ID: <1517809249-7183-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 2FAF749F19C2.A8EED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] geoipupdate: 2.4.0 -> 2.5.0
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
X-List-Received-Date: Mon, 05 Feb 2018 05:41:04 -0000
Content-Type: text/plain

1.Upgrade geoipupdate from 2.4.0 to 2.5.0.
2.Update the checksum of LIC_FILES_CHKSUM, since ChangeLog.md has been changed. The licence is still GPLv2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../geoip/{geoipupdate-2.4.0 => geoipupdate-2.5.0}/GeoIP.conf     | 0
 .../{geoipupdate-2.4.0 => geoipupdate-2.5.0}/geoipupdate.cron     | 0
 .../geoip/{geoipupdate_2.4.0.bb => geoipupdate_2.5.0.bb}          | 8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.4.0 => geoipupdate-2.5.0}/GeoIP.conf (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.4.0 => geoipupdate-2.5.0}/geoipupdate.cron (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate_2.4.0.bb => geoipupdate_2.5.0.bb} (76%)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.4.0/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.5.0/GeoIP.conf
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.4.0/GeoIP.conf
rename to meta-networking/recipes-support/geoip/geoipupdate-2.5.0/GeoIP.conf
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.4.0/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.5.0/geoipupdate.cron
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.4.0/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate-2.5.0/geoipupdate.cron
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.4.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
similarity index 76%
rename from meta-networking/recipes-support/geoip/geoipupdate_2.4.0.bb
rename to meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
index 3e045bb..f4eb2b7 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.4.0.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
@@ -6,17 +6,17 @@ SECTION = "net"
 
 DEPENDS = "zlib curl"
 
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.4.0/geoipupdate-2.4.0.tar.gz \
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.5.0/geoipupdate-2.5.0.tar.gz \
            file://GeoIP.conf \
            file://geoipupdate.cron \
           "
-SRC_URI[md5sum] = "02f9712fb80e8e979d3d54cda7f7704f"
-SRC_URI[sha256sum] = "8b4e88ce8d84e9c75bc681704d19ec5c63c54f01e945f7669f97fb0df7e13952"
+SRC_URI[md5sum] = "28f633c49ec87ab01ad3c0fb0228a696"
+SRC_URI[sha256sum] = "5119fd0e338cd083e886228b26679c64bcbaade8a815be092aecf865a610ab26"
 
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=334337b6ecbb65093bae66b3ae21c8c2 \
+file://ChangeLog.md;md5=11d2e31df0de2be3ccc3e2286c4dafcb \
 "
 FILES_${PN} = "/usr/share/GeoIP \
               /etc/GeoIP.conf \
-- 
2.7.4




