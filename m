Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD468CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7013.1782378126095623165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HT5k6Qmi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378126; x=1813914126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gcfBGewSUeEF8DuZu8H1en+BGoaTlrvOns55AAk7Ugs=;
  b=HT5k6QmigB0PYp+o4ZBy6wQQ40vp9GGR5LKbs92d8APTUUVPSqUczgBs
   4iPz/O4Y0ZmfGeyPInLVzywrxSnmpQFjp3CxxLoXHm/nBKlrPlKxEkG3w
   gHx9/vM8xIxHn3R0xbsEwIusR0Oh4K+Lv+js9QXwMbUlLcIjI9gQxtJlQ
   WoOBhrkb0YYU6Tbyd07AU5QckJdPvNO2mfixMmQI/OSnQgMzTkS9RWLK/
   Lj/oM0GbO2QkST3V18lA9Koaoe3K/1W9MVuVgWBsqxBMps05m9M/TDE/K
   hrqz+0sI6+gPz9Jf85Cw3qFsTcnCxSaEh2eg05jl/tDVM85yccBYDERlx
   w==;
X-CSE-ConnectionGUID: m6puNAUVRRKjlrpEwCrhFA==
X-CSE-MsgGUID: i230jPgSQWmr5DVCA5aEzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743135"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743135"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 90FD71000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4005A1C17471
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5BBEA101732C;
	Thu, 25 Jun 2026 09:02:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/47] python3-fastapi-cli: upgrade 0.0.24 -> 0.0.27
Date: Thu, 25 Jun 2026 17:01:01 +0800
Message-ID: <20260625090127.1563-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127753

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-fastapi-cli_0.0.24.bb => python3-fastapi-cli_0.0.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.24.bb => python3-fastapi-cli_0.0.27.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
index 90624b86a5..218137e5f8 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
 
-SRC_URI[sha256sum] = "1afc9c9e21d7ebc8a3ca5e31790cd8d837742be7e4f8b9236e99cb3451f0de00"
+SRC_URI[sha256sum] = "1dffb1e40c0c88f2e0171a8a252a2b615c1e63ff8c05626649e4badd6a84336a"
 
 inherit pypi python_pdm
 
-- 
2.43.0


