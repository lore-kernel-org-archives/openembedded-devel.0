Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334B9C02191
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.32637.1737360857857674530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ul6C6bJQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360859; x=1768896859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/iab7clu/LCIKZ9siTQYnGdZJPAm4hFixWy57EbO/vQ=;
  b=Ul6C6bJQkI9QPXTVozbdhaiforEYNcOkr3mMD3CQJOa1q3GmzMasX2IH
   xoDpPqIA67CKZMqc+GLK6KflfbYFkP2STYPebS5X+a3F1UwSv1yNgjgNg
   bWC2pskHZiEOTslcWUHNsSbTbbz4Sa9qfqhKY2Xf1OkNRFIMD1aJEFC50
   rgA1+TU2IBH0/d/JnNAimK9XBQySyow3AOI8ukSp1BU5Rm/0QrV6nvTt8
   81CXfd5qlwdj4pJ87GQOp7kFzaGATQttP6o0kC46uhW71dk2K+2PgLG1p
   jyQscRR6hNOQPR60aXzjAUjYKFoXmDUE30Lnvc6/xmR1stWr2bLttDZDJ
   w==;
X-CSE-ConnectionGUID: +NI9otcnTvWR4mKCky1nug==
X-CSE-MsgGUID: uLVTXNWETB6MqnjUHBtiCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="189605703"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="189605703"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:16 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6273DCFC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A036BF3C0
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 195B420071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BCE971A0071;
	Mon, 20 Jan 2025 16:14:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/32] iotop: upgrade 1.26 -> 1.27
Date: Mon, 20 Jan 2025 16:13:40 +0800
Message-Id: <1737360846-4824-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--2.304200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jNcu
	PsUZnq/Ljf84k1uW53jqXvXKPBg5Bm0Xr+fj3ww/TuctSpiuWyU2ZWOmuJUS2RKve+dd8RhJeVs
	0skyEaS2BkESMI05d4qjeYGNquYUzTweK12oEGfueAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaHyYZQs3SFqeMZaZfOZ9yy6nGze0lbA02ze6iozbOvSLk23pJxziWC1pp+56DJy/NoJ6
	S1KvTroOA+1Nf2Cxys3Vb7IGQlJHoByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114968

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 1.27

Changelog:
 src/iotop: correct pg_cb signature

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/iotop/{iotop_1.26.bb => iotop_1.27.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.26.bb => iotop_1.27.bb} (83%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.26.bb b/meta-oe/recipes-extended/iotop/iotop_1.27.bb
similarity index 83%
rename from meta-oe/recipes-extended/iotop/iotop_1.26.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.27.bb
index 9b36b57cb7..60157305c5 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.26.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.27.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A top utility for I/O"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=686f457fedcecd9b92d69e625291ffa2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3154adaa1a9ca0d8dcc1944518ece1b9"
 
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https"
-SRCREV = "b15743b04bb04ff1fc6e197d21ba30365349edcb"
+SRCREV = "4e32789e496a027201e66b5773a9d7955f7c638b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


