Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B0D105A572
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18783.1773312848257554060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GSvdBJXT;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312847; x=1804848847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tVIuH09JdY+KYnkpRDhNLI7HjMnllZx4doJW4nSxz+M=;
  b=GSvdBJXTz8ysc9LJ7zh5aWsXk3k+Z0iaqU5fSjCm43fX+UkC/Rd2wchk
   kolOKQouWYSBTenL1b+3Lf63EfZ8bTn0NMAGgnw5W6lks8ABVfjisJ8CA
   vALHM7MowJlc/mQLoOAXZxHSDguuBdqP2/1GWqssl8kqGEyQAKoB5yiXA
   z0Pqoek12HeiDf/PWlZDvqFlvSfrAA2k4xupeDue6o9ArnGo0vPQ1gyrX
   YW99uRy07mntEMYwTbRfq8C8VXV7IwQgpbQhJpVM9tzXiTOkJ40zYEbWz
   iet/gbBdpaqxWoW6ezOayy3Yx3yft9x5bmSBlg78mJTCBbXcbBGRG5jUL
   A==;
X-CSE-ConnectionGUID: y1VKSv1pSsmwiY14lnrFGg==
X-CSE-MsgGUID: 0qzfagqbRkW6lQVLGfLwdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950557"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950557"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:54:07 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E874A1C1C708
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9D31B14042C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id AAED918005BE;
	Thu, 12 Mar 2026 10:54:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/64] python3-pymisp: upgrade 2.5.32.3 -> 2.5.33.1
Date: Thu, 12 Mar 2026 18:52:04 +0800
Message-ID: <20260312105220.1856-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125148

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.32.3.bb => python3-pymisp_2.5.33.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.32.3.bb => python3-pymisp_2.5.33.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.32.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.33.1.bb
index e3b8ba3f23..4885dda859 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.33.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "bb30bbdc4d7c8c73a247ab39fb3da2ceb631dd190ccfb63bc66b77f54e155291"
+SRC_URI[sha256sum] = "b5cd9aac342596fbe2696b7c3ee02a2a221574557c0334451b0d4e21a4c5928f"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


