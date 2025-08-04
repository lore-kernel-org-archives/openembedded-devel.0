Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4341CA0EC8
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.13440.1754296438818344616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tFkGECM4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296439; x=1785832439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NlveSkcMGbHY+pztMCnlESaZRzn/xVKM/C8D21h6B4=;
  b=tFkGECM4kdEkCAmWJbeNRb7JN2guMX0sCN9840jKLsZks1lqwp9tTGhA
   Zxytfi3HeTg4t5OzLUnDww9mWCY99rnWtBNCo0VxD02eU98V13VXXP/FG
   iZLY2UpXkUQBrjyca4sSFtabOmgilDDXrZ23DOEOevv/paPn3CTPYM2Ow
   YtP0WYJ+v2FCordBpCSSXMI4Ix71r1Q4zDIlSxm8QkebD4EDFZGLEnmXV
   6XGZX34TS6rz5kgpZiVzbbjyA8gUWyDtKE0dklY9dEUE0Nnw5QPbPLSy8
   d8eROFmw40Hdl7LJbcODtsio07VzXNq6Bd07Ajw8XIExq3Z1KJblbsdM2
   w==;
X-CSE-ConnectionGUID: Bjb30iZyRu6hHCvBKBxwPQ==
X-CSE-MsgGUID: GQXW9o4tQoauKeiv3ukFLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="196835202"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="196835202"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:57 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 619301002B9D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:57 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CCD83844BFF
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E5AED1A0074;
	Mon,  4 Aug 2025 16:33:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/18] python3-inline-snapshot: upgrade 0.25.3 -> 0.26.0
Date: Mon,  4 Aug 2025 16:33:32 +0800
Message-ID: <20250804083340.1649-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118844

From: Wang Mingyu <wangmy@fujitsu.com>

Changed
-----------
 now have to specify test-dir in pyproject.toml when save tests in a folder other than tests/ in project root

Fixed
--------
 pyproject.toml is now also located based on the current directory and the pytest-root, which solves problems when use inline-snapshot with uv-workspaces

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.25.3.bb => python3-inline-snapshot_0.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.25.3.bb => python3-inline-snapshot_0.26.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.25.3.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.26.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.25.3.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.26.0.bb
index 4f7949bf41..3296210017 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.26.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "99fc959d1362443b7551246d787f80c4c1d7cc69963ac018caeda3f0a0b3736f"
+SRC_URI[sha256sum] = "cfb66e4c11984eaa9d258c50a6e56fc57bc1e91d253acb4312968899e3f7ad54"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


