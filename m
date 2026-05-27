Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FD6CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16931.1779875326730967733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B6o0vITR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875326; x=1811411326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GvnBO5UUdRUvHsEQwKLYQV8rY7aZ+7i5P3jCm+3j06Q=;
  b=B6o0vITRlZc3mmHKEsdiEsRPXqH+LWuOM24Y5j4ov57kMVVJokDRpOzZ
   puMGPywEfCUgiUwFUGpHI3PQI2hAdHQAI7GjUvLEWRHFcoAVYZeCVQ4Mn
   /b+CMMeXqLJT7BUlQEN+f41nkznAtR+f3MjMIcqUv7oBuaa/MPe5LTScm
   6SqGkpV+nZTll38UtRYVF530uG1j6B2o1d2m0vBXT2YLu92L1PHqrFgfO
   pGFVrn4IdT4Tl8EDn3gQ1BU32Mbh7jOksTaed65tbltnxvuXSb84pXMYI
   iHS2AEsfPX9dP1qBj0dA1rq/YkPEtcXCMp9wMwNoLuqPRoq6ZSmuF7dch
   g==;
X-CSE-ConnectionGUID: 1gJMrMzMR9e1ffGFVA2r8w==
X-CSE-MsgGUID: X9W8XAG8S7CereJesLxIVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241434765"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241434765"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:45 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5AB983FE1
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:45 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0DA1D1C2FBAF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1FC2282A2C9;
	Wed, 27 May 2026 09:48:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/56] microsoft-gsl: upgrade 4.2.1 -> 4.2.2
Date: Wed, 27 May 2026 17:47:25 +0800
Message-ID: <20260527094805.2039-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127223

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix MSVC's C4875 when compiling GSL 4.2.1 with latest MSVC toolset.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{microsoft-gsl_4.2.1.bb => microsoft-gsl_4.2.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.2.1.bb => microsoft-gsl_4.2.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.2.bb
index 87a8cbbb88..3d795878b2 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
 SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=rel/4.2;tag=v${PV} \
            file://run-ptest \
            "
-SRCREV = "249146590e322123cd0b378b1f364d6069717687"
+SRCREV = "152d6eb989a1ecd23fe9c9cfb2fb8cfc7c0cd0c1"
 
 inherit cmake pkgconfig ptest
 
-- 
2.43.0


