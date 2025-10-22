Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C86ACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:24:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4781.1761099854006084107
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kJkIvsMW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099855; x=1792635855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o0Qi1iOS4NrtpT7P5Eq31hBeowK5FW5dQVyVUI0Q76Y=;
  b=kJkIvsMW5Tf824///1S9R9qSF1T7mc0/ZEjDRpeSJ70LIZ/t0AXR5dKJ
   cv+YoxPukX9G+Jl28ExSbSW/a3YNmsnhw8zcd6CLaG4M1Y9IvoafP4LW8
   MlWp4X7exij+VMzODyxTXSoYHCMyjDzTGVEJERkL5kV0qm5B1xq2x90VX
   UCmmFHio5Rzxq4WBIoGfqWtyBcCTNy/jXGwPiU/cM+abmI1FMIQgk2wSA
   UtgXPPDPqD34sYAH/UFn1nAScp77QlT7ftc3LtR9162qKu4SClPy+rs0L
   sH6/Zusuf5rUxppcD2GBERhYMVDYJI5lqtLRxuOmOKxlu5qw9gkBAHebN
   A==;
X-CSE-ConnectionGUID: kBTWtw1oSo6X4j/lAYyf6Q==
X-CSE-MsgGUID: Dq/vEoxGRw6rD2RVKBxYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216695121"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216695121"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:24:13 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5CBBC8203C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 192C11400625
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BCB2882C0DC;
	Wed, 22 Oct 2025 02:24:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 28/29] tinysparql: upgrade 3.10.0 -> 3.10.1
Date: Wed, 22 Oct 2025 10:22:24 +0800
Message-ID: <20251022022227.226-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120874

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tinysparql_3.10.0.bb => tinysparql_3.10.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.10.0.bb => tinysparql_3.10.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.0.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.10.0.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.10.1.bb
index 3a42f6f54e..aba8f12976 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.1.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gi-docgen bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "fb0af98355ea1db700764cf4fa245884a199ca145ed42ed55f9a18c68552ca30"
+SRC_URI[archive.sha256sum] = "5a7f3e789db6671a550ed6280ed4f60a60bea77368da92be68dc7d8d7e230265"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.43.0


