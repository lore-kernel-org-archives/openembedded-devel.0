Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3B0E77186
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.77388.1734426112249572980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B+dSo9ds;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426115; x=1765962115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2pBdSDjXvPEtQgoNmavKkk+7c3+5qsFNA5RvO+ExFPQ=;
  b=B+dSo9dsuV6DJ+FxlNo0Sj+tJ13oMP2wcE4cwS1mZKqbGZXNVdQr7X+1
   dIB0nVR1BTzs58GpV6W7ySzHLE4G3po9c7822Ksl9ZeK62hRWJAuTs84c
   Mx0ShWRInXBGERjkLkxNF16bp8mzmCfgsLsKEqCa4Qt3MqK7xF+zazdzw
   eviltnS1zj4sMJefirhuLwo0dLb+nH4WEaMXpG03zc4plLyCU89fzXRpz
   G1pm4iM7mI3XfW2Iokl63TqBEyhEPNWmh5SNbMXPKtkVeAoMZ62LYdom6
   DQtoh3e33c53ZbzQd/Soh6cT+yO+wf7LEiL7dyObdufu6UcMWthUsG0zm
   w==;
X-CSE-ConnectionGUID: PJdusDpNTyeiFqLVTxGAsw==
X-CSE-MsgGUID: hS9g0w8xRzKGyhjKBkHk2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="183207110"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="183207110"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AF789674F
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F6F620AC0
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C9C646B5DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6655C1A000B;
	Tue, 17 Dec 2024 17:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/17] monit: upgrade 5.34.2 -> 5.34.3
Date: Tue, 17 Dec 2024 17:01:30 +0800
Message-Id: <1734426096-18300-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--1.081500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwigo0DxI7WwdHOw
	/jufb+urEPhqtlmGkXd3aWU5jdY62Pc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQ32S
	61JcPB8eE97yr4g+GPoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzjUk9VyVeTDanv4
	jXTxk09x9d1JbFFc1x6GETjNXm3hj1u6qKH6xI4jR4cvzH5ohpdqVrf05V4Bwy3iZO0OCoZji7J
	Yq0iQlXiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114358

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed: If the ping statement did not explicitly specify an outgoing address
  but a previous ping statement did, the same address was shared by both
  statements.
- Fixed: Monit may crash upon stopping if the ping statement is used in
  conjunction with the address option.
- Fixed: If a directory is set in the 'allow' option of the 'set httpd'
  statement, instead of file or string, Monit hangs on start.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/monit/{monit_5.34.2.bb => monit_5.34.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.34.2.bb => monit_5.34.3.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.34.2.bb b/meta-oe/recipes-support/monit/monit_5.34.3.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.34.2.bb
rename to meta-oe/recipes-support/monit/monit_5.34.3.bb
index 5502a15b08..42ef8594f4 100644
--- a/meta-oe/recipes-support/monit/monit_5.34.2.bb
+++ b/meta-oe/recipes-support/monit/monit_5.34.3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "291ca3d898e9b425b6d0c1768728fecd6c1cf4c268c79db15fda26285ad5b832"
+SRC_URI[sha256sum] = "669d8b95ddec124d1444ba5264f67fdeae8e90e53b2929719f4750fc5ff3ba60"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.43.0


