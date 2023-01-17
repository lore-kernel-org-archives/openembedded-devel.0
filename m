Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3E3C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:17:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.191029.1673939829366786331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=njavMuMP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939827; i=@fujitsu.com;
	bh=kyBJHNHuPbWEAaDd7loMvudHWD8RknAifLxD7Rfm4OI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=njavMuMP18ODdClAvA+u861Mp6/j0fRSgEWZUbNIBHIVpqHKcQY0BWrNylkYyC6Wt
	 yz3FfA7G8ni4TnVBy7rLJUFQbro6KBLMUU9l7szsCbra7UzgQAERr4I5xIBTFgGtvC
	 Ur6fv/4yjeU+5ESFRqcjL5mbsZJq+SxXGaOkJysGXnfyoAw9WoCd7yPOH5/2y8vDex
	 gEVpyMpa4EPlFORtByWpchzgP/qwEo7D8NcJfVM+Ffz8iGLTJFwIOlrKP9BRmyAQIa
	 qwpw2IA4kxyk7H1yTPczxMxueu9G7KTHHeZeOVGLpEYgX4LGpFrJjaWDhH0XpxRWbx
	 qy4C5GVlfTfjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpFvsfSz
  Z4MdTZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNg51H2gmauike9nawNjK2cXYxcHEICDxkl
  Xp3fygzhXGWSuHpuCyuEs5dR4t6rmUAOJwebgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAq4Sx1cvBKthEVCV2H3mKVgvr4CTxPfVE8FsCQEFiSkP3wP1cnBwCjhLtL01AwkLAZU8md
  YHVS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKulGj98AvKVgO6eRPzBEbBWUjaZyFpX8DItIr
  RvDi1qCy1SNfQWC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB8U4pTJXYwNiz/o3eIUZKDSUmU96TpsWQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErynv
  IBygkWp6akVaZk5wFiCSUtw8CiJ8IZbAqV5iwsSc4sz0yFSpxgVpcR5I0H6BEASGaV5cG2w+L
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3iQfQFJ7MvBK46a+AFjMBLfYoOQqyuCQRISX
  VwJTZtG/q4UVH36jbBvdt+inb/6WSf0LnzY8Lqs/Iq5ZHaqob2Wia24Y/WxLEUnHGmFVg45t7
  SydG7vr17S3vv7e75TP8X5f2NKavuH1I8Nn82snrCnpNw1oqnzvsLOPXexLD47Zncbjh6UBl0
  QlHMqZudV0tst9IiJl9RRfPYgF71p17TPXiQw5bCT2YNT3XX+54e5rDRLfDQVfE0hdGOZZdTX
  BlKcxOlr/pqrqb8xtLmrPv0V1zC8yVP4vdqHQKYD54ckG6Aqf/zoPmQkq11baLVz/4sG2uzx5
  NhwvtGtyiU50ufMs2PGVX3Nrz+xTfqzyvjP91NxKCuIve+TAcUmzb9+Vg5IP1LDHvfP+VKLEU
  ZyQaajEXFScCAEGCespaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1673939826!378703!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13675 invoked from network); 17 Jan 2023 07:17:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:17:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 88F921AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:06 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7D7851AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:17:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libtraceevent: upgrade 1.7.0 -> 1.7.1
Date: Tue, 17 Jan 2023 15:16:24 +0800
Message-ID: <1673939785-20072-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
References: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100602

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtraceevent_1.7.0.bb => libtraceevent_1.7.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtraceevent/{libtraceevent_1.7.0.bb => libtraceevent_1.7.1.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.1.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
rename to meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.1.bb
index cff86722e..f876f7534 100644
--- a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "826b06bb2484a53fdae196e12ec507a67ec87055"
+SRCREV = "4e51588b1f4d6617df7e39a38acc0d0daa3d8a3f"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
 
-- 
2.25.1


