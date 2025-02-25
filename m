Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66464C282DC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2204.1740525898343880793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QYpbXw2d;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525899; x=1772061899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Q2j9GEEkYYJyxWAZvqx1/6EGpzqde92GwF6q0smX6JU=;
  b=QYpbXw2dm+ZpMLIu6L2SfAkfUR0rgTNARs4YKkj5Xkf5DfdNQHujPVXU
   eCHLilXEkoIkKq39Ob4N4pfbwLgp78IctrFDu7Jy1tRg24o8M3zJ5Tdhn
   wyR+7bFVUGix8sYBH1cNFGcAwjkF/XZY8J7Frg2zn5ZZoPFwHg+8XWGZI
   R4mmgO3kl3gCfIk7SEN236qDi7CmrYA+z1IWluTdh3fFcrXXYKB7TYgmk
   oFBhIYVm8AzZs/8SFD4ZIQzfK3DJxuUqVmlh+UuRpzf/ETIu9sulG3b1c
   jA8FY+ZMDkJ2YOfM0dgSfeLKhfV5imJa9lbAj4bSy7xnFzYyHR8NBlwaC
   Q==;
X-CSE-ConnectionGUID: 1NkHh33ZSiWTXW0ns+Heng==
X-CSE-MsgGUID: RrnhxExtRlCJeile0//LqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170032169"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170032169"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD554D5015
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 75364C8BF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 39F051A0073;
	Wed, 26 Feb 2025 07:24:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 18/51] libtevent: upgrade 0.16.1 -> 0.16.2
Date: Wed, 26 Feb 2025 07:24:08 +0800
Message-Id: <1740525881-21103-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115615

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtevent/{libtevent_0.16.1.bb => libtevent_0.16.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.16.1.bb => libtevent_0.16.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
index e1089d091e..f38ca3a836 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548029e"
+SRC_URI[sha256sum] = "f0bbd29dfabbcbbce9f4718fc165410cdd4f7d8ee1f3dfc54618d4c03199cea3"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.43.0


