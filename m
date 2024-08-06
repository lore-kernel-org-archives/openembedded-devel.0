Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10726C52D7C
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2888.1722934023735823302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T55R42i4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934023; x=1754470023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tIhAZiDRLGPm1KDDONoR3/FdIOf3VIuJbwcPNQ/yZ/U=;
  b=T55R42i4MltReGTMYJxBKJWxN9/Rsas7EpHUwhx732y0q5u+dgQlzaP/
   +HOZEEm83BmNXcB0axqdhIt/bf6K/KcGYVbN/q/f0OnixARFUkn5UmW7U
   RdHpQLdztnW4qLPg56YMGrn6QY9/XW4mT3uE2+8QMpcV4EIWiLeclG2pf
   +JNDPFjDwyJnV3OW9qoFntJFResZ/rPfSDg/1IZr3jlvvsX5G2/kUNObH
   oMqxOc0avxhsRhDmlLIpJseuFv90Y+w4YH+ZHebWw44SEuetvPdoMc6L1
   P220CoV+d3LnpvdvI28ZQDMPcOggcL+p3LGtKtQNg9Ayg81YudSAPJw1M
   g==;
X-CSE-ConnectionGUID: FOJB368MRbG3WPyKnttllw==
X-CSE-MsgGUID: i7OlMQ9eSQSakSezt1pJ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157332585"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157332585"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EF4CCC142
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E40E1D4C11
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8545EE5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 34A8F1A000D;
	Tue,  6 Aug 2024 16:46:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/60] python3-pure-eval: upgrade 0.2.2 -> 0.2.3
Date: Tue,  6 Aug 2024 16:46:14 +0800
Message-Id: <1722933994-32549-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwP/hxxPCwzUoPEQdG7H66TyHEqm8QYBtMO1G7
	iEmker61tr0t6MZaQMOwjvhIqk77kTqhaAbPCoLszkibrMVTVgPHIVG66H/c34ofdp3jS1uiU58
	yw14uCvY6dEsd9qBz5gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111559

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pure-eval_0.2.2.bb => python3-pure-eval_0.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pure-eval_0.2.2.bb => python3-pure-eval_0.2.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
index 66e4673a7..f52b235e8 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "pure_eval"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3"
+SRC_URI[sha256sum] = "5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42"
 
 RDEPENDS:${PN} += " \
     python3-datetime \
-- 
2.34.1


