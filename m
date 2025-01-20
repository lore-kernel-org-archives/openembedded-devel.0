Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D10FC0218E
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.32636.1737360855980767102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uCljpB/N;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360856; x=1768896856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cvs9voVgHLes5GJBFYwnZCPIdQOTUPd/Ihs0GGxFgrI=;
  b=uCljpB/NhHZGvzBxB7sb6ETiixPHpmSjV+3/8CqPm4J1MpdwldKeSdjh
   abdCe+Ql9hoySvg6Wl1o22prsGNum5CCxphMLIMkogHC8+xAKbkiezKZB
   eLGhqgEPTDgq4Y+cW9LtHyuddz0K/H7I4WIE6ULkrXxYB9r0xx1gO40Vk
   HcZmTfvKMp+bb8Ai00oOp5EWe2/6C99r752nwXj/URXANcxvNt/DDukrr
   024Mc9wetRtvNwsZU0SVG5X267F92CL/QH1vP2fUgQusZAriHBjXntqU1
   YA48q+aFVUz0SKlRTX08+5kukXAfCKRCvdeTerWZPzgOS+LoO90Fv+haQ
   A==;
X-CSE-ConnectionGUID: J/kh74scQLKMyE1mDEqM+A==
X-CSE-MsgGUID: wbjntKN0RfGPhiSB/8FiuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187149517"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187149517"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ECD4D6EAF
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 730F1D3F00
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 068EC20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA56A1A0071;
	Mon, 20 Jan 2025 16:14:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/32] ctags: upgrade 6.1.20250112.0 -> 6.1.20250119.0
Date: Mon, 20 Jan 2025 16:13:36 +0800
Message-Id: <1737360846-4824-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrSQMNh4Gsei1Txb0QgSTE4KNMXCykGu9Wd8OipDENNufs/fXw7UKoP1E0D
	aJOFutDyzAhcRaE6CwVMczBVwG/jbm+Cc4Va4J3B0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114964

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250112.0.bb => ctags_6.1.20250119.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250112.0.bb => ctags_6.1.20250119.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250112.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250119.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250112.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250119.0.bb
index 21af7dc6fa..5281d79c4c 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250112.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250119.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "35c5c9776fdda655524da16b604037436a7ce37e"
+SRCREV = "e2308b07c4d8e4d3b6b59547e75f51b1c6046f29"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


