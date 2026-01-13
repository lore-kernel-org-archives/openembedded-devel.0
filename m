Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06066D0C821
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55840.1768299879143555895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dkBj7iuu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299877; x=1799835877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WN1acz/+nhNLP9BW2zuVeoIMIocPjWErAXFKWqVeMVo=;
  b=dkBj7iuusM4l7RkTbQrOiTqeHJkXsIkaQZuMa7qpesxceEQPShIGY/E0
   TL0oCRhMHAU0w46+w2uLxwW/2O+slWmO3wMkCq9c9J/0oNdvjRjWYSM1I
   fZcbuUZS3xL1dsBXJFmtBYE3floido8QhG5ehpQ4nu/l3Y/m7dcTfuzep
   O8nqViClOy4inV2pJvsxKf/kljuInYGplHmEwGxzKnFWqnMEfZDPxUUlc
   s9NGrrcyi/nfpihhm42kP9kyyNh1xLXMXaMPopZUSCNchi5h6fDePk8mU
   lLMMfQbnIwhFtnAS2UgDvfmkvpp3nMq0AYgDxZwNPUFYRSh41LXcPaM9Y
   A==;
X-CSE-ConnectionGUID: lPr4gULDT06fe3U10xistQ==
X-CSE-MsgGUID: UHUMjxHsTE+LaFZ4gaIVNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="214223678"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="214223678"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:36 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A6F79C00203
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 58C7E8D72C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 919521019049;
	Tue, 13 Jan 2026 10:24:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/22] python3-pyais: upgrade 2.14.0 -> 2.15.0
Date: Tue, 13 Jan 2026 18:23:26 +0800
Message-ID: <20260113102334.605-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123420

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 AISTracker.update now accepts raw sentences as well as decoded messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyais_2.14.0.bb => python3-pyais_2.15.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.14.0.bb => python3-pyais_2.15.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb b/meta-python/recipes-devtools/python/python3-pyais_2.15.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.15.0.bb
index 800f460610..3f124a750d 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.15.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/M0r13n/pyais"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
-SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
+SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "04c33cdfd156bcfbb6c924f7f889e47e3c2373c6"
+SRCREV = "7350f9db65ad715e582979bf389133bde07f5e10"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


