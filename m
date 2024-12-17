Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0D1E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.77614.1734426116070653535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tsqqxcb4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426118; x=1765962118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZA93ppu2+BtAD0V/wTsuU6XrDKoS2JX5QveOfk6JtWQ=;
  b=tsqqxcb49N0N+rimAOS3fzhDVH8Dx/5mLrUOfJ+CBrCKZufG6cWD9LDp
   B5zqRJJAnWYl+nRxADTqzkKfI8T/3Na0f5Kmxcba1CUfZeeYKd55sd/It
   HX4lQv+J9ar3WMUZKezVvXPFVAkx105qL1J9dEJ3jCHqoxL8KFjcl2EXb
   R2lK2KFCDQxr6AglpXgY9soMW8ioQjc1hD9ylGgS5iN4gKvUetKAyHPQX
   OTlBYtN2KvfGHLJj5wwUBZG2GsOibLgaVc7QZPRyaIGcxGUvTE/YCcUWR
   2/ocF+qcuOaaAgXAGT0FW3O0dzibbqWE4daqDvzDBXe5IyHcMbvrZNW0n
   g==;
X-CSE-ConnectionGUID: pT/JjLCpTDCSEaM0SAj63w==
X-CSE-MsgGUID: k3JcIPWTTD2V9Dov2z54bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184048218"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184048218"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F0454D500C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C70A6D971B
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62B9C6B5DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3DF91A0071;
	Tue, 17 Dec 2024 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/17] xkbevd: upgrade 1.1.5 -> 1.1.6
Date: Tue, 17 Dec 2024 17:01:36 +0800
Message-Id: <1734426096-18300-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--4.742600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrC//1TMV5chNMotU/QFIFG2uS
	BlWgaGJKIhU1mamEFmtd/cyqXfP9LsEQdgi1dcDAA9lly13c/gGdv37IsEhFdwfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv8/7jrKpSJx3HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Iym
	7fAO2dR6mVzLveFdqDBAMi+0JHNf0UWtuRh5pVF82yjgwHl7S7gJRWSMu+Nuj9CXI0614Y0ZLSQ
	62cPBnt8/Pq0aTg5s2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114366

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Use _stricmp() instead of strcasecmp() on Windows
- Accept --help & --version as aliases to -help & -version
- evargs.c: constify pointer arguments that aren't modified
- evargs.c: Use standard strchr() instead of deprecated index()
- Remove detectableRepeat variable
- Assume target platforms have strcasecmp now

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-app/{xkbevd_1.1.5.bb => xkbevd_1.1.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbevd_1.1.5.bb => xkbevd_1.1.6.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.5.bb b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.6.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.6.bb
index afc1fe17d5..92f1b94215 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.6.bb
@@ -10,4 +10,4 @@ DEPENDS += "libxkbfile bison-native"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "38357b702de9d3457c4ff75053390f457b84c4accc7f088101255c37c684926b"
+SRC_URI[sha256sum] = "d9b401f84cf8568342ff63b1ffc6aecd3877579256d89fe6408645e2741b073e"
-- 
2.43.0


