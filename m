Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560ACC071FD
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2747.1713318081378285055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xy7qrVo2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318081; x=1744854081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AugK9kqfqRJaDkpcgcHp1bAjngU1y5ElZ32Bxb+PhSE=;
  b=Xy7qrVo2tKZJCTGXUPz9BY7rrA2qtpsSQHMDYdCWM34Iz7O+igIcjQeK
   UGW0JcGVkzHyaqvkAMT4Ub43mfpzTH/yg+QPdfBkIDS6NY3zBbxc4i9c8
   npF66iN8sQwYkpKZTGvMWOMXjYdcLrDCPt8GzyZ1YflFoQpdT99ylb1b4
   M6VIdkJkSZBD3T2Gw1pMJbWBE2fLBbvNU2RxKmIMPrpwvAfAN4Js43z8C
   ZtN1PV7l6UGPUQw3Z3fD57OP7oXyLDIfAH12xIkf3xziR3NgbrUSA9CmH
   hysWd53ZxNdfQFg+uJ0ifjPFdIka/j9ojz4D5C6gh2trZsRGpxOrZa0Q+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155233180"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155233180"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C53C5EB337
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 024D01531E0
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EF636B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 395F51A0002;
	Wed, 17 Apr 2024 09:41:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 03/49] bindfs: upgrade 1.17.6 -> 1.17.7
Date: Wed, 17 Apr 2024 09:40:15 +0800
Message-Id: <1713318061-17128-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-6.143800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgOkJQR4QWbsHTv
	92h/oRdltQTfQKYWqkHU0dvNBvLe+/c2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQ32S
	61JcPB8fegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO0o13
	+LnQSKDIm+JtbAQp4ft0tSMs2TtEbku29eWFJNZktTLf8o96IVXWstB0H0Wp82lKSQwmyBxRmMA
	Sf2JtssrFHmHZiso+gf1/3a9+0pZA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Enabled -Wextra and fixed many compiler warnings
-(MacOS) Added './configure' option '--disable-macos-fs-link'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/binfs/{bindfs_1.17.6.bb => bindfs_1.17.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.17.6.bb => bindfs_1.17.7.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.6.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.17.7.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.17.6.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.17.7.bb
index 673198e2d..788c85b7c 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.6.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.17.7.bb
@@ -8,7 +8,7 @@ DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master"
-SRCREV = "b982aee1161307cdd0e90f7f9597b11872440efc"
+SRCREV = "3f5e3cb1fcac5fb8034fa4712764317fab51ebe0"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


