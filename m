Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78586C54766
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.37569.1708333366690951204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TCr+TPZg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333367; x=1739869367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U64hHH0oJe3Mzg3ANa1JHFEn++CeeYA65qRK0rqGB64=;
  b=TCr+TPZgZ8Z2GUDd42Q7IOuYMZigUC3Vitka6vgd/IchGqx7y/+JW+E4
   Lzrh0z5AE2y3SfDo8oKXnGSoAOK10kOUeGg8pKB8p7aO6pQ2O9XVMpxj0
   NSdIaGzzGN/8sLafJovkw2OemK88quBDCbgPbqs+oqQ0o4ukybOsRz9M+
   H22mfhf7AUIiPlce4K/jtO4o9URPpg13V5LBIO8NHiUU9MSxybTNHCPNn
   4b9OhnRsQbcfGIu3qPQ69MQRoRZ+5wRPaIylxPz5WvrcehT4utw1BgfK6
   cm5tEW2mrLDqvNhX57J4dfcADACISPC1fMCI6ZOEtU/8fQbw85K8YRWgK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149750372"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149750372"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC94E4A5DA
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2855DD3FF6
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B81951E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63A8E1A006B;
	Mon, 19 Feb 2024 17:02:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/23] ostree: upgrade 2024.1 -> 2024.3
Date: Mon, 19 Feb 2024 17:02:16 +0800
Message-Id: <1708333346-17704-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--5.640500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrn5nfR7I2dFP+Aw16GgqpOxRc
	qLOELivDq+flgBHHTd51YH+ohjwCAHzl0x7mtvufqhcdnP91eXEAtH/ey8zRp5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3jpxdo/JwVm/ioIsi7Sa0gdcdCrrMF5JTOb4
	onyN9S3euM95u3uSRseTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJBYXx
	c/U86mgtqTeXaLBUlcFlf8C5axij6ltXXuPINpCftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108859

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-prepare-root: Unify root.transient with composefs
-libostree: write selinux xattr when on non-selinux systems
-ostree.repo-config(5): Fix a typo
-Expose MOUNT_ATTR_IDMAP detection result to C code
-docs/atomic-rollbacks: Add a section on rollbacks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2024.1.bb => ostree_2024.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.1.bb => ostree_2024.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.1.bb b/meta-oe/recipes-extended/ostree/ostree_2024.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.1.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.3.bb
index d4ad765c0..07dedc8b8 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.1.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.3.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "152327fe804512d4f896fb9b9e9cdc84ad9b4c0b205b8625472147d5a28164af"
+SRC_URI[sha256sum] = "5e0daaaa70772bfa00bd3d0c25d11f7c1f6d41a996708fad8bf9941f0a36bc8d"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


