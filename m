Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B95497226D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:00:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="90990607"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Apr 2015 16:56:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3L8wpSc003833
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 16:58:51 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 21 Apr 2015 17:00:05 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Apr 2015 16:59:59 +0800
Message-ID: <1429606799-65190-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-networking][PATCH] geoipupdate: update to 2.2.1
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
X-List-Received-Date: Tue, 21 Apr 2015 09:00:05 -0000
Content-Type: text/plain

- `geoipupdate` now verifies the MD5 of the new database before deploying it.
  If the database MD5 does not match the expected MD5, `geoipupdate` will
  exit with an error.
- The copy of `base64.c` and `base64.h` was switched to a version under GPL 2+
  to prevent a license conflict.
- The `LICENSE` file was added to the distribution.
- Several issues in the documentation were fixed.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../geoip/geoipupdate-2.1.0/GeoIP.conf             | 11 --------
 .../geoip/geoipupdate-2.1.0/geoipupdate.cron       |  5 ----
 .../geoip/geoipupdate-2.2.1/GeoIP.conf             | 11 ++++++++
 .../geoip/geoipupdate-2.2.1/geoipupdate.cron       |  5 ++++
 .../recipes-support/geoip/geoipupdate_2.1.0.bb     | 30 ----------------------
 .../recipes-support/geoip/geoipupdate_2.2.1.bb     | 30 ++++++++++++++++++++++
 6 files changed, 46 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
 delete mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.2.1/GeoIP.conf
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.2.1/geoipupdate.cron
 delete mode 100644 meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
deleted file mode 100644
index 134cfed..0000000
--- a/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-# The following UserId and LicenseKey are required placeholders:
-UserId 999999
-LicenseKey 000000000000
-
-# Include one or more of the following ProductIds:
-# * GeoLite2-City - GeoLite 2 City
-# * GeoLite2-Country - GeoLite2 Country
-# * 506 - GeoLite Legacy Country
-# * 517 - GeoLite Legacy ASN
-# * 533 - GeoLite Legacy City
-ProductIds GeoLite2-City GeoLite2-Country 506 517 533
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
deleted file mode 100644
index 40597a8..0000000
--- a/meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
+++ /dev/null
@@ -1,5 +0,0 @@
-# top of crontab
-MAILTO=your@email.com
-
-32 11 * * 4 /usr/local/bin/geoipupdate
-# end of crontab
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/GeoIP.conf
new file mode 100644
index 0000000..134cfed
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/GeoIP.conf
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
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/geoipupdate.cron
new file mode 100644
index 0000000..40597a8
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate-2.2.1/geoipupdate.cron
@@ -0,0 +1,5 @@
+# top of crontab
+MAILTO=your@email.com
+
+32 11 * * 4 /usr/local/bin/geoipupdate
+# end of crontab
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
deleted file mode 100644
index 851ad41..0000000
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Crontab entry to provide weekly updates of the GeoIP free databases."
-DESCRIPTION = "update databases for GeoIP"
-
-HOMEPAGE = "http://dev.maxmind.com/geoip/"
-SECTION = "Development"
-
-DEPENDS = "zlib curl"
-
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.1.0/geoipupdate-2.1.0.tar.gz \
-           file://GeoIP.conf \
-           file://geoipupdate.cron \
-          "
-
-SRC_URI[md5sum] = "9107d082f15c8e482f4b6f1080e7deaf"
-SRC_URI[sha256sum] = "7388c46f6c483ae609e5f5333a2585bc9713d56bb522da5c11b09d41c87aa5fb"
-
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=25f3500fad03ad7e6bf135b29c9c7c2d \
-"
-
-inherit autotools
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}
-    install -d ${D}/${sysconfdir}/cron.d
-    install ${WORKDIR}/GeoIP.conf ${D}/${sysconfdir}/
-    install ${WORKDIR}/geoipupdate.cron ${D}/${sysconfdir}/cron.d/
-}
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb
new file mode 100644
index 0000000..1a246c3
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.2.1.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Crontab entry to provide weekly updates of the GeoIP free databases."
+DESCRIPTION = "update databases for GeoIP"
+
+HOMEPAGE = "http://dev.maxmind.com/geoip/"
+SECTION = "Development"
+
+DEPENDS = "zlib curl"
+
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.2.1/geoipupdate-2.2.1.tar.gz \
+           file://GeoIP.conf \
+           file://geoipupdate.cron \
+          "
+
+SRC_URI[md5sum] = "abfd4bb9dd7fd489c103888dde5f2a57"
+SRC_URI[sha256sum] = "9547c42cc8620b2c3040fd8df95e8ee45c8b6ebcca7737d641f9526104d5f446"
+
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "\
+file://ChangeLog.md;md5=5ca3d911ed549b0756b03410ff77fa62 \
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


