Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D52C35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 03:39:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.13313.1742528354465172780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 20:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JcA+K305;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742528355; x=1774064355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BIgDml4VEa75G+wcHBVOoGy+Xn7IOcPaTcyUvzzbHs8=;
  b=JcA+K305a/qtQ9dLrm4dx6Zcz4iXroUn8XSgA8Mlq3O7FxNuH2y2T64k
   hOTnx77TRJJFo4xyBiBgGLkj9DaxcofCJ2eMC56VcSbAvWHM7lEVZc1Vo
   QeS6Dl7Wj6oMe0osH2/7GGOSrF6Oa2su0KBknf5NuGO+RLEvcfQ8Ks+8r
   LHeY1jqRmrcYJZ+W+npMOAx91tHD8ZyBbIcbQsUJ5wM+nUIl6CChmqJx/
   Jz6KqZSS2w1FskA6f3I102PcxiK+o2HWsZcpr1feLaRogTeVh6efL7EB2
   F8CtzxtiGULamVCaaWM+iEgiqy3sQ/nnKmpyXOHkDA9eUHfQO8E61obGO
   Q==;
X-CSE-ConnectionGUID: O5xgvdZ1QaaO9qYW9zzvww==
X-CSE-MsgGUID: AtLfjrdxRp2uPDm3MB0ZjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="172684277"
X-IronPort-AV: E=Sophos;i="6.14,263,1736780400"; 
   d="scan'208";a="172684277"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:39:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 951CED6EA1
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 12:39:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55F74F0F66
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 12:39:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4E091A00AE;
	Fri, 21 Mar 2025 11:39:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 3/4] gnome-backgrounds: upgrade 47.0 -> 48.0
Date: Fri, 21 Mar 2025 11:39:01 +0800
Message-Id: <1742528342-27448-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
References: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 03:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116160

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_47.0.bb => gnome-backgrounds_48.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_47.0.bb => gnome-backgrounds_48.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_48.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_48.0.bb
index 8774750e95..d144cd0639 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_48.0.bb
@@ -6,7 +6,7 @@ SECTION = "x11/gnome"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "874a4a39c4261736f6a854722833400b612441c4681aa5982d90b15abc9c91fd"
+SRC_URI[archive.sha256sum] = "2d6baa011ee97804c7561f7e1cbd8d4763e30b55b8818dda78f9f75afb8d8d05"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.43.0


