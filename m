Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1C8C02192
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.30505.1735032440526993175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r6oIsKq5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032441; x=1766568441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L9ipb0Wt0uRo7+I58zHVOP/AiSZsq7FSR5xrQ4hgzoM=;
  b=r6oIsKq5avoi85fsYH8WkK2paRHRaqdz4LOswY3TcGs2Fd7Du4U0+fIR
   16Jcon6FZpKf7IE9h7DgckB0oed7dqHYmi/eSU6Me9s794Bbot89j9vDJ
   WInu441ei+u2hy5arhC9sHmMSLttnOTR2I7pZjJsseWB+m7eB42GVZc/Q
   onv/FDl/Q1A3bF1hKWiJK10Pb8R5aUXxk5yv6I/Wn42+VcNLe97oxZJRb
   Qbk88ygjGFYpTJL57oSfWbHCAn0Dr7gK6Hd3i2J914ybsi9JzbA4q60CG
   WuKak1FczB1Uo3IMv0Z/Vy0FZHLxbFbfHzFa+muGTFnX2qfpa0I1AOlCw
   Q==;
X-CSE-ConnectionGUID: 91rr16fHR+K0pvoAmUB70g==
X-CSE-MsgGUID: w4hhMos3SduWFL376ZWpwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184746888"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184746888"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A90AAD800D
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71A54D5B42
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1354D20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B00321A006C;
	Tue, 24 Dec 2024 17:27:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/67] python3-cmd2: upgrade 2.5.7 -> 2.5.8
Date: Tue, 24 Dec 2024 17:26:09 +0800
Message-Id: <1735032421-13513-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrSzy5YsvXRnkKLc6w3aWe4GDeXWjTvdJevdp7/242AeN/56btfCd8znBB7
	2nfWdkUtSWM3Sl8eiucb2JCrJJjBOdL8QNSEUCoR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114487

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Rolled back undocumented changes to printing functions introduced in 2.5.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_2.5.7.bb => python3-cmd2_2.5.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.5.7.bb => python3-cmd2_2.5.8.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.5.7.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.5.8.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.5.7.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.5.8.bb
index b764fd7524..34fd3d1bc9 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.5.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "0219e2bb75075fa16deffb88edf86efdd2a87439d1fa7b94fdea4b929a3dc914"
+SRC_URI[sha256sum] = "ddf29beaa7c9d4e9806eefad528a59c372ca97b4c0d83e019fef0e37c44f4497"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


