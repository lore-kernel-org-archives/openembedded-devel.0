Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4712BCD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.120.1778645426766416257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rEiqheSl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645426; x=1810181426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IMTUTfcFQ+N7x3fln0NLFh61UQEANP8s9A5eXlpqjC0=;
  b=rEiqheSlvuWNfr9zXo9KfaQCQlEqHDUHzbzJA+N7OA7Sq5UmeILc3v9u
   BKfxXjKZ5w8fuD7S9ch0zyXR68VedMMnpG6Dbl4OaotGVGhQboP92HYNr
   6iEJIrjj9Lv3gb2+uMfqWCMa7bzQWQN/PQLWcooBO/fzjTlhVbwpu+o45
   BR5kUTLqFkAvTE3frrPiXN2IlE+9hwgIBbMVWM3YI9yFXCsqBAM9J6ANA
   vK4xt5FBla9hHX3lM0KU537j+UbyY0DfPussJJBgIHvpCKR3qIyFEIiJo
   p1g9ovIPjfjOv2Zsyx/Ps4STYjXftRqg4Eu8PELvNsDSB5gaXAiA4XFPT
   w==;
X-CSE-ConnectionGUID: 9usa0Hm8QJuXAb37Zh2ABw==
X-CSE-MsgGUID: 5+E5QpQnTBildqz/8gP02g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240265490"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240265490"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:25 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 214F21C1C71C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:25 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D1CFDC02F1A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 73CA014001ED;
	Wed, 13 May 2026 04:10:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/56] python3-drgn: upgrade 0.1.0 -> 0.2.0
Date: Wed, 13 May 2026 12:05:21 +0800
Message-ID: <20260513040555.377-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126907

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drgn/{python3-drgn_0.1.0.bb => python3-drgn_0.2.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.1.0.bb => python3-drgn_0.2.0.bb} (97%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.1.0.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
similarity index 97%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.1.0.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
index c2b4d9404e..09aef3a4bb 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.1.0.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
@@ -6,7 +6,7 @@ LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "26dd4435315e6735cfa7f4ab0713bb1533a94750"
+SRCREV = "818b5a7e8a4db82a1e0326667e7afaec5bf5fd19"
 
 
 DEPENDS = "\
-- 
2.43.0


