Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A916D10385
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 07:09:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8215.1764140976275027836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 23:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IvmRUVXm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764140977; x=1795676977;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3fisQ7Oagc667gpDu+lA1A0TaEF0sPgPWlPfZu44TCk=;
  b=IvmRUVXmq1XFDNl5XnriIzzKwyNdMUVyaeTpBsHTbVAkjanQIr9wZBRs
   zlI/7fTVbSaPUJdyiXG6XttA15SHyl/KCDe/03y+qhX9pZ1m2YjMotkqC
   WAuKva6aDzEt0Di6Tj7WQLNmsabfjW5E8pzSAkeCgk56ioq0ihcy2ib0d
   WDUnI4f7tu2yPS/6pa9Cj7bIy8d+TgyTPBR877C5r262H+hCAlurTTmJZ
   uJST1Fu9oDaPUz/5YfbGOSVzYHY3aKNh37pw5Tn12QEijCGmns684UYxn
   DIuKLQkh0Oz67ydMXRH2L91m1IvXs2ilyUoGZiIKjOq8YwsxPKl26XxPs
   A==;
X-CSE-ConnectionGUID: dgrgSanUTYajUG1kQ4rm6Q==
X-CSE-MsgGUID: HBC99ErYST+zFXVf98Xisg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="220486336"
X-IronPort-AV: E=Sophos;i="6.20,227,1758553200"; 
   d="scan'208";a="220486336"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:09:35 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5009D820704
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:09:34 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 06D1D8D2047
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:09:34 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id ED8BA4041C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:09:31 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-pytest-cov: upgrade 6.2.1 -> 7.0.0
Date: Wed, 26 Nov 2025 15:09:24 +0800
Message-ID: <20251126070925.4859-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122070

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...hon3-pytest-cov_6.2.1.bb => python3-pytest-cov_7.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-cov_6.2.1.bb => python3-pytest-cov_7.0.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_7.0.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-cov_7.0.0.bb
index af4ce4b770..117767d1ee 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_7.0.0.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=cbc4e25353c748c817db2daffe605e43 \
 "
 
-SRC_URI[sha256sum] = "25cc6cc0a5358204b8108ecedc51a9b57b34cc6b8c967cc2c01a4e00d8a67da2"
+SRC_URI[sha256sum] = "33c97eda2e049a0c5298e91f519302a1334c26ac65c1a483d6206fd458361af1"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta python_hatchling
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native python3-hatch-fancy-pypi-readme-native"
 RDEPENDS:${PN} += "python3-coverage python3-pytest python3-pluggy"
 
 PYPI_PACKAGE = "pytest_cov"
-- 
2.43.0


