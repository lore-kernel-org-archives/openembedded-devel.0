Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308BFC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:20:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.16473.1666595998012056197
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yIcPIAG4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666595996; i=@fujitsu.com;
	bh=gQ30XxEyKZ6x9vJorKJjC3KSeRUdiz5Y7NQDSJKfVsQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yIcPIAG4vPlFkBJ34UR3xMF9xlQWg+DqKPcXbwMZnUu0S5dmzgK8rKkO7BK8zOVN5
	 vQwkW2SK1bApwpAfbwyfBW7bsUKt/FiANDgCe+tVZ463SLixxiGJjIngxGJVlcKQz2
	 MaIdD2T+jEfsdbv4OW6lZHVJP33+dRjTrW9eVc37YJXEMMj+XgxbRJdYpSzrgikivr
	 0PgNN4rRIFYdafB26xZo2r3sxy7LdqNo+RZlUpDznnQkMdI5I07xdPLnn2n+pMEGY7
	 PGJ3TDYTHcoduvgfC/ciGcwhmlr9iYLOkCrBh7uM8mNklXrgpcM2Qp2YqYVd6EGXr3
	 SEaFp1glxa5cA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSXeOTVi
  ywbtXTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCBUkFCzgrNt6YztjAeISji5GLQ0jgCaPE
  5gNbWSCc60wSF353QTl7GCWm3TkG5HBysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SzgLbFi5VKwGhYBVYnvU6azgti8Ak4Svd3LweISAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIW
  oUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI1MtBLKspMzyj
  JTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzGlGLGKTsYe5b90TvE
  KMnBpCTKyyAelizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrdGCygnWJSanlqRlpkDjAyYtAQHj
  5II7ywjoDRvcUFibnFmOkTqFKMlx9TZ//YzcywHkzO/th1gFmLJy89LlRLntbMGahAAacgozY
  MbB4veS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeY9ZAk3hycwrgdv6CuggJqCDLq0IAjm
  oJBEhJdXAVGMud9dTWrRqAv+kx/zzjLPDfbc7LA99eoPRXM6JKfrOtX9t0fkSmyR1vIzSdhlW
  HuH+EszJc+jENgvH/H2NP/RsagwXvH6deTEzb/Intx4Na+Y+BZWovB+zKi5f3TDVenNfxjn/7
  RxXtxsaVYc6PhZMURRVcmhOtr5VHPckkdlu+uM9u5RYDmk+mVqZ4tPOsWJSiu/iT9u+2Wwp/a
  N+7YLqEnmNrozI+CulvlErZzGYS1iYb6//6zXb6PuLZn1V3406v78rf5ggbiYUuvbc5q1Gu26
  dNivaFBe0ePG8pVOm/NWb8FZOIJfbY4PEN5bcsv7rl3OY5ORURO711b74M9O277q8/0ufxMNz
  ZskosRRnJBpqMRcVJwIA90iqWVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1666595995!200933!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12801 invoked from network); 24 Oct 2022 07:19:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:19:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A39EC1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:19:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 96F331000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:19:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:19:53 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.2.0 -> 4.3.2
Date: Mon, 24 Oct 2022 15:19:37 +0800
Message-ID: <1666595977-29850-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99290

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.2.0.bb => python3-pymongo_4.3.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.2.0.bb => python3-pymongo_4.3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.2.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.3.2.bb
index 62b6a941b0..fa43b7f403 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.3.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "72f338f6aabd37d343bd9d1fdd3de921104d395766bcc5cdc4039e4c2dd97766"
+SRC_URI[sha256sum] = "95913659d6c5fc714e662533d014836c988cc1561684f07b6a0a8343651afa66"
 
 inherit pypi setuptools3
 
-- 
2.25.1


