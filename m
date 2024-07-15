Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F3CC52D1D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.33827.1721034178749344561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qYUrhl35;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034180; x=1752570180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EJBpHEK6xTFSQECMTGEQFskay7QFm8fErQ8i62vXwNA=;
  b=qYUrhl35mS3asYP2rtOHEFPFEf/UQx6lU6VVfmi9NTRO3I8RWKk7b3Jc
   6cBYQkvTsKC7sO1lY8vH9rwtDzhEwDaHVIojN7j0ppSqGFy0tGIgf9GqB
   pataJhUSAYCAISQ7GgkcEKeNzu5yytwBQndLIOy1ciVZMHh+0wWr2FnCT
   mD2ZVGXoJBN6pI3OSYAxH1mFcVJNxw3MDxVB/Nh9lFr8TigCGwHRI2MOn
   2966Wh/CNiFWp0WlCqtX1f8zwYrllXrbHnFJTMAdKl/IF747+ihZS/2Vt
   YTgG980LG66j0an2SNaEk3VbPWlnYEuQY8dBaji3mwx4sUyayyHMsy+0y
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166935613"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166935613"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31933D9048
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CBEFEA42
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 039966BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C40CC1A000C;
	Mon, 15 Jul 2024 17:02:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/38] poke: upgrade 4.1 -> 4.2
Date: Mon, 15 Jul 2024 17:02:08 +0800
Message-Id: <1721034151-540-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--2.992600-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrG24YVeuZGmOeEPi9wVyFrvST
	3pdVTxJIhJtbBPDn7JupSccoUoy+5N3OqQ/LhtAVvybt3bgNxoIE9jhJ6ArePMgVyTd/p+/Iynm
	jej0hP2mmP5i+joLD5FQenUCVOyo3k15IUjnVxYM8o3fwIs8rQcE5XPQnBzGXLaKzyzWK8GQ2ZL
	SMma5T/Bab+AC2MJ3seN84i/8IyFqiQ2Dmbjed+Px0ykrbAxjCchr4pBLGIvAH8UzOewTxw34qt
	YI9sRE/5o/rYvVL+ieAMuqetGVetnyef22ep6XYxlblqLlYqXIEKB5PoykMNZJImi3ieYeNQo2C
	IAUVpZ7CkwBspw/7C+kHuvZXEbsAt5s13yT4Z+Ti/lc81kJvrylmqIqSqWhiK25bRy2Ii4T+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111333

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Bug fixes
  - Handle 'strdup' error correctly in mmap IO device.
  - Exclude unnamed fields when traversing struct types.  Fixes bug 31836.
  - Replace 'strtok' with 'strtok_r' in pkl-ast.
  - Fix the compiler to not accept invalid use of 'break'/'continue'
    statements.
  - Fix the compiler to emit the correct code for valid 'break'/'continue'
    statements in more unconventional cases.
  - Fix 'iogetb' to always produce a bit offset due to signature of
    'iobias' function.
  - Fix 'pkl_loc_to_source' to handle compilation from buffer correctly.
  - Fix use of 'assert' function in parser.
* Improvements
  - Diagnostics for invalid casts has been improved.
  - Improve diagnostics of '.ios' command.
* Build system update
  - Handle execution errors for 'pokefmt' tests.
* Pickles update
  - 'diff_structured' function in 'diff' pickle has been fixed to detect
    "simple types" correctly (types that have value semantics instead of
    reference semantics).
* Documentation update
  - Update reference manual to use '.vm disa' as short name for
    '.vm disassemble' instead of '.vm dis'.
* Internal changes
  - Internal machinery for compiler builtins has been removed.  These were
    no longer necessary.
* Jitter update
  - Update jitter submodule to incorporate a fix for 'configure' portability
    issue on some old systems.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/poke/{poke_4.1.bb => poke_4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/poke/{poke_4.1.bb => poke_4.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.1.bb b/meta-oe/recipes-devtools/poke/poke_4.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/poke/poke_4.1.bb
rename to meta-oe/recipes-devtools/poke/poke_4.2.bb
index 296368070..eb840435c 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.1.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
 
 DEPENDS = "flex-native bison-native bdwgc readline"
 
-SRC_URI[sha256sum] = "08ecaea41f7374acd4238e12bbf97e8cd5e572d5917e956b73b9d43026e9d740"
+SRC_URI[sha256sum] = "8aaf36e61e367a53140ea40e2559e9ec512e779c42bee34e7ac24b34ba119bde"
 
 # poke does not support using out-of-tree builds
 inherit autotools-brokensep gettext pkgconfig
-- 
2.34.1


