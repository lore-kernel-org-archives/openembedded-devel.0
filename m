Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F53C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.14613.1744794152284666272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qL44K00E;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794152; x=1776330152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FcEGBmLRyVsDEyEzh1uMvhKlycEdLuR/UxhYzGNitOc=;
  b=qL44K00EQ7UZFWokCEhbkuhIRwVuB5oOApMw2x1jUad0TeiPISKRIwQj
   8qeOf9m5d9G+1zotwYyin/Nsj0cgSMnfn1MZe1UOgXK2ImFl1IwR6nAJH
   Rgupfp9TF5hrFmCKH8pGLBdHDwxm4jKhXmtoMTO3qTKf9HbQG6dqKaZh1
   sD8+nbd2H6WEGb77W7Bx+s1oWOVmg9r8vJ91Ilhe1LRBm3YyyXRjOhakw
   pDCLZ8aARd+c4yu+/74nxSv/sRWSAEj/G7CuNWIi+0dPSbMwlMBp8tngJ
   /N5oEKToRmr3wQE9+XjDslgSNPBWd6aWQvksmf+ym1/t33sSKW70ddw9k
   w==;
X-CSE-ConnectionGUID: 8BTX9O0CSBeyRk4p4iEilQ==
X-CSE-MsgGUID: 2yRWjT8HQdOSHXOk62Bg1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196966143"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196966143"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2639D112E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8291D6FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 702651A009B;
	Wed, 16 Apr 2025 17:02:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 11/31] nbdkit: upgrade 1.40.4 -> 1.40.5
Date: Wed, 16 Apr 2025 17:01:56 +0800
Message-Id: <1744794136-908-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116879

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.40.4.bb => nbdkit_1.40.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.40.4.bb => nbdkit_1.40.5.bb} (93%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.40.4.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.40.5.bb
similarity index 93%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.40.4.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.40.5.bb
index 0d24e96a5d..5d80d1e091 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.40.4.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.40.5.bb
@@ -9,9 +9,9 @@ HOMEPAGE = "https://gitlab.com/nbdkit/nbdkit"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
-SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=stable-1.40 \
+SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=stable-1.40;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
-SRCREV = "0d111a31d9dbc473b9eb901fefe07f0ad392c75a"
+SRCREV = "900a0d2bea4b027d71cf213f385711a2bab33eef"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


