Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202BDC27C44
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.10752.1715677833910753373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tTYSgABe;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677834; x=1747213834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nbwv534ZICAL8ytg2FrLfBIzOs5aSFeh+ofPv/YocMs=;
  b=tTYSgABe78eBUUz4W6w525XdUdVPYEXVQjxNWadyAci8sD4os/irMkYQ
   jLVayamB4acHXipM0aVxSChRQkoqKxDTJIkdX05JJ8A6OIY/+p5I3q/Ow
   ir8lbqwSJVDF76ZgzFyGm9L4ICo0wHSc0SbVF8gRWRkZ4hfbjIuTP0OWu
   jDgZnpA3Vq3fD2x2bkPogRj5YEgEJozPTZiYU/83KB43ebWULYZaZa/dO
   oIbamEvWnlKmjJdPFge4sbigPriSJsAbNiKEGedYPPlBsrRKumQ2m2gNU
   U2XAUyREOzBTPa1XvVzag95WsaYTBOxvR7YEL8Ifk8c0YTzXM3XagAkef
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146230421"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146230421"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11F43CD6E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4322CD0D99
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CA74620076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 778951A000B;
	Tue, 14 May 2024 17:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/44] python3-asyncinotify: upgrade 4.0.6 -> 4.0.9
Date: Tue, 14 May 2024 17:09:49 +0800
Message-Id: <1715677817-2223-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--3.584300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4s/vUphzuigbo
	TDS3zulA6oELKh7X24WL1gp8ViXFsrBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtB4K0yQXj2NWWatfqaEgK9VLZTCoMORLok2uodKrmN42b6LhXLgd3UHdJu
	YCsbx0ZK3EsljOln5NkOokXyyp5MlWXPBBE6xTcHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110362

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- switch theme to furo from alabaster
- add .readthedocs.yaml
- bump version and change repo url

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.0.6.bb => python3-asyncinotify_4.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.0.6.bb => python3-asyncinotify_4.0.9.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.6.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.9.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.0.6.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.9.bb
index 34f7187d4..0946dd2a3 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "c03fdb1a7dbb6bed8ede763e4e0ac224a2a3157bdc51e4ba3832588a3c29904d"
+SRC_URI[sha256sum] = "d0fc2c9af487b6ac2a3bd7db7b5139de54afcc3660720f80d7324b122a27c1c7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


