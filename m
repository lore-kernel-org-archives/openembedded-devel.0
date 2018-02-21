Return-Path: <brendan.le.foll@intel.com>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Feb 2018 14:00:19 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id B65F871BA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:00:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 05:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,543,1511856000"; d="scan'208";a="19361456"
Received: from schultz.iul.intel.com ([172.28.50.124])
	by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2018 05:50:45 -0800
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Feb 2018 14:50:42 +0100
Message-Id: <20180221135042.24289-2-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180221135042.24289-1-brendan.le.foll@intel.com>
References: <20180221135042.24289-1-brendan.le.foll@intel.com>
Cc: Brendan Le Foll <brendan.le.foll@intel.com>
Subject: [meta-oe][PATCH 2/2] upm: Update recipe to use v1.6.0
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
X-List-Received-Date: Wed, 21 Feb 2018 14:00:19 -0000

ads1x15 patch is no longer required as it has been merged upstream

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 ...15-fixed-case-logic-in-getThresh-function.patch | 54 ----------------------
 meta-oe/recipes-extended/upm/upm_git.bb            |  5 +-
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch

diff --git a/meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch b/meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
deleted file mode 100644
index c617d14a1..000000000
--- a/meta-oe/recipes-extended/upm/files/ads1x15-fixed-case-logic-in-getThresh-function.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c64d04d084f47b4cb3e1cdee6e96348fcc6a756e Mon Sep 17 00:00:00 2001
-From: Mihai Tudor Panu <mihai.tudor.panu@intel.com>
-Date: Tue, 30 May 2017 15:14:09 -0700
-Subject: [PATCH 1/1] ads1x15: fixed case logic in getThresh() function
-
-Signed-off-by: Mihai Tudor Panu <mihai.tudor.panu@intel.com>
-
-Upstream-Status: Backported [c64d04d084f47b4cb3e1cdee6e96348fcc6a756e]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
----
- src/ads1x15/ads1x15.cxx | 4 ++--
- src/ads1x15/ads1x15.hpp | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/ads1x15/ads1x15.cxx b/src/ads1x15/ads1x15.cxx
-index 35782709..47701b2a 100644
---- a/src/ads1x15/ads1x15.cxx
-+++ b/src/ads1x15/ads1x15.cxx
-@@ -116,7 +116,7 @@ ADS1X15::setContinuous(bool mode){
- 
- float
- ADS1X15::getThresh(ADSTHRESH reg){
--     if( THRESH_HIGH && THRESH_LOW) return getLastSample(reg);
-+     if(reg == THRESH_HIGH || reg == THRESH_LOW) return getLastSample(reg);
-      else return 0.0;
- }
- 
-@@ -137,7 +137,7 @@ ADS1X15::setThresh(ADSTHRESH reg, float value){
-      case 2:
-      case 3:
-           set_value = value / getMultiplier();
--         set_value = set_value << m_bitShift;
-+          set_value = set_value << m_bitShift;
-           if(i2c->writeWordReg(reg, swapWord(set_value)) != mraa::SUCCESS){
-             throw std::runtime_error(std::string(__FUNCTION__) + ": I2c.write() failed");
-             return;
-diff --git a/src/ads1x15/ads1x15.hpp b/src/ads1x15/ads1x15.hpp
-index 7524572d..efd8c8ec 100644
---- a/src/ads1x15/ads1x15.hpp
-+++ b/src/ads1x15/ads1x15.hpp
-@@ -390,7 +390,7 @@ namespace upm {
-              * @param reg ADSTHRES enum value.
-              * Returns 0.0 unless THRESH_HIGH or THRESH_LOW requested.
-              */
--            float getThresh(ADSTHRESH reg = THRESH_LOW);
-+            float getThresh(ADSTHRESH reg = THRESH_DEFAULT);
- 
-             /**
-              * Sets threshold levels or configures for conversion ready
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index a5c2bb321..d742a5e46 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -7,12 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 
 DEPENDS = "libjpeg-turbo mraa"
 
-SRCREV = "106b6c706268522ab0168a4ddb19e89ce832e084"
-PV = "1.3.0-git${SRCPV}"
+SRCREV = "cc7fec9ae0228add9011bf1c2cd5e0ca2ba0d4f0"
+PV = "1.6.0-git${SRCPV}"
 
 SRC_URI = " \
     git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
-    file://ads1x15-fixed-case-logic-in-getThresh-function.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.16.2


