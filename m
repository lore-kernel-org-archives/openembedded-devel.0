Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D51CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17475.1777546266332523961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D7UyqFet;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546266; x=1809082266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5sQtzW4YpHrMXbGmQ4Daw1TeRkL8nKWOG2P4UPhLw9g=;
  b=D7UyqFetccdQJxwx1UHh9PBpXWo0aoerrzwITCwdFbXJ1dj9y4fi3Slf
   6cQILCMnAoWGDNRB9BH8blh9s40Om39IXdpXx/3/QKVXoVjdwciYDMxcc
   8PPWq22O4/GO+QulbadCpnnci1MAtjlf8fvvE3tG+7mc0xuDZEv3ik4Rr
   W9rLiHhAsUsvQn58lVes0s7Q27UWZPoxDCpOdIgAymzU801lwtZ9C0715
   pDFDqJ+90edXwKpHJt/+BNNrKsUDLjb8Z4MB48CXVKoeLJtYntK/pF2oG
   AGnIRMHp8KliAhfgRFZ1jgokOhQWY2Dzim2FCw+3XtARHEjDgbh86zpsJ
   Q==;
X-CSE-ConnectionGUID: QHFuez5/T/ar/ly9KWWRWA==
X-CSE-MsgGUID: Tz9gcQcaTeyEzsNqNKACyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552762"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552762"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C668F1C000D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:04 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6B59F1C00282
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3861E1801130;
	Thu, 30 Apr 2026 10:51:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 60/64] tinysparql: upgrade 3.11.0 -> 3.11.1
Date: Thu, 30 Apr 2026 18:49:19 +0800
Message-ID: <20260430104924.1106-60-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126730

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tinysparql_3.11.0.bb => tinysparql_3.11.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.11.0.bb => tinysparql_3.11.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.0.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.11.0.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
index 522cfb3d23..5ddc309293 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gi-docgen bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "011e758a53f31112a8c45700fd6039ae55617f0dac70119d9eddafc03cf68fe5"
+SRC_URI[archive.sha256sum] = "cfd46021ee1514ad435e714f7aa1ec7a787c7f516a94f4c7438897ee3d6eca1e"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.43.0


