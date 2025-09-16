Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EA3CAC5A9
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15423.1758015724862104256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KfwcdvLd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015725; x=1789551725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WEvLlAT1mwH4bkaeBpXZTULcg72a46yg+vWKwj4MlK8=;
  b=KfwcdvLdA+1VkzA67fNzqYCRkxk5pRMThS1YucCm6wZjqk4tpzIAqU1Q
   2e6SpWRkCP5PJa+oQ+th220ZSzJJKX6RqrD/xLFintksCFsPo5DULpCC7
   mwsDnbbtvlGF+vdFN3UxH25XD5VHA/OEzJBmkyktew8bXWBSTdr6xHZFi
   i0YkU/UBCLEoZ4kiuJO75IVptN3enIpixfEo9TJGF8t7PNX6AmwBUG8k3
   EmrnM2hc/VaIq4UvqNFdCdK566vWjvQ+ugi5rI10JnTTZbKzy2KsfQawy
   86W5wHjwJBHfZUjOPp8/FWL27XMsBtp7RPS3oifr9VqkW1dsfq3eKj5fD
   g==;
X-CSE-ConnectionGUID: OwDbcbLVSuWL7DoMwMvVVg==
X-CSE-MsgGUID: N7p9rd2AQeCQJq4yFfZeUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200384936"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200384936"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5E05F1000344
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 15AF71C00124
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 6635220017C2;
	Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5CB91A0071;
	Tue, 16 Sep 2025 17:41:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/42] gnome-font-viewer: upgrade 48.0 -> 49.0
Date: Tue, 16 Sep 2025 17:41:16 +0800
Message-ID: <20250916094152.1479-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119431

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-font-viewer_48.0.bb => gnome-font-viewer_49.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_48.0.bb => gnome-font-viewer_49.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_49.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_49.0.bb
index e8d51a12df..b8e5f1d01b 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_49.0.bb
@@ -15,7 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "732624231b624ff5c7ac03a8ce71be12393daa53551d11550b20d7b0a3a872a7"
+SRC_URI[archive.sha256sum] = "7c018925c285771b55d7d1a6f15711c0c193d7450ed9871e20d44f2548562404"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.43.0


