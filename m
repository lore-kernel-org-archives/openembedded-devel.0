Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFD9CEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8432.1763456962801266797
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oFDRsnIB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456964; x=1794992964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5838CgE/SU5TSPOi7RgnE5rIxBMu4RwovWlC6cnD0b0=;
  b=oFDRsnIBXpjmZyf3rZCBvPRi6ZtGs8ZxFaSwJU93ECJ3wobGiEZ7iXat
   x5xOXTD/86EiOEDxKCqT+qYObwmZ4WPgxokJZY6pxPLNrO7SOKbOFc6qK
   PJViC/qzH+S572a6qbFOhhPQXJZQDlfYTyw0pyqu56hKb9Sm/Gnm+5tN4
   8lw55M5ov6TkKX5pe6RZFPrN8wxWE+IYta54lbqwHxh5wFXu1xGqRWp96
   4HM4ynXW9WwgLGrWfd5ri4QxfF+idM00ylXniHgiv9lXcpSvCyZUkJanQ
   UjvtKNMrouzJjCeZM2vxNJ1LMByIzoTObhyQ57mgY3WsHY7PUFdw8wKQc
   A==;
X-CSE-ConnectionGUID: 1+ZlzV8ASiiaBKiKlNtc9A==
X-CSE-MsgGUID: LPAfh3plTU6vjRHN1UTS7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219608366"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219608366"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:23 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D03953FC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:22 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 772691C0015B
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 084EE14002E5;
	Tue, 18 Nov 2025 09:09:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/29] python3-cantools: upgrade 40.7.1 -> 41.0.0
Date: Tue, 18 Nov 2025 17:08:35 +0800
Message-ID: <20251118090846.1484-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121829

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Update supported Python versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.7.1.bb => python3-cantools_41.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.7.1.bb => python3-cantools_41.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.7.1.bb b/meta-python/recipes-devtools/python/python3-cantools_41.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.7.1.bb
rename to meta-python/recipes-devtools/python/python3-cantools_41.0.0.bb
index 92b6c1ca09..24249dba9d 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_41.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "467e04cc86e076307375ae9bcd83707108e998e3ea6019bf968773580b9aa95f"
+SRC_URI[sha256sum] = "81d7efa32d66a149934b21b691a40fb40db9e0b74fa02c24f4f257f587d169ae"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


