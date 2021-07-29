Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.6428.1627542667746818988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gYR5Nz4T;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542665; i=@fujitsu.com;
	bh=q2aHx04JVg/Id3WvQg4ulE6BR2c0SF9WeD3wIugc58k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gYR5Nz4TUUigzm7f3gMjwbzaic19SF9OlWcmA9489NRFN1BsA8hQBTtZ8E47yXnAb
	 Ha+u6X1hyUUWEC3saj/yBU5UtRiab3v0wOd7RXLlZwMAwtuhIVPRQ6yHsBQLBS3GxA
	 B7owZRU5j55Tj7/aZL4L6mXxu5MSMsUi+o2I2y4uNYq7Lf04MznxxOZUAC4bnYL1QY
	 06M1qAueIefSLqNZZiRrw0hZgmCvkDPJWW32GMgo9gB2+O2032EjqKgDH6cjHr600m
	 JtAEb/tUm5Zm1vro6N+/2C3RFEAP+lAtTF4mr/Jfsa4YZE3AazG9O2UiVhC0lg2Q89
	 tVwAWqZOIBGgQ==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 7D/4F-03136-88452016; Thu, 29 Jul 2021 07:11:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRotsRwpR
  osOyOmsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHp1in2gvMcFb3nHjM1MF5l72Lk5BASmM0k
  8eqsSxcjF5B9glGi590+RpAEm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373ADVzcAgL2Ejca
  0wBCbMIqEoc+L8YrJxXwEmibcpNsDESAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy+YIWoUJWZfbm
  aBsCskZs1qY5rAyDsLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrrGumaGuolVukm6qW
  W6ian5pUUJQIl9RLLi/WKK3OTc1L08lJLNjECgyulkMl4B+O11x/0DjFKcjApifL+smNKFOJL
  yk+pzEgszogvKs1JLT7EKMPBoSTBeyYYKCdYlJqeWpGWmQMMdJi0BAePkgivUABQmre4IDG3O
  DMdInWKUVFKnFcUpE8AJJFRmgfXBouuS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeR8FAU
  3hycwrgZv+CmgxE9Di2hJGkMUliQgpqQam5m0bCnYFb5u3wGrq0bJjD4s795fN3m62462pp6H
  nosO/eLSzF3uukBRxn28vN/vRf42dQeplD5df/rpYU6/ks4XK351B/brrt750d3Nmf7DwJDdL
  343HDU9mP91or5Yj1L3TTufcWkG3I61Z8n+jGJfFni1l5VXm4crWKJ9wQoB1Qv6u1a+zuybe/
  TxJ0s9NYkX6ee8Fz3n3H193r7t30qtYNZ3T3l9DQrNMPr+dUZb0Nz+Oe8sPiUtCj3+fvLvslK
  Mxx7wGz3bOgmf/LFPmJLn03L1gxfbZaOq0BTGm0T/2rc3u6866uWNRR53xPGXrSU/2vlcVm+m
  hcoL5w/P9ZQ521yVFJDfzz038/03YWYmlOCPRUIu5qDgRAMfn/fopAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-226.messagelabs.com!1627542664!53848!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19278 invoked from network); 29 Jul 2021 07:11:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:11:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7B3lC005662
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:11:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:11:01 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.3.0 -> 1.4.1
Date: Thu, 29 Jul 2021 15:10:47 +0800
Message-ID: <1627542649-24816-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Added:
Docker image architectures amd64, 386, arm64, arm/v7, arm/v6, ppc64le, s390x
https://github.com/bats-core/bats-core/pull/438

Fixed:
automatic push to Dockerhub
https://github.com/bats-core/bats-core/pull/438

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.3.0.bb => bats_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.3.0.bb => bats_1.4.1.bb} (93%)

diff --git a/meta-oe/recipes-test/bats/bats_1.3.0.bb b/meta-oe/recipes-test/bats/bats_1.4.1.bb
similarity index 93%
rename from meta-oe/recipes-test/bats/bats_1.3.0.bb
rename to meta-oe/recipes-test/bats/bats_1.4.1.bb
index 39a02733f1..1fdc81f597 100644
--- a/meta-oe/recipes-test/bats/bats_1.3.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/bats-core/bats-core.git \
            file://0001-install.sh-consider-multilib.patch \
           "
 # v1.4.1
-SRCREV = "9086c47854652f2731861b40385689c85f12103f"
+SRCREV = "54e965fa9d269c2b3ff9036d81f32bac3df0edea"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

