Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBB5C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7601.1745900150871326977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LZgPT12v;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900151; x=1777436151;
  h=from:to:cc:subject:date:message-id;
  bh=o7kunxZp2CYbSpwwpIC2SHtoN2usOzZNYrfzkwdIOr0=;
  b=LZgPT12vuxUev/IvwBGGHly1LpwOxj2tfoXLqx0Kx/qsYKFjdMGw2ydO
   FB7fKWvWMw+7M1KklzB3Xhl1G6nUC7h4qBsJowXKG68gFrUzlO3QiThLB
   otEnyWC3jm6VUE1HOwE6amXhSF6+f/fVabli0UwWH2RgU2r1u5Tjci35p
   1tTGpdjPddnMdcFelq2sVEnG53OQ2w1GxTyrpjCockwj2XXekX5jzt738
   RFsOrMuLoq15VPyQVQ+ySlwCZuWvWbCN1fxUNgs8zQHfcNLJEs7uOHHzs
   gEHQ0xVgKuebXZu9FX+iyYkNMOxQzts7FEFzFa68dPhwsir30OFsixXtv
   w==;
X-CSE-ConnectionGUID: XLDXSRF4RYCdPFVoT4ZkkQ==
X-CSE-MsgGUID: qIfOngHFSQKG4as8NG9fFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="198356476"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="198356476"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:48 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B75DE445A
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1481ED3F16
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 70A171A0071;
	Tue, 29 Apr 2025 12:15:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/23] ctags: upgrade 6.1.20250420.0 -> 6.1.20250427.0
Date: Tue, 29 Apr 2025 12:15:16 +0800
Message-Id: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117206

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250420.0.bb => ctags_6.1.20250427.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250420.0.bb => ctags_6.1.20250427.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250420.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250427.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250420.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250427.0.bb
index 8e3ab85078..eb02faff56 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250420.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250427.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "bbd841c8c55dd96c9ff9fa6699aea31a9f9ada42"
+SRCREV = "987f20d4779e847ba9c744ce15cc3818db965869"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


