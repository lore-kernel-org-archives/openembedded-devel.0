Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12DBCD6E47
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16782.1779875318920009370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tCOg/Ten;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875320; x=1811411320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nNyq/lJ3RM7dMsWPjCzh+646vuQT5lHC5CJ2NBLe4aw=;
  b=tCOg/Teng5MgHowq4eb4q5CEzUMQYw1a1Zvs/cSrMnFAk8K/nh5GXktX
   BnraLZt77CmanpMA3naFWXnxKmvHEOB4gvfr5urW3TuuZn3FyAZMSuWAc
   NUGPvQ8tQr3Z4+wOhgxpP4YEIZYNs3gJr7hutuyFCv0PCYbAVPWCUL/Og
   xNNKYNdZRa/rsBQyT60YPAhazMFCF2ue4zjuoxAxlBM+uAix44/C9wlMp
   vrIkp9hPL25KcW/rEvl44WmVP6cZXstHJl/29/tw1CPZNQzt81t09yNZi
   dAIXIVh24fW5Iv+GusaDcBE0uEz+6j7QkVff/3T4Pct05jmA0DX4StLtL
   g==;
X-CSE-ConnectionGUID: NUoGoS1JTB68k/8VaZRp6A==
X-CSE-MsgGUID: b1lSpmKqSz+pPCyV4RCffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969803"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969803"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:38 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5CC3A1002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 12A9018591C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 135EE82A2CE;
	Wed, 27 May 2026 09:48:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/56] libjs-jquery-cookie: upgrade 3.0.5 -> 3.0.7
Date: Wed, 27 May 2026 17:47:20 +0800
Message-ID: <20260527094805.2039-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127218

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Prevent cookie attribute injection: CVE-2026-46625
- Add Partitioned attribute to readme
- Publish to npm registry via trusted publisher exclusively
- Ensure consistent behaviour for get('name') + get()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...js-jquery-cookie_3.0.5.bb => libjs-jquery-cookie_3.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libjs/{libjs-jquery-cookie_3.0.5.bb => libjs-jquery-cookie_3.0.7.bb} (91%)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.7.bb
similarity index 91%
rename from meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
rename to meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.7.bb
index f4e26a65fc..7544ad4d9b 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.7.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/js-cookie/js-cookie"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
 
-SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
+SRCREV = "17bacba0171dd022728d8fdeba3203c60791bf58"
 
 
 JQUERYCOOKIEDIR = "${datadir}/javascript/jquery-cookie"
-- 
2.43.0


