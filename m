Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201C5CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16955.1779875360519843762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N7/oUtft;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875360; x=1811411360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WhEMJqTPoKG+fKnuK0WtXaBsIMmGOKMhEnhBpi38qBk=;
  b=N7/oUtftCzYtwO/qTucuZ2MPAn9+rEiQlpLMzQV74SVx3QiZqxLPFpSl
   61Rp4C1to2hKsc2P+PQUBnC0QBE1Tmtx32RC6RoZqupNLSYI/Ai+KFVeI
   YzNdyEKlqMxmsFW/yDYc9ra+zzGjLDxdZia2qXrY9KA9CjHoPirCHKCfa
   DN4F/Pjwd6bv91AAuQBmwfpT9KpJtSCbdx9tHaCOidd8Zl1SDmGfNKk/2
   l24+tMLRRJpnc3CMlFTiGEo10R92zI5pcygAlWI62oG3WOjv8iTLbiOzg
   yNJy4FyWD2VqnQkQOFXFcJ9/XJ6aPnIqnQ8ieivIdbFf3LeV2H18kMbYd
   Q==;
X-CSE-ConnectionGUID: qlAJ7NVESBKIZP+S/PLgOg==
X-CSE-MsgGUID: obV8YMXUR8Kjqs9GEhnhZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="219714784"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="219714784"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2B4EC33D9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:19 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D0073C0E450
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E95AF82A2C9;
	Wed, 27 May 2026 09:49:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/56] python3-python-multipart: upgrade 0.0.28 -> 0.0.29
Date: Wed, 27 May 2026 17:47:46 +0800
Message-ID: <20260527094805.2039-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127244

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Handle malformed RFC 2231 continuations in parse_options_header

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.28.bb => python3-python-multipart_0.0.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.28.bb => python3-python-multipart_0.0.29.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.28.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.29.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.28.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.29.bb
index 1c57dc03f2..e792b2d792 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.28.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.29.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "8550da197eac0f7ab748961fc9509b999fa2662ea25cef857f05249f6893c0f8"
+SRC_URI[sha256sum] = "643e93849196645e2dbdd81a0f8829a23123ad7f797a84a364c6fb3563f18904"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


