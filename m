Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9BBCD583F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3099.1767781788624483972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DlZ9ZzGP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781788; x=1799317788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D/s0l+HPpzG5sPAkiYcjfm/gymQqNOGWKt+0VcfSYSs=;
  b=DlZ9ZzGPiJjxZglF1z//5FnztxQcDcKgEWJjoKeNRM1Byk6sDEM/x9CL
   f+nne5/RBLXlm/YDbhBU1WdNXgPEIv3c1WGjgOPDIuDR/kpAvoUDqqApa
   YlRiTuYE+aPzZD53yP9EM+fehKctm+8T8R+RBq5WtjhV+NqEknkVyjA57
   XFCO1aDMRMU2vX6k++sqfTuAvNn9Qb1DaoyFRbhNwaPAx6WSe+VPTuTu5
   htw/7pKqtdNKABQNfSZZs6EvrGH8cHmzWYJZohG0GXi0XtCfbFIOR6oxT
   IEK8ZqPAgcV3D2EumccjITm3vaua3x4x6gt/zfMYl/yxW8Y2t7fo/Ar9L
   Q==;
X-CSE-ConnectionGUID: MCyHCllnRPyt2gyUrElTGA==
X-CSE-MsgGUID: qrSPBgviTDyLwoJnogcycg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="204045543"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="204045543"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:47 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 40EA642A307
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:47 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E56BD180416C
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 32918829F3C;
	Wed,  7 Jan 2026 10:29:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/24] rtorrent: upgrade 0.16.5 -> 0.16.6
Date: Wed,  7 Jan 2026 18:28:53 +0800
Message-ID: <20260107102855.228-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123220

From: Wang Mingyu <wangmy@fujitsu.com>

Features
---------
Added timestamp helper commands
Use separate thread for saving session data
Run multiple session save requests in parallel
Changed magnet metadata handling and added 'magnet.path.set'

Optimizations
-------------
Use map rather than vector for Poll tables

Bug Fixes
-----------
Convert IPv4in6 addresses to IPv4 in outgoing handshakes
Force clear bitfield ranges of downloads that get hashed
Use CURLOPT_CLOSESOCKETFUNCTION to properly handle libcurl closing sockets before CURL_POLL_REMOVE

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.5.bb => rtorrent_0.16.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.5.bb => rtorrent_0.16.6.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.5.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.6.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.5.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.6.bb
index a7606d384d..9f0666f2bb 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.5.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.6.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "60cfcd37c4fb4a4ec31837a8f2127b4330e01bce"
+SRCREV = "ae14baa357aafd072de6f57f005cde4eb75e7dda"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


