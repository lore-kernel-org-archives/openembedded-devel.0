Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC73CFC51B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.50498.1728896176490697559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fn1Mtz8Q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896178; x=1760432178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3z13QPBjMbSlZD3Zp04YvfYo/Mru87faQBJ4dL4qfuQ=;
  b=fn1Mtz8Q2gRW/ZnD2FblHylr9QLeJ53FIWsJ4TtQ41jRLWNBnyhAdalq
   O0MBPagzSOKur2IJQk6NopSryUC0lJ9Sw4ojvaX6MuEEYuqbYsXBa7psn
   w4fROWfNndrb+VOZNVSMVr0FVQ9GsJkP8GNIeD4r5a0kIO2imxmx7bTHi
   i7OP/7pQxU0M9nGfPXELBIyQneR3seoYB27Ok0aDKbcay8MjM5Xqs+Hnd
   FmInQ7qIcajfEkDq1clP+Y4YpCBtjnR8hYdE1k9j59jMPYi4VbnHfcPmJ
   65B32PydLuzWy+P/74JFkuBv+6MhEPAcbeJhwSLZMYNDnPq/CFgPm7tDD
   w==;
X-CSE-ConnectionGUID: 9jugmrirQGOep7vKBRr83A==
X-CSE-MsgGUID: KIhbEam+SOeXaaZaeMcMVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="175895935"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="175895935"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D306ECD6DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21FDC159BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF2926B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C6961A01E9;
	Mon, 14 Oct 2024 16:56:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 50/54] rtorrent: upgrade 0.9.8 -> 0.10.0
Date: Mon, 14 Oct 2024 16:55:11 +0800
Message-Id: <1728896115-2944-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--4.282900-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvhA4WtAM986dbL
	FhUX/ioapWHL4tDeyjWfwVbCeqKo5SbFpXq4ZRfVM10nOFd6RPZFSfT/R4wUBcj0QMA/92m2GPy
	Kh3GehNoeNwaalmieXu79J1nr/VpVEuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IUOtZb5hMKrMXV7tdtvoibawEM6ofA+CGObKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWuXJFmylUbr/f+Dc4t2Zs3HOOEqfr/0h/CAz7+XnW/en3lOkoFAl1JknE2
	OWj5241M0eD3mTlRJTwCI+FesXlGXDQkkQ6w6pvyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112899

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
libtorrent
-----------
- Significant performance improvements to improve throughput and reduce CPU usage.
- A fix for a torrent client crash with the socket address object.
- Support for 33 gigabit speed throttles on ruTorrent.

rTorrent
--------
- A fix for a torrent client stack overflow crash with the lockfile buffer.
- New trackers.delay_scrape command for .rtorrent.rc to avoid crashes with thousands of torrents and allow instant startups.
- A fix for compiling the software with LTO (Link Time Optimizations) for additional performance.
- A fix for a critical memory leak with RPC commands which may waste an alarming amount of memory.
- A fix for critical torrent client breakage if a power outage/failure occurs during a session saving interval.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_git.bb => rtorrent_0.10.0.bb}          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_git.bb => rtorrent_0.10.0.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
index d9cca404d..4c963d9cc 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurses"
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
-SRCREV = "d067bd802e44f0e6a747aabcc311ada2175fd550"
-
-PV = "0.9.8+git"
+SRCREV = "a88cab6d2e764e22cac232ef8d5af039d41b8280"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


