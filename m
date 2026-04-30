Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC88CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17438.1777546198833265801
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e3dWTP8X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546199; x=1809082199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i9Ew5qH5gOOjMGy1hpfRLeoofmGRQ2svCCwgPvo7iwQ=;
  b=e3dWTP8XhLTZEJHSPfegKA4tHb4M/SuD38ciyzSvpegzf4cWaalgrD7/
   19Z8e9PRW4EWnGOE2a5ffgJk+WkDEknWlDcE4yw4Ws+oe4LSb+DFeZrsu
   lLu45aFmmh/ZtDJtX+N14hRAJSNf+FmLXJ8WczGbCe6QKccflOI2mVttK
   6AKc+kQjn8kKWFgHzBhcpoHGUctdYSY8D0Aw9yvVG5ul2l9I4WxSIyOP9
   fQMzJO2+SSzYnz/9TCzNHzkV6be9IJgQZ0x9NryAoGDHmwACSLnjNO8ds
   tDyD0RmafhRlm8WsI5joA1CmAcX+UYa03DpeZCjWD/uX8o1A+D5qrDfgP
   g==;
X-CSE-ConnectionGUID: V0VEkpeZTbWJAWDd1xJ1hA==
X-CSE-MsgGUID: Ev34Rh8oT0KLsBHRJYzPxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238077188"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238077188"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5EBA88203D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 141E418002E8
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A44C3180113E;
	Thu, 30 Apr 2026 10:49:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/64] libtorrent: upgrade 0.16.9 -> 0.16.10
Date: Thu, 30 Apr 2026 18:48:37 +0800
Message-ID: <20260430104924.1106-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126686

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.9.bb => libtorrent_0.16.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.9.bb => libtorrent_0.16.10.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.9.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.10.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.9.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.10.bb
index 63c8a0bb7d..224269f1d8 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.9.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "e88d4e7854abacd3036a0dec11927c1276c1e6b2"
+SRCREV = "3e6508fbcb9cef13c62d41ecd460990ff063a5df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


