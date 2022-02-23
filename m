Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CB0C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:53:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.4976.1645602786740594368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pKeV4A6w;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602785; i=@fujitsu.com;
	bh=XQohBzviyOMjHYpkYIaB5dUL19RFGjk5LY06kX6YY24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pKeV4A6w8hGEYmEkl9qCqtu/3WwhmZvBjvvqHj78M6QQ14xaA7gdeLPEjzzZcEExB
	 bFT2lIRYwwBKnoEgZC/54YwNDT82ZEq/VKXkGeQr2whO2hV4AOp0QGzeUKywSeJRJY
	 6eLGVAyOzvSOB7/QdKES+hCA+WNWyffeAhGfPDI+CUKLxHjtLrc28i7JayEAB4N+tI
	 +jvF70lv8FHcxju0n0D7FqPuClkJLUDDZ4lQzpMPRoDVWQ2dqu4mHCPd5pjZ6pKebt
	 SmuAhjRcuO2goN+Sv/7EEnfMbt3Ya84H4m7KVSNvEXpmuxjsqvil4pGpqAJVsVuAGq
	 5Cu+CzSJLdPIQ==
Received: from [100.115.36.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 4A/2E-02429-0E7E5126;
 Wed, 23 Feb 2022 07:53:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MRovvguWi
  SwY4bXBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0ZnYz97wTauio0fT7A1MK7k7GLk5BASmMkk
  0TEzpIuRC8g+wSix4OAuRpAEm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373sIPYwgKOEpN/v
  gGrYRFQlfjafJYJxOYVcJJ4c2kGWFxCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdY0tdUyO9xCrdRL3
  UUt3y1OISXSC3vFgvtbhYr7gyNzknRS8vtWQTIzDEUorVTXYwdq/8qXeIUZKDSUmUt/CIaJIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6+J0A5waLU9NSKtMwcYLjDpCU4eJREeEVA0rzFBYm5x
  ZnpEKlTjLocV69c2cssxJKXn5cqJc77/R5QkQBIUUZpHtwIWOxdYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMK/IMaApPZl4J3KZXQEcwAR0xJUsI5IiSRISUVAMT45QmxdKfaxuf6ijYNK9
  basf4LLLrwDlXuaK9vPIv512rzjYNUW1xC1mVtWSpacOt8hkTl7Ad4vzR8CN+3pNpdREvcq05
  UrcaXfdptH8/LcvDdenBCXq3O6+H5i6s3JB1fq7Z4/cXQ+/+z1orYGZ/b8mSHNb601+dhYxNn
  vcZ+7sV3NLZ2fNq/26G5KmtDXNvcfy4Jffz+eQDuyVOLd9Y4jGB5dLhyNUn5XYZGze0ra0W/2
  X+a9LDtONG1v8bN6QsuFHRcE+rOp/FeIE44zTh9zvE7J+b1RgsneT4xXfP5H9meQnfAyP/yLU
  +fc8VWWCrfq839svGX43HKleL6EQH678I6yw4KcbXryiyteeGEktxRqKhFnNRcSIAPb6IszgD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1645602783!40551!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9262 invoked from network); 23 Feb 2022 07:53:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:53:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21N7qwWX017790
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:53:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:52:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.23 -> 1.4.24
Date: Wed, 23 Feb 2022 15:52:45 +0800
Message-ID: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:53:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95473

Changelog:
=========
Contribution section added to issue template
Language of VNC encoding cleaned up
Remmina Hardening and Compliance
Remmina_preferences language reworked
Resolve "Follow-up from "Remmina_preferences language reworked""
Encryption level language reworked
Confirm on close of window
Adding flush and cairo clean up

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.23.bb => remmina_1.4.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.23.bb => remmina_1.4.24.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.23.bb b/meta-oe/recipes-support/remmina/remmina_1.4.24.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.23.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.24.bb
index 9346da5b2c..817b5118e2 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.23.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.24.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "b518b9d1f192375b08bbcdb0e77f3d98925de2f9"
+SRCREV = "ffa6a7ef9c6be7951bac23d14df148098fd2d3fa"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


