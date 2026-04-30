Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA28CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17249.1777546246945321106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D20SSeDx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546251; x=1809082251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6DBgcGkwH42gR5EKf89SQSvh/aQV0Y04EnqF0B8ZMlU=;
  b=D20SSeDxgjWNb2lV5QmGF9TRPzovDDJ7vtWuvmMH+QbKSsEl5hUfBaP4
   YuEXCsJZAc3ewexiV4JLkGB3V7Saj+0RLhQ2ijPMikvlxAOtcLGQx3+ec
   BPd+8+O7nmqFcdGZTKSuk+zE972IM2CeXleMdQ0QpQ4nNag0/V+AYd7ly
   MgAtkiJU8cSEeFFHxHQfcjFyvtpSCGTgVyM5tgZhl6evSykhuLKrSt2LP
   JsqjkyoZTL5JXvYNnOghwUz6w10ipUIhM0AzOfdyXG79ljTRAfeHH3+nm
   56hRdzhOsmE8xvXqb+CgmJ5biiPd3aNeRpQQpKa+vzuEjcnAzyrGzZ3KT
   g==;
X-CSE-ConnectionGUID: pV+6G8DbTcm1mMtFd7rNKw==
X-CSE-MsgGUID: 7h86h39PTV6OZDOlSivdcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226101035"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226101035"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:50 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 96E4C426E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:50 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 411FB1800E9E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AAAE31801137;
	Thu, 30 Apr 2026 10:50:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/64] python3-typer: upgrade 0.24.1 -> 0.25.0
Date: Thu, 30 Apr 2026 18:49:10 +0800
Message-ID: <20260430104924.1106-51-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126721

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.24.1.bb => python3-typer_0.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.24.1.bb => python3-typer_0.25.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.24.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.25.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.25.0.bb
index 6538f16f0d..c38fbc9761 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.25.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "e39b4732d65fbdcde189ae76cf7cd48aeae72919dea1fdfc16593be016256b45"
+SRC_URI[sha256sum] = "123eaf9f19bb40fd268310e12a542c0c6b4fab9c98d9d23342a01ff95e3ce930"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


