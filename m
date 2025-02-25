Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74171C282E5
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2202.1740525898028914135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R1e1voC4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=v1YgtfsZH7N/POyIAxc/fTnFZ8mml0YK0eIyGa3pYLc=;
  b=R1e1voC4KPULdBkvz0n+ajSntxO2sfGV8mzjA2onJCave4QtMUbffbP+
   J5h7p4ZgZNm8K100jiE7xyfbPKWXF7sJj6srhIseCOxDHTe5K+AlJlLOy
   sfQM8o3SbsVq7YqKqBh5u8UVYMFjZFeE+qz9GX0uRNeSzLzrtwR8p503J
   ojj8wpj+YrEjKLn38IYqfgEQsSSV37TEJBLTJsIntsEFn8aUHYD1ICZIN
   HFFfeqggW1k1v0PoXHs7vQD0Ia37IbHPabPHB3oBqFDSppqW/WRaXGJSt
   L++03Yzp4AXMHzGMMBru/g2+hKSxm7PZQxoSNt3H2i6EJ7GWP7fRc1sFI
   Q==;
X-CSE-ConnectionGUID: +j5xO6F2RMaoEtgXVbS70A==
X-CSE-MsgGUID: VXuwKd42RIiphxsVCLREDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191180224"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191180224"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20A21C2260
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C6BBEBDC81
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B6241A006C;
	Wed, 26 Feb 2025 07:24:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/51] iniparser: upgrade 4.2.5 -> 4.2.6
Date: Wed, 26 Feb 2025 07:24:00 +0800
Message-Id: <1740525881-21103-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115605

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix heap overflow in 'iniparser_dumpsection_ini()'
- Add test to reproduce heap overflow in 'iniparser_dumpsection_ini()'
- Clean-up
- Ingore temporary vim files
- Symlink compile_commmands.json to make YouCompleteMe in vim work
- Fix typo
- Fix links to FAQ sites in doxygen generated documentation
- Escape names to prevent doxygen trying to interpret them as command
- Enable command line arguments for tests
- Fix packaging status description
- Add packaging status badge to give users and me an overview
- Convert @-value that slipped through

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iniparser/{iniparser_4.2.5.bb => iniparser_4.2.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/iniparser/{iniparser_4.2.5.bb => iniparser_4.2.6.bb} (91%)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.5.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
similarity index 91%
rename from meta-oe/recipes-support/iniparser/iniparser_4.2.5.bb
rename to meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
index dd2c97ed04..aaabfaa085 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.5.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/iniparser/iniparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 SRCBRANCH = "main"
-SRCREV = "19e0ad6c37440ba52313e10c6e148dfb9ab417f6"
+SRCREV = "4bef811283e0ec1658c60e09950bd5a1ddc92e4b"
 
 SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
 S = "${WORKDIR}/git"
-- 
2.43.0


