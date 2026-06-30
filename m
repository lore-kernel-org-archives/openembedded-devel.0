Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4332C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17237.1782811344038903328
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NfQZY6V7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811345; x=1814347345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KM2dhzrkC5Iagwje7umfZFjw8JwzESd/X1zZh1xACqg=;
  b=NfQZY6V7/IBdVMUaIJadTdctGDKgeg5iC4qTY9qs7A1QccIwN88bAihV
   VHtrmJc/ocNr25UUvaukWftwzMaWi7FrnAxw9fmO9tzmNRKpy/LjXjptI
   a2YQ1osV+lMgxfNUA0Yi2HmpFqZUSGp4J88bRiCffq/lgdr27IldEkwZ4
   p9Qrqo2m6UOY/LJeGQLb/tI4OIsQrWHg3E9wnojC33nldydyDhFI+YblQ
   0F/256LR8JQcio3qFuoPE9N2zZASlbxm8F/CLjykFvHLY3KvghMW8zL70
   E7oRjp9tNRzoBuZK3xVbZFIU4XzWk3fxwez2ehrl8rpS759tgvpeM+Y0W
   g==;
X-CSE-ConnectionGUID: 8mXniTOkQhSwJHbC24cjZg==
X-CSE-MsgGUID: w++sUrouTKqFI26IF/TGJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="224703868"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="224703868"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:24 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3BD0F3075
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:22 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E7823101D683
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 17AF482DDC3;
	Tue, 30 Jun 2026 09:22:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 08/37] libgedit-gfls: upgrade 0.4.1 -> 0.4.2
Date: Tue, 30 Jun 2026 17:21:36 +0800
Message-ID: <20260630092206.322-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127950

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gedit/{libgedit-gfls_0.4.1.bb => libgedit-gfls_0.4.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gfls_0.4.1.bb => libgedit-gfls_0.4.2.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.1.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.2.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.1.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.2.bb
index 87006cc564..2e06b9e796 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.2.bb
@@ -7,8 +7,8 @@ DEPENDS = "glib-2.0 gtk+3"
 
 inherit gobject-introspection features_check gtk-doc gnomebase
 
-SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "ce4b836dfda4ea3f594b9ded7b60c5cb51ccbc87"
+SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=libgedit-gfls-0-4;protocol=https;tag=${PV}"
+SRCREV = "3e83903b8211b7b392758e548e2d33ab162a32c5"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.43.0


