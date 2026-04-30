Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921CDCD3421
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17231.1777546221601690184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G/7cXiL6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546224; x=1809082224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nZ8PDA0ZBu8S4pnZt52adOgXSddhf40sguMswSKsibg=;
  b=G/7cXiL6Eg+2V3aAJHRv/inDCELeI2lQFnFt9CjOye9/Oa7gbXk/muJv
   QIIBoD8OgZg9nZ8lLwXoOp7xJrBDgTBl2/mIpv7kPKHGilqicnyrFzV5z
   RY5ZI3aW1vhPWRavVRXTRhj+G11K0HIty2ZAC6RRqvPD2+JnGcwyd9+IB
   E8BHBXLzOC5q8f6ht5B8/Gklfw6GWX1SsowiErNJuyitxV+E0DYi6K+dG
   wWbC/IaB8ww600Aq+4C2ylMkv/R54UViO/CN+sOTZvcinMyGGLlyl1Jfw
   4Udhf1pNDHTA2KWYLy0TooVLJoMxSWT+SG8JOhI99mPffxqXbnK6oMLDk
   w==;
X-CSE-ConnectionGUID: ny4pyB/BTrGiPe3u/AvUtA==
X-CSE-MsgGUID: UmucVWm7QVmCV5hRySL19A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238610039"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238610039"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 28BE421EC
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:23 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id CF6511801E9B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4195E1801137;
	Thu, 30 Apr 2026 10:50:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/64] python3-filelock: upgrade 3.25.2 -> 3.29.0
Date: Thu, 30 Apr 2026 18:48:53 +0800
Message-ID: <20260430104924.1106-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126704

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.25.2.bb => python3-filelock_3.29.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.25.2.bb => python3-filelock_3.29.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.29.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.29.0.bb
index 6f1a32ef8f..9957fa224f 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.29.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
+SRC_URI[sha256sum] = "69974355e960702e789734cb4871f884ea6fe50bd8404051a3530bc07809cf90"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


