Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCA4C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:15:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.116093.1698048900680255702
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116580604"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116580604"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:14:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29E81D6186
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:14:56 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65ACCD5040
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:14:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6541E8719A;
	Mon, 23 Oct 2023 17:14:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20230209 -> 1.3-20231002
Date: Mon, 23 Oct 2023 16:14:31 +0800
Message-Id: <1698048871-24240-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-5.868000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwN538HGe6I39gj
	E0ANqbLc/on3UY6JQwMSiA2QFkvY+ADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFcfRJq1ctTfwrT6V6InEuVweK93mzhKdFbnHuVHGMMIA5my
	w77qSuOLF9uGobEuT7gDLqnrRlXra/ZOFeDeXHgN0H8LFZNFG7hqz53n/yPnqeOpZ1ndL55S4/1
	ljsiVQIZwGSiz6jVmpHk/uDCURRr5kOezvUdbR23g7MzXMla0pUf7f2lxJiziuy9jCooGLd3+X/
	kRmOuyA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105632

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
+ add/use dlg_print_nowrap(), to handle multibyte character strings in
  progressbox and tailbox (report/testcase by Sergey Merzlikin).
+ updated configure script, e.g., for compiler-warning fixes.
+ update config.guess, config.sub
+ updated configure script, e.g., for compiler-warning fixes.
+ minor fixes for manpages to address mandoc warnings.
+ updated th.po from
        http://translationproject.org/latest/dialog/
+ update config.guess, config.sub

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20230209.bb => dialog_1.3-20231002.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20230209.bb => dialog_1.3-20231002.bb} (92%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20230209.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20231002.bb
similarity index 92%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20230209.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20231002.bb
index 444b97c4e6..8887700e8a 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20230209.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20231002.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "0c26282305264be2217f335f3798f48b1dce3cf12c5a076bf231cadf77a6d6a8"
+SRC_URI[sha256sum] = "315640ab0719225d5cbcab130585c05f0791fcf073072a5fe9479969aa2b833b"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.34.1


