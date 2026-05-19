Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A29BCD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:53 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19331.1779190851611540435
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=STR9H5jK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190851; x=1810726851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HyW3BAA23Z5+pmxuN2onWe/Ot8yfqnFAEwmnDeF7x84=;
  b=STR9H5jKJsFva7fcGy6v6IazN/XuWhZ55mpxCVzv/HBrvYwhyOIzVM/n
   PXu4u0OmNMhgF40Im56eDlTHdVCn/0zwFhjcq5lQiqeq4kkkexFw0Ghd2
   6waFu0hzXmfFrsiRPZOaDD0B2wOx/IS4HAcrLHpAipH6zF2Y7eZI7L6HZ
   9tll7YBMge0EhfGv4KtI4T+uZ05v/GqOBF33xj6Apln8A0PNxNI1TqmDM
   RVfRPBNqaHOr/PRHDvPbXfFjUluEse69IPCL8Ca7b7CVYXPNDMJ+/q9FH
   oTIa6BBoshgChU8Qp08i2/ik6ny+RYM73D2pUJaXUJph/B5OWUvasEAyD
   w==;
X-CSE-ConnectionGUID: d2nHJc79T0KmrYVZ7fCbXg==
X-CSE-MsgGUID: oETERgm3Slafd0hBeMwWeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="218799646"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="218799646"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:50 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 28FCC1C00093
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:50 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C9F401802AFC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 5DCA0405ECF;
	Tue, 19 May 2026 11:40:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/38] python3-reportlab: upgrade 4.5.0 -> 4.5.1
Date: Tue, 19 May 2026 19:39:10 +0800
Message-ID: <20260519113921.655-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127089

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-reportlab_4.5.0.bb => python3-reportlab_4.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_4.5.0.bb => python3-reportlab_4.5.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.5.0.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.5.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-reportlab_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_4.5.1.bb
index a7e9d2fd0d..e6635e5c31 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.5.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "e595932789ab7a107ba253e83f7815622708a9fd49920d0d6a909880eb66ac75"
+SRC_URI[sha256sum] = "9fdf68f4de9171ec66acb4a5feed8f8ca2af43479e707a6fbb0daa75d88e5494"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.43.0


