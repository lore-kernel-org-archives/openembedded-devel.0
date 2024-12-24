Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB53E7719B
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.30365.1735032445892108500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=APIGEsUb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032446; x=1766568446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Sg0ySoKOlFQnmDAG3UZRvyePJA2cAUmG/Cb/DqvmgR8=;
  b=APIGEsUbsDd9ETfr8FYqiFEP8ndMcVJAwNlSwQ0LL6TlVCySnRCYHV6L
   yQ1Ii+MrxvH1D4OV7twb/iMTpNJQ4mh4tvOAnCPQe6mWBZQa9bTam2e/9
   IWND0j1euxthQaoCWIIlayrnmUji3PRk0IX/U1lJe0tFXuSwsAvlmxRDg
   8YaRLJV6zpSX45JF6OiLYEg3vhjUyjsVwVEQL82TlkNbQn7jkBRpLhsUB
   R8JzyfFHFRVb5+yywXjmYBUEBeL/Lfm8JCeu64FNY2w3cduTPgyjqW90k
   3DJIMiiEBqrsChn8txjDHCQiBDGQrqnPDloOmMqMb4zc62wNIIWBAeZ/7
   g==;
X-CSE-ConnectionGUID: Y0qz6GoWTkiLjEntmXBq0Q==
X-CSE-MsgGUID: Ht4r0ozUTWqFXxAjWgLavA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163677410"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163677410"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 12CB8D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF0E5D6FE5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6988520071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 110C21A0071;
	Tue, 24 Dec 2024 17:27:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/67] python3-httptools: upgrade 0.6.2 -> 0.6.4
Date: Tue, 24 Dec 2024 17:26:27 +0800
Message-Id: <1735032421-13513-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.042900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrSLyuC617NWk6FHRWx2FGsPUt
	SCGaNXOrcqGlFHKX7fuJDICn+7EM7SjIPNRiddO2A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYhPUpUX8s8NPtPmTjXcK+VOeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNWhfxLWgQMBVvise71dFZMTPvxNanwlTlZJ1ksT4QMZUA8LHhr95ajM6cSc596Z4HSNVF
	snUAzLdOgdXhKHrTm4X/tD0SXCabNctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114507

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Include Cython source files in sdist
- Fix missing CR is some tests
- Bump bundled llhttp to 9.2.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httptools_0.6.2.bb => python3-httptools_0.6.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httptools_0.6.2.bb => python3-httptools_0.6.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.6.2.bb b/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-httptools_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
index 73378baffd..730df90f1e 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "ae694efefcb61317c79b2fa1caebc122060992408e389bb00889567e463a47f1"
+SRC_URI[sha256sum] = "4e93eee4add6493b59a5c514da98c939b244fce4a0d8879cd3f466562f4b7d5c"
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.43.0


