Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C53ED2D8D8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:45:58 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6922.1769507147726547066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MC081Pfn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507147; x=1801043147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T0O76ivjkqS5DPdu/95P81tJj6fhjs+GKrp5hCcLVDw=;
  b=MC081PfnPvFqbYHZolaxirUA1yfxeP+CK5DmRh/rcNNY25ASXbesLzxn
   ZZWoyFaEz8KO/IMXi4NYmw2A4m5zkFY7Itq2dLy8D0BESZrEopNacLysO
   LCdKtMDA896ofKu6vbGhrobJ2t8QC7jCRufmX/MEBqIuTXZAszIGDO+oQ
   3q156kkRd55hkbjtc10VNF7cWPmOKE0NpXRWWGVxUPJIMzFdFGbBFjN0A
   Bfj+7KNoIqOxiqHPVwLG7Bf0LLD1WfKrjiPI1G5QDfsniZVd68nroLTBt
   9sAs9DuR1Hrvc9XnWY3JeWd/Vy2foBj5KRUA/jA/i05PXFeIC7T2aTgOT
   A==;
X-CSE-ConnectionGUID: bDznCQsIStiYliw/EhKBsw==
X-CSE-MsgGUID: IDwmHirbRKmgHDPj5hkQUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206088403"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206088403"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:30 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DA7B382070D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 94CCC8D2065
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 04CCB2000212;
	Tue, 27 Jan 2026 09:44:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/25] python3-multidict: upgrade 6.7.0 -> 6.7.1
Date: Tue, 27 Jan 2026 17:43:35 +0800
Message-ID: <20260127094339.1081-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123937

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.7.0.bb => python3-multidict_6.7.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.7.0.bb => python3-multidict_6.7.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
index 821a880291..15848fefec 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fef6e4b0828c2401fb983363985b39"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "c6e99d9a65ca282e578dfea819cfa9c0a62b2499d8677392e09feaf305e9e6f5"
+SRC_URI[sha256sum] = "ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d"
 
 RDEPENDS:${PN}-ptest += " \
     python3-objgraph \
-- 
2.43.0


