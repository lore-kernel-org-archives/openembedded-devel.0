Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573E8C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7613.1787731774832086305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CnkGHAVL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731779; x=1819267779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VY+ZtumaXG7EePDW0jaYfZRLCr7F3fN0BYLuI+TgvI8=;
  b=CnkGHAVLPV/RJAC8PGz7Wlt7NzylG9bAXYybAlGwI2iSckoZYahVdDUo
   7lVknfMw+FdJZn6/dPZtwkTYvk5hMITKAo6Cix+sMex9feCnAyJP6rPjh
   GX4l91Mx9bgPqkQ8NJL1TdFxlj5vXQ8YEAaygcYjENo7j2ENHp09rb+GL
   xubm+zGlwUIsoTkAIV9vSfHP4oCEfRMR4p79ag7kOnu9+QW0KCu3Nm5xg
   m3rPPZBViya2tX2ayvlzQLE+SRuClSvl9gn9DDrwYa4sBVYpheJzQpHy5
   Axvj3WLrDpCorhHvux4AWOVpj0QAKJTHlrp+/LoOI26spb2pxn9ERjIJd
   g==;
X-CSE-ConnectionGUID: bW2vdl6sQsqcy6SgtUk3ng==
X-CSE-MsgGUID: wgHbQscFQ1ygp15/kjX2Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240666564"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240666564"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:38 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 754A742A30E
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:34 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2932C1C17292
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3517414063AB;
	Wed, 26 Aug 2026 08:09:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/23] ctags: upgrade 6.2.20260816.0 -> 6.2.20260823.0
Date: Wed, 26 Aug 2026 16:09:05 +0800
Message-ID: <20260826080926.989-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129494

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260816.0.bb => ctags_6.2.20260823.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260816.0.bb => ctags_6.2.20260823.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260816.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260823.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260816.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260823.0.bb
index c7cff997b2..0f01c137f5 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260816.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260823.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "8495a124e859685a21fdf575b83955ce8e7c48f2"
+SRCREV = "f25245f010f206c251005614c6c41be3b49c6cab"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


