Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ABAC282D3
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2200.1740525896906935447
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sX7iHmM1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525897; x=1772061897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=F7UKxYyXSrTsBDaJpU/5LC3RpbNtMPOjBLg2/epA/q4=;
  b=sX7iHmM1hGUQ//R11sBDvLERsjFsmr8ocaE2i2P0f2flEAJh+ogaXUmj
   eYgnHZun40Dv6U45Y+u+L24OuhqTdbQug6qGfBiKqxSZBc3C8mtjbj16R
   OHJf9j+D/uFEkd2ronQgbwQC/UKR8D+2d302J2pmhxmdYd1a/G6H/1MyH
   b1TcBYpNutNhKlluBuhR0kxZXNROKHLvqliyNwZuhdb9OK86UFRdKYq8x
   iy/uOBziHub8g+KFrq4LRyGss+TrO8+R5d1yTUR1dlxNH9n32SdaRXnDT
   G+0EX25tuv0HdPDgFKnGrQCn7ephWmHtg4oCXYVS+YoaWND1fyBh0ppyt
   Q==;
X-CSE-ConnectionGUID: ckk5MTmvQMuC+PZe0S4JXg==
X-CSE-MsgGUID: ZiyCYFmdQZ+HN61fxvfDEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191180221"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191180221"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 70D9DD6EA1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 388A1D50A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD96A1A000B;
	Wed, 26 Feb 2025 07:24:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/51] ctags: upgrade 6.1.20250202.0 -> 6.1.20250223.0
Date: Wed, 26 Feb 2025 07:23:53 +0800
Message-Id: <1740525881-21103-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115601

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250202.0.bb => ctags_6.1.20250223.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250202.0.bb => ctags_6.1.20250223.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250202.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250223.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250202.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250223.0.bb
index 16047591b7..697ed4d6cf 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250202.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250223.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "ba8960c3b26ca92f710d9dbbf45802cdd2a3fbd9"
+SRCREV = "e7db33bb545bf69c83a0501e3cd2f6b558edf7c5"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


