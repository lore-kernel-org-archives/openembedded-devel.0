Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D8AC02183
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30358.1735032439837642540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nwyM/yKg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pVAkMWbzsE5p1cZs24m44zziLMdRENw3kGcS+hTO/BI=;
  b=nwyM/yKgxX8YxiBHOmnEeTvu51xFXiWrzFKW7AcblVAHiCeFbJqQ9V/s
   sLIltNPGvuEOv6gJvNoMzS2cD2Md7kAhfa5jlKNsBuk3ZX9fW09koBWQo
   gdBLJH1u/nuSb2ObOAaK2+JYnhnl26iPJh8iLqjEFwfCNDpTQ8HZ8I6cY
   YAUYtl16sbalIne325Knt8pmhAkggY0Zpd2r3xAbCgZrJzNqrNjuI8mn4
   YJGfa5+Y2JBost/5jQxr20sioRdE0lCWpalZuZ6SmRDA4fzS51dRicAu5
   7i7qVHPZYnpxa0fLJWdKkL3NtMD/r1eQoWgtfxv5yiboBx2Ai8mIiZyGr
   g==;
X-CSE-ConnectionGUID: 18t5MZ1xQlyieCW/6wo80Q==
X-CSE-MsgGUID: Lwv55IbHSsmi3SeIkPwlng==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776098"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776098"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5079EC2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 254BCD6FE5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AC68720071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 530661A0071;
	Tue, 24 Dec 2024 17:27:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/67] python3-grpcio-reflection: upgrade 1.67.1 -> 1.68.1
Date: Tue, 24 Dec 2024 17:26:24 +0800
Message-Id: <1735032421-13513-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFZH0YXYnbGozFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtfUe
	ErNKFJidbmq95nefglh19amF/flSYs0EwW9f9IqmM3CByWkQBG1zVL2cNLcwNFxB+V3wXcFO00i
	xJpX4YsTo5IQSY/O8EkaGfDlsE+CLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114501

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.67.1.bb => python3-grpcio-reflection_1.68.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.67.1.bb => python3-grpcio-reflection_1.68.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.68.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.68.1.bb
index dc7a4c85d9..3c0d5be812 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.68.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "507d9785a72032816e9bb5add4a660c655813a6bc1537b957822c652c88bf458"
+SRC_URI[sha256sum] = "cffcb33c4cbdde771a06fd55ca6fe149c6f89ec330c9a4010730bb2998597982"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


