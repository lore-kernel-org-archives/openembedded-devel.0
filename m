Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FFDC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.37567.1708333360522936497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kfdcfbR7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333362; x=1739869362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B39Eo1s2WTD0NAfRhizPCKUG7LUGMRPc2/lOMJxE4Us=;
  b=kfdcfbR7QEcMWG85K12YX6nwI3WKVXTo0COEgdwQrfTefkwO+5ZrTIeK
   yW3QONb7OGm7C4gei2LjfKyM7sbVwW0xSQU01JGjpWmFSIC+1Jml19bu+
   PB5KJgzTmmtUnREqy2tSTj4u+Ibhbe1Gk5HchKHnfF6KhJgnoD/M8o7EV
   l5UpbxT3D/ianOrXwLAkwSj3BAMPaKooiv/Bm7t7BBBkTPnuOu3iwfdks
   SnoXlGqPADDRN3vdiqhLMDDcNhtiXOr0H3c06N659Ib7WDNtFo8tQjxpI
   SLNzdU2KsoWaxYZvhghiuUj+va1PafnHHsxanKZlaXi2Le/FqInZyQ5gY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129068886"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129068886"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B85BE4DA5D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E72A6D3FF7
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8216920099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31CBE1A006B;
	Mon, 19 Feb 2024 17:02:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/23] isomd5sum: upgrade 1.2.3 -> 1.2.4
Date: Mon, 19 Feb 2024 17:02:10 +0800
Message-Id: <1708333346-17704-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--2.618800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxs1Ir4NZzFmgla
	FzN4biirzjZas1OTfE2gGOZ3m2LY5+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4Diu9xE0vJpX5y5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbQUYXVhUcNUqNLEflwLrGWB81suir1ALe6bC0eILnfe1pmGoqSYm9A1qo9mJhgdYkGLEh
	2gpvdBBN5ALVgU/xEkeSs8TZYVRUvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108850

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add support for riscv64
-workflows: Update to use actions/checkout
-Fix checksum failure with small isos
-test: Update testing to include small iso and larger iso
-Add a GitHub Action to run tests
-Add mips64
-testpyisomd5sum.py: Support genisoimage, Python 2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../isomd5sum/{isomd5sum_1.2.3.bb => isomd5sum_1.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/isomd5sum/{isomd5sum_1.2.3.bb => isomd5sum_1.2.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
rename to meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
index 4f8ea64a2..0c981ebf5 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
@@ -31,6 +31,6 @@ RPROVIDES:${BPN}-dbg += "${PYTHON_PN}-${BPN}-dbg"
 
 FILES:${PYTHON_PN}-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
 
-SRCREV = "7860901f726f5d92689cb67243cc7f981f21f74b"
+SRCREV = "3f4c9bd3f21ec9ac75a025dfa3fa30fe3f621831"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


