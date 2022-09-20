Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD852C6FA8B
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:31:14 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.7356.1663641047817316780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F9oB3Gvk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663641046; i=@fujitsu.com;
	bh=kbyDicn3enuzwD7GEtSElR2YwUh08FlNhK3SMGzcqiw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F9oB3Gvkhii5VSZ3obR4RXJ3XiolWb0LSz1ja1gMXeiYAznTXY8AerebVqz1scUXH
	 T7ACYH4u1VAFgGjGpp1hgvRBEbv0lfBWdJnGORNw1qwUbeuMtXGzanGr/RTszWmhnG
	 TlFxSYCOGeMFQyxFs0F5Ud+OEn5uzD61Ec2ZrCjVYUFuIhMhYTzOUMUHOWaeUKZiNc
	 rfsGBnUoaO6taQEV40l6VkLFpfxZ+gPgGkddGrD+2bRglkYsQMgm7NP483LeV83lHn
	 FwAfLoTdTzbeQxxqUYw2ctlpUfBLyE4vt6kdzpz/7uVA77nVImB8g2lU2U5MXVOBF4
	 z8IjYoqqEMQPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSfeqqma
  yweHl/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bX2WtYCp5xVXRPu8XYwHiYs4uRi0NI4Amj
  xKPz69m7GDmBnOtMEpc/+UAkDjBKfLy+DCzBJqAr8eLHYhYQW0RAX2Lp7D3MILawgJ3EtWdfm
  EBsFgFViVf35oPV8Aq4S6z+t4oRxJYQUJCY8vA9M0RcUOLkzCdgNcwCEhIHX7wAinMA1ShKzJ
  4uD1FeIdE4/RAThK0mcfXcJuYJjHyzkHTPQtK9gJFpFaNNUlFmekZJbmJmjq6hgYGuoaEpkDb
  UNTbQS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAy/lOJUuR2MB/b90jvE
  KMnBpCTKy1WnkSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdeUDNZSLAoNT21Ii0zBxgLMGkJD
  h4lEV45FaA0b3FBYm5xZjpE6hSjJcfU2f/2M3MsB5Mzv7YdYBZiycvPS5US57UEaRAAacgozY
  MbB4vXS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeTmVgabwZOaVwG19BXQQE9BBN1TUQQ4
  qSURISTUwLbp/NCgqUvqufKlYfZsl96GFCj98Lr9kv6DSuIlJVK9F4W9nbN6sQEmRRkXb2cJL
  5TWjC6t+TCl9z1LJo/mjPPGp57OG25eyzyXLmOxxW/R78dL7kmxTvfrE77ySuJRpsnN1AdvRs
  LXnFyXrOkz4vyVVbZW27Kf8/1+jZLaekbao8tohImH9t1coYeNfu5lq3EGRybtbt9+veXGhqH
  VFZpnJUbHzC9/9f/3nvv0h8TrV65tzPSbLck4un2l3ZPJhTR6enOR+uY8q3xx8Fq4Ji3onZ6n
  JvO31yYcLcyf0H61ivRh+b+sj27M/jsRM/7/J5feH6DQFoydrnM4aTvuW7vKw5IvQoqQD7lMy
  +QNSlFiKMxINtZiLihMBFbvrsVIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-728.messagelabs.com!1663641044!34530!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4010 invoked from network); 20 Sep 2022 02:30:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:30:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A86BF1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9BBF8100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:44 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:30:43 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] smarty: upgrade 4.2.0 -> 4.2.1
Date: Tue, 20 Sep 2022 10:30:36 +0800
Message-ID: <1663641036-2538-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:31:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98896

Changelog:
=========
Security
---------
    Applied appropriate javascript and html escaping in mailto plugin to counter injection attacks #454

Fixed
--------
    Fixed PHP8.1 deprecation errors in modifiers (upper, explode, number_format and replace) #755 and #788
    Fixed PHP8.1 deprecation errors in capitalize modifier #789
    Fixed use of rand() without a parameter in math function #794
    Fixed unselected year/month/day not working in html_select_date #395

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_4.2.0.bb => smarty_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.2.0.bb => smarty_4.2.1.bb} (94%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.2.0.bb b/meta-oe/recipes-support/smarty/smarty_4.2.1.bb
similarity index 94%
rename from meta-oe/recipes-support/smarty/smarty_4.2.0.bb
rename to meta-oe/recipes-support/smarty/smarty_4.2.1.bb
index 2cd96a255d..71040d0164 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.2.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.2.1.bb
@@ -9,7 +9,7 @@ DEPENDS += "php"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
-SRCREV = "97aeb14c6fc2fb733938809926e2f9d6c581a70d"
+SRCREV = "ffa2b81a8e354a49fd8a2f24742dc9dc399e8007"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


