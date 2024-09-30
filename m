Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8E6CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.48969.1727682259865116978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dOiIybwW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682260; x=1759218260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AmdOLo1ZxDZSdVL+Tdhn/MDkyKf9Vt4LeZqg4cv3OPA=;
  b=dOiIybwWFbIIm2//jYybrSc5EsthsyfZwvStI2qKhUsjPzJT3rtsP96W
   5/ND5dCHFHRjyV8HNshKE5Njg9qIVhgNtmrsPL6hpYajyPPAncW3qoUDw
   jvQakdda6HISHpCMdqfU1V5qTr8hDdfLIMX3k71xe+rTlpvE8k/EOuntw
   /iHOs4VVrminkwrWCk6zTTUJ4JFcO+TNxW2ZDE9j4hoelEkgyNPyc0qCc
   3w9bGo/gssZ6JXKqLVHezK8X5EXd36niu3yWGL0ctqM3jDSi1kOBfBXE7
   tw1ijFsbYsqkMxaQN5uCAifhaFtw8dYpTiBi/FU3726oXLBhWnbk+lHp4
   g==;
X-CSE-ConnectionGUID: 5y57GbrkTM2xeeApwxuPTw==
X-CSE-MsgGUID: WYBLkNqgQDCZBuQfHzkBpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154210000"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154210000"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A897EC68E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1198D506C
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 858F32007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 365841A000A;
	Mon, 30 Sep 2024 15:44:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/40] tmux: upgrade 3.4 -> 3.5
Date: Mon, 30 Sep 2024 15:43:05 +0800
Message-Id: <1727682185-12664-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--3.797400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmRuce7gFxhKa3zndiJkHFMhHXHQq6zBeSUJ+m
	KA5rZIpiESVL06fzYO9wU8VHXGipCHxPMjOKY7A9wK7mZ44aKbg1fU1q220JrKrauXd3MZDX+Mt
	3AgL2cndRW5Ry5kFiAsee5IsNFRQdeRKrYoe9tnldSfmF9Ky3Ls2HHqIQPlZwwI1F+/SKnCoCj6
	cw8NCz9DfTMgSbtxC2AcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112600

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://raw.githubusercontent.com/tmux/tmux/3.5/CHANGES

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.4.bb => tmux_3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.4.bb => tmux_3.5.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.4.bb b/meta-oe/recipes-extended/tmux/tmux_3.5.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.4.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.5.bb
index 4360edf4b..33f709681 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.4.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "551ab8dea0bf505c0ad6b7bb35ef567cdde0ccb84357df142c254f35a23e19aa"
+SRC_URI[sha256sum] = "2fe01942e7e7d93f524a22f2c883822c06bc258a4d61dba4b407353d7081950f"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


