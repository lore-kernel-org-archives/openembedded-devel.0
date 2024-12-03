Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6504E6C5F2
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8205.1733185017914802578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pWTrQcF1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185029; x=1764721029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2BLFmNf9+YwsGaU+nGZE7a/rL3b9c/wnhAMDYAIsGHg=;
  b=pWTrQcF13FCjOtT9bmufOqXrNFFN2VFTSK45Knb7kb1piu+NB/ClzKc9
   lZQcGS4l+G/bSwOjAi4Z2k8C4ATOGxVzUvaX2HjoIEBonulX9fWbNhJtA
   JRmL47chPUCKUQDbZ3xKB8kjuQkC6eAijGnYwDuc4xbgm6zSQgqRkP1Qe
   fjN+tEIvS2sdcjU8kh7Bhhz4jz18ZKBhAtUJNv9yEe1Qu6c99xJd/wED7
   IiN2itS96zhM8XXJmNIZBuhm31b2NGge+YxKDz2Njjhz4ni8sqYxnkyXN
   f+gm7a0z5yehrMLYQlFUnW+USi43o6c8+qF1motu7ItDu0z5oRIi8YQXY
   g==;
X-CSE-ConnectionGUID: ITbzacXFQBK+e7C9vajG1A==
X-CSE-MsgGUID: N3MLomf4Qs+Jj9Pivj1HHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170725157"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170725157"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D216DC6A4
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6701ABF4AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E35A36CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 840F41A0003;
	Tue,  3 Dec 2024 08:17:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/34] tree: upgrade 2.1.3 -> 2.2.1
Date: Tue,  3 Dec 2024 08:16:39 +0800
Message-Id: <1733184999-27041-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--2.247100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sZhhkmdi0+GXuDhljfG03rOwpfLMeBwRv4qCLIu0mtINzONa1Rspx3Oxf
	QLcsk9qioK1i8LNN3fgbBgWAUWNZnlwV2iaAfSWcURSScn+QSXpjDMT0TyDk5+gtHj7OwNO19R4
	Ss0oUmJ3I4bvEBwjNl1UeR/hYQgM8n8Wv+PSPJZTGWKslvjuIWGWEYAC3p+NPAMWKGrgJMOTqo1
	koK4jWcFbbKiZ+QCMcT0QCsb//JxvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.1.3.bb => tree_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.1.3.bb => tree_2.2.1.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.1.3.bb b/meta-oe/recipes-support/tree/tree_2.2.1.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.1.3.bb
rename to meta-oe/recipes-support/tree/tree_2.2.1.bb
index 79e0d5e10b..df52d63fbb 100644
--- a/meta-oe/recipes-support/tree/tree_2.1.3.bb
+++ b/meta-oe/recipes-support/tree/tree_2.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
-SRC_URI[sha256sum] = "c24c9bfbbb3bd31a43b16898f74fd338cfcf348e914de81438ddfcf052076ff4"
+SRC_URI[sha256sum] = "68ac45dc78c0c311ada06200ffc3c285e74223ba208061f8d15ffac25e44b2ec"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.34.1


