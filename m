Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43C5EA7974
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14286.1770268526969408596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ShD3GblT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268527; x=1801804527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ITp0wr02oYPjh1m9+MoSjD00A3xisEB5H3WfRyjr3X8=;
  b=ShD3GblTItDfXBg7e1VnIHjK/ZDRoRhhzTTpFq4Zsbw8bS5QocK60sx5
   57Ybw0MC+t06mtEFmUUrB+vYweejuUpoNNLQbJWpDLwD3uGCeXEHL4MO5
   TrmQMNgCPKHAS2C9uus4CBjV3cHvUN0R6VTKd22Sf9RmtQxM4R7EvdsaC
   npvaSsLIr8+bLYcDHXYyrD9tK4lt5WHqX/P6oNlPEEDc5Na+vdlQOwi4d
   28tBDlbBIHMZMvBmew/cnObfrV2tcDNks/kj/q54NYFweTtMtXINITqvo
   cgeh3bgN3skorWYPU8B68t3kH0Y+885wCBgKq+LY0AScVcj2vSZ08xie/
   A==;
X-CSE-ConnectionGUID: jq1XL8YBSyWTjTPY6dQ8yg==
X-CSE-MsgGUID: 2DwNNtnLRry505a268oa2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="217208152"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="217208152"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:25 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 57F4F4DD1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:25 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EBD82926778
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 33D9C20000C6;
	Thu,  5 Feb 2026 05:15:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 10/24] libspelling: upgrade 0.4.9 -> 0.4.10
Date: Thu,  5 Feb 2026 13:14:20 +0800
Message-ID: <20260205051435.1366-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124162

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspelling/{libspelling_0.4.9.bb => libspelling_0.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.9.bb => libspelling_0.4.10.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.9.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.10.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.9.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.10.bb
index a378cc87e3..c906c8097d 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.9.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.10.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION = 'docs'
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[sysprof] = "-Dsysprof=true,-Dsysprof=false,sysprof"
 
-SRC_URI[archive.sha256sum] = "d093fd35ae0f1c98fb58876505287fc0a885e47da9d2411d6d7cd595f34d4ebf"
+SRC_URI[archive.sha256sum] = "56e3f01a3a18b575beea4c34349f99cdaba316e1f7c271b1231f7bcf5d9af73b"
-- 
2.43.0


