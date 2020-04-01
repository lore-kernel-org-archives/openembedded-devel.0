Received: from mail-edgeKA24.fraunhofer.de (mail-edgeKA24.fraunhofer.de [153.96.1.24])
 by mx.groups.io with SMTP id smtpd.web12.3229.1585736810451452348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 03:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: aisec.fraunhofer.de, ip: 153.96.1.24, mailfrom: felix.wruck@aisec.fraunhofer.de)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ExAQA0a4Re/xmnZsBmHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgWgGAQELAYIobFUBAR48CodYhTqHKYMgAZFrhSiBewoBAQEBAQE?=
 =?us-ascii?q?BAQEHARMMEAQBAYEEg0CCOiQ1CA4CEAEBBgEBAQEBBQQCAmmFYoRQgTN7ARg?=
 =?us-ascii?q?BLYE+DgWDJgGCewGvSoN9CwGBQoM6gT4JAYEuAYdMhGQPgUw/gUeCKXOFG4U?=
 =?us-ascii?q?jBLBtB4FJd3sEhmKPKgwdgkyMXoxELYQzjAyWFIQgAgQCBAUCFYFUAjaBWDM?=
 =?us-ascii?q?aJIM7CUcYDY4qFo4nPwEBMQKNe4EQAQE?=
X-IPAS-Result: =?us-ascii?q?A2ExAQA0a4Re/xmnZsBmHAEBAQEBBwEBEQEEBAEBgWgGA?=
 =?us-ascii?q?QELAYIobFUBAR48CodYhTqHKYMgAZFrhSiBewoBAQEBAQEBAQEHARMMEAQBA?=
 =?us-ascii?q?YEEg0CCOiQ1CA4CEAEBBgEBAQEBBQQCAmmFYoRQgTN7ARgBLYE+DgWDJgGCe?=
 =?us-ascii?q?wGvSoN9CwGBQoM6gT4JAYEuAYdMhGQPgUw/gUeCKXOFG4UjBLBtB4FJd3sEh?=
 =?us-ascii?q?mKPKgwdgkyMXoxELYQzjAyWFIQgAgQCBAUCFYFUAjaBWDMaJIM7CUcYDY4qF?=
 =?us-ascii?q?o4nPwEBMQKNe4EQAQE?=
X-IronPort-AV: E=Sophos;i="5.72,331,1580770800"; 
   d="scan'208";a="20897447"
Received: from mail-mtadd25.fraunhofer.de ([192.102.167.25])
  by mail-edgeKA24.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 12:26:47 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D/AADea4Re/2q0YZlmHQEBAQkBEQU?=
 =?us-ascii?q?FAYFoBwELAQGCJ0clVAEBHzwKjRKGAoEnlQyFKIF7CgEDAQEBAQEHAR8QBAE?=
 =?us-ascii?q?BhESCNic1CA4CEAEBBQEBAQIBBQRthQpYQhYBhVABGAEKI4EaJA4FgyYBgnu?=
 =?us-ascii?q?vUIQIAYFCgzmBPgkBgS4Bh0yEc4FMP4FHgilzhRuFIwSwbQeBSXd7BIZijyo?=
 =?us-ascii?q?MHYJMjF6MRC2EM4wMmjQCBAIEBQIVgVQCNYFYMxokgzsJRxgNjioWjic/AQI?=
 =?us-ascii?q?wAooog1OBEAEB?=
X-IronPort-AV: E=Sophos;i="5.72,331,1580770800"; 
   d="scan'208";a="79558121"
Received: from 153-97-180-106.vm.c.fraunhofer.de (HELO xch-onprem-03.ads.fraunhofer.de) ([153.97.180.106])
  by mail-mtaDD25.fraunhofer.de with ESMTP/TLS/AES256-GCM-SHA384; 01 Apr 2020 12:26:45 +0200
Received: from fwlt.aisec.fraunhofer.de (10.225.16.62) by
 xch-onprem-03.ads.fraunhofer.de (10.225.16.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 1 Apr 2020 12:25:59 +0200
From: felix.wruck@aisec.fraunhofer.de
To: <openembedded-devel@lists.openembedded.org>
CC: Felix Wruck <felix.wruck@aisec.fraunhofer.de>
Subject: [meta-java][PATCH] features_check.bbclass: Use distro_features_check instead
Date: Wed, 1 Apr 2020 12:25:25 +0200
Message-ID: <20200401102525.25426-1-felix.wruck@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: felix.wruck@aisec.fraunhofer.de
X-Originating-IP: [10.225.16.62]
X-ClientProxiedBy: xch-onprem-06.ads.fraunhofer.de (10.225.16.38) To
 xch-onprem-03.ads.fraunhofer.de (10.225.16.46)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The features_check.bbclass is not part of the zeus branch of poky.
Instead, distro_features_check.bbclass should be used with zeus.

Upstream-Status: Pending

Signed-off-by: Felix Wruck <felix.wruck@aisec.fraunhofer.de>
---
 recipes-core/cacao/cacao_2d6f6c14daf9.bb      | 2 +-
 recipes-core/classpath/classpath_0.99.bb      | 2 +-
 recipes-core/jamvm/jamvm.inc                  | 2 +-
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
index 0e50b68..6783894 100644
--- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
+++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
 SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
 SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
 
-inherit java autotools-brokensep update-alternatives pkgconfig features_check
+inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native := ""
diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
index 5b9d904..714503a 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -1,6 +1,6 @@
 require classpath.inc
 
-inherit features_check
+inherit distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index b03a5b9..d47b2f1 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -15,7 +15,7 @@ RPROVIDES_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
-inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
+inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
 
 REQUIRED_DISTRO_FEATURES_class-target = "x11"
 
diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index d774cc2..cb670cb 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
 
-inherit features_check
+inherit distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.20.1

