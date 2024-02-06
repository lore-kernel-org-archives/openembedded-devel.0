Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50185C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:43:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.17431.1707209022988303818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pNUv6vqF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707209022; x=1738745022;
  h=from:to:cc:subject:date:message-id;
  bh=DhHFNGyIJwUTx3BR8sFP30R1Ujt9dhXKhiahynx1MeU=;
  b=pNUv6vqFmiqEtsK29gAf7+/fvn7+bQ0qng5uIjnTaTXaURUnAJAjVs45
   ooP+VqesyHPLGuDmEiVJSaHcDqP23FNKKgO0+92DqMH4DnEpdr08GiyBn
   Ue/1HKgn7ZLPd1WRDW2qFvxj39u0FP9kl2N8S+MAOddS9jlMrw78KeL9o
   Z0ETQ05p2vQr3PlkX+3BbS70t/iMv6sV422KnACAfq0aKZB+B+2uWXHZ4
   Z/z1UuZP3MfGlxJXGqWPjbWgbNaAwuGGBSiEa0rkUo9+wgBsecjlO574D
   DuAHv2zGvKobH5XEowcdjyR3mxLAAzwo+eCO1WZ8Y42N7+vZMOZcx/i9S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="127325638"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="127325638"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:43:40 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A58C4D772A
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:43:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3F8ED506C
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:43:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 720A8200968FA
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:43:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F0001A006A;
	Tue,  6 Feb 2024 16:43:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.16.1 -> 2.16.2
Date: Tue,  6 Feb 2024 16:42:59 +0800
Message-Id: <1707208979-5883-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.354400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrnITPTa+uKHEtMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMu7AMMulsbT/M4gXzGWwQSHAx
	lczkCbbv48FSTcbKYK54zP+EuRpYTMKbRY0K3eN7n6fsIGcZBn2JLioyBm48FUQCxSGqUN0ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108615

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Spelling error a,out -> amount

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.16.1.bb => python3-google-api-core_2.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.16.1.bb => python3-google-api-core_2.16.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.16.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
index 6c2511885..4d13b2e78 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7f668ffa3d5b9f3c6930407e5f5d691c05a376050a5a5fd772b9dc32e70a0c30"
+SRC_URI[sha256sum] = "032d37b45d1d6bdaf68fb11ff621e2593263a239fa9246e2e94325f9c47876d2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


