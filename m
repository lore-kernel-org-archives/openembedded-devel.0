Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84E3C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.14429.1744794159555978773
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jXsTyrlz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794160; x=1776330160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O5dOKnAiWD7tscosc+NSWmtUloGRGx0eETrwHNnfhSc=;
  b=jXsTyrlzXXas+dHo/Lic8uZrtUdaThL7BniKMj1EpLcFTU5bBUV2KNLj
   0aEWPPZL+qAM9l0m/rAtWiDNUJZkVEQxXpEbEcP+DG+fvL1I4HOPly/Bc
   8TbZaPUPsDizor3XE6yPitGNx+Dw05jgiTMgOIsM5CRinKZWYZrVpitDo
   L5XrifGEXwnkrYjsi+rFZkz5uPeg2fa5AfuFVoDfpEPesdaUyc5GjWJvd
   JvaF6xEfVgxFxlWZ7mjntkirB9swspRbYiRUL2zMNMS27lZAsj73hqmCb
   H4t+n0Qlazy7ld3YrdkKkjYuJ2en0gLn86Kj0nKYAtEI8HI9MOc0pep5D
   g==;
X-CSE-ConnectionGUID: 8npBPbhsRjqYybLqtXptVQ==
X-CSE-MsgGUID: KJQ0De1yRKS2N7v8d4d5HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196625258"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196625258"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D14CCD4C33
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D2D8D8B97
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2528E1A009B;
	Wed, 16 Apr 2025 17:02:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 02/31] bindfs: upgrade 1.17.7 -> 1.18.0
Date: Wed, 16 Apr 2025 17:01:47 +0800
Message-Id: <1744794136-908-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116896

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../binfs/{bindfs_1.17.7.bb => bindfs_1.18.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.17.7.bb => bindfs_1.18.0.bb} (87%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.7.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
similarity index 87%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.17.7.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
index 788c85b7ce..040cbc95bb 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.7.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
-SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master"
-SRCREV = "3f5e3cb1fcac5fb8034fa4712764317fab51ebe0"
+SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
+SRCREV = "a276dbe66faaf7af02d967a648f7598589bf5c5b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


