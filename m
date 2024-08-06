Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FBBC5473E
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2883.1722934017677000776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WDS6tcDR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934020; x=1754470020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GIBxsJES3bV0OS/Lb/HhPXSw9YXdvB7KuqRce/4dzwU=;
  b=WDS6tcDRILglbEAi/6QXTMzVzR72SMFPR/A3OEnP49uVZlw53XoFjyLQ
   CWRHbyvakRGUv0Mn/XcZA21Xt2Gho/jgceDcdp+5E9D5/n8qvgQFlFqkt
   qYy1uuQXJgHmYDiqPqZApladwyIefnOchtFHBtaFG/0yVpBMpor7fI5jF
   hoYHpU0Gmq/LUU4PKhShFPp/+XClKe2MUBQKbA94wV1Q9yshp0NmvbkKW
   50GjQBUI7m3ICxDTSoxZw6YUjzC/zOcVnWc2tSItWl3KHOk75kZTRxXrK
   j6dzmujJYPb/a5LqP+IB2Kggzjp0sua10R5N7rhHomhNIXmLqa+AA9839
   w==;
X-CSE-ConnectionGUID: ykO2+Yq8QmmCmSQ05inZOw==
X-CSE-MsgGUID: bJI7EDZpSr6fH0GIdazWBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169165584"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169165584"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F5EFC68E1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93223D50E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1352820076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1E7E1A000D;
	Tue,  6 Aug 2024 16:46:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/60] neatvnc: upgrade 0.8.0 -> 0.8.1
Date: Tue,  6 Aug 2024 16:45:59 +0800
Message-Id: <1722933994-32549-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.645700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SBiPbSW0/xvlJYTqFMdfSWW8yZU3yFoZl9zC2/LBTG0haCh
	/Awk9FGxdHDDfri0Wb3OamXNZQUxxIsN53YfWhMxDEUdhFrQPCS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111540

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
index c9c4a6c27..9065050c6 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
 
-SRCREV = "46432ce8cade0b54a38d4bb42eb07f96c8ff49fd"
+SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


