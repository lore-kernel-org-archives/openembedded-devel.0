Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B906FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17255.1777546258491554769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eJCBCrbD;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546258; x=1809082258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6vvsvEafkAxDviFzT1uAU87mY7k6Q0Ozl+pu66njzmE=;
  b=eJCBCrbDk3lEV/rMavEGLn4RLs/8d37LeiGiKZXLIGQbM+vNg3kz5S9y
   kAWKK2c1hbB9OJoQMcW7anfSpgacRN5SQieob/2cuLx4Nc4sGwxInGil/
   oBXO2zgQzzUmU1SqChZikoqlUo90z9vRQMNv4lHGlfS77UamDpcmlWFkE
   XkEf10BC8DD1noe2FrLen/es/vfD8qrciSxFdtF25liIZ68MxQLF8uyQj
   5hvvDTCs23pnggFe0gDqa/WhEmj1RekSmLmq9H/JhotLNmxulxa2okfC8
   3D0S5ieUc8uoMO359hFmYU64N5+LPm5BqpzDU5tsuc4KrjWRrtrIXsx4z
   g==;
X-CSE-ConnectionGUID: aYc6JE/RSaeN27QI6Ik0Fw==
X-CSE-MsgGUID: rKMVZuvDQaup1xX0bJlGwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636990"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636990"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:57 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7AC1F1C1C701
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:58 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 35C4414003DA
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C78B81801130;
	Thu, 30 Apr 2026 10:50:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 56/64] rtorrent: upgrade 0.16.9 -> 0.16.10
Date: Thu, 30 Apr 2026 18:49:15 +0800
Message-ID: <20260430104924.1106-56-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126726

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.9.bb => rtorrent_0.16.10.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.9.bb => rtorrent_0.16.10.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.9.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.10.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.9.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.10.bb
index 7ce38e9597..36ef5a623e 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.9.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.10.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "b78fd9aef5d0060fe7bd8447cace38606e03f41c"
+SRCREV = "b5a606649a4800deb44c31d3ad74d01b4c5ca37a"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


