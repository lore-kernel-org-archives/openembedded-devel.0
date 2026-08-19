Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB65C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3352.1787132221133633110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RMGy9TKf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132235; x=1818668235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d0WgUt6pOt5SWmWKNI+jCvDggJ71SxiW9yHLjkn47L4=;
  b=RMGy9TKfbG1Yn5jXB7AL8P47zvjwOniOCAFLsiLLOiEaAnZkoOKaq1/r
   YCH/lv1GzWJlPlIx03r1T11DGAaCvxUn4cgB7zPFr2Y/D4gNhV4+IzVTb
   LH3m1emmlsw0a+CO7IQBdG2E6vlPa04TvFmWPRqX04GBhPHtFYbUXBk/+
   F//GzML2U/8lQH/zwkN5ynMYqQGA80Sl5q6BnfNxwcobqqf0UoQ6Wqzci
   dtZUHex07oZT3hoSrYTET3N2crKCWgW9TOs+SUcPzGd8CCjCpd5VQPqEJ
   Gjb+9ykIkiEgOqZf1cG22LLERpD6gJvI2D5NrzuiU04DlZPWzCSsj8aH4
   w==;
X-CSE-ConnectionGUID: 0LvzGn77TV+5kJB1QCZHuQ==
X-CSE-MsgGUID: 5EY1umNPTkqjvonhDaBe6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251797142"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251797142"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0A89A1C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:14 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B9B5B83D95A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CAF901801C0A;
	Wed, 19 Aug 2026 09:37:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 64/70] python3-virtualenv: upgrade 21.7.1 -> 21.7.4
Date: Wed, 19 Aug 2026 17:35:08 +0800
Message-ID: <20260819093514.1101-64-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129334

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Upgrade embedded pip/setuptools/wheel
- fix(config): return a real list from ListType.split_values
- Upgrade embedded pip/setuptools/wheel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.7.1.bb => python3-virtualenv_21.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.7.1.bb => python3-virtualenv_21.7.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.7.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.7.4.bb
index 366e0087bb..6ee0b921e6 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "d0dbfaa5483487baea28d7210ef8d24c9d1bd0f10f449eeb215568825a9b334e"
+SRC_URI[sha256sum] = "c9d960c95fa458171e58222a5ccab7465298e4b6559977865e627c4719f1e825"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


