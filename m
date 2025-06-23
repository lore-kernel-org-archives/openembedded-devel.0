Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68943C83010
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13874.1750662712468065205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r79iOalg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662712; x=1782198712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s9T+QX3u49aUdTvee3WgRXuQHVUUCNckh3bXsvGvMNE=;
  b=r79iOalgzfTrwO5tStc7Z+lWzGn+GcC161MnYsnQill21uu3l4Zc7P1R
   e6QRtaXuTFbg79CKUl7qBQGbF9kPzc2D9RGl9LMfD+EGLg/KF8cQFYgrY
   ZX2nNqqUZ2E0Lhr1Q3vb9InKz+lJC0x96pc5T8etHKNGCbFCb63/Ez9Zr
   +PdHCRR95OeVSixHOIYd0u+fxExPw8R55OtEElKpfWCa0uZN3YymGTSzf
   3SAMlACtIAtJh0cGRVeOeVy7uQyteo6l8IX2cQBtjuYQrLdrxQqE23kRH
   hF4nznYlBGBSI6R92zTt86q545/XcoqytpzdbZz3pRTcsV7Aexj9qV7Mn
   A==;
X-CSE-ConnectionGUID: 5j34hy5QQgafSeQQvbOEGA==
X-CSE-MsgGUID: Yw28G540Tem47533LIpuIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="192069975"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="192069975"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:50 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C10A7D5004
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78064D5049
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E79021A0071;
	Mon, 23 Jun 2025 15:11:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/30] ctags: upgrade 6.2.20250608.0 -> 6.2.20250615.0
Date: Mon, 23 Jun 2025 15:11:11 +0800
Message-ID: <20250623071138.402-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118034

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250608.0.bb => ctags_6.2.20250615.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250608.0.bb => ctags_6.2.20250615.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250615.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250615.0.bb
index 845a78da76..c794278f57 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250615.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c06d333b3162660694b26604a364cdab89e2010e"
+SRCREV = "0644fb80a8250cc3ca6ba00037e490768fe4492e"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


