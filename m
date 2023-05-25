Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56702C83003
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6061.1684997788859697057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117405091"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117405091"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:25 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 34D96D29E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C291D9A7B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C43BA2007CA80;
	Thu, 25 May 2023 15:56:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.19.0 -> 1.19.1
Date: Thu, 25 May 2023 14:56:05 +0800
Message-Id: <1684997777-2061-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-0.263300-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yUIIxwDaU5mr0NnUUVMlTKbMVlFqf7Fxu3G9
	F+cXkyli94Fp/lSvGiY7PAsbBuvo3WC0wJ6cyme5K0+leiJxLle7ggJ29b3hYTQQTVweW/TMHGp
	23bat06DWPKk1jTC1ptWTXnicoB4Y75zkgvo5OA5g7YsHFMzCIGl5nVxdmJvHnZzXQ/cXPaCe1T
	cu/lFv/ec/TgNYoEwyEE6OGkkJBqt+vCHRWV5XHAPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZlXePXNM4FjPAQzqh8D4IY9W0pkpPR1DaDuhh
	x8YYGQ9bJcQH3furV3k48PxckV+kHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUtNYcsRl2g9iQoja
	/7iqYRPaWIHhAEUpuY8CIYkWVI2LPU+4flvcUSqPW8qXjRxRgQfRHYPq7HzucTGyNbsVKt9mb58
	Tu4JnR7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102806

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Security
---------
- CVE-2023-32067. High. 0-byte UDP payload causes Denial of Service [12]
- CVE-2023-31147. Moderate. Insufficient randomness in generation of DNS
query IDs [13]
- CVE-2023-31130. Moderate. Buffer Underwrite in ares_inet_net_pton() [14]
- CVE-2023-31124. Low. AutoTools does not set CARES_RANDOM_FILE during cross
compilation [15]

Bug fixes
----------
- Fix uninitialized memory warning in test [1]
- Turn off IPV6_V6ONLY on Windows to allow IPv4-mapped IPv6 addresses [2]
- ares_getaddrinfo() should allow a port of 0 [3]
- Fix memory leak in ares_send() on error [4]
- Fix comment style in ares_data.h [5]
- Remove unneeded ifdef for Windows [6]
- Fix typo in ares_init_options.3 [7]
- Re-add support for Watcom compiler [8]
- Sync ax_pthread.m4 with upstream [9]
- Windows: Invalid stack variable used out of scope for HOSTS path [10]
- Sync ax_cxx_compile_stdcxx_11.m4 with upstream to fix uclibc support [11]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.19.0.bb => c-ares_1.19.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.19.0.bb => c-ares_1.19.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
index bb19ff1bd..1440d7271 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "fddf01938d3789e06cc1c3774e4cd0c7d2a89976"
+SRCREV = "6360e96b5cf8e5980c887ce58ef727e53d77243a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.34.1


