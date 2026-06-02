Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C5BCD6E69
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21224.1780394925815658717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TKLj+x1n;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394926; x=1811930926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CVeQtQJV41+PMVdEbfvQcT7RCTB2lJhKEE6MH9o1BuU=;
  b=TKLj+x1nfXIoII1aGvKZ2pF/HOhzjNQCXJnO9jL780sCE2Xf6OpUaora
   Gq+kqFslZjaDjB2rDYNXlLpHrqnBrz2JGSUjHnmNuCSK60nTn8BYnMr48
   8Aq3SdHeNACwLO2Q1GajS1RCx+zS1CjEb0EAUQSvyf+roUG7xm/MlM7/t
   8nnqUZ8w+BMRy4DUusJybfeWE2NHTvDzxHAWoKpn10J7yc+8aVauUPYC0
   ees+fHpXavH17w9tdsJhiZ49/xWm5AAgzANML6Eixe5sGhkG6cKNQsPe6
   yoNiJ91sRpY4eLsynEr4vUaf9nWLoDZy3DSDvXJeWs3bnmrU8tAwFvFPy
   w==;
X-CSE-ConnectionGUID: vQ3Dl9QSSAKO0DQc4anfAQ==
X-CSE-MsgGUID: a0U3VwVWRI6x5aOotYtnYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230702048"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230702048"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:45 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D97761000348
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 899AC1C1C25F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A16A61800522;
	Tue,  2 Jun 2026 10:08:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/38] python3-python-multipart: upgrade 0.0.29 -> 0.0.30
Date: Tue,  2 Jun 2026 18:07:41 +0800
Message-ID: <20260602100755.2117-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127347

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.29.bb => python3-python-multipart_0.0.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.29.bb => python3-python-multipart_0.0.30.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.29.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.30.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.29.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.30.bb
index e792b2d792..46c8ff72e5 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.29.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.30.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "643e93849196645e2dbdd81a0f8829a23123ad7f797a84a364c6fb3563f18904"
+SRC_URI[sha256sum] = "0edfe0475c1f46ddd3ff7785a626f6118af32bdcf359bb21260367313bb32118"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


