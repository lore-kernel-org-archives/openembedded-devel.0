Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE85C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2892.1722934025757537388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OVCUrV/h;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934025; x=1754470025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5ioWbrD3PZT50Mqi7WBkhocZZwRJue9YkbRf+nW1lS8=;
  b=OVCUrV/h9zkwPieYtvAdLgUqiKbDo/vvObK7vxUiMOvzO6hvBbx2QF7g
   pVydw29n9XO8KYq+wlLamXtpXcU8IVggUxg0zMnDSSmKX29P0Ua25KarI
   c1ZmaxcfbLsw0+xaUjVMj9GH6nG8lzMMYxr24kaY3IKuHyyW4ZA6PLVod
   KQKirVpFUFO48QyvG1xGPqKFSyXKxg5esz/gzaP2bKp1B3JL/LwJ95Leq
   46yQLfh6jYY3AklAQL2haImaLwu863aICAq5VtMHYGpGBW9xyhLuXAfey
   UfnrMeMHH2cNZSQgpuV8IBZcqgyQhF19t70aaSqI2C+pgXARn5kWqRUPi
   w==;
X-CSE-ConnectionGUID: Fp+C0AYKRUqjbmCKnpL65g==
X-CSE-MsgGUID: dcsbIf/LTGe4Oe0a0Hqe2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="170035577"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="170035577"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92197D424D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA86DD753B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FEA920076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E86B1A000D;
	Tue,  6 Aug 2024 16:47:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/60] python3-sqlparse: upgrade 0.5.0 -> 0.5.1
Date: Tue,  6 Aug 2024 16:46:23 +0800
Message-Id: <1722933994-32549-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--1.986400-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLZl4AtR+Rw/oRiOzyn0C74ngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDV7Gj3C4OfqJkM68p1Iv4mLVhOIC/HW6cKT8/atmwqZEn/lSDVyZM4OiBDMWgKL6EqKo9
	hH4zwAzmHC+TubN895eiQ/lx/wZmwN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111569

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sqlparse_0.5.0.bb => python3-sqlparse_0.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.0.bb => python3-sqlparse_0.5.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.0.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
index e10c97d77..62de2327c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
@@ -8,7 +8,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "714d0a4932c059d16189f58ef5411ec2287a4360f17cdd0edd2d09d4c5087c93"
+SRC_URI[sha256sum] = "bb6b4df465655ef332548e24f08e205afc81b9ab86cb1c45657a7ff173a3a00e"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.34.1


