Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBB2CFC500
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.50333.1728896160077214616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n7suGirH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896160; x=1760432160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yHLzhwWYS8EbmVrUgpE5ItNAv0AOhlBfRra8BwtAgtI=;
  b=n7suGirH9/cEbNyKdv3rWJFZDqAsWQOIZSr11n04YYc6vbuWFTJtxwXa
   gnObotpeMgO8Lw5Y3IPD17d4I4KCbFTZH28g1gAjOrWPRZ7l9j5vYaeud
   vse9winMpnhrOakrfy0sIn41wB17QPQlGsjIjgXAA17DGZGroSvFojOBE
   Bh7oIC54bfL1n2ygOBJ+nMuE1z14FdCaHW4Bb46mxteXMzr4XCEEk+sdl
   EOZFydRV3hNJhHk4my4CjlAuyQ4HCw7BH90WS9e8oToXOBTBFpgPC8cTq
   SCgR8MbMfMmY1pEs6gDpwlVllntrrRT7wgTkZKJna7oAHxKuslS3Jpw6N
   w==;
X-CSE-ConnectionGUID: uELrdioyTHCC9rRVeYl8KQ==
X-CSE-MsgGUID: QOj028kiS5SO7L62DCwVwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671111"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671111"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CAD39D5A47
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EF45D3F00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D33A200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4397B1A01ED;
	Mon, 14 Oct 2024 16:55:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/54] libtorrent: upgrade 0.13.8 -> 0.14.0
Date: Mon, 14 Oct 2024 16:54:30 +0800
Message-Id: <1728896115-2944-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.200200-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7RQWIO4YO+fPW8q
	nFk+BWUX6Y0NhLe2qGW/MfwiIqx1/cgqWOFh1Y7mCoHzIAMWCU35EyDUzlC8Rcj0QMA/92m2XR/
	hn+4QIq3Pz9CYF+mMT7MIrP4Y72+XKr4Zn1kfEiEdZEkR8Y/meSthirXYhZk5kXGw9OO7nQrE41
	Bh6hF6cU3JmjmjwvjwZACetupFJLBxqOIZOym6taqHmm/V4M/P3SkTY86NiDgHNq0HeN2LVI/MV
	Y+TBf96wAcnOhjN5iGAL09PYcYYu5t7ZCTW/W0/M6A0eGVTtgxLGPRv0WdxQpTx+2LIqNmt0yOP
	Bv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q07Cl8sx4HBG53ZbPRfc5otZYjmj55HGp2sGHK
	/YO0c/+LzNWBegCW2wgn7iDBesS0nRE+fI6etkvSHHP4PZOzuVfwszJRw6JmMYyTCelCrbwBqXB
	r9PGg00tAMvam6NXcB1wfuwRf2fAdyct7dHalSNZfI+NxXbqS0YIeF0IRBI0u/kTKv9giuqwOHO
	1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Merge branch 'stickz-throttle-increase'
- Increase max throttle speed to 33 gigabits
- Remove decision structure for popcount_wrapper
- Merge branch 'kannibalox-feature/fast-delegation'
- Fix double insert
- Speed up delegating by returning multiple request assignments at once
- Allow 10 gigabit speed throttles
- Fix memory access crash with socket_address object
- Add is_initialized() API
- configure: Define _GNU_SOURCE when checking for pthread_setname_np
- Create FUNDING.yml
- Updated and cleaned up automake. (#224)
- Removed obsolete files.
- Added ipv6 options.
- Detect ip address.
- Added '--disable-execinfo' option to configure.
- Fixed issue with multiple connections from NAT not working.
- Improved backtrace error checking.
- Added option to disable pthread_setname_np.
- Replaced custom execinfo autoconf test.
- Changes automake required files.
- Refactor make process. (#207)
- Consolidate make script to optimize build. (#206)
- Fix log format so GCC can check it. (#205)
- Fix compiler warnings. (#204)
- Fix for inotify missing quickly renamed files (#203)
- libtorrent.pc.in: add Libs.Private (#202)
- Backport changes from feature-bind. (#200)
- Merge pull request #195 from Nicholi/log_append
- Removed log append function. Added append parameter with default value (false) to log_open_file functions.
- Allow logs to be appended rather than overwritten.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_git.bb => libtorrent_0.14.0.bb}    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_git.bb => libtorrent_0.14.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
index c7a0562db..912b00261 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
 
-PV = "0.13.8+git"
-
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https"
-SRCREV = "e60f222241319aaae482789517ad00ae9344bd13"
+SRCREV = "08fb6635ba249665cb08a4de1b955288d25c21e1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


