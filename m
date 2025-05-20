Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1381C54ED0
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.16486.1747731313345111636
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hx9+p7OG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731314; x=1779267314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0SE4rmwKNQUFiBVXigaB17Ea0tBHxw/O3XVLUfPbiDE=;
  b=Hx9+p7OGwc9K9Op8ipDp5cbyk/n9piDiz3mRJL5c9cvfeC1krTKRFUAM
   9SSdnbdgGSqERv1uJusVDOXbjySRvDPLRK5L3G2Z54W56rOwYd5Kodk20
   Ofp7khibfhTsXXWc4OqAO/FUl0WUknFB1jqkmBqm88rpU0L1UqtjCgivs
   hiR4N1QcWE7Q9vv8KGxdPnSTaTKE5IFgl0n+50txDDkxnlTf3YJmn0R2K
   lL2KLXU5mVLpz2SS4Y/uGkhMhtGa5/VNg9CBdc0lj/nNpV6BXRKV5AeIx
   lWyF5rz5hos9Dl5NIdfoIw713LjeG9P8WJFhCVweqroY5wTH4pETfVZpp
   A==;
X-CSE-ConnectionGUID: m6Ja/7qmQsGW44RjAnr+dg==
X-CSE-MsgGUID: 39QfMdW1T2mLBO2Trk1KtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="179533912"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="179533912"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E50BBD8034
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F5823A51D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 343C31A0078;
	Tue, 20 May 2025 16:55:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/27] ctags: upgrade 6.1.20250427.0 -> 6.1.20250518.0
Date: Tue, 20 May 2025 16:54:34 +0800
Message-Id: <1747731299-20448-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117484

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250427.0.bb => ctags_6.1.20250518.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250427.0.bb => ctags_6.1.20250518.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250427.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250518.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250427.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250518.0.bb
index eb02faff56..59392f57c6 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250427.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250518.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "987f20d4779e847ba9c744ce15cc3818db965869"
+SRCREV = "123588eed48448dee07b919c943f0fb4f69b809b"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


