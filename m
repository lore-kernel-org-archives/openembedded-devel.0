Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95893C19F2E
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2206.1740525900980157654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hb7z6koZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525901; x=1772061901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=enbR6vcaTDPMY1YHW98+v4GDX9mY4vbjkRZ77uzU/QA=;
  b=hb7z6koZqLCVtAHYm3Qf9J0zpajrKRF5gXaCJ+XLyTl1RUxy0lKGxAhX
   sMTul8q+mKBHmMdWEJNgUvrYiLVooV4tNOV63nMcmbQawVYdfl+DNcZrP
   2um0s4yVy3OZoNDtPjahfXpmkh8naIRTwBuaDEAm5HLhBQiUk+VV9egrz
   hn91lDXsoJK8/K3xhYjZqGozBmrBimlFJP6BwTdyPr63JrjD7kvySZ9SL
   qAyX2iT+5vS409BuCMtyaZ+hvl0rkBTDzn8vPhMZJi2xaf9lhIMyMMjpk
   UHArZRwd0bKd3QHWecV9gDnfNTjo2p0Xi7tRN4KFExdjH9QyF731pKI4u
   w==;
X-CSE-ConnectionGUID: rHJadYNXTbKGrxihprMHhA==
X-CSE-MsgGUID: g9nOJ7sjTVuQ2u48eYRwfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191419382"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191419382"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 164ABD6EA1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D26F0CF7C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 715731A006C;
	Wed, 26 Feb 2025 07:24:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/51] mcelog: upgrade 202 -> 204
Date: Wed, 26 Feb 2025 07:24:09 +0800
Message-Id: <1740525881-21103-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115624

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_202.bb => mcelog_204.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_202.bb => mcelog_204.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_202.bb b/meta-oe/recipes-support/mcelog/mcelog_204.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_202.bb
rename to meta-oe/recipes-support/mcelog/mcelog_204.bb
index 59fb86f2a3..b0d238361f 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_202.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_204.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "6b3fe165f35ef9897a6573042851922b3a3e4e4d"
+SRCREV = "ad244c6b60fcbd08a5d73497bfb3487983801598"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


