Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E78E7543D
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117714.1766567669746255912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iEiummte;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567669; x=1798103669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s4KjRObTywN4Rxrjgw7KlgzzeTKB8ISVNBi6HhfA6Ms=;
  b=iEiummteC5i65GHVMHKX/zN7Z0pu3d+J5IbzjSp8lSzgyTNBeRDyAjui
   CTYdhKHZYLPbn7qwKQmNF8avC5TOAInECmpTyHUKqw/kRHD3LiE3VG1Bj
   ZdTqU/Uq2jtzEutFPr2laWWSgNkxMSX8UXvf2nZdLq1xBkwZ6OR4L3mLI
   oogWKsFYA89ot4APIBcLK/bdconDhmFxWzBEzGYARZAy38vk7zG0QPPGn
   CfBCW3lYScGyjsSEZUqsdbPwDWYTdrxQDF6CshdSQizrlfYrZhMYSzwQJ
   lU2JVGZEYYMpzRNyEL1uFnYTaHmPSepZLrC1goFkPlw8unMSj2rrHPVsN
   w==;
X-CSE-ConnectionGUID: TxfnyxwbTqiYj0/11Jb5NA==
X-CSE-MsgGUID: wK/lfmQ6S9W9wFkzE3BCCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="212367948"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="212367948"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 554D53069
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:28 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0947E1C00133
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5BC3B200076C;
	Wed, 24 Dec 2025 09:14:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/28] python3-imgtool: upgrade 2.2.0 -> 2.3.0
Date: Wed, 24 Dec 2025 17:12:54 +0800
Message-ID: <20251224091304.974-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122868

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imgtool_2.2.0.bb => python3-imgtool_2.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_2.2.0.bb => python3-imgtool_2.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_2.2.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_2.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-imgtool_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_2.3.0.bb
index 192c8e895a..ed647143cc 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_2.3.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=0645fb61e2f961a110302fbfdb227446"
 
-SRC_URI[sha256sum] = "5c873a11895e36d0eb99e8366a43a3ae2270cc4f419e36b693428918255164cf"
+SRC_URI[sha256sum] = "fff72e4e793ac0ec02a493c19548715ccc0a2358afaeeaa10b49ccc2e0bd1295"
 
 inherit pypi setuptools3
 
-- 
2.43.0


