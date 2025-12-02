Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE549D11700
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4301.1764669143486928621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OPjPXmIC;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669143; x=1796205143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TnAiBO+6DIbMr4Zer3zto7C+BgMmqHwD599zofrEYXQ=;
  b=OPjPXmICw0wHYyDN6i2DUcMvmZcmA20CvSuWvfLXRzX+tnMu+QHbwDRO
   VTj06NLePVsVRdwISZd2vRJ9uNk1iPtOqS+T/4jhkMNrHReG4hZzBvNOc
   tpoto3wJh8vC5DvLImeDm1K83PEKUYjLZ5/QVUDzBFcHm9DHvp9s/mSnd
   hNjj93tKCNLg/SMszG1shz9ghwcrFrQV3pxIptVaZp5zCNV7lXl3P6vWz
   V9eD+MimQAwNBpmUg/mzBRaRk26O/KPpvGAAY7NL9jBw+gYAuso7rBjEt
   Rap1i+kJtVPh8g5JXbGy7oxuP5X9/YJT42E61Rf6FIddosdHzxksy7Cvt
   A==;
X-CSE-ConnectionGUID: FeR5kyHWQ2SiL5IDaiZt8Q==
X-CSE-MsgGUID: qHe9Jb3rRGqe4EQcQ2FJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200140688"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200140688"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:22 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id F15EC1C1C715
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:21 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A1B6A18000E3
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 26B0C101A43C;
	Tue,  2 Dec 2025 09:52:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/25] python3-werkzeug: upgrade 3.1.3 -> 3.1.4
Date: Tue,  2 Dec 2025 17:51:29 +0800
Message-ID: <20251202095132.652-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122255

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- safe_join on Windows does not allow special device names. This prevents
  reading from these when using send_from_directory. secure_filename already
  prevented writing to these.
- The debugger pin fails after 10 attempts instead of 11.
- The multipart form parser handles a \r\n sequence at a chunk boundary.
- Improve CPU usage during Watchdog reloader.
- Request.json annotation is more accurate.
- Traceback rendering handles when the line number is beyond the available
  source lines.
- HTTPException.get_response annotation and doc better conveys the distinction
  between WSGI and sans-IO responses.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_3.1.3.bb => python3-werkzeug_3.1.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.3.bb => python3-werkzeug_3.1.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
index 73029eccc7..2cfb5864b1 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746"
+SRC_URI[sha256sum] = "cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


