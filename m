Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC8BC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.12704.1716861017038116439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eElpgV+V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861016; x=1748397016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AXs/o67msEx2ytPsgKKVodRbXff3hLzyQD5aWUaFtDo=;
  b=eElpgV+VadIg/LxW+vb6Z7lP4vu/YZZzClpcvGN4sM8YQP+Tly0cqhTv
   Fr+rNWOftd9yJ+nRU5iRv0H1DEidpip/5unI1Erg5xNMXspU0/IDnI/2T
   gmTA5q6ILgw7yB732hvNK6nvJ6778K0ZpIft6vzCVFHX9/q6TsyuMwFTF
   ZVWCR7kbd6sqtpt6yVuyspCs0744pmYdGG+5w8JGNbtVm8qRBTxaP0E4E
   0KdWCJhuYzZsQsWjdjkUlrcBtkT28bsELrv6OAOzhe/zJs/1pLJY6v/uO
   5YfXlTWgw8gX9C2DLOokkJLEuuGNGY6kJcrMomNKe+2IzgHGeFdh+jEQH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160448557"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160448557"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:14 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 13693C68E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45B4BD7B69
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D16D52007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 56EFB1A000A;
	Tue, 28 May 2024 09:50:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/40] python3-pyperf: upgrade 2.6.3 -> 2.7.0
Date: Tue, 28 May 2024 09:48:04 +0800
Message-Id: <1716860901-863-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--3.542500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvmMpl5KXG7eBYz
	bMgyIvQWPQy6oQaP4bHHabnThzwuaSzrPg+MjoVukCThXPqsqitzNCdGumZsSZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcu+K/AI6W07vIa7Coctq8cDYliSyXiKq9rPQK
	0BrVNfo+L4guAaR06obxORgytzp/Qh9K0Ui4XrsNxjoxxhFi8EIn+gpadh55/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110558

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix typo in example docs
- Update --table example
- Include CONFIG_ARGS in Metadata
- Fix typos discovered by codespell
- tox.ini: Replace flake8 with ruff
- Add some ruff rules for pyupgrade
- Disable TurboBoost tuning settings on non-Intel
- Fix logic in MSR availability test
- gh-187: Support environment variables PYTHON_GIL / PYTHON_CPU_COUNT

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyperf_2.6.3.bb => python3-pyperf_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.6.3.bb => python3-pyperf_2.7.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.6.3.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.7.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.7.0.bb
index 6b37e1864..f3ebfe2d9 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.7.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "9752fe749c21e460a564bb3f52fc319b892c62ee61c5138b4a9bbf94ad2755e6"
+SRC_URI[sha256sum] = "4201c6601032f374e9c900c6d2544a2f5891abedc1a96eec0e7b2338a6247589"
 
 DEPENDS += "python3-six-native"
 
-- 
2.34.1


