Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7218BC624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9379.1788344955597997520
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fmfurmP0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344960; x=1819880960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gv2Vn/B8p+XhUYK2ej9xJfjLmYl7g7eT0f+/q87Q8o0=;
  b=fmfurmP02wd3j6MzygdyN7eAYbRJ6+r7oRTgZxsFYY2tMppFwArgnHYU
   M0ebeQklusIZX9bGV7YVVBDzCGCl7vRj1+3kkAAneMskmpGrq/ZF/tygp
   RAuxYSLIoAwWC/fDzTwQMVa5TyZ+8F7oeCuUIFhfvHPPMyUhb3G/y41Rq
   bPKxyo+/rIGCZQrIopVHHEhR9O4yIdJ3LgiNeKpdgZlRFZ7r/xaKMcS+Y
   W5E8j0oBSB8AfbStp8VAJWnZf0R79mqoULPwpX+7eLPDWljynV9E2H9Ie
   02ytg6t0DZnvWHa7holJcrqW+nWo/Kwp7H6M7SXSXw28H02IetQOs3KQ8
   g==;
X-CSE-ConnectionGUID: 8EuP+Jo6RRO1R3ni1s++LQ==
X-CSE-MsgGUID: tnQITuVvS9OpUAeuTx/DqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253572103"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253572103"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:18 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D39EE1002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:13 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8B76114003F9
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8BB182000224;
	Wed,  2 Sep 2026 10:29:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/34] libcloudproviders: upgrade 0.4.0 -> 0.4.1
Date: Wed,  2 Sep 2026 18:28:31 +0800
Message-ID: <20260902102900.1296-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129664

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcloudproviders_0.4.0.bb => libcloudproviders_0.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0.4.0.bb => libcloudproviders_0.4.1.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.0.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.1.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.0.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.1.bb
index f0a0e36022..8bf940a472 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.0.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.1.bb
@@ -8,4 +8,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "247b228d1027b2683868e7d7080d38693a457e908aadd0c119d52de59a398064"
+SRC_URI[archive.sha256sum] = "3e123fa2a34f6dfd99897ebe5fec3dfa35d9cf4b192c28fe7fc90c5aafafcf5b"
-- 
2.43.0


