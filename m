Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C823D2D8CE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6885.1769507065161131078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mFz1T9DM;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507065; x=1801043065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYnmG9wWA9ecGdj3xqWZAsJuPVWbKA9jR0NHifYL5VY=;
  b=mFz1T9DMF2qIVmoliHf2xUx+9pmJLwNUgD8N292HBEmN1alBoRh/pBwa
   3R8vEneYMm6CRWRavtRe84xt5nm949TxVWoGDUa1b1bqwUOY1aGuPT1Lb
   glaKuait3cYQbYD7G3Na2BpqiKkuDyyicvzgPp/fzif/djxMbkhW1Md/q
   fBgQI8GustUMTvXQjktsAjW3laaKWddO6iJnaXCTirYdfUsapLbRDUbdM
   FpTbdsaTcQfhmAs5C42Tw9XPaUdZMtqWOYu2UWfukxk+gLGYGkBfI79f8
   H9aIdLI1X95qjkWvpA6NZIfRzwXbY17ysNUoUCf3C+LWZYMvG6yAQeIyq
   w==;
X-CSE-ConnectionGUID: 7zEEDfyxSY6HeBG91kMHCw==
X-CSE-MsgGUID: dSDk5VAnQ8yxZZL5ul+nqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206239848"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206239848"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:23 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B2728C0034E
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:23 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6C5D81401253
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C23D92000218;
	Tue, 27 Jan 2026 09:44:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/25] python3-gunicorn: upgrade 23.0.0 -> 24.1.1
Date: Tue, 27 Jan 2026 17:43:31 +0800
Message-ID: <20260127094339.1081-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123923

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gunicorn_23.0.0.bb => python3-gunicorn_24.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_23.0.0.bb => python3-gunicorn_24.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_24.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_24.1.1.bb
index f629214b5a..f7951b9b32 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_24.1.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5b70a8b30792a916f50dc96123e61ddf"
 
-SRC_URI[sha256sum] = "f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cba004ec"
+SRC_URI[sha256sum] = "f006d110e5cb3102859b4f5cd48335dbd9cc28d0d27cd24ddbdafa6c60929408"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0


