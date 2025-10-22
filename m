Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F152FCCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4836.1761099794470936316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IwV3YQmm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099794; x=1792635794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0mPEEDxhMqxHclwSNPbBMG19WEGpEbgdFJma8xRa33w=;
  b=IwV3YQmmDUnB99HwlQ4wxgRC18/rxtwoECG+8d4unazK2EjFjMnreN+J
   OJkUxM3lNF7Q6SIDrcAF9gVVhoTFTejacztS7zkT9izh1rPH9DA6swPi0
   hKygOtubTFsf283ZtgDhG2JxYWSH0DciEnO04704LxVqoEnbu2izQOm0V
   AEzthzJBD5akTK1PL/NQdPwrLOh+a5Qbatxt+hlhSTUxYPmIs4InfscNl
   CRRbVVvVJS+Ev0sF1+QpivEHi/ByRv9zA8qNwgLliuXAkDPgEljhnOUwT
   kMonafb2LbX649n29RUgsj7P8MEB8nFnZ9cvn1GO2bBEwX3Ix12gWIGxN
   Q==;
X-CSE-ConnectionGUID: qVngMR9URWi9QFAUszPakg==
X-CSE-MsgGUID: LPNzRadvQhOVyzh10/CMpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="204646545"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="204646545"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:12 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B7BCE407578
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7496E1000469
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DDE2E82C0E6;
	Wed, 22 Oct 2025 02:23:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/29] python3-mlcommons-loadgen: upgrade 5.1.0 -> 5.1.1
Date: Wed, 22 Oct 2025 10:22:16 +0800
Message-ID: <20251022022227.226-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120867

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mons-loadgen_5.1.0.bb => python3-mlcommons-loadgen_5.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.1.0.bb => python3-mlcommons-loadgen_5.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.1.bb
index 7bb2e9d4dd..f607dcbcc1 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.1.bb
@@ -21,7 +21,7 @@ SRC_URI += " \
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "d7829729a8d5503fa02cd758f39c3ae6f96d743420ee841027cf7addc165890d"
+SRC_URI[sha256sum] = "4059adc2c3cf3655d605f90c510aaf49bf5017fba7c0d85501bc22a90794e4f9"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


