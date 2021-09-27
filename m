Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F332C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:52:32 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.30702.1632747151003382519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xgm5IQ4z;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632747149; i=@fujitsu.com;
	bh=9a/v6ih0f46BIRy+mIvmwFytIt1sRIkay9UP2vHJ8+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xgm5IQ4z4aB3lkHqwMDG+bvtQ0nhm0r1iK+lKghyE4vbkTwhTKaMaiSBDp4wA5+K+
	 H781WJvN8XNMIFztQZvEgGGaf832pOX2tbz0uHWKTRjQSEhQOl7EtXR43REC8cOxJM
	 tvJTK02l2hDP5jigWIK4hFunc8qF0hrKuDaE/PeqLnJQDbwkjZr3UCfVGAhg33r1sX
	 76uQ6yOqUC8rB95/921iftohB7QNFXJRofBnkShhekgk/nq912HNa/8mlaW77TTGLO
	 4jiUX0Vhi4nYvvA1M+hs8WoCDxZ9aQBpSoVzDHnX3qHqmYML00MHjC8eZqrJoVHXWo
	 6eAYWurb22Yvg==
Received: from [100.113.6.157] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 91/68-23595-D8EB1516;
 Mon, 27 Sep 2021 12:52:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRotuzLzD
  RYN1tHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePdxMqCv+wVW9/cYG9g7GTvYuTiEBKYzSRx
  YP8qJgjnBKPE4X/LgTKcHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43QNUw8EhLGAvcXV6L
  EiYRUBV4nH/LkYQm1fASeLBg+dMILaEgILElIfvwVo5BZwlNt5/ARYXAqr58/QmG0S9oMTJmU
  9YIMZLSBx88YIZoldRYvblZhYIu0Ji1qw2pgmM/LOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqG
  Bga6hobGuqa6hqbFeYpVukl5qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMBxTClln7mD8
  9PqD3iFGSQ4mJVHekLWBiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGfsAcoJFqWmp1akZeYAY
  wMmLcHBoyTCy7EXKM1bXJCYW5yZDpE6xagoJc5rAJIQAElklObBtcHi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd5skCk8mXklcNNfAS1mAlpcOykAZHFJIkJKqoEp6uH3D3f2PTmk29T
  op7DdVUNmxuHtp1PaTQ7d3rzy9O+3jLmr288HbG2/cFBYTy6qW6wpoe6Z68yVHp+idz2cLCde
  EVSz3fVdRsLveMvqU8+zrpqdfSRykXeC46MHMVz6nBXFGzj2vhGZE+Pxujs1hnm18GSH1Uu1b
  33umL3j5bu75tNE/4qd9dw14cGC53ucnK6znRQO/DjzRbzhYZ6zwgwO+7s12KPLOfmebTFc57
  VuQsn+C/OuzVO6fLpFdIrKFOuNy5hdVl1kDdm6KKxVapp7xRLDawHWf6qPb0vs/3wuNn5WYuz
  +o143T/NY58us26uw5PZbNd+fFrXrhOQsO15LqPiWbK9TO9pxsiN9kxJLcUaioRZzUXEiAIo1
  6DxCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-238.messagelabs.com!1632747148!290230!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11959 invoked from network); 27 Sep 2021 12:52:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 12:52:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RCqI1Y007977
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:52:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 13:52:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sanlock: upgrade 3.8.3 -> 3.8.4
Date: Mon, 27 Sep 2021 20:52:08 +0800
Message-ID: <1632747129-70797-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
References: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 12:52:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93143

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.8.3.bb => sanlock_3.8.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.3.bb => sanlock_3.8.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.3.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.3.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
index 11a165ed79..fa08d0f98e 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.3.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
@@ -16,7 +16,7 @@ PV .= "+git${SRCPV}"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch;patchdir=../ \
           "
-SRCREV = "3a750fed849405c745dcb7b4ceb85f662c53d8d0"
+SRCREV = "a181e951376d49a82eef17920c8ebedec80b4823"
 
 S = "${WORKDIR}/git/python"
 
-- 
2.25.1


