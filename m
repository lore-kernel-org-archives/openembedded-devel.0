Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA267C04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.7646.1690875751122537345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114651552"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114651552"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C567D4F59
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC965CF7CA
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DDDA10211;
	Tue,  1 Aug 2023 16:42:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.0 -> 20.24.2
Date: Tue,  1 Aug 2023 15:41:54 +0800
Message-Id: <1690875717-21608-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.137700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrjdL0b7DvTG6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzWSaIRQoExSx3T7
	E5egZO35wbzF8dmED/xfkkcDZlzpzajWKKn1m+O5yqngdA0SjKi8CtS8TVnL+H6iIIlBBNWEO5N
	OkMduYFiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104194

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Bump pip and wheel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.24.0.bb => python3-virtualenv_20.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.0.bb => python3-virtualenv_20.24.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.2.bb
index 8b849df31d..52a99ccda6 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "e2a7cef9da880d693b933db7654367754f14e20650dc60e8ee7385571f8593a3"
+SRC_URI[sha256sum] = "fd8a78f46f6b99a67b7ec5cf73f92357891a7b3a40fd97637c27f854aae3b9e0"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


