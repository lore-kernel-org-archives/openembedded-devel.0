Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36350FD7F67
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92443.1772187253999427039
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r+dcca+H;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187255; x=1803723255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vmC6If7Qx/xzE0JUxYfGWxMQKt/xXGTcZ7OfndyAUgU=;
  b=r+dcca+H+8B+4wEnwcWElQ+m6XePdaC56nwV5NcuQ+OmLrNf0RmMhPeX
   7eYUWpc30Jar+DpNkoirKAT+VydsFmFsEIfiP7lH1ybA09U3ZRzwBV1EM
   sbdusaqU6yrRhOEn/ECD2qvowx0lrUt4255AgfNEkv6x4AaYsb91w8Awi
   n5VFGik0ZP5fH9wwSUC7ffmzE/lxGaLU8QfDoC7dh/dNYpf5NV6SJmxmc
   uuhkM8AqFhdkywJZk8A3LrI5TQuFzjDYtiNh6jMjEanW7AFJiML2ZlkPx
   HaT+9a6Z0D4b/lAWhWCYxLjd0c+U+VqhRZeZb7MXGarrNsKzeBQlRHJZr
   w==;
X-CSE-ConnectionGUID: UTokWrHpQhWQH/bueA+e4g==
X-CSE-MsgGUID: EwETxGP+Shi4Wn+ckLUNmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210131557"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210131557"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E2AA142A311
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:14 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 95BD01005940
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id B86EE18005A1;
	Fri, 27 Feb 2026 10:14:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/52] python3-ipython: upgrade 9.9.0 -> 9.10.0
Date: Fri, 27 Feb 2026 18:12:51 +0800
Message-ID: <20260227101327.1432-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124716

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.9.0.bb => python3-ipython_9.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.9.0.bb => python3-ipython_9.10.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.9.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.10.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.9.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.10.0.bb
index 53d334e251..9b9c6ce34a 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "48fbed1b2de5e2c7177eefa144aba7fcb82dac514f09b57e2ac9da34ddb54220"
+SRC_URI[sha256sum] = "cd9e656be97618a0676d058134cd44e6dc7012c0e5cb36a9ce96a8c904adaf77"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


