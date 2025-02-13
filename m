Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547A0C021A8
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:56:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5547.1739429793381383377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IqO7UH8H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739429794; x=1770965794;
  h=from:to:cc:subject:date:message-id;
  bh=XfXQpVTuqLXFfnpSbex1HeTEWD6TMkmg7lkP6ODt9kA=;
  b=IqO7UH8H4I2sjnAD+I8zIGxEaBEBze9Z6vlj0gbf/FOY93b/pYcKx+Ga
   bXwdep73Bzdj+nBgQ4sp75yd6Ck/qfDxaIkdazgPm6Kt71UyMkg24UkG6
   PCPqRwtd1ZbEkX1rpI/Lps2eHYx2pFwEC6uD+j02MLKBUAMGj3v7wBuFr
   tVRi33+TSYpugItcRJ5vemkmBTZSabhnspzizlVpIPiDDZf7WO0Gw7e2v
   3mLL3REh9w+ejoRLJkWaEKheUtNU/dzQg7ls7AqshmMebzNOzftzTR0sI
   ZxiVuo0a+u7k0V6ghC38EYeZ/JAKdgXrMegAEk9ojhK0ZP/HI1kUhujdx
   w==;
X-CSE-ConnectionGUID: bSaqPYZLRw+Wa4588C3FbQ==
X-CSE-MsgGUID: usemmi9sTTmSH2JhJ0fhng==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="188962904"
X-IronPort-AV: E=Sophos;i="6.13,282,1732546800"; 
   d="scan'208";a="188962904"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 15:56:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E8D9DBB81
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 15:56:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D3A58BDB60
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 15:56:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 563D31A000B;
	Thu, 13 Feb 2025 14:56:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] rp-pppoe: update SRC_URI
Date: Thu, 13 Feb 2025 14:56:23 +0800
Message-Id: <1739429785-11694-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 06:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115451

From: Wang Mingyu <wangmy@fujitsu.com>

Upstream repository url changed.

Fixes unsuccessful fetch warning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index c8e1767114..42e9c4260f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 
-SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/OLD/rp-pppoe-${PV}.tar.gz \
+SRC_URI = "https://downloads.uls.co.za/rp-pppoe/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
            file://update-config.patch \
-- 
2.43.0


