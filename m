Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFF5CA0EC6
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13437.1754296436254496950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Brs0Oh7r;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296437; x=1785832437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GKoRYyqJ0a7/4ypJQEMmzldtTWtYsUlmjOnB6nJ1CbA=;
  b=Brs0Oh7rBTbpk7iFWUGX8wyqMf6kUn+4pqDpEjFjoe6kJXF4NoiBZZyG
   SWeipe/6qtMXU7HaIwz9CpSVYJXJ/vBEcLwEj1TY3dKzhOVUT/jlMi1aG
   OzWMFzpohzuEQZyPqXTvGR/lmCyhRPJlN1I+PuZC7IsczIU/h9xk1qlQ8
   tJyMoSB5X0ojSE+oCUKwfppoIXBWq3cWtUU4/XFUWPMRO57W/q36ffgbW
   CJFW+T0CYOjTK/8YbKfBi7Y3b9ET0n/vsftKroXWZyHcSVh0IZP0lhbAX
   14WV5rk2xhYV14vBfLscOEb9M9fysYfzVSyM69XDT2G3OIB+ZbBifWYvl
   A==;
X-CSE-ConnectionGUID: bo5YH0KgRSe3uXbIzH3+2g==
X-CSE-MsgGUID: 5Ivst3dUTba7eVIK1mcQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208301698"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208301698"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:55 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 7ACEEC00406
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:54 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E672D844BEC
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 061DA1A0073;
	Mon,  4 Aug 2025 16:33:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/18] memcached: upgrade 1.6.38 -> 1.6.39
Date: Mon,  4 Aug 2025 16:33:28 +0800
Message-ID: <20250804083340.1649-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118839

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.38.bb => memcached_1.6.39.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.38.bb => memcached_1.6.39.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.38.bb b/meta-networking/recipes-support/memcached/memcached_1.6.39.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.38.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.39.bb
index 9799b55a09..efcc6b4487 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.38.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.39.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "334d792294e37738796b5b03375c47bb6db283b1152e2ea4ccb720152dd17c66"
+SRC_URI[sha256sum] = "23e5507e933b15463161d4c5d3921b0c5f340b542d6edd7f6c5e17c34f11a363"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


