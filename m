Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACF7C87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:33:53 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13435.1754296427871557363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NgBimn8q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296429; x=1785832429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0IlcI1ZjxaAyRD7E+QckYu1iQHChBmKMtj8VlFpvxk4=;
  b=NgBimn8qITXhk+mE1pL6emvmvpmGqa+53hTBLBduQZ1+jYXNkyJMllpy
   P5tCEPfCmHbfbnrCU02aDfFFXkVSIuukHRaxRR2UOH3R3/QHBnfwbeEwU
   K6gDE71Wq2RPhqWY890f18G9LF6mvv4XUjVGH/1jT/BlQeQCzSov8s7El
   fNa53MyJpNYvH0deo4zy6ClUQ6TuIkfU9uLIL/o/8TrRPgF+R1dNUnLsq
   5R6OleDRwZYcYQ8oZi7WcpvXeB+Vn+CrrEcONw/J7hvz6gxXsNq6gicfv
   E62Rd1hqZgmWie9RiHmjExWEEhLinwDGZIlZIKDCJkrlZUPGjeNCa7BiB
   g==;
X-CSE-ConnectionGUID: VcsKHh3pQ4mMuIBXwnYFlg==
X-CSE-MsgGUID: dZoI2ta/Rti2K865BBqSWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="207643579"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="207643579"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:47 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 70490C00561
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DF4F683D94F
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0706D1A0074;
	Mon,  4 Aug 2025 16:33:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/18] graphviz: upgrade 13.1.0 -> 13.1.1
Date: Mon,  4 Aug 2025 16:33:25 +0800
Message-ID: <20250804083340.1649-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118836

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- When built with PangoCairo, the Kitty plugin is now available in Graphviz
  static builds. Previously it was only available in shared library (on-demand
  plugin loading) builds.
- The distributed Fedora and Rocky Linux packages now include the Kitty plugin.
- On Windows, the GDI+ plugin is now available in Graphviz static builds.
  Previously it was only available in shared library (on-demand plugin loading)
  builds.
- Processing a graph with GVPR no longer makes explicit the default '"\N"' label
  for nodes. This undoes a change from Graphviz 13.0.1.
- 'nop' no longer preserves empty string labels. This undoes a change from
  Graphviz 13.0.1.
- The order of programmatic calls to 'gvContext'/'gvContextPlugin' and
  'agmemread' once again affects default node labels. This undoes a change from
  Graphviz 13.0.1.
- Spline routing can now deal with horizontal and vertical lines. This removes
  some instances of the "Something is probably seriously wrong" warning.
- Using 'layerselect' beyond layer 1 no longer causes crashes.
- Correct parsing of a PDF file's '/MediaBox' section no longer depends on the
  internal 'BUFSIZ' constant.
- Round tripping a graph through a file no longer causes it to acquire a default
  node label '\N'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_13.1.0.bb => graphviz_13.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_13.1.0.bb => graphviz_13.1.1.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_13.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_13.1.1.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_13.1.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_13.1.1.bb
index d15cd7288f..f385280f6d 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_13.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_13.1.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "13339b83ee5467001a035cfacd175702ac4b14f5d390f0d34e89437b29881278"
+SRC_URI[sha256sum] = "6c49d7dda4329f5a35ce70035d1ec6602dadae7a7077cd7efe43cb57f4bc8f22"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


