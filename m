Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BA5CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11102.1760433615330039716
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jr6/BTtA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433615; x=1791969615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QT4oRBNIENiKlvfWQbc5d2yrgRhQg9RE7L9R1OB/jqw=;
  b=Jr6/BTtAa4RyQbDfNQSgHY/P9JUXMdrzO9+lhbU6BYSWCTAT7d82k7De
   c1hmlQXNG0pDhknDe+90KmZg01bQ+ZcivkZBNIhxozr84uBWxtUPixilR
   l4H64Dh7/26V5GHHEJuNyzfEUsfS0dK9Jdy/LU79Co7itxqfZMvrzH/gh
   IuGwqLGzM7vBDmPz7YL3SJ5fFpcoJPKMPqSVRVKcpqetQFqej8fLNSe14
   aCsgrPLPL+aeQ2TKiquboawDpwfEa3YC//XbdQDvpAqZEz5GAHpf2l5m5
   pPI2Sd4IdoQKmNeL53CL2la0ceyB703nE3q9dLJBoUHRPmn5LZul5KhjP
   w==;
X-CSE-ConnectionGUID: RjIT0EXySIWvxxYgGsKDuQ==
X-CSE-MsgGUID: aWNS/iGQTJ2EApM17cj4cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275697"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275697"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:12 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8F9C01566
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4E1CA100027E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D5A07101BB7E;
	Tue, 14 Oct 2025 09:20:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/44] python3-greenstalk: upgrade 2.1.0 -> 2.1.1
Date: Tue, 14 Oct 2025 17:19:05 +0800
Message-ID: <20251014091927.493-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120580

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Adds the ability to initialize a Client with an already connected
  socket to provide full control over socket configuration.
- TCP keepalive is now enabled by default to help detect broken TCP
  connections.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-greenstalk_2.1.0.bb => python3-greenstalk_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_2.1.0.bb => python3-greenstalk_2.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_2.1.0.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-greenstalk_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.1.1.bb
index c23c29f35d..b02e10e655 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
 
-SRC_URI[sha256sum] = "a731ca15bc3b03dfffc438db08c96d0c4e8ce5f472403573e40a1939791c12a7"
+SRC_URI[sha256sum] = "e89b7694ddabbd69562bfe11140fdac1afc9fedcbe2edf6464eaf7c355533ef8"
 
 RDEPENDS:${PN} += "python3-io python3-core"
 
-- 
2.43.0


