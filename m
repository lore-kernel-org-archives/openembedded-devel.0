Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694F3C10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:37:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.37723.1670830668965349680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dlqiPj8+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830667; i=@fujitsu.com;
	bh=lwv1I/3mKA6AqRYF11rAmwU6VFXWNcFBfSGIIwEtdFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dlqiPj8+FO6Q8Zgx6lKBaUsmU+jgnSfBTE5rVtRS9HeaAVxARA9ygBEgBnW6oEys0
	 J6EOX9jwB3/NeGRwHuTfiK8PSL40Q+FPmgKoSD27fa320Ale9s8lBEMiXd7/JhIoei
	 XIkZ3qkcu7LMBtKZ0eBxpM08Nfk4nuKn2git6ZIJYfVeZx+I3y4m1h+psJ7DrGemIh
	 3+3kGKZyhgXK/guRp3olY5RnVGQKOz0PCmP6sagZdQ+c5h+XfN45PcKwXm3zH2NeuH
	 G4Gp9C4C/1Js/lOFbLCXj2HU7qlWXO85rbGKQIjDr4A4OmFGaRqXAGITTbwJV+ttEk
	 qHLrepzTjkMQQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORpOt1a1q
  yQeMmdYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePmuU72gtccFZf6JzA2ME7l6GLk4hASeMgo
  saLlPSOEc4VJYt/RRmYIZw+jxMsT29m7GDk52ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7B
  6xGWMBX4tSvmSwgNouAqsTDc7MYQWxeAUeJ29/+gsUlBBQkpjx8D9bLKeAksbR7PViNEFDNq6
  5zrBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm6HmVEjMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtooJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGL4pxSzxOxgfLvujd4hRkoNJSZS38sq0ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  BuuAeUEi1LTUyvSMnOAsQSTluDgURLhdQNp5S0uSMwtzkyHSJ1itOSYOvvffmaO5WBy5te2A8
  xCLHn5ealS4rzsN4AaBEAaMkrz4MbB4v0So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFem+t
  AU3gy80rgtr4COogJ6KCol1NBDipJREhJNTAlG07WE3HaxR2ucf2bu3PGGoYrOscC5h0wP2G5
  Km/CitubGu2airecSrfvlzxRpPa+qXiT2rdDP+IYD5k9zMqxmrzrNuvVGx+6VkwMr9+T/uzgv
  wgv76n/vU/nrU7R4Lwuw1sV21BWvDaLheW+cerrOwfnXv70qGzPzesKWj+5crzqskL4zNUOzM
  y13cLD5tTKuTLpZWn+tVfPSuZJxM3y3na1c91lIdWNupzmZzzzolskEtwyTN22lFw790nifY1
  bvHzGzVM8Nwr/8J2Z+1rQcIW6l0L7BYMTl/z3LElaLv/Ve2rr176UR58MKubbLWFZrrNPYKv+
  qzn6MTOv3zN+fu7G4jmFjBsvyh/+HuChxFKckWioxVxUnAgATdaHW3IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1670830666!226841!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25271 invoked from network); 12 Dec 2022 07:37:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:37:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 467881AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3B77A1AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:37:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asttokens: upgrade 2.2.0 -> 2.2.1
Date: Mon, 12 Dec 2022 15:37:12 +0800
Message-ID: <1670830635-3098-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
References: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100046

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asttokens_2.2.0.bb => python3-asttokens_2.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.2.0.bb => python3-asttokens_2.2.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.2.0.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.2.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.2.1.bb
index 847f164fe..7c7753034 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.2.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e27b1f115daebfafd4d1826fc75f9a72f0b74bd3ae4ee4d9380406d74d35e52c"
+SRC_URI[sha256sum] = "4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


