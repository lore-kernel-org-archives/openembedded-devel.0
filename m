Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819B2C19777
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2299.1740525898065065197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XuxPv+Kz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+DKxy2SfAIhU6xkpEhHtVGbZRPUriCkEi2nw9BZaJfw=;
  b=XuxPv+KzZ6Csau/btmHnrAVV1VVdFYA0yyWrU5znJtjxE3RjJysXDhwR
   JEbTaK45kyZiD6iUQXYS41A9cmAKcZ4AoPIxEflsge8EIgHqybiwgvXpP
   4GI/14gF0MUF/EEcpOHfzVcXwJHjPWE0bNc2ss9bgleP+W7Q2mVYHz6Sm
   bCOrlNX695gKeTvG1WvAh7dKKIuwjibOfXaEYhvW/S8e5bvaxncPlPQ7Z
   J0dwPJ8LD1FTSWSoMSW9XnQdjy7zMfmZUCNM9q0L5huLOs6KZZ9UAHnSA
   QGGxZvZUrBZQmUZOtCt+oJ356RU6H0nrg/swxYf9Qe9txkjYZZlqzNPkg
   Q==;
X-CSE-ConnectionGUID: mUXX3g8QS+yOo5a/h3+i0g==
X-CSE-MsgGUID: kDV/ykRlTO+OWI2vZ4L6vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="190327586"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="190327586"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 28689C2262
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E042ED8B64
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 848F01A000B;
	Wed, 26 Feb 2025 07:24:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/51] ghex: upgrade 46.1 -> 46.2
Date: Wed, 26 Feb 2025 07:23:56 +0800
Message-Id: <1740525881-21103-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115607

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- build: Don't include gtk-hex-paste-data.c symbols in both lib and binary

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/ghex/{ghex_46.1.bb => ghex_46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/ghex/{ghex_46.1.bb => ghex_46.2.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb b/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
rename to meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
index 412b304681..f29ddbb6fd 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
@@ -16,7 +16,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-introspection vala gi-docgen
 
-SRC_URI[archive.sha256sum] = "8a13975474eee27719b29ad763f1b24760a1aede6d7da4b623703070bc26e9fd"
+SRC_URI[archive.sha256sum] = "a8f276a36397a70d20b862ff7c664243d9cf2891deb9be06d745a4f1ac661f31"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.43.0


