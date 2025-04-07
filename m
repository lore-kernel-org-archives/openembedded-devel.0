Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B514C3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.42477.1744017446472197366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QSV2rdnw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017447; x=1775553447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TtAmk6iGhs0DV1k27MDhglQ5250K62V9E870sDSuETU=;
  b=QSV2rdnw96AikY44HKbs5cfBjU7zVi+7rQsiL7iuhqbgA0QA98srJnhj
   TgfCUtLE85gMz+g23ziquCQFIFqSHbcmEkG8ujF0FRsXOXB/3SxS0u/Af
   o+f+zykJfROunyXm+0fNH5Nu+tq9DysffiZabRc71rYlAzGPZFbiDY2c1
   4gAscOwbKia8Xfpl8Ic0C03P6p6fbDipZSp8eUHYB1TBNF8+qKxbLwAUr
   biHtnlnWYkcoPTpdx+Mwn/ZbYfvf8KwF368+sAGwrqSg14tVqczv3T67k
   Oa7ZpHvHGEZWH2PlVC7TvuTQQhOPBLMD9kaZdKVfnvdnrgk6FQZGdN+6S
   A==;
X-CSE-ConnectionGUID: 1AqbT7F+QuKhUtZZjHA0qQ==
X-CSE-MsgGUID: +W4qgDUCSwq+fyPFMIYYRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="198434350"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="198434350"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:24 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0AF1D501A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67704143DD
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E389C1A0071;
	Mon,  7 Apr 2025 17:17:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/30] libsdl3: upgrade 3.2.8 -> 3.2.10
Date: Mon,  7 Apr 2025 17:16:46 +0800
Message-Id: <1744017431-22217-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116630

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.8.bb => libsdl3_3.2.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.8.bb => libsdl3_3.2.10.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
index 86a0ae6b50..25ef8ae70d 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942ba926e378e00db03"
+SRC_URI[sha256sum] = "f87be7b4dec66db4098e9c167b2aa34e2ca10aeb5443bdde95ae03185ed513e0"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


