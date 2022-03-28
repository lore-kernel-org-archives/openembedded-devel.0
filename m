Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B803C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 13:02:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.10544.1648472554025626231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 06:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XolwWVdK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648472552; i=@fujitsu.com;
	bh=m7g8odl683xjRLabKHyQqwGfitMHxmKacVLCOOrzqf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XolwWVdKPXIDT/nECjldjfxPYf4JjhUzk/jQhEA05Gzdf/fHUtLhMeqTh1cUZnWMI
	 x0tVnt7ykbsqRiWz+QrMAlqFrvw1noyg85ZrDyqn0ScGpnI0WkMaorZ4vFY8U+I3yR
	 R+fkrbS4u7q3Pv/RRgeHjiRoK88avtlJz9RUnOCQJP6p3zC4AiTbvBQoDAIVcZ7Y25
	 JTmjfRgh3NpawEbrDfCVKtvRcEfBUGQ3EQDXgNvSSZ0oJy9z5/aSgDVkr5GvIlHiDj
	 zrVQealGxK9wqIEUM4mHeCLWR0zZsFYKuLJ6OJtWy2AL0hiKYssL5y1I655q3Zb0XG
	 VjP3fStrUySHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSff5Rsc
  kg2l3zC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozHV1cxFmzjrGju3crSwPiEo4uRi0NI4Amj
  xNyfLxghnAtMEpu+n2KCcPYwSsz60MHWxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAiMSBM+/AalgEVCU2nl0GNJWDg1fASeL+ahaQsISAgsSUh+/BWnkFBCVOznzCAjFGQu
  LgixfMEDWKErMvN0PVV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaN
  raGCga2hoqmtsoWtoYqCXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYlinF
  aj07GE+s+ql3iFGSg0lJlPfiXMckIb6k/JTKjMTijPii0pzU4kOMMhwcShK8LsBAFxIsSk1Pr
  UjLzAHGCExagoNHSYQ3YDZQmre4IDG3ODMdInWKUVFKnFcXpE8AJJFRmgfXBovLS4yyUsK8jA
  wMDEI8BalFuZklqPKvGMU5GJWEeUNApvBk5pXATX8FtJgJaPHad7Ygi0sSEVJSDUxPnu0uv+l
  xM/DO8uTtn/MVTJe/Zi79HLVa0vrvhpRolcaf+/4y+hpXm4k5u/TKSt17VHdYQ39SV+zMXR2T
  tPUrElimnT0Uvq6mjrN43Uu5bw4COQJ7Zez9Fi4IX/Tk+K7Fh0q+cclMUNl8yoXRbKWHuWtv6
  W4Ff+lzJ+SN4j/XcamXqF9ctsErVE17zcUF+xy+njh2Z/LuqImTDmuILVq/4qlflva5UxLJrl
  NTc01+VlQ8Cz0xY2/j7ayQ3o7E4IbrJ/4F902sCnrAYVO4Ujj0klLehoQ5mXcjrT0eJc+ZMq1
  v/qR9L1ImMLybdb3vjn/ohHfTl134+qEv8G/DxTaG5XeYp/9h7TpyoeP5/a4rSizFGYmGWsxF
  xYkA3oQClEYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1648472551!58195!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3649 invoked from network); 28 Mar 2022 13:02:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 13:02:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 61C6E10033A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:02:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5395E1000E9
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:02:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 14:02:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-metadata: upgrade 1.11.0 ->
 2.0.1
Date: Mon, 28 Mar 2022 21:01:59 +0800
Message-ID: <1648472519-16911-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 13:02:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96240

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...test-metadata_1.11.0.bb => python3-pytest-metadata_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.11.0.bb => python3-pytest-metadata_2.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
index 060eee3a5a..35e8b7568f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
@@ -4,7 +4,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "71b506d49d34e539cc3cfdb7ce2c5f072bea5c953320002c95968e0238f8ecf1"
+SRC_URI[sha256sum] = "5cdb6aeea8ba9109181cf9f149c8a3ae1430ff7e44506a8f866af8a98ca46301"
 
 PYPI_PACKAGE = "pytest-metadata"
 
-- 
2.25.1


