Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24180C5474F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8728.1724833559099070937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=La74Xa7L;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833560; x=1756369560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jSXago8HfcT/6MP2FDAdZnHU4aGhogGM7fYyoqhbTEw=;
  b=La74Xa7L5N8ld84N1HjoQTC39gHvLZk/Ozt6jh74ii3/0vh09F+mNnlq
   xhpEPp6M8eN3k8z/Di9uMbX0pInJHV+fdcWw1xtJirTPB3j42y9urYOJp
   XJQ0+er8igd6GFZTvXShCnXQvbzFHrnbBrujdOSOKdhv+lHBe0VbtSz5I
   ipvJ4nVclFJaHpzPgNxd5aLg2vOOJVAIvvT/kWubQagZ7LXMKPBeZUFtL
   BmQ/j0j8V2u4VhuoAYMpQaJs57+5sE0qwJlvA5BV42PL62PVzHeuq/4XW
   a3m4r0k3EzyYV1ADp5khy5AhklAoM7Cz8cK4tMYUayDGLnUip1d9SiHgd
   A==;
X-CSE-ConnectionGUID: o/HT3v2mSDy10R/CbpgDwQ==
X-CSE-MsgGUID: rJ3Re6cpTxuMCa+vwcp7cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039591"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039591"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A86E4D65E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E4654D9CA6
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DF6920079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2714E1A000C;
	Wed, 28 Aug 2024 16:25:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 45/46] sanlock: upgrade 3.9.3 -> 3.9.4
Date: Wed, 28 Aug 2024 16:25:23 +0800
Message-Id: <1724833525-2162-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.600800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvVjNsehGf0veS9
	slBM8vbuHhnrN6LbNlFZLssvIGkU446lfOIi6Q3UA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYiOhdNh/bEUXTweK12oEGfscQNQCplRkzuDTYjejIZTwVxk27EKh25KNzf
	N/81GnbuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUGF/kzBzTNJuYOiHpl1EWWalEY
	QIJp78mYQvXMgVC9yaqd6dF1wATGweG2FeyScQIfujdjYdGUZuzJ+3eiYdm90Km6VP8pCn07H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112019

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix time calculations for dead host
- change paxos_acquire error for initial host state
- fix for lver that was abandoned in dblock
- terminate helper path and args
- fix freeing lvb after io timeout
- add sysusers file
- rem_lockspace EBUSY when orphans exist
- fix SANLK_ACQUIRE_ORPHAN_ONLY

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.9.3.bb => sanlock_3.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.9.3.bb => sanlock_3.9.4.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.3.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.4.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.9.3.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.9.4.bb
index 3b558cafc..9e879ff38 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.3.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "79b35bba8298f4444923c15e11bed38380cb18ee"
+SRCREV = "e077f1a99a07c32ef460db89ed395b441f5e8b03"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


