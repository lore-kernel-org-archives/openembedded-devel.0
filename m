Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84A5C3ABAC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7602.1745900152042896936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dl1kiDzS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900153; x=1777436153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UgekrHbS/bRJgNCf492/OQsdXlS0Jgi9wj1fgY79L7Y=;
  b=Dl1kiDzS0zmQQvjoK+pvN62t1o1ixK+/DNIelvg8yaoax84nW2rrarxf
   Pqyc4T2mdqgEDwEUg6Mk8dgzB8z0SoN7N3U13e5+nozaUUo1mEjpgUt2K
   eS4SA+UAnrur2dN7ujBTYJ5YD35Xie6Z9KvGVJYirt+Rz2meT9uniVXos
   ygEIVF/YWHpCcRR3/YWb0tOBuoXTMW7RqvbMvXTjOpDqKhaI0G32OisH+
   stysz4/LLGpVi527spBhwuVRppbBox2Dljh+UZhEzq1BblI+8AxwGRdc+
   LWz89MxixHo365LDcxblY5Z41GhnE/wN1x1lZgz+Lt0gmtaupoohWbBpG
   g==;
X-CSE-ConnectionGUID: PC6856dNSMGveb//a4bHLQ==
X-CSE-MsgGUID: 7yL09qb1RFW/ye1Gfn2uFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="197987828"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="197987828"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:50 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DA563D4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 954DAD88A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2935D1A009A;
	Tue, 29 Apr 2025 12:15:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/23] libsimplelog: upgrade 1.0.4 -> 1.0.6
Date: Tue, 29 Apr 2025 12:15:21 +0800
Message-Id: <1745900138-26424-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117210

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libsimplelog_git.bb => libsimplelog_1.0.6.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-libsimplelog/libsimplelog/{libsimplelog_git.bb => libsimplelog_1.0.6.bb} (86%)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
similarity index 86%
rename from meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
rename to meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
index 461b960357..0aacbcd2cc 100644
--- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
@@ -5,10 +5,9 @@ HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
-SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
 
-PV = "1.0.4+git"
-SRCREV = "781f5eaa1713e7f60e9ee79ab5143c0bacfcccef"
+SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


