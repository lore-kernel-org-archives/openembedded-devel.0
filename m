Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35195CDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7022.1782378146954478639
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hMckpBN/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378148; x=1813914148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nl8hnjE/vsbVCX+W8lYGISO1zOO0PoQcWeKOdMfmLII=;
  b=hMckpBN/awgi5/7sIVibBO5sHEBBO9R+uayckEiELvBDeUr/7PfuIyCC
   BvkbH+ENJlOgRkIuIpFZHev7R2fUBGdUc8cdA9qdbWrZROrTGAQ8djh8s
   tPC6VURCQGmP4Od/eIB6hCAb0Xmi0hCca3vv/tE4bFDey2yCf81DwkMJN
   LViCR4NKSQFlzxVE5hCFFu7YE2SvlsAKWZr15AyEo5/f2PkQDCQTWx84w
   Wfrhgsa7jFIrR+xs0nyYww5p3WUoubHsteowKwYKpPnXLoU/1QyAgBwrk
   Kj9WQkybwiIxPActPrDU+Z0mt4epWj95acPceQoXzJWr1K+jaWTwY5ApJ
   Q==;
X-CSE-ConnectionGUID: AHdlMxckR+qolAMlyZuUgg==
X-CSE-MsgGUID: LdOYdKIRSSCxYRqam1evlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="243444639"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="243444639"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 68C3F406C4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1B276C0183F
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3A7D71017328;
	Thu, 25 Jun 2026 09:02:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/47] python3-reportlab: upgrade 4.5.1 -> 5.0.0
Date: Thu, 25 Jun 2026 17:01:14 +0800
Message-ID: <20260625090127.1563-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127766

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-reportlab_4.5.1.bb => python3-reportlab_5.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_4.5.1.bb => python3-reportlab_5.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.5.1.bb b/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-reportlab_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
index e6635e5c31..689f7d7bc2 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "9fdf68f4de9171ec66acb4a5feed8f8ca2af43479e707a6fbb0daa75d88e5494"
+SRC_URI[sha256sum] = "e4494a0c6623ae213bb856fba523171b2b54a7bf629fda02d5e525a7b899a784"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.43.0


