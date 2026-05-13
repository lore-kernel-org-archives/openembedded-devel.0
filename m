Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F10CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:09:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98.1778645364478671989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s9rWbZW4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645364; x=1810181364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wzADfBluRac9U3iQqJglTj451uf0vS3O/Ru3qg4sUrc=;
  b=s9rWbZW4dIrbCKGTI9mWlBl+3ayeW/vIkVLXH2M+aBmTGHW03E4Zm+5F
   yB++U3Ile/0FvIGTkXgq0ltnN5k1klDyIQtYmhQtie6vGhSHOVtIDMgsv
   QCVBRH3t8ytsY+yb2f3ozpawga9AowP+JHDaXOZ1h8NhoG4N+w6eMIwBw
   DIYWjXXNYBwV+gZ3m+GrDz0wkW5mhABPg3C73vl+CVkCI/BYwIxgCTg7o
   aZdq6C7Wbndb9nWDfnhiU6u9igYk+yOa2bD5gKocMYUBk9HTz0N6aA0rf
   25W4frZjuLlzj9irmMy4Dk5Fdtha/5bBrM4iRmHW1EYEBSIaw1nF05sMW
   Q==;
X-CSE-ConnectionGUID: tOFwtJCCQZmgoK9pE4u/9w==
X-CSE-MsgGUID: k8QdoEs9SJa3PBmGiGjuCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206274"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206274"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:09:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E4A0A5C0A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9639F1802AE4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 213891400247;
	Wed, 13 May 2026 04:07:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/56] hunspell: upgrade 1.7.2 -> 1.7.3
Date: Wed, 13 May 2026 12:05:08 +0800
Message-ID: <20260513040555.377-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126900

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix stack-buffer-overflow in Hunzip::getline
- Fix stack overflow in compound_check on Hungarian dictionaries
  under certain conditions
- Fix UB when SFX condition starts with '^' (#1095)
- Bounds-check continuation bytes in u8_u16 (#1110)
- oss-fuzz timeout/OOM hardenings
- Fix #715 CHECKCOMPOUNDCASE considers digits uppercase
- Fix #748 hzip: cannot write file
- Fix #1024 std::string bounds check
- Fix #1044 tools/analyze crash
- Fix #1076 flags 65520/65521 wrongly rejected
- Fix #1058 don't suggest the input word as its own correction
- Fix #1002 exact word marked as a near miss
- Fix tdf#125600 dotted-I regression
- Partial Unicode table refresh for Mc combining marks (#1057)
- Add Hunspell_add_with_flags / Hunspell::add_with_flags
- New SPELL_BEST_SUG flag, MAXBREAKDEPTH limit
- Replace clock() with std::chrono for suggestion time limits (#716)
- Improve exception safety (#587)
- Document analyze/stem/generate requirements (#554)
- Report iconv direction on private dic load failures (#619)
- Show dic load errors unconditionally (#1012)
- Rename es_EU to eu (#1113)
- Build fixes: out-of-tree, Windows ARM64, MSVC hzip tmpfile (#919),
  --disable-shared with mingw32 (#698), iconv on msys2 (#723),
  ncurses with separate tinfo
- New fuzzers: hzfuzzer, persdicfuzzer, parserfuzzer, affdicfuzzer
- Coverity-flagged fixes
- Merge in weblate translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hunspell/{hunspell_1.7.2.bb => hunspell_1.7.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.2.bb => hunspell_1.7.3.bb} (89%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
similarity index 89%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
index 67a51f5c9f..94ed985c42 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "2969be996acad84b91ab3875b1816636fe61a40e"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
+SRCREV = "c5f98152a274e25b5107101104bef632b83a0cc9"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
 
 
 inherit autotools pkgconfig gettext
-- 
2.43.0


