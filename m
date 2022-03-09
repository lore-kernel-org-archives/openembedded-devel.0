Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F7FC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:45:29 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.4129.1646822727479344749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RiAnIwqI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822726; i=@fujitsu.com;
	bh=uA2I6CRZmRrPPnbzD/LI25VOMezOWmSriv2S5qHA88U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RiAnIwqIb7tn3ZDmq6RQN1tMQbElhXqLrfBeRViscjCHH4srxCLEutyOuksHn7n9S
	 O/4UiVRO0/+3Ne77A9uswvjKG/mMJvkJSwRn1KswtRv0CmlicCtLpfZ7pYgqSJP5/X
	 nIre4zXrq7okcgrgXP13PHgsmuH1RGu/dKaaXJrhp5kEdO/Gu3f1We67tM/hefaTqh
	 FMCEk4A/iUxzBQjXQTQIuPrp5nznqXCbIOk00u/52rDIQsaA6biEE47zqKN3Lw1KUH
	 twPVu7Orc3K7pHRUyT5Lz3CnhE8e/9M3xtZBJuAu6YiBSRrGMOLt+uJAHFzp+PO8XB
	 8fdYfH/tFw6iA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqOvaqpF
  kMO2UusXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF3VitzwWuOioZZe5gaGKdwdDFycQgJPGGU
  uLxgChOEc4FJ4tGLv+wQznFGiYs3JzJ2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJbHw4SSwehageO/66WA2r4CTxLXza8DqJQQUJKY8fA9mcwo4S0z68Y8NxBYCqvlx/h
  wzRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRrukosz0jJLcxMwcXUMDA11DQ1NdM0tdQ1MzvcQq3US91FLd5NS8kqJEoLReYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgOKcUu87ZwXih76feIUZJDiYlUV6ZYI0kIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8nU1AOcGi1PTUirTMHGBswaQlOHiURHg/1wCleYsLEnOLM9MhUqcYFaXEed80AyUEQB
  IZpXlwbbB4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJevBWgKT2ZeCdz0V0CLmYAW2xm
  pgSwuSURISTUwrfp8vvTN1OMm89sSr794umFfZOLzjRtUUjn61qlpVLcmVEg3X1jes/zdb7Wc
  nfq7L8e+szbO/jjL4n/gcZdSDbmrsUtOfX0hvfD7b77PzUovXoUeOLhk65m911ZwK+6caf5Fb
  np2+5ujZ+Jfbbqz7sO163ptBiueTd/PZbSmreLC4+NsfyLfqN5V9V140Pbo/qK98R9TOA4w1V
  6yvPJxwxlf99BSk10+gpprHn3bdbH9s83Lo+/mOIctN527tugOp32RykuB48fWWq6YUpH0aY9
  E84+GaT43V5zelvzg6PWohFtPPV3iRKPaq9usFLXz+5Vf570Xu/H75TLlhu4PnT/qOY99W7Io
  Z4N9QJim/nUWJZbijERDLeai4kQA1sFwPWIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-545.messagelabs.com!1646822725!3615!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25756 invoked from network); 9 Mar 2022 10:45:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:45:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C19951001A6
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A2DDB1001A5
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:45:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-networkx: upgrade 2.7 -> 2.7.1
Date: Wed, 9 Mar 2022 18:45:05 +0800
Message-ID: <1646822705-61973-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
References: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:45:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95905

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-networkx_2.7.bb => python3-networkx_2.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.7.bb => python3-networkx_2.7.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.7.bb b/meta-python/recipes-devtools/python/python3-networkx_2.7.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-networkx_2.7.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.7.1.bb
index 10030074d3..9e5b086a99 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "effb7d9cd5c36e1e0d33f42a3aef5badde5030535826a367d5cf608a170af515"
+SRC_URI[sha256sum] = "d1194ba753e5eed07cdecd1d23c5cd7a3c772099bd8dbd2fea366788cf4de7ba"
 
 inherit pypi setuptools3
 
-- 
2.25.1


