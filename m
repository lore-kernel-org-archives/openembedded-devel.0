Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9968EC5478B
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.37323.1708333367998122470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MHBjrAkG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333368; x=1739869368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3iEROIKVSxZn/dvE4ZgrxuUAhiOU+ilpYnH86F3n1B8=;
  b=MHBjrAkGKBzIw2Mob5cn/evxTild5aUzAHvGO+CcmOHFUpMTBXUcGBQM
   mUvQdE3ho4xPxKmYoJGmvxYpHKnhat1PKVynWuShz3VcwkozLoFSZxLL9
   vrYfdNulK1hA7qNXKxquYe6l62ESaSIrSTWnAEhQBDvuyJ4VAIpby7BE+
   z+dVsZ3h/VwrrdZwbM4BnP0lVFvrZRidyZ9KWbIZXJCZWi1I8+15JEWJK
   gy1mNFtyGCwUgjoyl9Hk3WtumyPA+khvMl0PZHpbweJylU2ps/Hg8TQPu
   mBZ5dBXeoCGPiKvpFfEYrQQHmNp18ZK6odouaykoX2GeFcRQCpXLaUCys
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="128545992"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="128545992"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:45 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66B154DA5D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9803BD4F4F
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 36C2D1E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DBA2C1A00A0;
	Mon, 19 Feb 2024 17:02:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/23] python3-aiohue: upgrade 4.7.0 -> 4.7.1
Date: Mon, 19 Feb 2024 17:02:17 +0800
Message-Id: <1708333346-17704-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--1.500900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrAWQaZTMSP86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr1uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5a3C
	Rcx3mxoiuaf1a4JQOEd8wnV+8SOIuC5rtGPcdNtnm2Q+MF4laECFBFeWkO5C1UGEfPc5YgRouO+
	UK9/IY47w+N2h+r/36CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108860

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
#281 - Treat EffectStatus.NO_EFFECT the same as None
#262 - Allow a scene's palette to be absent

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.7.0.bb => python3-aiohue_4.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.7.0.bb => python3-aiohue_4.7.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
index 84aace451..4b5edffdb 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "3ca727b463e55bbe7c69b67f5503ffcd7d213c9644c4e458e3556ee6ea33855b"
+SRC_URI[sha256sum] = "29b5e5ae05938cac195b1969e70bd6ad4e4e2e105d0e565849803d2a99ff47d1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


