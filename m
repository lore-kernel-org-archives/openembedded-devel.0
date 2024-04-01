Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E7CCD12A3
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.39357.1711983100517075574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cmT8OfL2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983106; x=1743519106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EjJOHiPZFPchmyzvRrTGtsbD3duuEA7IDLQaNb1dV3c=;
  b=cmT8OfL2SIUKNoN1tuFY/lFb46AAmebhzqQjIOLub04szbFihOF/g9yS
   XZtRc4YN1GdHdxi35pGqjPb0hKHyc9ZNyjCi+oqoXgnB1/g3MxQExnUm6
   n8bQULgvJ996/es3IABgrTkAsgiLebR+9p21u0D+ei25DtlKBf35G0lri
   LX7OZI5YeIExSKGGGWaj3r19afTCGhHJbgCli2z6Li7zV5wHHFgM+/2bw
   v110aSvehplM7oZtDms+jKVXlgOvFfgBOr04QWw7rr/VMNHw9aT0D79hk
   YcYrWCQ6EghxfegyP+AwL4QKBANOMLwrw9MHk/YioozTu2q93Zl5aPVdX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133627004"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133627004"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:45 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 65522C36E3
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91B1DD620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F70420093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D999C1A000B;
	Mon,  1 Apr 2024 22:51:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/47] python3-requests-oauthlib: upgrade 1.4.0 -> 2.0.0
Date: Mon,  1 Apr 2024 22:51:07 +0800
Message-Id: <1711983079-16849-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-1.821200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7RnyL8x0tKlO0KJ
	Pvbg1+TH4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7P9o
	XxAYLQjKDSMj/C9RiOhrbR8I05N72UYUC9qS2MGacgsIWjNlGX0faZdF+G+pOJ518ND3YqG8cjw
	zxsmROeBN1KSyK0TeGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109750

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Merge pull request #534 from iliakur/patch-1
-Drop py2 support from the wheel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sts-oauthlib_1.4.0.bb => python3-requests-oauthlib_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-oauthlib_1.4.0.bb => python3-requests-oauthlib_2.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.4.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-requests-oauthlib_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb
index 76b14585b..71cafb513 100644
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb
@@ -1,7 +1,7 @@
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
 
-SRC_URI[sha256sum] = "acee623221e4a39abcbb919312c8ff04bd44e7e417087fb4bd5e2a2f53d5e79a"
+SRC_URI[sha256sum] = "b3dffaebd884d8cd778494369603a9e7b58d29111bf6b41bdc2dcd87203af4e9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


