Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825C8D29F80
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:13 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.40023.1730874671722375443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PTTOeljt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874672; x=1762410672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8HhP9MmLbiFRHJeQNuqX7k3TsLR2iruoeMYjXU5YN+0=;
  b=PTTOeljtIgFF7QFiKwQg1Pn07N82/YIEPmzB09LI0yNYM6KXjfsPnHJc
   cYSs9oz4iPoknu/vbsIcnDdyDZphV5K2ylvARyoAffptFemE53lSFcyFP
   T/OZhD3Jpg9+dmyYzjGees2gPBgFrtCLt0PVuKQ/B+TNCC2SBa4r4nYrU
   jSDOLp3Wn4i31WB8TDOh3AOVtcTPy5P+B79tyUWuQ6A/T0nF/CNjbudGD
   T0Wi6RBOwpNUulcByUqYa71MLKGhsT2pNy3pYNTi3IbNE8a02XuY6AfGJ
   mUPRE3nRTSD9SEOhbyUnsKQBF8SmmjoGqA8fMR7kw5f0nlXXLC60fr0P2
   g==;
X-CSE-ConnectionGUID: laZtWyRoQXG6xVQazddNIg==
X-CSE-MsgGUID: KG56X0nVS2eeuSzh0fT3Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158735882"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158735882"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77688CC162
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E029D8B67
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D82F6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BFD2C1A000A;
	Wed,  6 Nov 2024 14:31:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/46] fastfloat: upgrade 5.2.0 -> 6.1.6
Date: Wed,  6 Nov 2024 14:30:18 +0800
Message-Id: <1730874660-2364-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-4.348800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz8glbo199JTb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uSlVVMSD1EMk+Hv
	2UJ08907/5j56PnN5eoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzY2VpiedFJjGjVk
	AyvBYtCHQAP6krdDg0wJ1MgIvutWhXoZIV/iEKSzQoQA5gYpH8aONiTFJ7kd2Sgl8ztTt1Z+3CK
	2cXmpuBiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113690

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 doctest: if SYSTEM_DOCTEST add a find_package(doctest REQUIRED)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_5.2.0.bb => fastfloat_6.1.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/fastfloat/{fastfloat_5.2.0.bb => fastfloat_6.1.6.bb} (90%)

diff --git a/meta-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb b/meta-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb
similarity index 90%
rename from meta-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb
rename to meta-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb
index b121a97b2..99b213c4b 100644
--- a/meta-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb
+++ b/meta-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main"
 
-SRCREV = "2b2395f9ac836ffca6404424bcc252bff7aa80e4"
+SRCREV = "00c8c7b0d5c722d2212568d915a39ea73b08b973"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.34.1


