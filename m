Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2433B65D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 02:40:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55526317"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 10:36:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t052dXRB026529
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 10:39:33 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 5 Jan 2015 10:40:05 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Jan 2015 10:39:21 +0800
Message-ID: <1420425561-36741-3-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-networking][PATCH 2/2] geoipupdate: add new recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 02:40:05 -0000
Content-Type: text/plain

From: leimh <leimaohui@cn.fujitsu.com>

for update the IP geolocation databases

Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
---
 .../geoip/geoipupdate-2.1.0/GeoIP.conf             | 11 ++++++++
 .../geoip/geoipupdate-2.1.0/geoipupdate.cron       |  5 ++++
 .../recipes-support/geoip/geoipupdate_2.1.0.bb     | 30 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
new file mode 100644
index 0000000..134cfed
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
@@ -0,0 +1,11 @@
+# The following UserId and LicenseKey are required placeholders:
+UserId 999999
+LicenseKey 000000000000
+
+# Include one or more of the following ProductIds:
+# * GeoLite2-City - GeoLite 2 City
+# * GeoLite2-Country - GeoLite2 Country
+# * 506 - GeoLite Legacy Country
+# * 517 - GeoLite Legacy ASN
+# * 533 - GeoLite Legacy City
+ProductIds GeoLite2-City GeoLite2-Country 506 517 533
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
new file mode 100644
index 0000000..40597a8
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
@@ -0,0 +1,5 @@
+# top of crontab
+MAILTO=your@email.com
+
+32 11 * * 4 /usr/local/bin/geoipupdate
+# end of crontab
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
new file mode 100644
index 0000000..851ad41
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Crontab entry to provide weekly updates of the GeoIP free databases."
+DESCRIPTION = "update databases for GeoIP"
+
+HOMEPAGE = "http://dev.maxmind.com/geoip/"
+SECTION = "Development"
+
+DEPENDS = "zlib curl"
+
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.1.0/geoipupdate-2.1.0.tar.gz \
+           file://GeoIP.conf \
+           file://geoipupdate.cron \
+          "
+
+SRC_URI[md5sum] = "9107d082f15c8e482f4b6f1080e7deaf"
+SRC_URI[sha256sum] = "7388c46f6c483ae609e5f5333a2585bc9713d56bb522da5c11b09d41c87aa5fb"
+
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "\
+file://ChangeLog.md;md5=25f3500fad03ad7e6bf135b29c9c7c2d \
+"
+
+inherit autotools
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}
+    install -d ${D}/${sysconfdir}/cron.d
+    install ${WORKDIR}/GeoIP.conf ${D}/${sysconfdir}/
+    install ${WORKDIR}/geoipupdate.cron ${D}/${sysconfdir}/cron.d/
+}
-- 
1.8.4.2


