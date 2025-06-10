Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AD4C71141
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.78432.1749526425679932358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NCrokclj;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526426; x=1781062426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YbqGR5WRaicmN+N7WmCTW9yqKafAdGYs6YkmWSICXes=;
  b=NCrokcljYGP5PDr9Eq94lGx1g3prh3HFkRaAfUOnySgQB9zV0/dTQEOH
   XyljYYnN2Cs7GwjUTiL8BqrWd32PlE0zuzLOqYJ38NR7zCI5JqhylDRXf
   06VYS5koZkwcTsdfZRsh/wutor2GgeuBXnCrXJd+PFpGPGhLSLUemH0TG
   XOVYj0nlOpTMrbK2VljXwlpE6ZpjA7WJsxCcZ3IBDe9i/ttHrxBo8J2DJ
   MrkruE6AUqkfvysMSb5Zygt2UQWHZhhfXCpWbGCSE6p530EyLh9+i2ugf
   TD+NeXs/PBWwue4VginM72V2VkXldxm1QZ3I/ZF73+LJqN74mfw3aMC18
   g==;
X-CSE-ConnectionGUID: lpKQ7VkrQTega2kiWCvllA==
X-CSE-MsgGUID: dB7RyJpnS4exepPiXplxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662464"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662464"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3D2ED6FBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60ED7D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2CC11A009A;
	Tue, 10 Jun 2025 11:33:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 22/64] nautilus: upgrade 48.1 -> 48.2
Date: Tue, 10 Jun 2025 11:32:48 +0800
Message-ID: <20250610033330.924-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117811

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Load directory before thumbnail attributes are ready
- Fix trash banner visibiltiy
- Fix sporadic crash when loading new view
- Improve container-related media property handling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_48.1.bb => nautilus_48.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_48.1.bb => nautilus_48.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_48.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
index 46a64c9c76..f867cd14d1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "7995a2a17c29d4b09abf9dd9aca14b8dee7dec3bd74776dd379512f2e6d7347f"
+SRC_URI[archive.sha256sum] = "a030f6163f8a68064fae5a9e89e37f19cbb293de2e12a19dd5e210956d0df4b5"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


