Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C84FFD7F6F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92454.1772187286459871953
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lnc+kKHd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187285; x=1803723285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EPx4jynxC/9LLpa55JlHdlCU1lR+owE+toGfgsTHMMY=;
  b=lnc+kKHddFuwrq93QaFV97FEeiwZMnRVCn1inz0Nn4UmsJCMJyRoIgVi
   z/diQDxR1nYMe39mvBWI70DIZGEDGNjWjJGTFlltLZlcX0rPeZnMf/8ng
   9BUrcIXn1j9Q2QdDplA1RiEToBkAjpFM48UFYIhm5reLB67G5E20xHjCM
   Q30m3NRrrT0ILQbWFtO16wqjtsTomXdNVtSxer+6hB1i+ehbEwLpo8Rsd
   S3ZLrWoJAs264jX7WeeusnzdzzIJ8XNRKn3L5MJEstBTl+5GrFsmDdQ3m
   gcCPsEtSp4/4JV4oBChRHq4b8hZcw9pNVvRWsLTA7khLSSjTBgtGwVm1R
   g==;
X-CSE-ConnectionGUID: XlhAtv+UR02HM9obErza5A==
X-CSE-MsgGUID: QG28pdWQTc63uTT5v03mLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231299958"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231299958"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ECA1D1C0009A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:44 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A1FFAC02E5E
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BF430180059F;
	Fri, 27 Feb 2026 10:14:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/52] python3-pymisp: upgrade 2.5.32 -> 2.5.32.3
Date: Fri, 27 Feb 2026 18:13:00 +0800
Message-ID: <20260227101327.1432-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124725

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.32.bb => python3-pymisp_2.5.32.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.32.bb => python3-pymisp_2.5.32.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.32.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.32.3.bb
index 4c8bd5c50d..e3b8ba3f23 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "6d6cae6ff5756dc77f8a1a84175ed769c7bdc7b5c8250650bc238f6ad13d5d2d"
+SRC_URI[sha256sum] = "bb30bbdc4d7c8c73a247ab39fb3da2ceb631dd190ccfb63bc66b77f54e155291"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


