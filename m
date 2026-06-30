Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFA0C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17258.1782811376060309645
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cMatoQ5S;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811376; x=1814347376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cWPJ8E92bHdmAg5RxKLf17LocCx+JoZ+yNaepP/gs5I=;
  b=cMatoQ5SdI45WkVI52dWp8l5WtGYmUmFeMkS8NyUfQmlcC/CkkO4l6m6
   KHn0xdX1dS9BTuWqzmLOaJLq5Yvws9y6YIr/J4ciYvazO5wc8fVx10Xxt
   pxjvTHxBcBujN6BpXw8qSaVuP+st+iPnTNURyqnwnuOuThHPFwe6l7joN
   TvRrjErTsyxg8/OiMqWtbx6BCMqi40SNOpWO7hZ6GzkOZOZEAxDBz57VX
   iEKBj2NV0f4b88TH3qYDspgK6vCJ6zAufs7N+n74pc64+yfnxs9mn17sJ
   9lwEmjS4PaiBtLuFu+xRgLA9mq+QCBQDs4rbk7mTzHMnuyXyOb+6hzK5D
   A==;
X-CSE-ConnectionGUID: ruwxnHBBQR6aOvCW3g5WSQ==
X-CSE-MsgGUID: tHETi4F+RAGMzq1bOyx9xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233222260"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233222260"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:54 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 72C59C01592
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:54 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2B9A18493AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 42D99826FEE;
	Tue, 30 Jun 2026 09:22:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/37] python3-tox: upgrade 4.55.1 -> 4.56.1
Date: Tue, 30 Jun 2026 17:21:56 +0800
Message-ID: <20260630092206.322-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127970

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix type errors flagged by ty 0.0.43
- Drop obsolete ty: ignore directives
- docs: Use double backquotes for git command in development.rst
- docs: Fix indent misalignment in reference/config.rst
- docs: replace http://tox.readthedocs.org with https://tox.wiki
- fix(config): restore skip_missing_interpreters default to False
- feat(virtualenv): auto-pin virtualenv for end-of-life Python
- treat scalar string then/else as a single item in if-replace extend

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.55.1.bb => python3-tox_4.56.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.55.1.bb => python3-tox_4.56.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.55.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.56.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.55.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.56.1.bb
index 64bc26afee..e3f3d605fa 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.55.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.56.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "0678fbf26dd5b559b1ef128fa4388325920219322ebc8cc5f3497627c00f4472"
+SRC_URI[sha256sum] = "db1c2610802553189cf40de251661d066a635ee0ed9bf2a60093b5f1a7f36ef8"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


