Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAE8105A57C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18640.1773313209576943023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q8DwEjoB;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313208; x=1804849208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b2BUlbJ+AdMecwJRv7M3VyH+o8r8O4KDl5cGT4SvTd4=;
  b=Q8DwEjoBbXWm55/YCX1o+vWdBazejdf/B2owdLlhbD94RLTkqsVXxMKj
   CWAYBpxmTKFvhpP0KX0gnZw4B+ObCil1qzdS5iVYhAxIMIwZaOWvSlv1A
   0AWoPyDm6oJ+V5eTjF8IepPdzHgWwPm0B3ytA1ge5jQI3zptsJo6leXo6
   zROAOzbtgTEZj0PMYStJoMx8oB3sdCb7YCBVdEy8eBwyywpynEB0RhhbG
   aRh9Jsfd/WdWi+VddmqFaru0mkdwZq7bD24mZmn355K0oE5FcKiCt3c1d
   sRwImmV7nRVrwTc520wKjfLeatD1knJyj6XgKQLfO7Icw7mX69WTV8wdX
   g==;
X-CSE-ConnectionGUID: pKIUPCNeSRyyIvxvTzFSVw==
X-CSE-MsgGUID: h69Eck1jRuutDQNqFNicKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="221636607"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="221636607"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 27CA61C1C70D
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:08 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CFC81C0081B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E00698288E8;
	Thu, 12 Mar 2026 11:00:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 61/64] rtorrent: upgrade 0.16.6 -> 0.16.7
Date: Thu, 12 Mar 2026 18:59:37 +0800
Message-ID: <20260312105940.1900-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125161

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added a buffer that limits/deduplicates active dns requests
- Properly handle libcurl reuse of sockets
- Added SocketManager to handle reuse of uninterested fd's by the kernel
- Removed old work-arounds in epoll and force stricter handling of errors
- Allow disabling of stream buffering for plaintext logs
- Fix some compile warnings
- Fix use after free in UdnsResolver::try_resolve_numeric
- Fix crash in DhtRouter::bootstrap
- Fix key/value pairs in Lua
- Expand '~/' to $HOME in session path.
- dht_add_peer_node is empty, use dht_add_bootstrap_node instead
- Re-send smkx on SIGWINCH to fix arrow keys after terminal reattach
- Allow dht bootstrap nodes to be added when dht is off.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.6.bb => rtorrent_0.16.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.6.bb => rtorrent_0.16.7.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.6.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.7.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.6.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.7.bb
index 9f0666f2bb..0ec048dcf5 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.6.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.7.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "ae14baa357aafd072de6f57f005cde4eb75e7dda"
+SRCREV = "7ead88448b8068c6737a975604884f96f6ae498c"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


