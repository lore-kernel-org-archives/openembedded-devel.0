Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061E6CAC5B3
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.15059.1758015726230917982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mLyuWnz/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015727; x=1789551727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0YphKkpSHU/b7ytBqCFgIIUmSYrWTZCgPPGxvBvZPJQ=;
  b=mLyuWnz/Y66T2umjCSGX3/4YyswKs9FjM3Z5VHGJzeAyJXpmRtzrqTSm
   /gY0S48sUGjT51/oL6g/oqpJM14gVtGw5a84RaWEdRp49+wCHmoUhr2mF
   I3uw1EC1rE1CP4nOtDZl478vp+qu2SqgPJ+cbdTdD1QoqoCOaTyXOdhTK
   rsD37Q1ILpunSWBsFPc93l+hW4ClBD76IHfrv/xnp5JaWKHXm/BrlOTzy
   duC6Q5cJECWOyF+p6jAfltQVOilwpGN8vTbrEZLNIsxOrJRxg/3h6hgge
   IRy7v43NdZxiKr49kMdh7onTomLYnmIrBSv7f4UfjD6g82zOUE8SyvPcO
   w==;
X-CSE-ConnectionGUID: PG5OoUTyS8GHvGBBRqi6aw==
X-CSE-MsgGUID: YOqxPTUfT7S3F2sNULub6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191918848"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191918848"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:05 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 71F4542A30E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 23FDCC00FF4
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 6C4C71801555;
	Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06E351A0086;
	Tue, 16 Sep 2025 17:41:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 15/42] mutter: upgrade 48.4 -> 48.5
Date: Tue, 16 Sep 2025 17:41:25 +0800
Message-ID: <20250916094152.1479-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119438

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/mutter/{mutter_48.4.bb => mutter_48.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_48.4.bb => mutter_48.5.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_48.4.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
index d563e8a912..ce7f44947e 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
@@ -27,7 +27,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "1189cf7e63cc87cfdd1f3a86e8f14d97c33d6a9da254f23e81655549b6c50d93"
+SRC_URI[archive.sha256sum] = "02ed0ab4194fc537540f9ee92acbf5af8209971a404df319c1cb7763294ae58b"
 
 SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
 
-- 
2.43.0


