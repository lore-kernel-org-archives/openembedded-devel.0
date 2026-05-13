Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71774CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148.1778645507604880163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HVCaT3zV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645508; x=1810181508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S7Bfg5L/OYz/KDxw4Yer7OlLoJLVWX1ppTQ/4gC6kLg=;
  b=HVCaT3zVK88i+SRtuxP44FgKAPom/3NWHYVxlHmryH74p+NM5eR478iI
   0f60rztKUwkH/kbnJOuGCcy6840TCcw3b69ZzMLLMUZgUdhuhwvhr3a2W
   eUZXWrI83CWfZyCYGSS1r/kheteMWsBWjgB/JcQLw0Jb+tKaVC7Jc4ymr
   dfDv3tm97DPwk39th7vIP65nuSlnH+hJRQkbyx7nWhB1U/v/jiY92qlwq
   kOTCOctfhjESWjaqHb1or+kraluCjgg/oi2YRNNBUHLavlaWtMZrWv7rL
   bzt2XPgzzdx3zQMRklAwPLO2rsCdHGSWUS6u9g8Mw+kzrF7lwuk8XskK/
   Q==;
X-CSE-ConnectionGUID: ikRMxN+jRgy2r4CXa/y1Wg==
X-CSE-MsgGUID: YAJj6d5RQtu/h7aY5LmZmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214377"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214377"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:47 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BFB2D1002BA2
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 79296180027F
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1D5EF140025A;
	Wed, 13 May 2026 04:10:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/56] python3-parso: upgrade 0.8.6 -> 0.8.7
Date: Wed, 13 May 2026 12:05:32 +0800
Message-ID: <20260513040555.377-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add PEP 695 type parameter syntax

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parso_0.8.6.bb => python3-parso_0.8.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.6.bb => python3-parso_0.8.7.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.6.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.7.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.6.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.7.bb
index 1659f1babd..0b2f188e12 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "2b9a0332696df97d454fa67b81618fd69c35a7b90327cbe6ba5c92d2c68a7bfd"
+SRC_URI[sha256sum] = "eaaac4c9fdd5e9e8852dc778d2d7405897ec510f2a298071453e5e3a07914bb1"
 
 CVE_PRODUCT = "parso"
 
-- 
2.43.0


