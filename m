Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7B3CD1296
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.39356.1711983099599367728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l1HjQL+M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983101; x=1743519101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RmZ5rJCksDmNX0YMCWgXLlu/sgE+Alxm3bRCR31Imxs=;
  b=l1HjQL+Mttc7FG1iUJVYY+/AFHFaqsVn8ciMmIDYEWMplKPbWcu0E5mv
   P0roT0/z1SJrImLZHRhZ0TiL1PCHAzd2R7E1ESidAhm70AcarWG6RWbnX
   N93ZMhvVbbte7Nt5u0YOWMjVP+sr/nn+PV0AfgvGyvZNsVPU4LypsJQap
   cRXKhZv3PhzEZauwCenWmzGEUeiMGyXEUBQxwU/s8pJj6WGLou6JQw0rj
   oJOPdyYkKn+5sjhQUFEavU7re2BrzBRQbXf+xitCYzNfA4+9ZQJlponSt
   pIbqxbDGICWoA/elC35merNKJisiXTWUNetKE5lhWPZ2HF4bR7n4gBWfq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154534826"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154534826"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:40 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AC030E36E6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E97ACD5022
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7732E20093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D31A1A000B;
	Mon,  1 Apr 2024 22:51:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/47] python3-pyasn1-modules: upgrade 0.3.0 -> 0.4.0
Date: Mon,  1 Apr 2024 22:50:59 +0800
Message-Id: <1711983079-16849-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-2.200900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzXFwTHnELZHgx7x
	XfYhWv+NGKQaFKGPWNNyDkRoj4ZKbBtSB+SwKRub8x3PqFMA/tOK90qE/lTCc7pgUMAOb/zKOmS
	tDehIjqiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109743

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added support for Python 3.11, 3.12
- Removed support for EOL Pythons 2.7, 3.6, 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pyasn1-modules_0.3.0.bb => python3-pyasn1-modules_0.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.3.0.bb => python3-pyasn1-modules_0.4.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
index ccd6025be..34f3639e5 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "5bd01446b736eb9d31512a30d46c1ac3395d676c6f3cafa4c03eb54b9925631c"
+SRC_URI[sha256sum] = "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e905f17b6"
 
 PYPI_PACKAGE = "pyasn1_modules"
 
-- 
2.34.1


