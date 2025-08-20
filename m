Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F15BCA0EFA
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.15247.1755679196640782156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BYWjg8G/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679199; x=1787215199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eWt6gSJKGlW7v+N4zTtRj/MSPeT5G8wCeJ4wQL12pe0=;
  b=BYWjg8G/QWHrd5k4pIsQHxbqSD6pLS4GQfjRyDiPY1eze67WQxMcAgwf
   77wik3RBOwzDSsLdVEFU7fJdun6GcWcSjwwFfnZu1MA0SKd2RKEaiXkqs
   S3hJRRyHKsUWeVkUndcMPUpA+m1UzdzGm4kNqgG006fhQmylFC7ld284x
   R23t3AsJRgQKlWedRV+7HIF542pFi1qdQnVjtN18zATxZiJZjMk6ABJ5q
   7BnlTkrbN0bIRA7m1cD4nlWRc01VTbrgJmbHGXoE1O1QeQCl303vp5bTQ
   Eh/LAmeQRjEbOc9Ib/vUCcFB+9aAOmQ5VUrDRTw0JwJQEN/hIHvIVgJ0p
   w==;
X-CSE-ConnectionGUID: 5zoMI/EpQUagdm1qXnu5ZQ==
X-CSE-MsgGUID: stXLERZoQfiGFTg71N0Xiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="213396778"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="213396778"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:39:59 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 7D6E81002B88
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:58 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3E1AA1401260
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:58 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 400E818001E0
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D6EF1A000B;
	Wed, 20 Aug 2025 16:39:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/26] gnome-online-accounts: upgrade 3.55.0 -> 3.55.1
Date: Wed, 20 Aug 2025 16:39:22 +0800
Message-ID: <20250820083945.802-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- #71 Adding GOA account fails with sonic.net IMAP service
- #81 Support Webflow authentication for Nextcloud
- #162 Cannot add a ProtonMail bridge with IMAP + TLS
- #242 Rename dconf key in gnome-online-accounts settings
- #408 "Account Name" GUI field is a bit ambiguous
- #420 Nextcloud login does not work anymore due to OPTIONS /login request
- #429 Linked online accounts no longer work
- #430 Invalid URI when adding Google account
- #434 Failed to generate a new POT file for the user interface of "gnome-
  online-accounts" (domain: "po") and some missing files from POTFILES.in
- !340 goamsgraphprovider: ensure a valid PresentationIdentity
- !345 goadaemon: complete GTasks to avoid a scary debug warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nline-accounts_3.55.0.bb => gnome-online-accounts_3.55.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.55.0.bb => gnome-online-accounts_3.55.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.1.bb
index eb78bd1327..8edbd8411d 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.55.1.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr keyutils"
 
-SRC_URI[archive.sha256sum] = "fd69d0aec3b672621f525671b5e54f28b73939920b3fc308ade561a83a727b2d"
+SRC_URI[archive.sha256sum] = "a0b50fb75553c1e360713a827321cd17e2f91a735b8205ba5fd0ff374b26108b"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google"
 
-- 
2.43.0


