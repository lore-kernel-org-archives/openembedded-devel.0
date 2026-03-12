Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BC81125867
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:37 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18763.1773312809822921535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nPx88Fdo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312810; x=1804848810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pSbgkJt5T+Ne2ct4C9oi27FDYeaVWulPzYlRXVBBJ0w=;
  b=nPx88FdoCMiFu9UAX1QStjUkfTip6mST79gfEEHi8/jqTqHhSB8Z0WHv
   /ogJQNfsBQGhwYvp44bFnt6EAL28MyDM9HX3jYvV1MGBC11BlF+OVjjQN
   pCyMu3FnvaUuPJth+swuB/bp3aGkORpGwmtbIGt3uZCjkOsuH6YpKlJam
   xMGcFLoVVy/NvPeHZqbNALuSumDHjy9lRc28RChMjnSuuGQvEVqpWy2jE
   VMj16APWzIqIBv+DLHUU9/ngKC22T84jTkT4CbHdjSVBeOnAwImBrvkZj
   Eb6drS57aqIrUPvjR/H3vetPcqMJSHQcW/Wv7OQTj7ayBw5mOny7HpiuP
   Q==;
X-CSE-ConnectionGUID: BgwKSfvgQMibTymPYPNiaA==
X-CSE-MsgGUID: 87kCL/eEQe+EFxcqlhiY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824360"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824360"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 508291C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:28 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F264EC02E45
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1F11C1801925;
	Thu, 12 Mar 2026 10:53:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/64] python3-charset-normalizer: upgrade 3.4.4 -> 3.4.5
Date: Thu, 12 Mar 2026 18:51:45 +0800
Message-ID: <20260312105220.1856-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125129

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_3.4.4.bb => python3-charset-normalizer_3.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.4.bb => python3-charset-normalizer_3.4.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.4.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.4.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.5.bb
index 38086ca017..e69d7536a9 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
 #SRC_URI += "file://0001-pyproject.toml-Update-mypy-requirement.patch"
 
-SRC_URI[sha256sum] = "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
+SRC_URI[sha256sum] = "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
-- 
2.43.0


