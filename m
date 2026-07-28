Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59046C54F5B
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5636.1785218840901881105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I4toGjgw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218844; x=1816754844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EKdxThCobdHc8xRUvfg9R8jpuZrQB+ZQia93mpbCJqE=;
  b=I4toGjgwv3NoY8LF+6KqwXEU+92/JI1m4kDXnYaO2s8SGgthmHfnei+B
   PaW2mJpdPMxDcctI6nNdSVGAGoZYgUumeRRfGIotojVfpUTJQS7l+eeiS
   q1SjA1RZwV04hHnKFC8Eo2Sf0EPxrFQYdDEuLpfAS62XYCzT+Ij/tQQvA
   Rp9Gy8gevdmrl9zWuURAN7EYM7oLRyKZ548pXk/As3Z6pMSs7S8oFdWR8
   XWx1GzxHcSKsyQuJPGTfJlfzbh9nmUfX/TbCL7nhijfoBMXoXVfhgushu
   NF7KzxgkSHxWe8TjPpYNeDQlzL55rIGzoScNXs+LH8oDKZSYb9CC6eBFQ
   Q==;
X-CSE-ConnectionGUID: D+njz9zaRFCkLK5Z3M6Iaw==
X-CSE-MsgGUID: 1CRy6qm8TuSt4v6qCGpo2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248843311"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248843311"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:22 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 14A5A307B
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C02DF1025E9C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:18 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 194A810005F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:16 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-rarfile: upgrade 4.3 -> 4.4
Date: Tue, 28 Jul 2026 14:06:36 +0800
Message-ID: <20260728060645.819-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128494

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rarfile_4.3.bb => python3-rarfile_4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.3.bb => python3-rarfile_4.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
rename to meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
index 9fce84bc56..fe1bc7d7e9 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
@@ -8,7 +8,7 @@ inherit setuptools3
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "0d8b5a7ffb9f8e9a7b002f2398905e4420c0cb373e799b48e48f418db9c8816a"
+SRC_URI[sha256sum] = "b7d29d671223cdc80e8b992df212d152ad88e6c961d4426c3fb2fefe8dd86fdf"
 
 inherit pypi ptest
 
-- 
2.43.0


