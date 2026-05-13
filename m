Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CEBCD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119.1778645424534011969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ohRLVJ6C;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645429; x=1810181429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGGU3svWIZMrtDqQS0Yzsf1IK0kVw+kD2PMIgqNuRwc=;
  b=ohRLVJ6CMWuqrAy4asgVVg6Ei2LoeM0WkkOFLC+1b2UWKsrFwKwDnVcn
   sSc8l72tR2g7BINV4n2T/oBCkzv3AyKXDJY7SdWzle0Fxrtd+joWXJKfS
   MfAORd0YqER+cPulkCcVnM+45zt5KgNIibrOSxT/34zqRfJb11udV2X+J
   DpUDuTQld3ufWxGzb7kbfaNA2wtbyfPjIDdn8r31kGsNSfHoKmdhaRfx4
   4BOKV26hrDoTnWlG1o621rEuVNIXPBpFb1KBz9jWhOjxhDT86J27gTWTY
   s1ST1HfRvJSEu5kFG0lBsdIMPslqkhmAHg7oUutUuUh+EjI2SM6qmysxA
   w==;
X-CSE-ConnectionGUID: 9drZ+OYHTx6Jyh4j66Conw==
X-CSE-MsgGUID: uRUf4bttR3ON7TYlYz894g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240257339"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240257339"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:29 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A880D820702
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 65CD01801FF1
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 09BAB140008D;
	Wed, 13 May 2026 04:09:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/56] libtorrent: upgrade 0.16.10 -> 0.16.11
Date: Wed, 13 May 2026 12:05:18 +0800
Message-ID: <20260513040555.377-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126909

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.10.bb => libtorrent_0.16.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.10.bb => libtorrent_0.16.11.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.10.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.11.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.10.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.11.bb
index 224269f1d8..b04b7f1310 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.10.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "3e6508fbcb9cef13c62d41ecd460990ff063a5df"
+SRCREV = "dafcba711114af2274a45ca55a7bcd4abdf5ca9a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


