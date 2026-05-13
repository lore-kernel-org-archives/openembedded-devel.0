Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B75DCD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.244.1778646015755159242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HRlYMQ8R;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646016; x=1810182016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IEALSkacd5xJYGZBVaoVaAlLQuenW90YhHSnedai7lY=;
  b=HRlYMQ8RGKZT6Zf1Lrc3nLPztC0N7FQMbfkt8lD1BKkXb45acc8tkV1+
   6LiM59r7F8iqPayEfgixHcSAOKc5vZyFQZeS8iUj8vBNw1z5MCtMldel8
   Qsv7+6TKaguxLXRbxLCyHaEQAEnRJX7N46nScTXJFiNRB3VzpWP8f7LP2
   knG2eDAINe+q3QZsOJAOFx50SKUGVyE5++bOWyN9yP964gt78dJ6dGbkM
   PZt17r6rK8J5AOWFWOZz3UAxPA/W7AoOx46phz9UAH5ETbRiclparf620
   jhXUIKC/EsBEXhHWnSTezZmKEVnk5Q1yRyoLOPv6ycBGZ1CAZeDQdirhP
   Q==;
X-CSE-ConnectionGUID: ig8Oaw70Rp2BQQAse9opXQ==
X-CSE-MsgGUID: mQe0Z/IESY+nLkWM/h93BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240208785"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240208785"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:14 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 371C41000349
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:14 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D8E1F1C00F8B
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6561114001F2;
	Wed, 13 May 2026 04:20:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/56] python3-virtualenv: upgrade 21.3.0 -> 21.3.1
Date: Wed, 13 May 2026 12:19:43 +0800
Message-ID: <20260513041952.450-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126931

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- ci: retry transient apt failures on Linux
- fix(seed): bump embedded pip to 26.1.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.3.0.bb => python3-virtualenv_21.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.3.0.bb => python3-virtualenv_21.3.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.3.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.3.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.3.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.3.1.bb
index 492d1ff731..100f249d00 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.3.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "733750db978ec95c2d8eb4feadaa57091002bce404cb39ba69899cf7bd28944e"
+SRC_URI[sha256sum] = "c2305bc1fddeec40699b8370d13f8d431b0701f00ce895061ce493aeded4426b"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


