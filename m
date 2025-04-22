Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ECDC369D9
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.35434.1745311787628479901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aXb7mJ4J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311788; x=1776847788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2IU6glqfhBY6lxD7VeBjdwDkBO16Ee/eX0vsiEsWaQs=;
  b=aXb7mJ4JhCLUoA7E+4dyeMya/UAqc3Zb410sMzg88otcR2kKkp4PJ/l6
   M1FiHiEliBCuNC2EszbDz9OxtjJuz0besT84Rvw049R2C6EUKVC8Pa9yV
   yNps2wQQap9PPH8WvDX9JrBeZNJe0L2wWVPdA30DWYp6Tpf0tsMFynANE
   ja4ADUIM7EiOFgbibnp3Y+lrbcIl13//xotOI8zymZzJb463Zx/Z+G8oY
   7+WQuP3FVY1tYgqgwoS9pgm15P3yeJP/IRblScbekPcxVEgjsd6FHPvOF
   V6sNp7fo+AbjEtSGAgOEiuCz+waBEhF+SIgU8Zyaft6bqmEtrFQw6Oj75
   Q==;
X-CSE-ConnectionGUID: JbbHjeaiQ/iber9oeyzD8A==
X-CSE-MsgGUID: qI+SkdCAR4G7tP8oVW+law==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197297357"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197297357"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D8B30DBB8C
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 97CBBD72A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 325F81A009A;
	Tue, 22 Apr 2025 16:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/30] nautilus: upgrade 48.0 -> 48.1
Date: Tue, 22 Apr 2025 16:48:58 +0800
Message-Id: <1745311761-1912-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117049

From: Wang Mingyu <wangmy@fujitsu.com>

* Bugfixes:
- Fix switching from tree view to grid
- Fix opening new window of starred folder
- Fix selecting Google Drive files with file chooser
- Run script files in their location
- Disallow duplicate bookmarks

* Cleanups:
- Update screenshots

* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_48.0.bb => nautilus_48.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_48.0.bb => nautilus_48.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_48.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_48.1.bb
index 5f239a6c6b..46a64c9c76 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.1.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "f9e6a4cbe1d5bb7ad59ac44f0d439edd4b0507bf07d3d90a2e7e7e6d3f416d57"
+SRC_URI[archive.sha256sum] = "7995a2a17c29d4b09abf9dd9aca14b8dee7dec3bd74776dd379512f2e6d7347f"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


