Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75719CD1294
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.39357.1711983100517075574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ppbik79t;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983111; x=1743519111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oS5mTYLdGnRkKfXh2aHYpOvFQWuN2/xWY4I51DDzdK4=;
  b=Ppbik79tFnKu9OXSyb2UMBqOBorqNSYBe3MJp6/W+vGNS32cS5I7iECZ
   LSw71jwv1bwSyv9p3t/lSZFJBS1d/h070BDyvWkKSPAGDfS6rYhpuwhRh
   ksBhHCOnObaDRi0BUwSgvh6ZJHi0kxyOPEyc7A2Rde3w6S+aXvwaia/yH
   bUiz9wTpyndHjA2LJclrBhBx0PCGqAJa/3nzU2h3piyWS6NkO0hZ8KM2s
   LdFenUKd0Db11yZAHb8QRZRw4P7elFPbEEfHosZi+fD2prIUDBWpfXEMM
   t8+gg/gkltPhm1yW0tX9LxbvtS2bo+pWQhyYgtyv5s1+eGZx/Px8Wb9ay
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133627011"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133627011"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:50 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62BD7C36E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 87BACD620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1EEA21F7B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A85371A000A;
	Mon,  1 Apr 2024 22:51:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 46/47] wireshark: upgrade 4.2.3 -> 4.2.4
Date: Mon,  1 Apr 2024 22:51:18 +0800
Message-Id: <1711983079-16849-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.927800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yeJMNIftzCCTg55m5RSwLML/7iEeeKfdMpio
	Tuin9e1FhJtbBPDn7JvwUtXFCC9gQD4xnGicftAB/sUSFaCjTLyX2rvknNYlE5g6V3Cf70yovqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgAYAPqHoVmYRPrhvTq+YBF+em2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkljUl/4rqDIppA6D/Iy3ycdwXw0I8x+VDjfRc
	bezH82Uwj8LxNob5OuAP/mLPvruErM++aBXIlDQmMYILd7d+o0jE0K2m3JXPUu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109763

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
=========
-wnpa-sec-2024-06 T.38 dissector crash.
-Extcap with configuration never starts; "Configure all extcaps before start of capture." is shown instead.
-Packet Dissection CSV Export includes last column even if hidden.
-Inject TLS secrets closes Wireshark on Windows.
-Wireshark crashes when adding another port to the HTTP dissector.
-When adding a new row to a table an error report may be inserted.
-'--export-objects' does not work as expected on tshark version later than 3.2.10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.2.3.bb => wireshark_4.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.3.bb => wireshark_4.2.4.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.3.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
index 28a379445..95db2efc4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "958bd5996f543d91779b1a4e7e952dcd7b0245fe82194202c3333a8f78795811"
+SRC_URI[sha256sum] = "46bd0f4474337144b30816fb2d8f14e72a26d0391f24fe0b7b619acdcdad8c0c"
 
 PE = "1"
 
-- 
2.34.1


