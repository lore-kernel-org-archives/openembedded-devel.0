Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87FFC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.77946.1749526420435893183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OTup0oAz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526420; x=1781062420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1sNXq/EtIsSuAxnb7FUT6QnLheurUXdq8R0VpelsrAo=;
  b=OTup0oAzow2wJmnqSVKRKPtjvxHb6oKYoEH02moHH8VGBgOixoC67KrR
   hQMPy9mrs4aPJdvuXLmhpN+FfyNV1AAsBIlAw4dVghPXDXlRd3MmTddOo
   LGTkceJkawVc8E4PdLXg9aMY7d/o3ddZikN0UXUDSb5h6iwv/mkrflyXn
   giIsc2pUyxP0Jw0g1jFtKWiEBze1vsUJcfpQf0s5zwLs8MhkCI0C//dRQ
   9jdgYsJJhfQrT4h6LGGhXlgjhiKR9qTYF+TX2s2JDH8F90a6hbsijmLB/
   26IaU5NsoxUiJMgmb6hX8O340bvXBSYvmC1n6x13tl38rkU1m2L+G6xHP
   w==;
X-CSE-ConnectionGUID: u+mNEmlSQ2muzX58TUV8fw==
X-CSE-MsgGUID: Ia4B5RokTQSZRZSY8fMoSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680444"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680444"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F066ED5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96ACFD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:35 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C194B1A0071;
	Tue, 10 Jun 2025 11:33:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/64] ctags: upgrade 6.1.20250518.0 -> 6.2.20250608.0
Date: Tue, 10 Jun 2025 11:32:29 +0800
Message-ID: <20250610033330.924-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117795

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250518.0.bb => ctags_6.2.20250608.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250518.0.bb => ctags_6.2.20250608.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250518.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250518.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
index 59392f57c6..6f0fbff0b2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250518.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "123588eed48448dee07b919c943f0fb4f69b809b"
+SRCREV = "c06d333b3162660694b26604a364cdab89e2010e"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


