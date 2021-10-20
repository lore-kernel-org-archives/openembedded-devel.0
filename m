Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BC4C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 01:34:58 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web09.2232.1634693697101959560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 18:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gyZ+bkX5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634693693; i=@fujitsu.com;
	bh=CQBiNFSpKsVLLr5lpovHsldfKrcfAUOCneZjwNqiOHs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gyZ+bkX5ufG4nCO2wC3fZJ+1hNVKdN64b/hyf64q1O5mR2OMOVpo87U0EOrUZxkup
	 lBatf3WuuhKObgLXejUQXXLndotAl4fszv4z5chQDM6fg3Mus2DUrZx5n0l4Jr3Bs5
	 C8f8IW2DWxnMfPBcsyQ33opi2A5F9RI4B0yrYy3tkqJz++VIMZGt9BBgXZa8MbOzph
	 iWnbMeOPmtSBRLtnWYP8GBXz22xIxvXenItDDzYGOVWpZ12OKTScYcvHfOZfbtXcBH
	 +pOhvnjIAOqx99794LFlWygqp472Pb0XqDrKVy+gsFK4VAgbbHVxRTBmdFarillGyH
	 nCapLeTWsyDDA==
Received: from [100.112.197.4] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 5F/86-20159-D327F616;
 Wed, 20 Oct 2021 01:34:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRomtTlJ9
  o8PCmocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFo8i32gk0cFc037jA3MN5m72Lk4hASmM0k
  sWD3BGYI5wSjxNp/DUAOJwebgJrE9Fs3WEFsEQF9iaWz94DFmQVUJF787mEHsYUFXCWutd9hA
  rFZBFQllmz8wQJi8wo4SjQ8f8wGYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvGCGqFGUmH25mQ
  XCrpCYNauNaQIj7ywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGmha2RoqpdYpZu
  kl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGGApBceu72C8+vqD3iFGSQ4mJVFeaZf8RCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvAkFQDnBotT01Iq0zBxgsMOkJTh4lER4TXOB0rzFBYm5x
  ZnpEKlTjLocl6/PW8QsxJKXn5cqJc77DGSGAEhRRmke3AhY5F1ilJUS5mVkYGAQ4ilILcrNLE
  GVf8UozsGoJMzrVgg0hSczrwRu0yugI5iAjrjqnANyREkiQkqqgWmnwqq/WnoyZx93/LH483n
  2/GnuFrsmdywze5r0MyH40MKL8sn7t4o298YLz7jSaHgiVylfRspW4cnaGfs37dFZury8u+/Q
  H+OMNemPuxYV9jz7dTrxX16H1dsD5Tqp+hYb9kwR6gy6NHvm47kd/VlMR0rkpda4P94Vn//0Y
  dZBI7VlvSb3L0c5zPv9wfJB49drCgENfyOqT387FhjAyXbt+KqkxOuZeto9P4tOHoyUPrbBNs
  9+8ew1rIezNnPf/xqj8k3Tx/RWy6ndfhoTttZP3DPVx2FT3x7L+7KW5xwaFsZ7+4kGcG82nLP
  t88vTKaEOOwN/PNkwf26Lyd2Nxec+7f7+7vWRro3iP7ed7Dz2VImlOCPRUIu5qDgRAFhZM0A3
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-285.messagelabs.com!1634693692!483247!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11199 invoked from network); 20 Oct 2021 01:34:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Oct 2021 01:34:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19K1YhUG013535
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 02:34:52 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 20 Oct 2021 02:34:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] xdebug: upgrade 2.9.5 -> 3.1.1
Date: Wed, 20 Oct 2021 09:34:29 +0800
Message-ID: <1634693669-2954-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 01:34:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93474

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-php/xdebug/{xdebug_2.9.5.bb => xdebug_3.1.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.9.5.bb => xdebug_3.1.1.bb} (86%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.9.5.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
similarity index 86%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.9.5.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
index b03517bf1a..580ae7e89a 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.9.5.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
@@ -6,8 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "c04be1bf225b768bf627dc92e5a1f9df"
-SRC_URI[sha256sum] = "775b1705109611b996d6a713fe14117a67846e157eb7dbf349bc0b055e861a10"
+SRC_URI[sha256sum] = "9be3ae0fdb4dc4a4c68084626cddc56f12396487e309a8c8dd318f0f900d1a68"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.25.1


