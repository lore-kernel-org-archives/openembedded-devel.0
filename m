Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36443C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:36:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.1631.1654133815077290349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J8EB+DOU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133812; i=@fujitsu.com;
	bh=OxmXoMx8Bois1rgKOzliupw8CAgOhOvUo5zmqLzfKdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J8EB+DOUu69s8Hd9HV4AQeufrxFbd+IOtkaWl6hy0vFGhX0MC+ww251sobu+KUEoC
	 eYk7KoB72vDcTRINVNXA04JGdempK8xPeqzbDPnfv6w1xmmy4IIx8U5YWTIRprLiS6
	 uB/vKYClpdE/PPLLu/UXO4KysQzd59WFnJW145ApGvsdVZgb6dODYHPdvW+6TAOT5C
	 jGQtLPMlagGrHwgmiQCvx3TOtFX5fBMEnjl2+/idPfAktGAmN2NvlhPfFHN57aN4gR
	 5dlj0D+k72qs4KATyEF+k5h5iJjt/VDtm+0qh4XiccaxnQmnbN+4OuylX1wQY9QxZl
	 BOtdKnsqhK6Og==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqGssMiP
  JoHmfjcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHofzdTwROOitZm9QbG/+xdjFwcQgJPGCW2
  ntnKAuFcYJJ4vGcxK4RzglFixadO5i5GTg42AXWJxzdfM4LYIgL6Ektn7wGLMwuoSnRfXMMOY
  gsLuEvMPTmPBcRmEVCReP7lCSuIzQsU37V/Cli9hICCxJSH78FsTgEPiRO7H4HVCwHVfHj3jx
  GiXlDi5MwnLBDzJSQOvngB1askcWLFRyYIu0Li9eFLUHE1iavnNjFPYBSchaR9FpL2BYxMqxh
  tk4oy0zNKchMzc3QNDQx0DQ1NgbSRrqGpsV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZgKKcUp83cwbhl3y+9Q4ySHExKorw7HacnCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLg7eafkSQkWJSanlqRlpkDjCuYtAQHj5IIbx4jUJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+X
  mpUuK8dUJARQIgRRmleXAjYDF+iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr6Qw0BSezLw
  SuE2vgI5gAjri2rcpIEeUJCKkpBqYZj47o5sa2RG8Llo39/zs7ae893L+uaAfZ63wXWDT7a2L
  +bPs1v3wf/thzcnKZrc1LdztFWsf5XxsDaoKejhRqkrZ0spLaierkuONR0lhNusV1pyYsMxlw
  hrltQcCzcr8Vz088LPgVCRnokxAuysT41feiZ3z+o7oPbPtcXl2f16HON/S9QkdZq9VWZn/77
  TeHmXIk9lR0Tr9qkfycZU1nBzt3L+sfjMYxwh5CTsda/yco/bwwUtn/r71W0Jvl5y9yvDs8+6
  lXJsfx/nwprH+NuNYUCRuuSjxkFTDH7M/pnMeb1UtffKz6mjo5MQvUYKRqbzxj0qWHT/eYRNU
  9SGj+mFcuKJKQcYBnZtujseUWIozEg21mIuKEwGRXc3NbAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1654133811!376224!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30173 invoked from network); 2 Jun 2022 01:36:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:36:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5F36C10004E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2B585100183
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:36:36 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lz4: upgrade 4.0.0 -> 4.0.1
Date: Thu, 2 Jun 2022 09:36:16 +0800
Message-ID: <1654133778-20912-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:36:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97373

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
Add flush method to LZ4FrameFile.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-lz4_4.0.0.bb => python3-lz4_4.0.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.0.0.bb => python3-lz4_4.0.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/meta-python/recipes-devtools/python/python3-lz4_4.0.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.0.1.bb
index ef5b00627..0dd353bfe 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d010c67c9fd1beca3"
+SRC_URI[sha256sum] = "efdfec2175715bf2d814ed72a7a185406f3456464eb3f343db1b87ed813e039c"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


