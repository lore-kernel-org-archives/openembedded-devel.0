Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DE710A3D65
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45653.1774526255465272353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QQELYAMq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526255; x=1806062255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nkJyxNek/mum6ngDPYEWS+UgCYx1MXa9YvkylzxfO8g=;
  b=QQELYAMqkcM1gGeVo4MhwzCQ+DnbtLRI4lHaioKqZfQ2Az2ktnjlHU7S
   VZf5bLgHdiQrZtMAcoGCE+KmHIyjbe0WLQrBJKe47zWixpOeHticjOk0U
   /CvSZGLrU+wNlq08CoFJ/pNKtU3HdQYw2U78mo4S/yLMLvQT3Nxyg5TUp
   HJQ3ZzntKVjydkXe0XSihsUwBowR0FweAPY3LSenDOdV80M0OCu+xnrK3
   inIIH/VbnHokNPSN2PCmbCxHJABSEHkz3sttjx2cKV/rJF7DHXgWcwo8K
   FCBeOz9Q9xdfPMD+IFu/+o4SR0Pw5l/Q1F2iQyp5Iil+BumDxtT3hnWbf
   A==;
X-CSE-ConnectionGUID: RXU0zttBRTyprhRHpwQS5A==
X-CSE-MsgGUID: COpVbMkTQ9uANTA7UYPnIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647292"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647292"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EB5B3483
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9D3361800E8D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2CC751807148;
	Thu, 26 Mar 2026 11:57:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/63] python3-filelock: upgrade 3.25.0 -> 3.25.2
Date: Thu, 26 Mar 2026 19:56:03 +0800
Message-ID: <20260326115634.1199-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125688

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix(unix): suppress EIO on close in Docker bind mounts
- docs(logo): add branded project logo
- fix(win): restore best-effort lock file cleanup on release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.25.0.bb => python3-filelock_3.25.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.25.0.bb => python3-filelock_3.25.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.25.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 91faecc92b..6f1a32ef8f 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "8f00faf3abf9dc730a1ffe9c354ae5c04e079ab7d3a683b7c32da5dd05f26af3"
+SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


