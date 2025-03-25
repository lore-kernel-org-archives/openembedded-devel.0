Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E51C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.61528.1742893334031795773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kNqKnY5p;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893337; x=1774429337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/EK/Gc3N++Jdaj72h1porFqCyDlR+FCetywHhA9Io1I=;
  b=kNqKnY5pxS2luaouS86ZBC4lxr449gZBZsSpLomjRipT0L5PNGvcQ4+n
   kcowqNtj0BZLONVVWCRkp16IfD6iG86O2eirmn6Gf6DdMfASqX1BCzyBq
   CS5MNfXvwDal0edXzLzmbVURYQtK8zJQJ/rT+w1aLmyYOyzv8w2JzYBuA
   LBpDcS/e6DoQ/CcfBjgwMfpJb09GpExoMVSdrQlFTyahWmS/zG0B7IcI+
   x753Tsjvy661STd/ip8XjFx3ijne5xZoEieoW6QTDG/VsyApHbrecIpeb
   tu978SBzITenZtr9XKOxaPbgXOKagnFKyUg3xmufkYEmzRZhN1l51X+p2
   A==;
X-CSE-ConnectionGUID: TedKps6wQGWsujLNg0i5Yg==
X-CSE-MsgGUID: WjJR87/rSLSsfr6H9tiQyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182159845"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182159845"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FE75E6881
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 44C03D4BD4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1F9B1A0078;
	Tue, 25 Mar 2025 17:02:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 15/45] libpeas: upgrade 2.0.5 -> 2.0.7
Date: Tue, 25 Mar 2025 17:01:22 +0800
Message-Id: <1742893312-3809-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116238

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpeas/{libpeas_2.0.5.bb => libpeas_2.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libpeas/{libpeas_2.0.5.bb => libpeas_2.0.7.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb b/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.7.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb
rename to meta-gnome/recipes-gnome/libpeas/libpeas_2.0.7.bb
index 557831da6e..76ed820e66 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.7.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0"
 inherit gnomebase gobject-introspection vala gi-docgen
 
 SRC_URI += "file://disable-lgi-check.patch"
-SRC_URI[archive.sha256sum] = "376f2f73d731b54e13ddbab1d91b6382cf6a980524def44df62add15489de6dd"
+SRC_URI[archive.sha256sum] = "1e9a9d69761d2109eff5b7c11d8c96b4867ccfaca2b921eded49401192769ec9"
 
 PACKAGECONFIG ?= "python3 gjs lua51 ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection', 'vala', '', d)}"
 PACKAGECONFIG:remove:riscv32 = "lua51"
-- 
2.43.0


