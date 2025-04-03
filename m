Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B38C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 02:57:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4668.1743649023181574936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 19:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QzkUtxZX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743649023; x=1775185023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FuCN3FcipEfDYqrbKXOp+0QVq6aIa+QbmoU0DdbHXpI=;
  b=QzkUtxZXWvfcjuW4eOmTWTnfFATD7X+dULpIzFZdbuFIohHXRnNraHTv
   gaC/mpgLYNzCByhSPoTuQIirSN0exiIYxBixBTebzJlYu4SRXDk+8R4YH
   8Q57s/mhFVlcVNKiz7NsHn1TfGSv2zTOvO/Y5MfBEjPDjVRbJCAgO1lqu
   lqF0Hg5pE8rBBHeeeE/iRpNUVR6RuYbObu/p5aSATAm174SCo/krbiz4k
   c3Ni5Rdmw2dozfzpMa3rSnZc55J5UsDqFN08tFwrjYdksiopRUoF/Xplw
   WOcc0H8UnSp0K3S/M3o1WED0YXOayQA1LeuNjTXFqC7B8cF0Wl+PHTPlg
   A==;
X-CSE-ConnectionGUID: kZLRFmWaSv2q4E0rqxD0Uw==
X-CSE-MsgGUID: oqBx9rh5R7an0d1y0ZZppQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="183679665"
X-IronPort-AV: E=Sophos;i="6.15,184,1739804400"; 
   d="scan'208";a="183679665"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 11:57:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB9EAD4808
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Apr 2025 11:56:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D480BDB63
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Apr 2025 11:56:58 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2DE61A009A;
	Thu,  3 Apr 2025 10:56:57 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pdm python3-pdm-{backend,build-locked}: move to oe-core
Date: Thu,  3 Apr 2025 10:56:51 +0800
Message-Id: <20250403025651.2197-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 02:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116529

They are dependencies of python3-webcolors

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../python/python3-pdm-backend_2.4.3.bb          | 14 --------------
 .../python/python3-pdm-build-locked_0.3.5.bb     | 14 --------------
 .../python/python3-pdm_2.22.4.bb                 | 16 ----------------
 3 files changed, 44 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb

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
diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb b/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
deleted file mode 100644
index e6f35b3c7a..0000000000
--- a/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A modern Python package and dependency manager supporting the latest PEP standards"
-HOMEPAGE = "https://pdm-project.org/latest/"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
-
-SRC_URI[sha256sum] = "8483f3d2285039cea7e07c5ba6ac7e1fcba358129f8831fb75065a797d27b923"
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


