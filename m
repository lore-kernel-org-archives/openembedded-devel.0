Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65B8CFC510
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.50489.1728896164520041880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F+bEiMHO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896166; x=1760432166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=73ZpBi14jQVAJUj9rgHH8nIKzehP0Y+BrbGsskcWHJI=;
  b=F+bEiMHOLk78GrLZts6C9aU34KKV+w+qRDyckzzNEqVLskoCev9zxWJ4
   3Ak2nIXeOr2IFjRv3a4LNPBx/+FSwgpfzs8sY86XW/63BI3XFA0HdtcuF
   0O7/6cpCLMUKSl7frkJKG/AnjBoYBSvbIVT7PJtY84U/j4BPboF6zmwJZ
   NtTIvbeGoozu7WMAiaJgtzLeB3zdSNe1rSwRt8PvIPe+RyUaabMcDIs8b
   p9s1WDa22sLwxQNrOCLbgtDLolF9rNKMHaXG2StaXR+RmiwieJE0bAkGe
   HdBI6PT4vbz6ZCkuE4fQLxgLLRY0SBs5XnxJNxLyDZvQTGyrHL+dWqGGZ
   g==;
X-CSE-ConnectionGUID: cF3VIkPHSUqQqwlQ2TO7/Q==
X-CSE-MsgGUID: s8PdR9YBQzq1oso9BNJx6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671125"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671125"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:04 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 481C6D800A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E325BF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FC65200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1D271A01E9;
	Mon, 14 Oct 2024 16:56:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/54] python3-gcovr: upgrade 8.0 -> 8.2
Date: Mon, 14 Oct 2024 16:54:46 +0800
Message-Id: <1728896115-2944-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.857000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL5w6
	tnDgS/8FocVgDNidr2BGZriJw3Sdwe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qM2AS1zeD/w2qjKAYV8LUaeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVprfrw0uph3wukHWsvfL8ZCZ5UMPRCilM/vyccpShWDulgUc6ILENWmODKMIeqkfpGX8
	yif7i1AUMyZ0e3+0us7HwfMtq+7UVLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix documentation build issue.
- If a internal generated function is excluded the lines, if present, are
  excluded as well.
- Fix exclusion of internal functions.
- Only print info on the first undefined block number in data model.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gcovr_8.0.bb => python3-gcovr_8.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_8.0.bb => python3-gcovr_8.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-gcovr_8.0.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_8.2.bb
index 27a4972ad..bbafa36ac 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b307623752f2e1189349885b95b326e5"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=main;protocol=https"
-SRCREV = "029de7050c8a7fffdaaee13cccd3939b29412190"
+SRCREV = "045fb8d51806bd7f9e3df4e4edffa3bb816cf77f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


