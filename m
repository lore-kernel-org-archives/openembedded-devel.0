Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D36ECAC5A0
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.15064.1758015739401197304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p/Bdns2w;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015742; x=1789551742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YzHx73lexIs5aMgbiLHqSb8xMqZiIPQfzLf1m1ZScTc=;
  b=p/Bdns2wcXPW8ByrqGPzXl4EiQDCoE/3PJTR0gRu550jKRsYkxmj1efo
   RA9V9aQxZVa9dn/8DRauKxvv36+6YppYqCUrnEZqU/YC1VXc26VEuHdIj
   iNwR0eWAAUD8aFkWHqrImaDrO008dNLB6yfdLh3fJ7s13dda1qDaHS1CQ
   YxA72S/7TmQRMbHSd9yKSoti92s6nSHhLLD6KaG78MAHYD6y6pH9buPeO
   +yhxkVeUNznRAFtWO6MDIab3p1ITF08evRoqm9HUI+lRwHNMJ3AlF0olE
   iufhwnIW+CrkkxFSOOeYetrEznUxBIrG4sKtgJ4Q8WER5i0DPZ24iZ80D
   A==;
X-CSE-ConnectionGUID: gUXMkpe1QoudLElUnw8kww==
X-CSE-MsgGUID: sLwFIdVjQ9WwOYnaPyDYNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="201479456"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="201479456"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:22 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 21F751000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:22 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D01BE1800E8E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:21 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 3A522200348A;
	Tue, 16 Sep 2025 09:42:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1A611A0074;
	Tue, 16 Sep 2025 17:42:16 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 41/42] tinysparql: upgrade 3.9.2 -> 3.10.0
Date: Tue, 16 Sep 2025 17:41:51 +0800
Message-ID: <20250916094152.1479-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119461

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tinysparql_3.9.2.bb => tinysparql_3.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.9.2.bb => tinysparql_3.10.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.2.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.9.2.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.10.0.bb
index 1194b1f71b..3a42f6f54e 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.0.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gi-docgen bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "14ce039024135e181022bcce4b1aad2e00377dd9c7d812b98391ccfc756dad8e"
+SRC_URI[archive.sha256sum] = "fb0af98355ea1db700764cf4fa245884a199ca145ed42ed55f9a18c68552ca30"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.43.0


