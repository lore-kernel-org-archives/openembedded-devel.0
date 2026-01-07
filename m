Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45477CD5838
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3094.1767781771928041544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bTnReudJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781773; x=1799317773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vw0I/sgl5ohybALZ+mfniAcCqw5Ztx9x3sVfj3dIhRo=;
  b=bTnReudJPAaRmoPZ4ccts/++umVVvn40sgKExio6Yniww82RSDDDXJW8
   MVXgzPMH3jFNVWjFZ6krNtMdFA6ZSW/+w4Kd3PGPsYreeCa+gSoYpd5GP
   bJW24Lf9MgPq9kLmJJputTUQ/Xq88FN8LXqdPCAKdIp+aQSaZB91hWV5N
   RAlD3J8lpt8Yha95wZf9n1dxsqZZ1q4Vv1FgfnbD+s1hb545BUmWCyT5U
   AH2wUj45RppDElptFJhufxyFzeDXf18jWOeLol1ukGj79sTwnbbyhX3Eg
   AKq/DVX2sppu38z19DkD1t22ZwzCmdDwaHbXe39GYdk8e3zF/btGK3rt6
   g==;
X-CSE-ConnectionGUID: 2fJTS6q/R2Kwjzj79y3hOQ==
X-CSE-MsgGUID: aK0RpgyNQ7qj5TULQ3VlBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225054582"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225054582"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:31 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 47DD81C00081
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:30 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EE818180416C
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3F3018214C3;
	Wed,  7 Jan 2026 10:29:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/24] python3-bleak: upgrade 2.0.0 -> 2.1.1
Date: Wed,  7 Jan 2026 18:28:45 +0800
Message-ID: <20260107102855.228-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123212

From: Wang Mingyu <wangmy@fujitsu.com>

1. Changelog:
   https://github.com/hbldh/bleak/blob/v2.1.1/CHANGELOG.rst

2. Skip integration tests in ptest
   After upgrade to 2.1.1, a new test set integration was added.
   https://github.com/hbldh/bleak/tree/v2.1.1/tests/integration

   According to the description, the tests need kernel module hci_vhci,
   but hci_vhci is disabled in yocto, so skip these tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-bleak/run-ptest        | 3 +++
 .../{python3-bleak_2.0.0.bb => python3-bleak_2.1.1.bb}     | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-bleak/run-ptest
 rename meta-python/recipes-devtools/python/{python3-bleak_2.0.0.bb => python3-bleak_2.1.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-ptest b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
new file mode 100644
index 0000000000..623fc814c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+#Skip integration as it need hci_vhci, but hci_vhci module is not enabled in yocto kernel.
+pytest --automake -k "not integration"
diff --git a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb b/meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
index 161b21b88c..03f2ed062c 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "718e5d76cd051910a9d5266266af632c2529c03c"
-PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
+SRCREV = "5d76a62a549a4674c64ee151d38e2339e8ba948a"
+PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S};tag=v${PV}"
+
+SRC_URI:append = " file://run-ptest"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
@@ -12,6 +14,7 @@ RDEPENDS:${PN}-ptest += " \
 	python3-asyncio \
 	python3-pytest-asyncio \
 	python3-pytest-cov \
+	python3-bumble \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.43.0


