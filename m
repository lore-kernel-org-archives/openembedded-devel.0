Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709D7C3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 01:37:37 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.15234.1744335452372978874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 18:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VatPSAxX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744335453; x=1775871453;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=08f0KWWaGFPUita2Sgx4v3Ww+N9bYGQ9ukEyZ8bNKk8=;
  b=VatPSAxXN4IkNaBEVK3iOeeDb06vq0Iic0DHHVItOF7KlBNLqZS0/b/F
   EzFjDD9+//0KWeYldECGIDKR4L7TPLFJCitmsBKR+GJ23EEZf0PlYi6i/
   W5c1X7EyJM6lep/yuXyKxxKklw92UCLqKVO+LsdSCVaoOHOWrToIpu090
   qrV4OHndsAxJ40WVitdfPc/aA0a2XGPFnm/56XvfsCUJWbY6IdCjeO7va
   ep3nfhdZFzHpo24yFiiPAMF8mSTs8Mgn3PvsfeRq0OmSl3g81gCdPK1yP
   nhTo8wlc4LelNvcYX9CK2c0rrOmt5b0iVxj7GBnxNhztS8GujPM6sYro4
   w==;
X-CSE-ConnectionGUID: jPTDDQmxSOmEVWnI9BcHrQ==
X-CSE-MsgGUID: EDvYQP+iSLKhjJht//hz7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="175556184"
X-IronPort-AV: E=Sophos;i="6.15,203,1739804400"; 
   d="scan'208";a="175556184"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 10:37:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7F6AD4C2B
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 10:37:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 64147D4C11
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 10:37:27 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1A8B1A0078;
	Fri, 11 Apr 2025 09:37:26 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-python] [PATCH] python3-pdm python3-pdm-{backend,build-locked}: move to oe-core
Date: Fri, 11 Apr 2025 09:37:20 +0800
Message-Id: <20250411013721.1239-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 01:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116788

They are already added to oe-core, since they are dependencies of python3-webcolors

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../python/python3-pdm-backend_2.4.3.bb          | 14 --------------
 .../python/python3-pdm-build-locked_0.3.5.bb     | 14 --------------
 .../python/python3-pdm_2.23.0.bb                 | 16 ----------------
 3 files changed, 44 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
deleted file mode 100644
index 46440c9d5d..0000000000
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "The build backend used by PDM that supports latest packaging standards"
-HOMEPAGE = "https://github.com/pdm-project/pdm-backend"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
-
-SRC_URI[sha256sum] = "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728"
-
-inherit pypi python_setuptools_build_meta
-
-PYPI_PACKAGE = "pdm_backend"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
deleted file mode 100644
index c0eee4e97d..0000000000
--- a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
-
-SRC_URI[sha256sum] = "ab2f381e00d79841d46be2e6909c265038b9fa951de2bf551ca6adb7f6844201"
-
-inherit pypi python_setuptools_build_meta
-
-DEPENDS += " python3-pdm-backend-native"
-
-PYPI_PACKAGE = "pdm_build_locked"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-
-BBCLASSEXTEND += "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb b/meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb
deleted file mode 100644
index f565819a9a..0000000000
--- a/meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A modern Python package and dependency manager supporting the latest PEP standards"
-HOMEPAGE = "https://pdm-project.org/latest/"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
-
-SRC_URI[sha256sum] = "ec5ce439648b42b928f4afa91c2b6251e6a33f40cc83779d899ca970bd9eb131"
-
-inherit pypi python_setuptools_build_meta
-
-DEPENDS += " \
-    python3-pdm-backend-native \
-    python3-pdm-build-locked-native \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


