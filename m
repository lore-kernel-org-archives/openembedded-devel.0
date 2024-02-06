Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62005C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:16:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.17181.1707207357176264715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ahD7OrsM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707207358; x=1738743358;
  h=from:to:cc:subject:date:message-id;
  bh=TNskMrwr17m4xXh/cgyAEX4UHS0xy2Er7EoxzZHMxls=;
  b=ahD7OrsMkOHv8p44AY3VdFTm8eTcDZItJotcGTv2F7bzN1HnapfWnzUb
   A/Kz2gRD70PQpeF3FCC4UiDqrV5mgaiy6X45GSPgGC6GvEx+gjQt+JcPc
   vE9KGDkZjcpvHAektdA3OKjyEDvJ0/IhFMzB5GCk7DNqFCXukiUwKYxJF
   rxGwOzJ4SYheHkrrcXfHBXVLoV4zkvMzOj4mOC++zHci6Shkd1CM2/SwT
   tmE3dXOcnDM5K8n2ffhQnrj5/bM5MB/IgMZWe4RVCANd/53e0De7SzGUC
   EpwR/rmjG4578O+fdN0sLPUqp/Fng92Bo3MoL+cQ5RzUurbA6wPRuDERV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148555829"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148555829"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:15:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 929E61F71F6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:15:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C89E47028
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:15:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F24F52009579E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:15:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BE401A006A;
	Tue,  6 Feb 2024 16:15:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] neon: upgrade 0.32.5 -> 0.33.0
Date: Tue,  6 Feb 2024 16:10:50 +0800
Message-Id: <1707207050-5365-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.523400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mra9qiaDSLgo2r1gUu9f1F/85F
	6tt6M8Cugzq26GBLL/jxWrSkrWUM6LxNGXfew0dmVyAKAMvj1ppReWnUUdhI9YEBeX0uQ+np+MD
	YhfPaDFzCI5ZCQy3Br8Yoh/qEF/tVATh1ufKMwlpO5y1KmK5bJRSLgSFq3TnjoxCLfriDzzioKC
	KkeJEujh1bJkEEwikdAXb7Q0wYAonlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs6p9B
	TuK1CcHjohH2JSG4W4CzZdjBu6auFG2dVeUVgyqV4ZFbkzjGMvBLO/CdukCYJa+YAmQTrD5hHW8
	TdHz2Yx1GwvIL7IU9YgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108605

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
 - test suite now works correctly on IPv6-only hosts
 - fixes for building against LibreSSL
 - ne_uri_parse() fixes for handling URI with no path and catch
   some invalid URIs which were allowed
 - retry requests after a 408 response on a persisted connection
 - 207 error strings are cleaned and compressed to a single line
 - fixed thread-safety in ne_rfc1123_date where gmtime_r is available
 - ne_lock_refresh() fixed to use a non-idempotent request
 - TLS name verification updated to match RFC 9110/6125, added strict
   handling of IP literals vs DNS names

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/neon/{neon_0.32.5.bb => neon_0.33.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/neon/{neon_0.32.5.bb => neon_0.33.0.bb} (96%)

diff --git a/meta-oe/recipes-support/neon/neon_0.32.5.bb b/meta-oe/recipes-support/neon/neon_0.33.0.bb
similarity index 96%
rename from meta-oe/recipes-support/neon/neon_0.32.5.bb
rename to meta-oe/recipes-support/neon/neon_0.33.0.bb
index c364aab36..a0333f456 100644
--- a/meta-oe/recipes-support/neon/neon_0.32.5.bb
+++ b/meta-oe/recipes-support/neon/neon_0.33.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "4872e12f802572dedd4b02f870065814b2d5141f7dbdaf708eedab826b51a58a"
+SRC_URI[sha256sum] = "659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8"
 
 inherit autotools-brokensep binconfig-disabled lib_package pkgconfig ptest
 
-- 
2.34.1


