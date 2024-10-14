Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18920CF2576
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.50494.1728896173975221498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xnr/mvcr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896174; x=1760432174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nq0PpIS9PG8XB6V+RNSdr5Pnbm3CHv6k5et7chUt3mA=;
  b=Xnr/mvcrLrbpZcyeIwacGiED8GW9WgA/ZBbmlbFqtnXPIPicffbhyjpX
   6UX5+VEv99SUU//M3Pft7OjMvG5HkT63qJ3bEtWeEraF3siQZgkfKtr0M
   G8fyHaMSxGsQ3zqKmt8izpe9rKje7FiN+nEgl8RECw41mCuUyhw1ugJ+s
   ZtkmVUTFcJwopuEqmyF7sw3sdXsB9XHNZRZuQ4DfMcFP9lS+y8TYxW8nE
   Cl9BOoO7G74BnqJRR0jmgfxcQeVHd9qQaiaZnYHLPxrl3lo6dsKxqqtMp
   eE+yrOu9nGemFQyCuURtP4DKoR9d3HTTGChUFbVvefo4o3aYlhT1dij3T
   Q==;
X-CSE-ConnectionGUID: HhlxFJHeQEOcMwgTmFAZ+A==
X-CSE-MsgGUID: VG5M+tNiTDaPO7LWIWgvoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="165031666"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="165031666"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:12 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A00CFD29E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D5B7ABF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7394620071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A5201A01E9;
	Mon, 14 Oct 2024 16:56:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/54] python3-pyperf: upgrade 2.7.0 -> 2.8.0
Date: Mon, 14 Oct 2024 16:54:57 +0800
Message-Id: <1728896115-2944-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--6.545500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrZFW4zmF+QEIvfU/riSJXkSia
	SqRpkfBtZD6YJVLlOr4KRuKRI67R4F+ppKXyNuu/WDAqA04FJPGUq+GQ/zyJdKc7pchzt8uXJV5
	8NUakn3DU6yvurZapF7hMPLktub63EuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7pUbu
	FGyT9U9YoatW7nAcLKMmJzkNWJ9QIgvj5WZAvwW66XHIc5w+gc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112886

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Refactor operations to fully work on AArch64.
- Fix the max_mem_rss measurement
- Allow setting the amount of warmup values in Runner
- Add hooks for calling arbitrary code around each benchmark
- Use KiB and MiB as units instead of kB and MB.
- Fix Spelling Error
- Make hooks work in bench_command subprocesses
- Fix deprecated method in bench_time_func example
- Separate subprocess writing/parsing into their own functions
- Fix "std dev" link
- Implement --timeout when running benchmarks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyperf_2.7.0.bb => python3-pyperf_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.7.0.bb => python3-pyperf_2.8.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.8.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.8.0.bb
index f3ebfe2d9..9857701b5 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.8.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "4201c6601032f374e9c900c6d2544a2f5891abedc1a96eec0e7b2338a6247589"
+SRC_URI[sha256sum] = "b30a20465819daf102b6543b512f6799a5a879ff2a123981e6cd732d0e6a7a79"
 
 DEPENDS += "python3-six-native"
 
-- 
2.34.1


