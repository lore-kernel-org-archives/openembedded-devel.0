Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB34C43217
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:34:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.29554.1652085280123875477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GaUze/Zf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085278; i=@fujitsu.com;
	bh=JL23FtwYBMM9X0zNYlh+Bbta3CoYAbASw8zHNq0wIsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GaUze/ZfTsOMoM9oKWAnDsjth4Yexu98ky6ooTjT3SOe29gAAwSidxcQIPh5tTgrG
	 l1rDOgE3imzX2Nbm8v9GxTyP5xFYsu/cFxBn6YKAG2C1RBVM+z00FjBmx8RAQoI41O
	 4L8Q8gvGdiwk5VzOLO+rnQltd12iQKR2x7VMSotQYiL+7KOn++2YpUbixpz4Rm7NnR
	 xbULSxmbgebAAmj6TY7me3tRRzd0Kimla+T9fHHfugzQK17shuS+afpO0wpZSZsB4T
	 RoalEJlRgvdbQvW3RaYaWDVpZEJOnW47xL7+7uOsb8MbIWJ0poORSg5yx5RJmZOu/X
	 UpL/scqp/okAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSVf2UkW
  SwafD1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a/NRNZC25wVKx4dJm5gfEbexcjF4eQwBNG
  iVkrzzJBOBeYJGb8WQnl7GaU2P1uIlAZJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfveA1
  QgLuEu8n94IZHNwsAioSqz+kQsS5hVwkrixcSJYq4SAgsSUh+/BWjkFnCVu394IFhcCqrnWso
  IVol5Q4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNtUlFmekZJbmJmjq6hgYGuoaGprpmlrrmJXmKVbqJeaqlucmpeSVEiUFYvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwlFOKXb12MB7p+6l3iFGSg0lJlLeyqSJJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgRvyDmgnGBRanpqRVpmDjCuYNISHDxKIrx3TwCleYsLEnOLM9MhUqcYdTnuLty7l1mIJS
  8/L1VKnPfUBaAiAZCijNI8uBGwGL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi35iLQFJ7
  MvBK4Ta+AjmACOuJjQCnIESWJCCmpBqb5eXcVN889wTap8f8lwdTYb89aNuQ7hXz4ZXeWtcb/
  //vybddrWKTKK6/Y9d0Vn23Sm/m3OfzvuujQh1+5utbe/74h5d7+D4dibpvpaQmFqiXffSs3+
  9fRi2u55rf+3s23q9PwHmPfRs9FEQlrwg56iOyQ/S1+PulvjH3q4eu/hORVjNJaJC/+c1vjof
  z8pJmJ7+Of/8Sq8+UYKyPbX72NEvm/S3Mb67JFl40691rpqZqumnUk2aRObOO8g3/3X2JIKBG
  c7TjJdcuuLwtbXkvyndCbWDRF79+Jg/9zlCyN7hVfqD/wcY+/1id9p8Lga9dzkqeraN/KDiwJ
  sF7pvmbOouZJ7Yl7w2ZsP1smdmGBEktxRqKhFnNRcSIAxLtygWwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-545.messagelabs.com!1652085277!250337!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3120 invoked from network); 9 May 2022 08:34:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:34:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 42A2F1000EE
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 26985100441
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:34:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.2.0 -> 5.3.0
Date: Fri, 29 Apr 2022 16:16:34 +0800
Message-ID: <1651220195-27553-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
References: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97011

Changelog:
https://github.com/wolfSSL/wolfssl/releases/tag/v5.3.0-stable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.2.0.bb => wolfssl_5.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.2.0.bb => wolfssl_5.3.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.3.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.3.0.bb
index 78a24bcdd..40a48f6d6 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.3.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "e6c07a296d2996e8d5c3cc615dfc50013bbcc794"
+SRCREV = "e722c15be860794179082a05d09e6a90dc77ccf0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


