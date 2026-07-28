Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E784C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5624.1785218814223847036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pygo6wNr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218814; x=1816754814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=S5hnQwLPudrnhILTl/+LmNPjvqoUcJ5mQiua8mrvh0Q=;
  b=pygo6wNrv4DxCciE8y1njySl6P545wAG/eikxQw9+VuxoMqICX41MG93
   AmEdUIz4y8cnA+syhWcC+CWkkZgmlRED2A4cxavveKfkycdqYGFbfuBWG
   +Os1t8GmxXj6WVUJd0Yg6IDMJWMdFot9NvZMKBpVYUOuENLqr0cs8dxIA
   R61ctpRy6K/wkOVZK+vubI1fyyXxoPDZzgy8qbW/0nJA4PZ3VqRiUA+WM
   kZng+s3O7Shx91CAE0xT5VQCwN0KYwWkclwvHQV+iYvEiwwDJr40r2tUE
   KpJdr7Oej4NYYMe5Dm6vt4ilflLQncToD+4q3tF5Cl8+SmCED5B+Epd4c
   w==;
X-CSE-ConnectionGUID: rGvDk2OzR3qkYdlX8TAS0Q==
X-CSE-MsgGUID: WXKzxwoGQuSQzzyQP4Gapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="252386875"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="252386875"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:52 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8363782040C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3C9CE140737D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:52 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 97EA910005F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:50 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] gflags: upgrade 2.3.0 -> 2.3.1
Date: Tue, 28 Jul 2026 14:06:16 +0800
Message-ID: <20260728060645.819-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128473

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gflags/{gflags_2.3.0.bb => gflags_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gflags/{gflags_2.3.0.bb => gflags_2.3.1.bb} (93%)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.3.0.bb b/meta-oe/recipes-support/gflags/gflags_2.3.1.bb
similarity index 93%
rename from meta-oe/recipes-support/gflags/gflags_2.3.0.bb
rename to meta-oe/recipes-support/gflags/gflags_2.3.1.bb
index bb8f144f90..6bb96ff703 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
 SRC_URI = "git://github.com/gflags/gflags.git;branch=main;protocol=https;tag=v${PV}"
-SRCREV = "33bb3461e10864b5406353d3a1fb7ff34c2314b8"
+SRCREV = "8f30ebfb2b206a8bd3a97ffe3b59009a952343e6"
 
 inherit cmake
 
-- 
2.43.0


