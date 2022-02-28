Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51060C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 12:05:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.18898.1646049926442113587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 04:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jLFafesB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646049924; i=@fujitsu.com;
	bh=oNtecWcKOdAPENtKDRelMLlIbqvExBcBgk4d2ea63iE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jLFafesBf4md6Kt+lmBY8sUbdGDHEcd6lQk2q4ergy/iwJp3n6fMH8DaMQ8KloxAW
	 PWzROeV/x7ZU9bAi6uc9vDsnyn39Zmy/AclhBIlAjM03FKhlxAVd7gaG79WENa4gL2
	 qn0JnRmS8xSlc5rLFEhuurw9CK8EWjhEroKXoXDjDNRcxGxyL2VO9WZKbYRhFmnqmM
	 XYTRvvhr3Ibj5jq6CoVyj2Y/7rsFO11mVeZSinKbclptLPyphJKzFUpn9bn4BexYik
	 xJTBBtpf3qf/dQfdXISlVTTEVDHQTnDBwqXR8ASyzfjuNFsaIDV/SciUu/oynsIj4F
	 yMwCn6nMhgJPw==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 96/31-12680-48ABC126;
 Mon, 28 Feb 2022 12:05:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSbdll0y
  SwZw+FouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNL33r2glscFRM++zUwdnB0MXJxCAk8YZRo
  XLWcCcK5wCSx9OkTKOcEo8TRLxvZuxg5OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxuwesR
  ljAR+L1v+dgNSwCqhJ7n34Fi/MKOEm8e30ELC4hoCAx5eF7sF5OAWeJeT/amEBsIaCav50X2C
  DqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2ZB9EoA3Xb13CbmCYyCs5C0z0LSvoCRaRW
  jdVJRZnpGSW5iZo6uoYGBrqGhqa6xEZBpopdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yT
  opeXWrKJERjGKcUKGTsYv6/8qXeIUZKDSUmUl7NLMkmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  K/aepkkIcGi1PTUirTMHGBMwaQlOHiURHibeoDSvMUFibnFmekQqVOMilLivE47gRICIImM0j
  y4NlgcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsVZApPZl4J3PRXQIuZgBb/DZYCWVy
  SiJCSamDK5HgXrbK6KV2qkK3HkPX16S1m1zjSNe6tsS1fybAhctEBDbPu81e+c/p8u6+Yu7Nk
  pXXHV82gtB08V88U9P0rNrCx3p8TGCpxlPW376eXIuqbLyyzWuP5Kfv5ZgafZVvXTy7o0doR9
  VRv37bcZTe3nOZK+paUmNzG7noge/qRY2YFi21/BBq89T3eEqB7aMEib6kUkb8LMpd+Vupzr2
  vetDp+4dFAkzsXL+i/r5htWfhcoabp27+WUOcDx9Pm6adk2/Htl19X6qBX9mX5Z1WLL93mk5K
  WnZPe+zJPz3jx1ym7l8fcjnHlbzSV/v9c8Io/n1/92xVtcy1WFby/6KfuHzV3qUqtyIpZ++68
  FxJTYinOSDTUYi4qTgQAiTWE1V4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1646049923!18841!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30694 invoked from network); 28 Feb 2022 12:05:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 12:05:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A8BF610044D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:05:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 93C0F100352
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:05:23 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 12:05:08 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 10.1 -> 10.2
Date: Mon, 28 Feb 2022 20:04:55 +0800
Message-ID: <1646049896-35695-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646049896-35695-1-git-send-email-wangmy@fujitsu.com>
References: <1646049896-35695-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 12:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95565

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-websockets_10.1.bb => python3-websockets_10.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_10.1.bb => python3-websockets_10.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_10.1.bb b/meta-python/recipes-devtools/python/python3-websockets_10.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_10.1.bb
rename to meta-python/recipes-devtools/python/python3-websockets_10.2.bb
index 6dd29a9ff6..c8179df5b1 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_10.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "181d2b25de5a437b36aefedaf006ecb6fa3aa1328ec0236cdde15f32f9d3ff6d"
+SRC_URI[sha256sum] = "8351c3c86b08156337b0e4ece0e3c5ec3e01fcd14e8950996832a23c99416098"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


