Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CBDC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.47776.1743412319621125398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DgNneJbw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412319; x=1774948319;
  h=from:to:cc:subject:date:message-id;
  bh=eKCCiy9vp3L5KsJaagOlW5c69suk0V70X1hZ2XudA7M=;
  b=DgNneJbwMBfgiK4KUnm73lugmckHxZzRAntFkYE4xX2EXa1KoByuquXa
   tk21ajogKuYdjAB41ZQcG/q4mKUNxn/KVizdyTIghuyJGcINXBPxOJMZ4
   8fMTO+YNHpWdi8q7hZwxnSxbb8GNgyLkm+QOFdgbtGA2U8u7yHLu8KAeb
   P4KTwO15pMckhR5JhU2lS8trl6dsTz80dLi5t463e854OgUGgNotBJry4
   OGtesKFJQLMAFe6GjTVEc//A+OEbu9GdjG2PQ20E7MJnPZoTSX1va8s29
   sc+FkBqxeJzvz/X1CIUVZtUhi8MV0FS+Ss9hAZWKh5Fk/yJh8NZ6F/3yS
   g==;
X-CSE-ConnectionGUID: ohwZYnEsRO2fLMWKtD0G5w==
X-CSE-MsgGUID: 5jDXZVgKRGyowlG0RsGmRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="182316066"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="182316066"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FAA4D4C36
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F2EBAD7494
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 60A001A0078;
	Mon, 31 Mar 2025 17:11:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/26] ctags: upgrade 6.1.20250316.0 -> 6.1.20250330.0
Date: Mon, 31 Mar 2025 17:11:20 +0800
Message-Id: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116396

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250316.0.bb => ctags_6.1.20250330.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250316.0.bb => ctags_6.1.20250330.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250316.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250330.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250316.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250330.0.bb
index 744d4dfe80..dba1dddcd9 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250316.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250330.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "3ee9ce5e3f6c7f58133af61f2490bbdb1afd93b7"
+SRCREV = "ac54c7206d2d7a12f7642e204c679d0009edca15"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


