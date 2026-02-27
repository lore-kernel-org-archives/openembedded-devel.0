Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293C8FD533D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:13:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92725.1772187224658446328
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TKKQbNOp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187224; x=1803723224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vk9RtTURmWVebXaDCHQKkKce/3c9yH1Olvmhwqoer4=;
  b=TKKQbNOpRUP0ncBOG/qcXVT3SsoW3P/ywlU/JoZBljn3OI4gl+WXijME
   vFcyjVsvf/XIif3buChuU/OfMZD2gkIEseSjhWdws/mgqes+TJa+etG62
   jDvKPup4pbsddIwBHrjvp1rNVFfMxnzszMbfK4TIrZQI5svk3qUL41q36
   B3nMQV1nwgmoRdKdUVtLRFkVzkLzn2E6DtofFMHdPq3XUR/EAAYZ0xFV8
   VZr9kvMZYjucH+Qhv+D6/FuITZQ0ehOn6/FueK7QLu5brCPOYId3Bvnvj
   W05JJ90dhU6Nk7C31D1BfN06y8jStTMppymQ+uq33sPAciG4PNRZr9FoZ
   A==;
X-CSE-ConnectionGUID: +H3WH7c7SHS6DPvmalnfDA==
X-CSE-MsgGUID: JNGlQ7jUT2qjuFp7e2v+RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231987853"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231987853"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EE1D41568
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A539E1009E19
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D4D5618005D0;
	Fri, 27 Feb 2026 10:13:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/52] python3-cssselect2: upgrade 0.8.0 -> 0.9.0
Date: Fri, 27 Feb 2026 18:12:39 +0800
Message-ID: <20260227101327.1432-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop support of Python 3.9, support 3.14
- Support :host

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cssselect2_0.8.0.bb => python3-cssselect2_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cssselect2_0.8.0.bb => python3-cssselect2_0.9.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb b/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
index 20165a098c..7353e498eb 100644
--- a/meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "cssselect2 is a straightforward implementation of CSS4 Selectors
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa7228954285c7398bb6711fee73b4ac"
 
-SRC_URI[sha256sum] = "7674ffb954a3b46162392aee2a3a0aedb2e14ecf99fcc28644900f4e6e3e9d3a"
+SRC_URI[sha256sum] = "759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


