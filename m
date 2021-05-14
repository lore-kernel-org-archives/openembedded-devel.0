Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.3439.1620958486110821396
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DSTSFiE8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958484; i=@fujitsu.com;
	bh=L9DtBBeVCoyxJhm5Jj8koakx1oGonT8V7yrO7X8U8jM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DSTSFiE8hM+IXJhbPRcfbN00FpFD+zxiF9BUHoMHBQ2BAXDEgMBU8pASsQ5Eh/ymB
	 a1TFfsTnvJIIFki5w2tiy+l/z2HRrM+tx3hOQmymiVf+ku7GKKwPelZRxSmu9QB8fY
	 HYyM6YD+2ddHkp3s60Nr6LUvo22d6UXKLUIzg4KrE9XA7g+ql3ReZVcoUO56litkq6
	 8f57+SSjYD6LfFrvf2spWQiOBtt9kn7r8vqkF/2q2EjXOAKz0TI7YPMZRuDg+bXO3K
	 bjod7GaA8P/T59IDIaS4L0iO4Ym3Mzj4E7UV9KDos5RkNceQRXvxZ/Ts9ig0Kdvr6f
	 8j96L8QUpfWeg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id E4/C7-27273-41DDD906; Fri, 14 May 2021 02:14:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqit8d26
  CwYRnehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a+R/OYCjZyVOydeZalgXElexcjF4eQwGwm
  ib7lP5ghnOOMEp09v1i6GDk52AR0JDpedIPZIgL6Ektn72EGsYUF7CQeL3/ACmKzCKhKXPo8G
  aiGg4NXwE3icZskSFhCQEFiysP3YOW8AoISJ2c+ARvDLCAhcfDFC2aIGkWJ7TvPsEDYFRIzZm
  xjm8DIMwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGuuaAVl6iVW6SXqppbrJqXklRYl
  ASb3E8mK94src5JwUvbzUkk2MwDBKKWTj2sH49PUHvUOMkhxMSqK8Jz1nJwjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4P1+a26CkGBRanpqRVpmDjCkYdISHDxKIrx/QNK8xQWJucWZ6RCpU4yKU
  uK8wreBEgIgiYzSPLg2WBxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexVkPE9mXgnc9F
  dAi5mAFt+YPgtkcUkiQkqqgWkab+D6fQxfjp3e9EB160S3bZ7a02zXKRtt/WXVtj1jhda2hgd
  PRdqnmcydu8rstG9Yy0ETruU/39w6f/r7pprTJ3Rf5wU6r7kn9IX1yjxtAbsD8W2fWB99/hrZ
  GK3mXPko4pxR08avvmULdnMs7Gif9f3ilKVRFuefr+/RmJNZaepf3n1ssrCGTsWUpScqv9Xxh
  oufm6ucFTGjb0nfgl8bf+a5hE45JnF50SzJ7qCPhkmBh5d4CwjWpvS82hq8xaPhZM3cL9wmCS
  8+tUgcNUnn03W/LLiat6rW/PWbu8uZtyUL3bjvsfG+0XN5wRnSpdbcWb73xQ5ERNyXE9b7EP7
  0U/6xyJ31Mxb3GF2f7eKtxFKckWioxVxUnAgA5I5RwB4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-248.messagelabs.com!1620958483!352116!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20550 invoked from network); 14 May 2021 02:14:43 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:14:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2EhO1027886
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:14:43 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:14:41 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.4 -> 2.2.5
Date: Fri, 14 May 2021 10:14:35 +0800
Message-ID: <1620958475-8164-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../gensio/{gensio_2.2.4.bb => gensio_2.2.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.4.bb => gensio_2.2.5.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.4.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.4.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
index a02442862c..271a668751 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.4.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "95cfb8f6d8985e2fb8ba51c4887dd70aa7551a03"
+SRCREV = "ed307629e067a9ef55d79beec9c9f67b86efbaaf"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
 
-- 
2.25.1

