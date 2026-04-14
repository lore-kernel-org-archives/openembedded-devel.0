Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E4AED7BA1
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15969.1776163174132774870
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C+BthfQG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163175; x=1807699175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IQ2qMka6MBsKFLsuUASDYTKjamqXzXtyeQV4wFLPLSw=;
  b=C+BthfQG9nNPO4Z3gs/8uVVMIRpfETh2rZq8yOrx3a9aOo6frpcUhU5w
   OemwyPA3zdNBhxLjwTDYHqFxss1FG2FFAQGJuIzlDsPP3MatKciahBqnh
   /GI83hdsLJYvpeD3oBbS6BnA4yHY1GPlXTKvxu6/sdMjn9WKB+FOYiKd/
   cYbuhwEAdVnhHkYJIBgITlUxhNFI3d34aCAUEgeVChX8o3ku8eaSpZ1r5
   qqTKH4YbPqM+P4jvvoKsb6uXgepebNYbic/Dn6xZhmls1iBwFkE9zE/0u
   DanUsedpTP8ZzRh1Jbw+Jclud+T0Gcm4Zo/ZHn9mvpb3bh1aPX3MxQQkE
   A==;
X-CSE-ConnectionGUID: LRfQe8HuRH29qx5ub4TwhA==
X-CSE-MsgGUID: NfyP5aLrSwu6m4dfEBPebw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236851622"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236851622"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A313D42A316
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:32 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 526791807161
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id BBA2914000E2;
	Tue, 14 Apr 2026 10:39:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/32] gnome-online-accounts: upgrade 3.58.0 -> 3.58.1
Date: Tue, 14 Apr 2026 18:38:19 +0800
Message-ID: <20260414103845.1728-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126310

From: Wang Mingyu <wangmy@fujitsu.com>

* Bugs fixed:
  - !391 google: Use #ifdef for GOA_GOOGLE_FILES_ENABLED

* Translation updates:
  - Serbian
  - Slovak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nline-accounts_3.58.0.bb => gnome-online-accounts_3.58.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.58.0.bb => gnome-online-accounts_3.58.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.58.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.58.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.58.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.58.1.bb
index 62f67460b0..6b80df7781 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.58.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.58.1.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr keyutils"
 
-SRC_URI[archive.sha256sum] = "344d4dff9149a1adc4539417193e1eccc2f76ef40ac24e104ccf58072be55999"
+SRC_URI[archive.sha256sum] = "9ec1900cc51409c2067c07c828c10be06fe3bf68d2999bb72d7d5ed325ed9bbc"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google"
 
-- 
2.43.0


