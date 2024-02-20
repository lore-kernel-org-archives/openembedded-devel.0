Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE08C54787
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.9341.1708419305339080884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SG8SgVNI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419305; x=1739955305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tLNsgaIKGHT7Z0hFwq+BU8dFr5Cvd/UlYE0wAZGni8E=;
  b=SG8SgVNIShf4o0oPW+9d8k9YCbV2YcV7NvI6/4DTvtr7bIqN6n7YEqRU
   uENkOvOW+XJfi7La1WXoVGKMA8UcLbNoeWLLqhlpZ6pB8dl+CSMYXAu3b
   Ref5Aw2lhgn6GjwBooWYy3ltEkFcs6chUijs3rjxeTn/17EHj3Pkl8dwO
   SR0kYWuiu77ObDLgpzi7spFG45ThOeq1lOridBekXlkbhQigR/ldIsVzJ
   V4LJ3MWfmEYzBXTdDxF8tQPX3GMkEsRxYr5eTDeRxsHraT9KJNRe5l2+u
   mFLFjy98TxdSqK4IwHrePJM+LB4GsbYpaOQrzYaej4U3Q0YcbDS3eYyYX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="129271137"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="129271137"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 491EDD4800
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46445FD90D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2FD0200A7CFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 624C31A006B;
	Tue, 20 Feb 2024 16:54:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/26] sip: upgrade 6.8.2 -> 6.8.3
Date: Tue, 20 Feb 2024 16:54:40 +0800
Message-Id: <1708419281-26047-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-3.569600-10.000000
X-TMASE-MatchedRID: FTsis3k8rau7qz8f6326on1zro62qhdCpxAd6mi1Ga32g0UfsHxDzZ7V
	Ny7+UW/9QS09ImJ+icPm08Df+RptelpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUOBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNTAyjrjtjWjkO+kBPZD1seC9e+5OoMU3jWr8B6LunQuQoTUx5214rj2RDZF2fsDU51QNp
	mxJarZ4QMyKh6HemTPsCikgfQw5uOjgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108945

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- The use of 'throw' specifiers is now deprecated and will be removed in SIP
  v7.  Instead of 'throw()', 'noexcept' should be used.  Other forms of
  'throw' are no longer required.
- Support for ABI v13.0 and ABI v12.8 and older is now deprecated and will be
  removed in SIP v7.
- Documentation fixes.
- Bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.8.2.bb => sip_6.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.2.bb => sip_6.8.3.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.2.bb b/meta-oe/recipes-devtools/sip/sip_6.8.3.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.8.2.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.3.bb
index 5df494fa7..d12130af4 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.2.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "2e65a423037422ccfde095c257703a8ff45cc1c89bdaa294d7819bc836c87639"
+SRC_URI[sha256sum] = "888547b018bb24c36aded519e93d3e513d4c6aa0ba55b7cc1affbd45cf10762c"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.34.1


