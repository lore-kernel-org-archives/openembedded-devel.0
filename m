Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04495C0218B
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.32641.1737360859637469269
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wr6J1VEo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360859; x=1768896859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ElfsqFCc75YMzk1L0B00cVY9Axkq9QTyr10PdV4dAzw=;
  b=Wr6J1VEojS+uk3ZJMDOD7Nxwg+A7+yAiS63ZrvkX7kIRkZxhvrTsFduk
   Jzr/WLs88NLGjGBHQl2fBz7LjO5jsbrzQm5H6vQ+Y3KHm6Irqxfsqq2pS
   Grkvf/wtwH5hc/hGWP2pYxYtLAr+F4oe6vayUY/qClGrNCXJKYS/+z3pz
   oFsvVZNT6R7wK8a2I31iiryrHQ8HeM/YF256fDcEvRNWXGMeb5DzF7DsG
   k5EQ9beCDQz58Kgc2pPDuP4l67dpI/m/PJxT9FnbZjEp7hcZYAYM8DRaY
   l15fxVvxn590Vg8xrWXEkUuJrMDOduVPrsWOmaQzW89ry+JdwixKngB3h
   A==;
X-CSE-ConnectionGUID: awhWDA7kSP+M0ijp1+GBrw==
X-CSE-MsgGUID: IMoNgdbHQrGwOfDrqSfQBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175108128"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175108128"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C4D9AD4808
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C7C4D748C
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3779920071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D9A531A0071;
	Mon, 20 Jan 2025 16:14:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/32] opensc: upgrade 0.26.0 -> 0.26.1
Date: Mon, 20 Jan 2025 16:13:46 +0800
Message-Id: <1737360846-4824-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--0.231400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrNkknTRICN7CBbPMYY6/ZwHEJ
	+wIsVb1cricPOsQXkQ2jpZ7xyE6QIT13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFJUz0P602LFdoMLOoNHsM9qzghBiD4bcIxhd4pAveWGyjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcpO1U4tlwyfcxgSTIwCKZUYLxYp2mRw568jrS
	vDzfIbXb7ARVA6v4mLGPuHFncXGjkmriRxZUJ+6wTBoliCnwiiNDRCyJqkDfv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114974

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
## General improvements
* Align allocations of sc_mem_secure_alloc
* Fix -O3 gcc optimization failure on amd64 and ppc64el

## pkcs11-spy
* Avoid crash while spying C_GetInterface()

## TCOS
* Fix reading certificate

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opensc/{opensc_0.26.0.bb => opensc_0.26.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.26.0.bb => opensc_0.26.1.bb} (92%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.0.bb b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
similarity index 92%
rename from meta-oe/recipes-support/opensc/opensc_0.26.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.26.1.bb
index bd44e24aeb..9c9dfd5f45 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
@@ -11,8 +11,8 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 DEPENDS = "openssl"
 
-SRCREV = "fe857cc4c68da4873071f168c9aaf9860040ff4e"
-SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https"
+SRCREV = "043343d2df7b09d1938bc3dc313d86a96be457cc"
+SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https"
 
 CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
 
-- 
2.43.0


