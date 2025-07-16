Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEAAC83F38
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.15677.1752648079852454607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X/wj4ClO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648081; x=1784184081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=phF0mKwxIJzFWYryuvdxL8N52WnDOX6IGh1tobkIR7c=;
  b=X/wj4ClOXZWVFuxgo8jqmI9QBUjiCgRV+GzVXrJEk1lWPXYfhBhp/o8h
   NkXVC6KvO9sSPt+KNMkbI+wBFm1Z1mIOImFSJgRBbIHZnJlAuFUZlbW48
   mQhs1ZLLpciVXvD+KCNYKf9U7H+H8rqCgKsQDBoN/FLebKmmF2nn3zTHw
   mNkqTgk7IDLOWFYwj2uQ6lVl3btZmMyEFXnSOMM7H3up6W3ddj0K5pqzB
   ar5TZkaRp19QAjYPCNCO0PaDI7ReklZsqMCBC9WsZabrYQY+nIL6yv4xs
   pzQm3wip87DzW85IIiWWoAbG/a54Lu6ESZg1IZiXmDThaCMjoFvtv9i7X
   A==;
X-CSE-ConnectionGUID: /GGOS82UTOCcB7dJ3zXk7Q==
X-CSE-MsgGUID: N93SeF0+THSDeHDvfxnpOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="206430585"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="206430585"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:19 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 04A8B184A
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 55B9910001F9
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8AE831A008F;
	Wed, 16 Jul 2025 14:41:13 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/14] mtr: upgrade 0.95 -> 0.96
Date: Wed, 16 Jul 2025 14:40:54 +0800
Message-ID: <20250716064102.1813-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118577

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/mtr/{mtr_0.95.bb => mtr_0.96.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/mtr/{mtr_0.95.bb => mtr_0.96.bb} (91%)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-networking/recipes-support/mtr/mtr_0.96.bb
similarity index 91%
rename from meta-networking/recipes-support/mtr/mtr_0.95.bb
rename to meta-networking/recipes-support/mtr/mtr_0.96.bb
index ac8b48e4e5..9008223264 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.96.bb
@@ -8,8 +8,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
-SRCREV = "852e5617fbf331cf292723702161f0ac9afe257c"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https"
+SRCREV = "f392168771570b0fdc104c38dea6bbc2ce585710"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV}"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


