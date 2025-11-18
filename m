Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA3DCED250
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8410.1763456967797027275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MLdyOoPx;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456968; x=1794992968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8RDOflJY4ewcI2eTcC25bM5rbW8W9GxaRzhCW0d0DdM=;
  b=MLdyOoPxK2wmqMOhZvGZuEXo0qNfH7kEe8oI0BVtWoEHO56u1QT4a2MN
   4XAli30PY8HUrlME35fCZiT1IOtgqEcdSklye8m/cqkVAoE8NFqIHhE7J
   N3Q1To+UOAyOM2K+GmyQpQWUAbQRtMCDmlTw3mZ6gZm7GAQW4YlxMiNnu
   uC6GJVQBAisCIF+2F11uKAlEmJHr+u69DvLVPRQWnImlgDEwCLaXK3OEr
   h6ydZLkauSkuI3euOKxGbbc0FL5uffytoyyM5gUqLmh9qR2jLLm3PC3HM
   3ovoMdA1CDR4+KNJY0+WjrpGF+KYny7whu3AJ+3xfN12GqbACjVOmmED1
   Q==;
X-CSE-ConnectionGUID: yYsaK61fRweJaQxl40u/bw==
X-CSE-MsgGUID: Xl1tBsg7RiKQ7dLspEsPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="207570411"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="207570411"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 44EB442A32D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EB2FBC02C69
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6612B140027A;
	Tue, 18 Nov 2025 09:09:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/29] python3-parsimonious: upgrade 0.10.0 -> 0.11.0
Date: Tue, 18 Nov 2025 17:08:37 +0800
Message-ID: <20251118090846.1484-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121831

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-parsimonious_0.10.0.bb => python3-parsimonious_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parsimonious_0.10.0.bb => python3-parsimonious_0.11.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parsimonious_0.10.0.bb b/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parsimonious_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
index c2352224ff..a637c7305c 100644
--- a/meta-python/recipes-devtools/python/python3-parsimonious_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "8281600da180ec8ae35427a4ab4f7b82bfec1e3d1e52f80cb60ea82b9512501c"
+SRC_URI[sha256sum] = "e080377d98957beec053580d38ae54fcdf7c470fb78670ba4bf8b5f9d5cad2a9"
 
 inherit pypi setuptools3
 
-- 
2.43.0


