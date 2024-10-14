Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F66CCFC507
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.50334.1728896160384323849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kw+B+MZc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896161; x=1760432161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pZ5VzcTxznrrPiyezsYhcDjgBMirW+AcA807Au812gM=;
  b=kw+B+MZcc0SNHqq2E5WfM34U16f8b6MzYPV4DEJ3hYkEZOdwYWtgu3Fg
   r1xaRNCwBS7jQ4YKTj/foq8M05gbuxWXzen7tt4vtuY8t60rXy+FpszD4
   1mORvvtLOsoRPVIqHAJcakW1Ai53F7Zisu4o0t9uPvbo+iV/9ruPROw0f
   w/jviDSUXzx5LFSz9yz91iWSpXWdr4QaexTzeESwsspQc81Kxet+LPNsY
   sa+Z9aZd6nr+QX/I95MOHZGa4d3w/SMzIs9JuxbQVf+z4H9PBa4ck7R7B
   vvVNnWJgub9m+0sKx/ZN+aX4bKAdFyNmOUSjyPn3y7TOTMIWuIPFUQAb7
   Q==;
X-CSE-ConnectionGUID: SwjG8TKfQhq3uJTner77TQ==
X-CSE-MsgGUID: TX+I66FNSbaKgJaAKkbHCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="175895922"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="175895922"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E37E2D29E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 278F0D4BC7
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3D5D20071A00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C8731A01EE;
	Mon, 14 Oct 2024 16:55:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/54] monit: upgrade 5.34.0 -> 5.34.2
Date: Mon, 14 Oct 2024 16:54:31 +0800
Message-Id: <1728896115-2944-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--2.981300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yYL5ja7E+OhyF5zgEdhsH9OdAuliTV06Yvtq
	IrkO/l5cvIVi2kAj6e8a8S7tBYtNDPc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQ32S
	61JcPB8eE97yr4g+GPoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzufiepv6/LQWOZV
	w+art+soDZaeHL/8j7s2oBoxH2UbSVUwBM3sqWJDGCKg5wxvMOCwX63D7x64vOHna03duZvbuOP
	kJ3sw7AiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112862

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
======
- The network protocol test may occasionally fail with a "Poll failed: Interrupted system call" error.
- The check program now avoids leaving zombie processes between cycles.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.34.0.bb => monit_5.34.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.34.0.bb => monit_5.34.2.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.34.0.bb b/meta-oe/recipes-support/monit/monit_5.34.2.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.34.0.bb
rename to meta-oe/recipes-support/monit/monit_5.34.2.bb
index 7c3869789..5502a15b0 100644
--- a/meta-oe/recipes-support/monit/monit_5.34.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.34.2.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "37f514cd8973bbce104cb8517ff3fc504052a083703eee0d0e873db26b919820"
+SRC_URI[sha256sum] = "291ca3d898e9b425b6d0c1768728fecd6c1cf4c268c79db15fda26285ad5b832"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.34.1


