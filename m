Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62334CA0FEA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.4725.1755766816430534244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ShO0Ltum;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766818; x=1787302818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hpihGEeULbdTpSd2NiqskPj1t/+mf/YUxnFoZpMeQi0=;
  b=ShO0Ltum31UIYOgoPUnxro6Ny49zvz9QohiQCBuBt9uP1P9EAm4rOpCs
   3vhItMayJnR5xfVC+ZVX9/IsxNcVXGNZvC2rZ6Rr3PtX5T7jQazsExP6I
   INHG7mpZRba3ffzIJN+S4r3sUxtFRJDtqiN6qi6746YNiz8oJGhyzdURT
   C49k1+8ToDczg613ypiu+v9DBGQNPbKejztZ+5oWj0/oll3Yt6Zd28No9
   KCzGr7F2ovSPlB+GQGlGUR+75swt5Eogs9guBADw2LExa2E3+AaEJ4MJy
   4/xkO55AgjCPWuB5x8mB6oRzGga8bh5X949O7X2/cqlrw/DPCVknYa/Ge
   g==;
X-CSE-ConnectionGUID: 6FO3B4jDSnqAGK0ni5w3DA==
X-CSE-MsgGUID: qrtji/CKQAiDGoqScNo7Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="213525261"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="213525261"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:16 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id BA1861000354
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6033818041B3
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 2EB18826FDC
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 24FFE1A0078;
	Thu, 21 Aug 2025 17:00:09 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/21] python3-pyzmq: upgrade 27.0.0 -> 27.0.1
Date: Thu, 21 Aug 2025 16:59:48 +0800
Message-ID: <20250821085954.2056-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119066

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- adds wheels for android and free-threaded Python 3.14
- adds wheels for free-threaded Python for Windows on ARM.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_27.0.0.bb => python3-pyzmq_27.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_27.0.0.bb => python3-pyzmq_27.0.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pyzmq_27.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_27.0.1.bb
index d52c99271b..8a66c852ad 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.1.bb
@@ -29,7 +29,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "b1f08eeb9ce1510e6939b6e5dcd46a17765e2333daae78ecf4606808442e52cf"
+SRC_URI[sha256sum] = "45c549204bc20e7484ffd2555f6cf02e572440ecf2f3bdd60d4404b20fddf64b"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
-- 
2.43.0


