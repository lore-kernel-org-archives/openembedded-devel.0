Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3812.1586412422770354175
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,361,1580745600"; 
   d="scan'208";a="88733269"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 14:07:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 087AA50A999E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2020 13:56:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 14:06:56 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking][PATCH] ntp: upgrade 4.2.8p13 -> 4.2.8p14
Date: Thu, 9 Apr 2020 22:51:19 +0800
Message-ID: <1586443879-20929-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 087AA50A999E.A6C95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

1) remove reproducibility-respect-source-date-epoch.patch since it is included in 4.2.8p14

2) License-Update: Copyright year updated to 2020.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
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
2.17.1



