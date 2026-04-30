Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABD6CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17424.1777546172057976680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cpcVV10E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546175; x=1809082175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B5kDZDUu3Mmh9gLreRkTp/Fm4mkl6LDU67PsCQoItZw=;
  b=cpcVV10ErTALWDcTu6Xk7XGyypsqk/H8thMdYJGsL4gW6IhdBJJXtxny
   x1ch1YUNSeRR6/ZsI3ubcNHqirXPoz1x1GF/QrNqDvirl4iQ4pzP9oDGq
   gV53j1MpB1SPvH9571skeJO1+CMbFWkm3YtFpPj8J9wo/LCO8/ffqHO+L
   LHliYT0Sd0mhqUO2jtXGIx7PkOGT3DsOoS4hj8dMCcqTgsjy4zKcjV+w4
   zBb1gPb+6ssM7jDJTyhoz7wQGVkAVTPl5YYBa56adovpQDw6mN6TgTVui
   tx7R8ovDzbLmJ4MsQiYlaVhicLCqFqHzqFjUGSVIIXb4a/9dLrUyV+oPn
   w==;
X-CSE-ConnectionGUID: lViCmTQNSEqSqbUsBtDNTg==
X-CSE-MsgGUID: Qp9NROBoQiqHqWF5OqR+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552627"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552627"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:35 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D84861C1C706
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:34 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9168618002E8
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2D4B6180113E;
	Thu, 30 Apr 2026 10:49:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/64] ctags: upgrade 6.2.20260329.0 -> 6.2.20260426.0
Date: Thu, 30 Apr 2026 18:48:23 +0800
Message-ID: <20260430104924.1106-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126674

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260329.0.bb => ctags_6.2.20260426.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260329.0.bb => ctags_6.2.20260426.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260329.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260426.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260329.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260426.0.bb
index 76bb5b77be..c3e6df01b2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260329.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260426.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "34659e2cb02e055c74e929c5bad291470a729570"
+SRCREV = "0498b5983b38f835ece70890ea171d1c1204f284"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


