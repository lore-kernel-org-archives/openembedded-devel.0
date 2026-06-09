Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409BDCD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76506.1781001001384476458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y1Wxmi/P;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001002; x=1812537002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUXSoPO8qf1gzcfxmkXE+VcHdzD0kC2+GFT8BZ73OGg=;
  b=Y1Wxmi/PoPB9nzXcCY7GGK1dAwNfvExFjsiBNI8OBv+Fp2KhsRnZ9t79
   oS6H4biD58U3uFT21YNO0NwXqp/B+kR81lQZSF3mw/ynoUHj7fccsCzaD
   KqUSNl7jqR7Hr0KnZ974+QzuVYWy8eSZTuwflYKUt0KRWS0GCnjH9Z6b0
   i8IIde0EsDFEBFkgAQj6Uixr7WwWkSsHbjPVIqxnBsyjUinKbOi2dkToZ
   kW3mWNqOghrnJ4xr3xD9HD+p4JlIMlvj4OtvQM6KRKmVzg4qCWOVdVF3M
   dd8BAgkCfJXvCMAbEMBissT+brk8+jgbeUVSQTo4R7df+04dd8ol9eMDc
   A==;
X-CSE-ConnectionGUID: eBci6C1uSsi+5w8c86mfmA==
X-CSE-MsgGUID: L60p4J1MQgykG2iCo6ebrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243463256"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243463256"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:00 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C887B1002805
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:59 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7E470C091AB
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id ACCD310003CF;
	Tue,  9 Jun 2026 10:29:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-faker: upgrade 40.19.1 -> 40.21.0
Date: Tue,  9 Jun 2026 18:29:00 +0800
Message-ID: <20260609102913.2204-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127471

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Add banks list for en_GB locale
- Add pan and gstin generators to en_IN SSN provider
- Improve barcode provider test coverage
- Bump liskin/gh-problem-matcher-wrap from 3 to 4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.19.1.bb => python3-faker_40.21.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.19.1.bb => python3-faker_40.21.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.19.1.bb b/meta-python/recipes-devtools/python/python3-faker_40.21.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.19.1.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.21.0.bb
index 7774e72dde..7c44c5cbed 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.21.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "76fa71fd3bf320db25e5504eb356f9a76b8a95cd6098524d006f446035b6b89d"
+SRC_URI[sha256sum] = "2fdee1b650a723a54432db9c6dfe17cfa29d1adc8bd60520444a07698524ba4d"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


