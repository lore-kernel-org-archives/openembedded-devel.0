Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0888C54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16488.1747731315687047643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A915mFkZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731323; x=1779267323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C44DbyK8qSh4SepOlm95baCRBU8GSAiCNmZ11R+BOqE=;
  b=A915mFkZ7PZZOmLcStShWBJb85hFMtat41HKSa1TMIXwYiHOW2hus4/8
   psPcBhtlS/71/PJFd/lg96WlR3wAEEka0nQRC25Qnhyiryi2hLJvC0G5n
   x/NhGctVsnfauUhrRsL6AGFobslMkvZwr3DJguQcmbwbD+3RCrrqAqBQZ
   56DvdHMvvOGtRfnbh92Laps1xaLIvkN3Ba+Az79kYIKdDBPy3twasNwmY
   Ye07+9XQtzr9xa+9o95Y1weWEiEKw3vojbDbo3gyxAYt/czLkgrw/2oGO
   GWpheUNDSo5mlrpvumJkX1g5zTxpukijj9780fO6UTnOvH0tN6owNEGJ3
   A==;
X-CSE-ConnectionGUID: Mt1kTic/RVK+LfvA1zQoZA==
X-CSE-MsgGUID: kpWVy3eCSwuOBy1BmtRM7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200435255"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200435255"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D247AE8FE6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 91B98BF4B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 24A921A0078;
	Tue, 20 May 2025 16:55:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 27/27] yyjson: upgrade 0.10.0 -> 0.11.1
Date: Tue, 20 May 2025 16:54:59 +0800
Message-Id: <1747731299-20448-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117508

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../yyjson/{yyjson_0.10.0.bb => yyjson_0.11.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/yyjson/{yyjson_0.10.0.bb => yyjson_0.11.1.bb} (94%)

diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.10.0.bb b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
similarity index 94%
rename from meta-oe/recipes-support/yyjson/yyjson_0.10.0.bb
rename to meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
index a13d73b452..57966980e0 100644
--- a/meta-oe/recipes-support/yyjson/yyjson_0.10.0.bb
+++ b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/ibireme/yyjson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8ae1b99922935413d4c596f50b59545"
 
-SRC_URI = "git://github.com/ibireme/yyjson.git;protocol=https;branch=master"
-SRCREV = "9ddba001a4ea88e93b46932e5c5b87b222e19a5f"
+SRC_URI = "git://github.com/ibireme/yyjson.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "9e24d6bcead647231f81173cc5c6bb6c097c00e4"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


