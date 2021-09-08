Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5119.1631060390766429773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Sep 2021 17:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1880JnvK019519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Sep 2021 17:19:49 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Sep 2021 17:19:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 7 Sep 2021 17:19:48 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Sep 2021 17:19:47 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] ndpi: upgrade 3.4 -> 4.0
Date: Wed, 8 Sep 2021 08:15:40 +0800
Message-ID: <20210908001540.24948-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-autogen.sh-not-generate-configure.patch     | 12 ++++++++----
 .../ntopng/{ndpi_3.4.bb => ndpi_4.0.bb}              |  7 +++----
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/ntopng/{ndpi_3.4.bb => ndpi_4.0.bb} (76%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
index ffc6ec1ef..1cbf059ef 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
@@ -8,15 +8,18 @@ Only use autogen.sh to generate configure.ac.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+refresh patch to 4.0
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- autogen.sh | 8 --------
- 1 file changed, 8 deletions(-)
+ autogen.sh | 9 ---------
+ 1 file changed, 9 deletions(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index df734ce9..d7bbf8cb 100755
+index cf5d7057..cb73cf9d 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -52,11 +52,3 @@ cat configure.seed | sed \
+@@ -52,12 +52,3 @@ cat configure.seed | sed \
      -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
      -e "s/@FUZZY@/$FUZZY/g" \
      > configure.ac
@@ -25,6 +28,7 @@ index df734ce9..d7bbf8cb 100755
 -cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed "s/#define VERSION/#define NDPI_VERSION/g"  > configure.tmp
 -cat configure.tmp > configure
 -
+-echo "./configure $@"
 -chmod +x configure
 -./configure $@
 -
diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
similarity index 76%
rename from meta-networking/recipes-support/ntopng/ndpi_3.4.bb
rename to meta-networking/recipes-support/ntopng/ndpi_4.0.bb
index 89450f562..24de044c0 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
@@ -3,15 +3,14 @@ DESCRIPTION = "nDPI is an open source LGPLv3 library for deep-packet \
 inspection. Based on OpenDPI it includes ntop extensions"
 
 SECTION = "libdevel"
-DEPENDS = "libpcap"
+DEPENDS = "libpcap json-c"
 RDEPENDS:${PN} += " libpcap"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
-SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
+SRCREV = "b8806bd2de7391abee18353e9a99ee4aec13887c"
+SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.0-stable \
            file://0001-autogen.sh-not-generate-configure.patch \
-           file://CVE-2021-36082.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

