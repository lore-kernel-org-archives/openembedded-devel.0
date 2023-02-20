Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72497C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:40:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.7898.1676878839556114682
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wtYwmePn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878837; i=@fujitsu.com;
	bh=9dwi+JbyFmox9TNZ5evrlPy0tFGXgnhQdSuqd6+4fmo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wtYwmePnJ2fLpFXh7M8mLilIROf8gTdC1uqwTiAJKqI6iz1qePAvczhITDZ7MSK5Y
	 T+GAj8prlK1P9huZbG0XpdWO+vbJjU159uI3sYY58Z+nvg3HTpCFECgfFjuvBjrY+V
	 RZBiQfYWyRTErICZILRuRbeFrzWB2KaOSTmMbU74c3pq5u6h0Vat9/JCmiNyx3E3Oc
	 JXq4pTBy+w7uA/sdEZBnJDpwOo5fH0T6+MQ2KP6f4lH/HoGAHVMH62OH/bj66tHrgM
	 qmmqgSftreGiDW8XcGxU2sg6EqVLYs47k4gBqu2O4+H5b7hlCTg1snv6GFdIZ4gc81
	 1Tz8ZIWYquqtg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpPtV+XO
  ywYYdUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aMXS4Fz8Qq/u9+xdzAeF+ki5GLQ0jgIaPE
  gab7rBDOVSaJ5gnX2CCcvYwSU/etYOxi5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBd4lbrTLAaFgFViX0fVwHVcHDwCjhJ3FjuBxKWEFCQmPLwPVgrr4CgxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdQ72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwEBMKVaeuINxRe9f
  vUOMkhxMSqK8m4Q/JwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K1SBMoJFqWmp1akZeYAowImL
  cHBoyTCKy0NlOYtLkjMLc5Mh0idYjTmuHrlyl5mjk37ug4wC7Hk5eelSonzKgDjTUgApDSjNA
  9uECxaLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5j0Ocg9PZl4J3L5XQKcwAZ3i/uMDyCk
  liQgpqQYmgc2bhTaHNqxJ3uq1dlnHhv2TOk7v3uJwSMnj2nqnLctdd7Bs6tRhq6lY92At31/t
  5wynQm9VLFl9KY/9vmCJyJ7e9CitnV+ecX30S3+vGjjnUZz4G77motLnJ6emLHX6cyIyv0iXe
  RP/unpL0QeOvM4eS3LaJ4h0e99vbflmkxk3edv8pscHJ7QdV0/l2VLq/vxN/7LznzVO8+1S0l
  Psl/t7ptwwYulUcce15x8+vv9Hznx2TEnclao/p+q2fCtK2Sa48YLgHLNT8T+zL05497ZNrH1
  JTf7Vd6HsvvY2WUv9uzK3tbP964tY7xjwI/3z/h/JMaphBxiC7ihu9l+8yuH1j3kXiiwk37x5
  XffeVYmlOCPRUIu5qDgRAA4c/v5RAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1676878837!840955!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16528 invoked from network); 20 Feb 2023 07:40:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:40:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2503D1B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 192721AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:40:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 42.0 -> 44.0
Date: Mon, 20 Feb 2023 15:40:18 +0800
Message-ID: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101156

From: Wang Mingyu <wangmy@fujitsu.com>

0001-examples-Include-alloca.h-for-strdupa.patch
removed since it's included in 44.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xamples-Include-alloca.h-for-strdupa.patch | 29 -------------------
 .../{rdma-core_42.0.bb => rdma-core_44.0.bb}  |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch
 rename meta-networking/recipes-support/rdma-core/{rdma-core_42.0.bb => rdma-core_44.0.bb} (88%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch
deleted file mode 100644
index cb472d9db..000000000
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a6c547e46bbadd2c08be9944a85308f6625263cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 23:15:44 -0700
-Subject: [PATCH] examples: Include alloca.h for strdupa
-
-musl defines strdupa via a macro which uses alloca() therefore include
-the header to get the prototype
-
-Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1212]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libibverbs/examples/asyncwatch.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libibverbs/examples/asyncwatch.c b/libibverbs/examples/asyncwatch.c
-index 724796e58..842b94180 100644
---- a/libibverbs/examples/asyncwatch.c
-+++ b/libibverbs/examples/asyncwatch.c
-@@ -36,6 +36,7 @@
- #include <endian.h>
- #include <getopt.h>
- #include <string.h>
-+#include <alloca.h>
- 
- #include <util/compiler.h>
- #include <infiniband/verbs.h>
--- 
-2.37.2
-
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_44.0.bb
similarity index 88%
rename from meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_44.0.bb
index a2d514295..f5b80c712 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_44.0.bb
@@ -5,10 +5,8 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
-           file://0001-examples-Include-alloca.h-for-strdupa.patch \
-           "
-SRCREV = "196bad56ed060612e22674b668b5ec3d8659ade3"
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
+SRCREV = "91392a91eb41affee3bd75dc7d03eb86b4854aea"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


