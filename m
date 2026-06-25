Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74453CDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7004.1782378113498773788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SpfPQDsT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378117; x=1813914117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OOw1tZMcspwA6Kor26A/5dpD/JfS+Xsf4mYFLRCvqQQ=;
  b=SpfPQDsTQMRds0yO4WRT+QN/zdQ3Kf6Bg6ZkfUTkU7YHnlCL4raPgVtN
   G2yV5vsIZZb7xCbT+Tv4zPzBiOeDhMLnzwbyL2k5XGF6c4ig3bhAXRIuL
   58YWblmrXtXnCrnYXBZOfgIj/8oRta2uwHCWtlf1DoduoiPzYIlJ+sZm6
   5HBwhLBqCUe8R6n+N41CYZHau4m8AuH9nSmdALRigeiIw72rDtVGI6CJZ
   D7vYIF75kui5aAZF+mhwsi3EVTm0YuxONAFNB91OkiYp8EsCWWAkbPAFB
   wvzD+b3K0ge0Tqa33VRAqborCTz+Ja4KgjA9nooJfK5l+iqB59SwYGCmP
   w==;
X-CSE-ConnectionGUID: daWSClz2SZGN2G0ToRCpUQ==
X-CSE-MsgGUID: utZY+geyTKmp6l6mLUtG5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="243444586"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="243444586"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:56 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0380F406EC7
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A5CE7103D5BE
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B6FC1101732E;
	Thu, 25 Jun 2026 09:01:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/47] python3-anyio: upgrade 4.13.0 -> 4.14.0
Date: Thu, 25 Jun 2026 17:00:55 +0800
Message-ID: <20260625090127.1563-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127747

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.13.0.bb => python3-anyio_4.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.13.0.bb => python3-anyio_4.14.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.13.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.14.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.13.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.14.0.bb
index e3e4fc9f7e..c1066d21e9 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.14.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
+SRC_URI[sha256sum] = "b47c1f9ccf73e67021df785332508f99379c68fa7d0684e8e3492cb1d4b23f89"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


