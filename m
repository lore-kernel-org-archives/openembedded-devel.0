Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276F8C52D7F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2884.1722934017920301362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ANqFmugO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934024; x=1754470024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5g1TC5Ptp+QzPlQRAKQZC7slKx/R6TjxmKbY/l4xRts=;
  b=ANqFmugOigfQPSB16KoZTAFefGTwzjgEgF6PXwr33iG3ypduU4ubTYxu
   g9ZsAVlglMy89Lg4/jl+FVWkxROOyrt1/SNvg1So5getOPNOzaneZ97nB
   f/uTSArwV5MYdtXePWdO/ckmyn1e05lWrQTBrdcSUhP8w+yqIHzkNDVjQ
   2T4JM4EsL9zl18jowczlt6DERFuNxsh8duHBsoOovSCe89EJfSV6lSS++
   iBelsJoPY8nmv0iiquJqH+J4WnmX02ZMAmXKs/uQr69g8TTTodDnrJWad
   ffWa+wXUr5yVmL8SDOLUCeU8RaE3Yl3fwO4r1UUS260d0xvQKGqAECB2Q
   A==;
X-CSE-ConnectionGUID: +gpXhftuQluCxV4hncnUyQ==
X-CSE-MsgGUID: HdoHxOO0Qk6O8PhNDftKIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="171895534"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="171895534"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07623E4458
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 489E7D50E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D39FD20076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9EF761A000C;
	Tue,  6 Aug 2024 16:46:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/60] python3-pymisp: upgrade 2.4.194 -> 2.4.195
Date: Tue,  6 Aug 2024 16:46:16 +0800
Message-Id: <1722933994-32549-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.376400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRtNdaRpWZzMRZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S785gg+On2pNcDGRpmsPG2RvhEQyl9huTVA/wXgMdH+DfPv
	i3zHDUuLL0pAYi/9fb5kM4Wdv7BBh2sCTKiyXfkKQxYeN9TZsTS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111557

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.194.bb => python3-pymisp_2.4.195.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.194.bb => python3-pymisp_2.4.195.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.194.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.195.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.194.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.195.bb
index cb28ec3ff..9738ed8ba 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.194.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.195.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "f7adb929a0f8a7f0a7c8a9be7727db247a9a30f3525216747fdbca151eb0a44a"
+SRC_URI[sha256sum] = "3200bc0934fbd51c8146eae3e5174720cd1987307c1a561312b29f96bb52fe51"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


