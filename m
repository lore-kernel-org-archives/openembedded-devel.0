Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87870C5478D
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9331.1708419298479997520
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mZTJaLxd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419300; x=1739955300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/BX6joX6u2/wVe/BNQsT3ao/FopHBD7ABlAd0C+mgDc=;
  b=mZTJaLxdzBR8YQiYkaK7grim9qZVd0n2o47SeSba6m+j7u6tFz67ZJCL
   /RavH72HNRwuj5YDkbSiK7h7EflQPqWftA2+htreYoRf1OCHZnDM3TY0X
   j0osQZgtR6mXbxfcLKyOBjbnlxT/ddR4NJqDxeNjiqrJVgvaKtwGkD4by
   7evxVbWKRyR2WenGzKKy/W/EhhGrXVTw2Qgj4A/Ek4N9fzuPu3SY81STe
   vOnU4tt1ea7/3qNFcQW+L32w7tsTYaPWfn1wr2+Fq9g0ckaUyXwmX6Yi3
   px62NBHBhCQDoz0d9x7ksO1xWynA6auxSyHTkzjYvZuPMf/z1gOfdLCmE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149742990"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149742990"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA8E9F256E
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02FB1FD92C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D2646C9D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F90E1A006B;
	Tue, 20 Feb 2024 16:54:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/26] python3-httpcore: upgrade 1.0.2 -> 1.0.3
Date: Tue, 20 Feb 2024 16:54:25 +0800
Message-Id: <1708419281-26047-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--1.813600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvDx5jfopzi0bWO
	DdZ1PDmEL3nSYEvv8mq6SBNYKhi0p+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4k8EtpVA6crmCbm0451GVI3dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt5oqmqh/snThHXbIN4NVmjURm0gJKafixHNYD6+E+EBEpVZlhNeL6+vE5k
	TEx9wELinm5nZ9aAc/Rp/BZeP4OGpOF+bwhGJY9HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108930

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix support for async cancellations.
-Fix trace extension when used with socks proxy.
-Fix SSL context for connections using the "wss" scheme

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httpcore_1.0.2.bb => python3-httpcore_1.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpcore_1.0.2.bb => python3-httpcore_1.0.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-httpcore_1.0.2.bb b/meta-python/recipes-devtools/python/python3-httpcore_1.0.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-httpcore_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-httpcore_1.0.3.bb
index 3bfe5ed4a..203bfd48a 100644
--- a/meta-python/recipes-devtools/python/python3-httpcore_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httpcore_1.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1c1f23b073da202e1f4f9e426490210c"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "9fc092e4799b26174648e54b74ed5f683132a464e95643b226e00c2ed2fa6535"
+SRC_URI[sha256sum] = "5c0f9546ad17dac4d0772b0808856eb616eb8b48ce94f49ed819fd6982a8a544"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.34.1


