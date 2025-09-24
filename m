Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87103CAC5BA
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8225.1758704439250344584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sWNVD2iC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704440; x=1790240440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BAqa734FMJ9lN7xtAIQttviAOGiJ5C0uSCtWpZvhZ4s=;
  b=sWNVD2iCtAu9fla0eEy+eb3Ugngi88BtP52h9inPlMtSatMfR2EPdrBH
   wfd6uUE03j+3Yazlq8WcD+sMiBZbuTlbn4ujv1gi7/Avbk/pFWPMVO+cn
   Iv23V0EkyYOzwuAsWc1rK9Hym2GPg8RQ431BwM9gPhLdpr5ZoVf2L+D2p
   rdTG7xveh30aG5bxJUwJevl8XlPTRkigzNxy4mYM9mATE60+bYBSfq9xX
   qz7y4eGkw1O2k8lFhNp+3xllMQgdauOrfhIitd0d+k4YPp3NHBNn7k+S3
   Ir5PcBKVQFYEZT+veJOCNXmME3lkR5SYA8EDA+su+ubdYUwGUm7UZVyr5
   Q==;
X-CSE-ConnectionGUID: fYnDYE72QFW+ykcH9k6Xeg==
X-CSE-MsgGUID: atnNDbDGT7a9wsadAYQKJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213113600"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213113600"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:39 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3FC7FC00219
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:38 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id EC1D8C02453
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:37 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 4FCAE1800123;
	Wed, 24 Sep 2025 09:00:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4ED4E1A0078;
	Wed, 24 Sep 2025 17:00:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/29] dconf: upgrade 0.40.0 -> 0.49.0
Date: Wed, 24 Sep 2025 17:00:04 +0800
Message-ID: <20250924090029.1786-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119767

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/dconf/{dconf_0.40.0.bb => dconf_0.49.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.40.0.bb => dconf_0.49.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.49.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.49.0.bb
index c5c45a0264..43a680d202 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.49.0.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.sha256sum] = "cf7f22a4c9200421d8d3325c5c1b8b93a36843650c9f95d6451e20f0bcb24533"
+SRC_URI[archive.sha256sum] = "16a47e49a58156dbb96578e1708325299e4c19eea9be128d5bd12fd0963d6c36"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
-- 
2.43.0


