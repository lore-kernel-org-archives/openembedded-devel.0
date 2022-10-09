Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F5DC433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:37:26 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.9540.1665275837723311743
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fiu7AQKZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275835; i=@fujitsu.com;
	bh=kM9/eqSrjjFOp7S9zJOMHRllSoOCdlM1p55Wr1JfEEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fiu7AQKZCtiuzIpazHzeeY6MV4UCEQUM5T6k5tjNL1GtZxYiyI3q5o/Y4OPDqx67e
	 0m1GIkH/xjac0+9/yut+V9Yo5R+JbJM7sU4Zt+y7iERN21H5FtNlHjicSkDdnPSNyH
	 i1dOe79adxPobtoIA8g8OSVBUyTm0zk9yzp68kcAcs36Eru8Ewj4tWCrqZnj0uQNFB
	 rhKGPQKz2mbWwLcImVnsKfBuO/dsQylw/fu1mQOGaDwdyF/NYzQYo+ktXx9pqz0tcK
	 FWi5f0BWxaY86jEzm2LHOkmElHa2y5v/4t8iwNIT+b39E5jzxngevE7HduBPvbVb3m
	 oj5GS4aegREbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqLtL3Cn
  Z4McfS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqLZ6C52wVbTuvMjcwTmDrYuTiEBJ4wigx
  +8l7VgjnOpPEx2MN7F2MnEDObkaJhe84QWw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4Bq
  xcWcJU4teU8G4jNAhTf3HsbKM7BwSvgJPH9nCxIWEJAQWLKw/dgrZwCzhIP1+xnhVjlJNG+6y
  nYGF4BQYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMlklFmekZJbmJmTm6hgYGuoaGprrGuhZmeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgeGbUswctoPxT+9PvUOMkhxMSqK8T7c6JAvxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4HVid0oWEixKTU+tSMvMAcYSTFqCg0dJhDfsn2OyEG9xQWJucWY6ROoUoy7H1StX9jILse
  Tl56VKifPGCgPNEAApyijNgxsBi+tLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5PwgATeH
  JzCuB2/QK6AgmoCOsHtqBHFGSiJCSamASkIvvsI3ZJnhb0nXPBrU2mcfeuQ8Pff3Sec/057v9
  PjtdTW3tLjvPMFw+beotzxTJN1IbgytcD5Zfvljbt1y/pirg8YQ3CZP/6U+0nX/GQXNKdWSDf
  s1TjWbxF5vm/9bafHlKd4rjaX9Nb9PLvxpmOPUHlbcosbilKPFPNg/m2eLw0/CL766TL1JWNa
  cEXlvpIeh9/Kf5FR9/kV/cynt09DrbAp5fYHHfu5n95r+9C0y1dsquXfz1nvCt8HC2+1l1V7k
  n6otdNPvU8+WTHv+K2/wPrugu2vTmW5/ujJAYwX9zshmsDsaVZeSqFJnwG3f3BHw8Iip7M+Sl
  fDSfrJfmetvHToncq6Zs26WyY78SS3FGoqEWc1FxIgBKrJAaZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1665275834!263203!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17040 invoked from network); 9 Oct 2022 00:37:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:37:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 93E5E100195
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 87D30100043
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:37:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 2.0.8 -> 22.9.29
Date: Sun, 9 Oct 2022 08:36:55 +0800
Message-ID: <1665275818-29173-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
References: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:37:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99105

Changelog:
==========
 Moves swift package to root of repository so it can be used directly
 Rust soundness fixes by @tustvold in #7518
 [TS] Make strict compliant and improve typings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index ebdd944980..fc85e571ee 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "2.0.8"
-SRCREV = "06c5c7ed0bd987a918cf88caafb094f22cdd1721"
+PV = "22.9.29"
+SRCREV = "c92e78a9f841a6110ec27180d68d1f7f2afda21d"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.25.1


