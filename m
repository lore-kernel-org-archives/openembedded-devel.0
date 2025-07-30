Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9B3C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.31489.1753869304228326273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZleT43uH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869305; x=1785405305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GTynIjf6981wUGt6YsYN8qc84YOZF4raBSnfYR9BEKA=;
  b=ZleT43uHQzcU8kXqsrpt5S9vC6QrLxRn8vlLI5gWAQTjpOR9NuEHw8Qd
   pKpJhXpwG1ak3fRb/YvjUCayx+AD/AtTT49EPI/BgP83zY648qaRZI/d1
   0BxDyM75F2md4VoVq91dDxHMOU4JpJEiYDxY/V2viJSkRkwZwo9b8pq4a
   J28Fis56disd7R/1FjitpMRHG/drfcjW3DHwMDFmm4XMDG2fjPqzejg2m
   ZLIXPsLYGTgvzr9GbY/5N+ffaREI8NJ21OiezGl+yMvLub4GH2317bN4M
   Vpzo52Sf5RBGs4NP/h+Uu3u0IQPM5tcpXv0nJaVsQFv0pYvrq8GT9eGKo
   g==;
X-CSE-ConnectionGUID: Fmn4Z10wTZaUk+F9WX+zpg==
X-CSE-MsgGUID: khQjbbJkTeWm07Jd0Vp/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207893415"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207893415"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 527218203D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BE38DC01804
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C4F71A000B;
	Wed, 30 Jul 2025 17:54:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 01/40] apache2: upgrade 2.4.64 -> 2.4.65
Date: Wed, 30 Jul 2025 17:54:17 +0800
Message-ID: <20250730095456.695-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118767

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index 061e52f736..fef1f5ecec 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
+SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
-- 
2.43.0


