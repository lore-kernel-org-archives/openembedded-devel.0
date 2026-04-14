Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB72EED7BBE
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15989.1776163238016945631
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h28KXiS/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163242; x=1807699242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PwJubPbbCjZ0k5RT+mOHEVjB6uYGtEwXpCDhQlopqzo=;
  b=h28KXiS/6AFpaAsWUDtL0i/9qcaGQP+rJggeA/xjIPcoCMXMZscijWi2
   DsUdVBZNjsWx1VCYL8bw0oXkHUSt70/IUZPUOlYP7jf5kFlbmcHmwiyo7
   MD4xDHfauhfSEkgOL68kjZx9k/rglFVIverjke3Cn1FJRDZuq80oCZBP1
   V9N4J/TZFbCo03hZXkUYGCE3RCrGZ4dYGRu/C9P/R5UPBNZBdAl+eAUl+
   wsTgeKJo2DckW6W1WWPkW5LJ8584Ycm5etG2yVvqYvUKKD+kaGlBaNvQU
   /FwJmNBX9FmP6sdUBTxrDWY7sJ8d3B2USHgA7t6LL6Jz1BTCriLNlOCEy
   w==;
X-CSE-ConnectionGUID: KaOm0JRuRciAPlWjHth1bQ==
X-CSE-MsgGUID: w+9SOv6hTsKih2vghg7sUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="225584022"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="225584022"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6B2805C1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:42 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 161CFC00567
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7948414001D5;
	Tue, 14 Apr 2026 10:40:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/32] python3-tox: upgrade 4.52.0 -> 4.52.1
Date: Tue, 14 Apr 2026 18:38:41 +0800
Message-ID: <20260414103845.1728-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- use normalize_isa for architecture factor matching
- fix(pip): invalidate install cache on resolution env var changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.52.0.bb => python3-tox_4.52.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.52.0.bb => python3-tox_4.52.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.52.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.52.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.52.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.52.1.bb
index 57b780ede0..dbac6deed8 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.52.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.52.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "6054abf5c8b61d58776fbec991f9bf0d34bb883862beb93d2fe55601ef3977c9"
+SRC_URI[sha256sum] = "297e71ea0ae4ef3acc45cb5fdf080b74537e6ecb5eea7d4646fa7322ca10473e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


