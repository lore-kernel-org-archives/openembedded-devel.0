Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CC7C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:28:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40223.1681115279557345331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mPF8FnM5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115277; i=@fujitsu.com;
	bh=IKT21g1PhAG5nGhJS7roubvru8HK9uwIR61JuGs6mYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mPF8FnM5BIw91ZOjjvwf80+XDbi/ARfAYlaqHOar1+iMvNcSQ4NyLlIw9r9Ixl54Y
	 aMXiygXPQVsZGF8slRrtJpNh0I0h+QQhAMbi89lbUCRKjpgn1Xfc1sDmkSbWvEYDyW
	 YNBroFb6L02vZU0DOjch+22+21ZLq83ZI6zCobr636K7lgk8DKg/JL3L9h9Feae9ee
	 gRRQb9g/0MIBqOXq/mp/8VmhKh65nVP5id+dulW7qjD+PS4tZpV4WxHSN5+WET8/u3
	 WCcjSDj6HBH+I7Q3ZavSD9JE/a6zKa+yZLFkI6w0ALSW9SJ6AynmRPg/U3KAZzMhEE
	 YMoaQ06dPBq/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSbfnhHG
  Kwbnt8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ay3bcZC2ZwVTT0/GRvYNzM2cXIxSEk8IRR
  4saLVYwQznUmiUXta5ghnD2MEg+PdrN3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsIC3xLt/28FsFgFViQXvOlhBbF4BJ4nNzX2MILaEgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7AqJxumHmCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3Qt9JKKMtM
  zSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMxpTj5xw7GXX1/
  9Q4xSnIwKYnydnEZpwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4F14ACgnWJSanlqRlpkDjA2Yt
  AQHj5IIb8UxoDRvcUFibnFmOkTqFKOilDhvL0hCACSRUZoH1waLx0uMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHm3HQaawpOZVwI3/RXQYiagxVwuBiCLSxIRUlINTGkSwiE7z8Qur35w3aR
  ks/DHJWtkzrnd2SYrrrLuiuuyr9u/b/vJ97/acvGJa95pgox7s/3it03Y84rD4ybrG8F/8Sk/
  /1+ykfldPK/4lHko81G2fZ9u5PNOCJAyX3G2KnyzyspjzBZf02Odcnqu1cVdKIni3KU3OTI97
  8f/ZDnnx4xH86b2vRYpv32tW+/poX25TaxTiyUTf87rmrFkhcHctve2/mvuflMUPv1+j2b99Q
  ST282Gy9c+stJhUNaTePlwyel3/tvvXq3knfu9JvaR0HHx9gdXCu8fWKYYdomb/57e11Wdvfu
  3qKyeIbFaXn++kO7bSuclGUtmH/TeG3x3UZL1Qv/QrYIV/I+U++cqsRRnJBpqMRcVJwIAHi4C
  s0IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1681115276!434514!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6370 invoked from network); 10 Apr 2023 08:27:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:27:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F3AFC1000FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:27:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E6F5C100323
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:27:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:27:54 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libconfig-tiny-perl: upgrade 2.28 -> 2.29
Date: Mon, 10 Apr 2023 16:27:39 +0800
Message-ID: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102010

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Edit to remove Test::Pod from TEST_REQUIRES in Makefile.PL, again.
- Update versiojnn # in t/02.main.t.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libconfig-tiny-perl_2.28.bb => libconfig-tiny-perl_2.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libconfig-tiny/{libconfig-tiny-perl_2.28.bb => libconfig-tiny-perl_2.29.bb} (86%)

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.28.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.29.bb
similarity index 86%
rename from meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.28.bb
rename to meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.29.bb
index ff28c7663..92d9bac0e 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.28.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.29.bb
@@ -15,6 +15,6 @@ S = "${WORKDIR}/Config-Tiny-${PV}"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
 
-SRC_URI[sha256sum] = "12df843a0d29d48f61bcc14c4f18f0858fd27a8dd829a00319529d654fe01500"
+SRC_URI[sha256sum] = "3de79b0ea03a8d6a93e9d9128fe845fb556222b14699a4f6f0d5ca057ae3333b"
 
 inherit cpan
-- 
2.34.1


