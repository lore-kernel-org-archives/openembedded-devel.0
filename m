Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305B4ED7BAB
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15857.1776163209396328350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LZS64StM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163209; x=1807699209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v4mQ/jtxl8S+SFGd/ldxX+2X2Z6G9OoxwYki6NNbQG0=;
  b=LZS64StM4I2ja6S8ulc3bp4qgmYnQ5lok34/pk6Mjev5osEbR+ZGH6NR
   hUK5Tu1li7q+nB3AnCapXHvSzmlgl7DteFNkb1ZKwz3oHPnfcmpHcWjf7
   mIAygq8hmvb5mhdYbfhkDprrnsZQndNdgyZK+ZHs/pj9wSkSuUSozZnft
   HKvItCzUvn+eHwY9iRJV9cmIbxFsDkGsc/dgpG/oX0yx0fzIijtgRZpE6
   NXQ9hD/J8NqEQBkORk2QM6JUnjf3xfKXWtCjvjjSudtohdXZ5f76HBmsN
   o0AvkQlY5itvwMFGuCdmkvG4avRmDQJCn1lUh9UMkx+pFr+EvXbMAm/sT
   A==;
X-CSE-ConnectionGUID: TetJAgy7TUCidEbDTNEgGw==
X-CSE-MsgGUID: TdNeULafTh+a7w5YrUepZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="224845187"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="224845187"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C877F1C1C70E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7C61FC02F18
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 06C5014000EC;
	Tue, 14 Apr 2026 10:40:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/32] ostree: upgrade 2025.7 -> 2026.1
Date: Tue, 14 Apr 2026 18:38:26 +0800
Message-ID: <20260414103845.1728-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126317

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2025.7.bb => ostree_2026.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2025.7.bb => ostree_2026.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2025.7.bb b/meta-oe/recipes-extended/ostree/ostree_2026.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2025.7.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.1.bb
index 363210b452..af726fff12 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            file://0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch \
            "
-SRC_URI[sha256sum] = "af8d080b9585e7fd1faba8f022967e1c268ae62e20ecf32ee7b364c1e307570b"
+SRC_URI[sha256sum] = "8e77c285dd6fa5ec5fb063130390977be727fe11107335ed8778a40385069e95"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
-- 
2.43.0


