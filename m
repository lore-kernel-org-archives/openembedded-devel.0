Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE678CDE00D
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7015.1782378132562250259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RmQHS9qo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378138; x=1813914138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ltJ1ll9+c8b/7fVp1oFNP0fwOTqh5mKlovRs4G84VI=;
  b=RmQHS9qo2YESb2J/S4Jz14HzA+qLCWFeYGCJQpATN/osmr4YClFM/bT4
   8Cfd0qQRS19G51PVkUnD8VKERh1PZNiaf649HlFw2zHoCFFvg5B+whelo
   NZpX5kCrrryjUhneunpcfe8aSqoewsFVVjGmlmnSLEcR3H4hHzvHTrvmr
   rYShuSp3AjwEBwyoejbnNbazOonfF6fscvXEYl5ydvIod3v72Gmnhg/gm
   HB19otQYFa5vJRWteLXLqu7F6V0Csd76UtR2UZt2QjYAEUJdTbJeCi5cX
   wUxsvZNWkFU4wdK7ilY5lquXk9uN3dkM5X7xQDjvUriR+F3wMgPdcc4uW
   w==;
X-CSE-ConnectionGUID: oBoUKb0VSpquFkK/UkFV0Q==
X-CSE-MsgGUID: gAXxH4BuS5ijbFyNgCjb7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245300883"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245300883"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:17 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6F7CBC00414
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 27236186CC50
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 24F8E1017328;
	Thu, 25 Jun 2026 09:02:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/47] python3-prettytable: upgrade 3.17.0 -> 3.18.0
Date: Thu, 25 Jun 2026 17:01:09 +0800
Message-ID: <20260625090127.1563-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127761

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-prettytable_3.17.0.bb => python3-prettytable_3.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.17.0.bb => python3-prettytable_3.18.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.17.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.18.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.17.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.18.0.bb
index 4e9b53adae..f74b977798 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.18.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "59f2590776527f3c9e8cf9fe7b66dd215837cca96a9c39567414cbc632e8ddb0"
+SRC_URI[sha256sum] = "439217116152244369caf3d9f1caf2f9fe29b03bd79e88d2928c8e718c95d680"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.43.0


