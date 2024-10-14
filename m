Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11F7CFC52F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.50346.1728896175390566090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZalXYddj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kPw8CIOQq4ij1hpTf2XTP9fQs3R6+mxzTZQ9JF//UG8=;
  b=ZalXYddj3kSbS8dRP0aewmtL+XgPC/0v1MKxwuLBtpENcj4IR5fM/KbO
   T9zqiQNJEOTwMzSAkTDp07B2tk0fq41zZhDI47kahpG3Jqb846WU9kVpq
   Id0Z4b6OzXVrzB+WZzb/fC9HHhDn5i6eucBmTrbonSH7rM+KpBdwzdKAT
   WR6R7yfj/PtJR+amTmkVBP6Fz8hyHC1Uph/zuSL1s2MHhs3QOsfqCAi8y
   KzDUzSSJcag8Se0m2x1EhT/r1z6C4VqEhBwM7L7lXODDDdXtCo3wGmMH5
   14TJOD3MNTcEO1GqEl6wSqSRyn4hGJRLCTudrEuKPQm6xkUycr/W/+IoP
   A==;
X-CSE-ConnectionGUID: sbAWzBo6Qx+aullzmF1j2A==
X-CSE-MsgGUID: Vj7XiY0zSnOgEoHhTq58fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176874706"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176874706"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 13914D29EA
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 562FFD7527
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C521420071A2A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FF181A01ED;
	Mon, 14 Oct 2024 16:56:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/54] python3-starlette: upgrade 0.39.1 -> 0.39.2
Date: Mon, 14 Oct 2024 16:55:03 +0800
Message-Id: <1728896115-2944-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-0.245800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yXtNecKMjy32Xs5nqGvDCfNnyL8x0tKlOxH6
	cbAZmiKWnuC4VmJFPYas3cxFKjrJJkCwax7Kf3TzKsurITpSv+NUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtNQc3YRDMjRxqawhpYG+MJhAiHhrrNzCDmwRKz1tOL/Xw8mFaEXbW3KSSz
	1tskhRFzX3qyfLYelOy2iP6MOtcMv2WrswqFc6aHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112890

From: Wang Mingyu <wangmy@fujitsu.com>

Fixed
=====
- Allow use of request.url_for when only "app" scope is available
- Fix internal type hints to support python-multipart==0.0.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.39.1.bb => python3-starlette_0.39.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.39.1.bb => python3-starlette_0.39.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.39.1.bb b/meta-python/recipes-devtools/python/python3-starlette_0.39.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.39.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.39.2.bb
index c01158fc7..87080e9fe 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.39.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.39.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "33c5a94f64d3ab2c799b2715b45f254a3752f229d334f1562a3aaf78c23eab95"
+SRC_URI[sha256sum] = "caaa3b87ef8518ef913dac4f073dea44e85f73343ad2bdc17941931835b2a26a"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


