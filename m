Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30928D49203
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.37267.1731922213179768646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F9eky7LY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922218; x=1763458218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pPZWV5oB0Dg8eKk4DbucQ57uaBYIAgaoxNmT8gOtWqc=;
  b=F9eky7LYnYQfV9WA2ISnj9GpOeqv9SpRr/lgb24KloRKX1ZGgO37rvCx
   +QInl1wL+zwSKXd/p2OYIR6pKyoOL2RXgLaR1y38pr21NNQoA4MaH0n8l
   01QjieYXFxEZnz+EyNCXTXJPH/6Z/3nqtX7LWav+6lD3NrwdQHs1jdYT+
   LmeB4lL9IT549I8awfntzOQEeoH9yFiHk85KgxNGYOoNRkaAz28aP7vU9
   g9Ky0690ms39bf5XY1pItAqOjXWZA04dw6h8gky0sBPEsqmZeZP+hqQbn
   PkmTNptWqmwEeWcmVkH9569hJvcxxLbBMCghpkyKJBNQJ0rgp9bYTKAUd
   w==;
X-CSE-ConnectionGUID: rrWltpa2R4udn94TXCCNww==
X-CSE-MsgGUID: 8FasuBaMRpW4N/ouzOq0GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168136725"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168136725"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DBA1DBB9D
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0A5ED6FE3
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44EDB20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8F531A01ED;
	Mon, 18 Nov 2024 17:30:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/32] python3-pyperf: upgrade 2.8.0 -> 2.8.1
Date: Mon, 18 Nov 2024 17:29:46 +0800
Message-Id: <1731922195-5266-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--1.258600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrQR7lWMXPA1vMB0kPsl40w0hC
	tyheYJgV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHVlM00Kc8zD7/9LYahWJ8EAoT
	uTBB+oT9yKHkpr5Pyf8ZovNzIhQj53SLaC1QgV+bR78SmJ1NEu9E+eA0IZyzxaLuujAQ7xhex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113889

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bugfix: Hooks now work correctly in subprocess benchmarks (bench.run_command).
- Python 3.8 is now unsupported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyperf_2.8.0.bb => python3-pyperf_2.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.8.0.bb => python3-pyperf_2.8.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.8.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.8.1.bb
index 9857701b5..a9f30745b 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.8.1.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "b30a20465819daf102b6543b512f6799a5a879ff2a123981e6cd732d0e6a7a79"
+SRC_URI[sha256sum] = "ef103e21a4d04999315003026a2d659c48a7cfce5e1440f03d6e72591400713a"
 
 DEPENDS += "python3-six-native"
 
-- 
2.34.1


