Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.3975.1586413662204410151
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: xiao.zhang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0396Re44015177
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Apr 2020 23:27:41 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 8 Apr 2020
 23:27:40 -0700
From: "ZhangXiao" <xiao.zhang@windriver.com>
To: <xiao.zhang@windriver.com>, <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] ntp: upgrade 4.2.8p13 -> 4.2.8p14
Date: Wed, 8 Apr 2020 23:27:29 -0700
Message-ID: <20200409062729.124705-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

License has been changed due to date time, no new stuff added.

delete source patch reproducibility-respect-source-date-epoch.patch
for new version source tree contains it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 ...producibility-respect-source-date-epoch.patch | 16 ----------------
 .../ntp/{ntp_4.2.8p13.bb => ntp_4.2.8p14.bb}     |  7 +++----
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p13.bb => ntp_4.2.8p14.bb} (96%)

diff --git a/meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch b/meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch
deleted file mode 100644
index 58e71c3b8..000000000
--- a/meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- ntp-4.2.8p12.original/scripts/build/mkver.in	2018-11-12 14:06:49.333020430 +1300
-+++ ntp-4.2.8p12/scripts/build/mkver.in	2018-11-12 14:15:04.947480167 +1300
-@@ -15,7 +15,12 @@
-  *) ConfStr="${ConfStr}-@VER_SUFFIX@" ;;
- esac
- 
--ConfStr="$ConfStr `LC_TIME=C TZ=UTC date`"
-+if [ -n "$SOURCE_DATE_EPOCH" ]; then
-+   ConfStr="$ConfStr `LC_TIME=C TZ=UTC date -d@$SOURCE_DATE_EPOCH 2>/dev/null`" ||
-+   ConfStr="$ConfStr `LC_TIME=C TZ=UTC date -r $SOURCE_DATE_EPOCH`"
-+else
-+   ConfStr="$ConfStr `LC_TIME=C TZ=UTC date`"
-+fi
- 
- if [ ! -f .version ]; then
-   echo 0 > .version
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p14.bb
similarity index 96%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p14.bb
index e950fabe3..cdf66082f 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p14.bb
@@ -6,14 +6,13 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "net"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4cee33257467509e498f4cd9a6a4bd53"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4190b39435611e92a4da74e682623f19"
 
 DEPENDS = "libevent"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://ntp-4.2.4_p6-nano.patch \
            file://reproducibility-fixed-path-to-posix-shell.patch \
-           file://reproducibility-respect-source-date-epoch.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
@@ -25,8 +24,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "ea040ab9b4ca656b5229b89d6b822f13"
-SRC_URI[sha256sum] = "288772cecfcd9a53694ffab108d1825a31ba77f3a8466b0401baeca3bc232a38"
+SRC_URI[md5sum] = "783edaf1d68ddf651bde64eda54a579d"
+SRC_URI[sha256sum] = "1960e4f081f6aafd108d721bc3ab15f9e8dfd08dc08339aa95bca9d2545e4eb7"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.23.0

