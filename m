Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046A5CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:01:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2746.1657177269442337773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CEZA8R76;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177267; i=@fujitsu.com;
	bh=oJRJpe8wK+SJWgfDLcHlcUqMaqRrAHM0aqCMDE7IJNc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CEZA8R76otZFhPg3WucQ3PKyDpH6skKWjIiXKnqmIIbGC20Goquwz3FywfdtrnlvS
	 DpU0DgimX8RDSE0uQncjdLWmgXASY2codIhOISnz3sWpNEs5aZ2HEIs2M+wL8YIYfL
	 KXZaTY8+TdIK7uRQzBx40Et9F3DbOB/1VH4dIaY8tEYsATaBV95TjiqMHTjhxmZlYC
	 iwl+wudJy3ojPnTUVO5VqJsXVAgdofZpT8sNxvwmlmSBHG1B43qisl8vzR7N26hTgj
	 F4D42CO7kZY3Qyv7stcs3NQT9IdunrrTK/UrrbU5R9gPUn2cB1zdnWIhNPpQTy4Cml
	 4hS8reJuAvBVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORpLu55Vi
  SwboXohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bD15vYC9o4Ks6dvMnawLiCvYuRi0NI4CGj
  xOJLM6CcK0wSCy8cZ4VwdjNKNO/axtzFyMnBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAU+JFYf3gsVZgOLXnz8Cq+cVcJK4fvwtI4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPGCGa
  JGUWL25WYWCLtCYsaMbWwQtprE1XObmCcw8s9C0j4LSfsCRqZVjNZJRZnpGSW5iZk5uoYGBrq
  Ghqa6xqa6hhYmeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgYGZUqy8Ywdj
  26qfeocYJTmYlER5veqPJQnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4OVvAsoJFqWmp1akZeYAo
  wQmLcHBoyTCy9gMlOYtLkjMLc5Mh0idYtTluHrlyl5mIZa8/LxUKXHeeyBFAiBFGaV5cCNgEX
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvJ8gUnsy8ErhNr4COYAI6Yln+EZAjShIRUlI
  NTJq8C+wPt31fL/fE2mLh09K4pj7xLfb36ifwTBFgy/V7XOq/8eWpTffeXVzynrPPVov7xpbV
  v6bU6bEFVm/YaLduYbpz2WUbl5iGSR0zZs0tmrc1/pze7B3746ccfRfr/JpBd+b/7kWLmtJrg
  /uP7WG6o7W98zXrs74Xk0UE9/vEfNpsd+TzZMOXJuWTVPMl5MpmskyZ0jpjh6LV2RcHJJy+cf
  7I1Ek8G2T4f3FWc2nClLtP99U9Un2pyc8240+T+nXp84op5z2k1O++tMi/FrKuImG3qNPCGUL
  t3adX6b42PpdVIP40Uj1AmLtac9vMafkHs7qfxv7ZsePIHcX78hxbfSpk1xZ9nrV8w/TinudK
  LMUZiYZazEXFiQC191ylUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1657177267!13686!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30182 invoked from network); 7 Jul 2022 07:01:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:01:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0E4FB1B3
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 025B21B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:01:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.9 -> 1.31.10
Date: Thu, 7 Jul 2022 15:00:42 +0800
Message-ID: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:01:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97742

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.9.bb => nbdkit_1.31.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.9.bb => nbdkit_1.31.10.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.9.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.10.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.9.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.10.bb
index 673fef841..07870bb2c 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.9.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "20f52c40d666ef18b9ae3aadac5a4ece428dd11e"
+SRCREV = "1c31e0e5397646ae3709b1fbfd9c3b47b904f254"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


