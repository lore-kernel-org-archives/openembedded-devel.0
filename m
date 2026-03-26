Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8598D10A1E90
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45639.1774526217146304796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GGGQ6bQ+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526215; x=1806062215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=80AnA8Z0nEAO6UI/biTyKLA1BsDrtM/y/z20quJybi0=;
  b=GGGQ6bQ+C399NSvK6P1xjJ6AUSlIPTfGYqlNFGgU9bBlfPGiNlwwPv+p
   1ixCN3eDAyMDcu9qkPdFeXW8vRZXaIEClxqbl6bvixr6iBMK8eS27hz4/
   XeOdiN3s9qshuyiAtbG6HFsxuIAvQmvg5e4B9zUit5hPffdw18Y3iML4N
   iYwW6grk/BXxd796R9HRcwzjgmtqChyhsAPyDh9AJvi/6cW692R/f0WFq
   sP+semrpgveXIryMK19fGDAbQQ3jUAmyawXlyLtRwqhKzmFxqqi9HVCnf
   +QFZSHZS/YZTZEnRV3OBXSXulhTdqjUBF3OsbWy8TJFb7fsUdS4MNz3Na
   g==;
X-CSE-ConnectionGUID: 0IjBaQO6RD2hF/0kbsvdKQ==
X-CSE-MsgGUID: n8JqRxHwQGqhs9rd7gRWkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222181240"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222181240"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:54 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9BF131C1C702
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 571FF8D29D5
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F135D1807148;
	Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 09/63] gdm: upgrade 49.2 -> 50.0
Date: Thu, 26 Mar 2026 19:55:39 +0800
Message-ID: <20260326115634.1199-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125664

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_49.2.bb => gdm_50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_49.2.bb => gdm_50.0.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
index 94e256e4f2..858933a4b3 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "9813631f9f5f0f860ea14a437866e60efc7bed3023b7c3b765cc5de1de597a06"
+SRC_URI[archive.sha256sum] = "646f53d68f2d2d147146ffaeb85047ded8b813dcb1c104d8f0ec36ca609eb5bf"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"
-- 
2.43.0


