Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D280CCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11100.1760433612351998957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oN4INbrg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433615; x=1791969615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qvYwveqjlGYx0orYqrrdbw0DRuqq2OVfSSe1t391jho=;
  b=oN4INbrgp231AwkPDgivoCAQvQonWkgX1OWrPO2OrZR5+ei8knoY382d
   9jyhxDrTWiHvelUMvHu/miif2Zb+ZuOw6SPGpmk/PhOqQZS3CzIdTW0h9
   EVEeHCv/DnE+6F2rRmSzD8wBP8/oIfsX9HcNO7gqgs2euxuVVqxHDKJl5
   Nbnq594okep+Th3iQP/BO58fwS0mAy40ylPF6oFaadaOlkbPLZawIUJRt
   EKuortwJAxfKPjDiGgZOuAGX5eH+KzYOzEtMVpd8U1GU0wmkWFLUmMTCB
   9PvP0ZqBgjNWMuALwWFV/ltD3goEHoCVKps2BfAKYvdaBGJdObJY28NJa
   g==;
X-CSE-ConnectionGUID: IW9bohVDS7yZCXjqRHKIOw==
X-CSE-MsgGUID: v+NEAD13Thia+fPZlSeUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="219477010"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="219477010"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:15 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 692671002B98
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 22E6014003AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9EFF6101BB76;
	Tue, 14 Oct 2025 09:20:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/44] python3-inline-snapshot: upgrade 0.29.1 -> 0.29.3
Date: Tue, 14 Oct 2025 17:19:06 +0800
Message-ID: <20251014091927.493-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- fixed string formatting with black which caused invalid snapshots
- xdist is now detected properly.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.29.1.bb => python3-inline-snapshot_0.29.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.29.1.bb => python3-inline-snapshot_0.29.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.3.bb
index d0d3049388..2a3d253e3c 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "17e73cb6864fa067aa94c2c1f290bbdeb25b2b807c4bdf53eee39a144f92a5a7"
+SRC_URI[sha256sum] = "f11e309d3474ab5f517687288bf23092e1acadb392e1e38ddb3d5bb165a8723e"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


