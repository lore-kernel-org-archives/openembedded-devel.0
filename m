Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9048C54EE3
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.16492.1747731319889207196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zxc7HLW7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731320; x=1779267320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QofqUf2iISivuDBthMCc8pJ8Bfph9vgpnxghaXXKxSc=;
  b=Zxc7HLW7vuHaKJKDBoTPTlj8DLsGxOPagXJ6NgFaa3q7rcWK9gDI0jxb
   1XWIuXQzOG50L07/qPwMdmzIp/ZzArhiN7peLuexc48bawnmiPNxtC1uv
   tHA9KCQ8BIWp+dakjEl+mNn53j9w6fh9dVcjjOU7W0etk2uy2MZU4zwvU
   Fl9W4kuqxGc1dyuSYf+t5QXCJOsWtGIgP7qt6XT9qaR2WVetWCHnOaalv
   PxWqrjHGh0c/ejhJ9fKL827Rk7IhvNu5459ICkfjRJw9zmVljk2aq9Fz/
   6UHJ+CEeNtU7QDhPC1J3wDsHGQ3BHqDKjJELxcJ5YpQbdBWBGI9jZxzRE
   Q==;
X-CSE-ConnectionGUID: 56zDa/nKTkiEcwpOUhuctg==
X-CSE-MsgGUID: 9zPlE0pARMiTp1NWI2XB5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200017533"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200017533"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 13FBBD5053
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C8556CFA28
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B4571A009A;
	Tue, 20 May 2025 16:55:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/27] libxmp: upgrade 4.6.2 -> 4.6.3
Date: Tue, 20 May 2025 16:54:44 +0800
Message-Id: <1747731299-20448-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117495

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmp/{libxmp_4.6.2.bb => libxmp_4.6.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.6.2.bb => libxmp_4.6.3.bb} (78%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
similarity index 78%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
index e4cc5c93b9..b8d916e70a 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1
 
 inherit cmake pkgconfig
 
-SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master"
-SRCREV = "828ef357943e1fbb13910e7a6fca21987c5c5827"
+SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
+SRCREV = "bed660f8e530d399c38f27a5a7732f4e79740585"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


