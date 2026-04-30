Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96A9CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17461.1777546232639185052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hEXVvEDZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546238; x=1809082238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r0GwuaceCH6ikXIw4cR4pTgL1m6VwqJZ8dxZajdO8oY=;
  b=hEXVvEDZiZBl3aXLcCo/FKUanR+6DFUfcYFk3+56jzY2yaRzTo2gxqAz
   9Ur4s3K9DNFtrL7aUxQPe7ueWzQ8VN/1IXE8fhqNJfQ6Ou/Mwy7A6edTh
   b15I5SrLLLh89uNCo//038Uk6M6a9xCJDRQV8XTPETzSl+gT8MY5AKN3g
   4qo3F11gB+jmTPotLLTeZ2IDkxH0FPsUWQrGIoSsd6beDtRvEs1p9Mf+g
   RcgibGI5k6RabkxSjkjGWffzFxCCnPNm5Lz77iDARKEAQBvtNxDDOv/gZ
   lRdqWsSNcGFfWRCB06+tGHo0LS7yFfGxpeLapJ71zciEHuh/mm2D7bKPc
   Q==;
X-CSE-ConnectionGUID: u9FVupFaT2KTZJRXca6GgA==
X-CSE-MsgGUID: UPnmzD2dT0ebM8Kq6CXILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566127"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566127"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:37 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6C106C00408
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:37 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2716418002C2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id BA5751801130;
	Thu, 30 Apr 2026 10:50:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/64] python3-pymisp: upgrade 2.5.33.1 -> 2.5.33.2
Date: Thu, 30 Apr 2026 18:49:02 +0800
Message-ID: <20260430104924.1106-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126713

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.33.1.bb => python3-pymisp_2.5.33.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.33.1.bb => python3-pymisp_2.5.33.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.33.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.33.2.bb
index 4885dda859..59fa072eb4 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "b5cd9aac342596fbe2696b7c3ee02a2a221574557c0334451b0d4e21a4c5928f"
+SRC_URI[sha256sum] = "ed45ae12bb58082c5dd7e8bd35bee3a3b7eee54196d3451fa4bb7051535dbd2e"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


