Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDB4C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:22:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.8587.1664266921470371545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s3u2LWo+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266919; i=@fujitsu.com;
	bh=7sp+MskT5THuD4SZIK1UaseAcHOhDh46vpYYlSoS2WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s3u2LWo+jCQw4F7ZI8Cgog0FBuSpv22xK42ni18R+StUIwcQWP0GxYK4JgSRtvTM0
	 u2I6j/O9v6ISwWMA/ON1KenVd8XxgjaYVZ+rdEsvd9n9Eal9D9qbXmjkr1NVY5dP/a
	 jaotMyGSU0ekpmPA4lgn1XDRgF6sQ9lqE/DKPvEI+8Wv3elu6CLY+SMLaLqoJ5p5OG
	 VKEQefdP0AcWvCyr9aBsF3uLdCLnpUzXFdm2++cf3Fk/HjSA+3EOK2R0rFmb+iyBf7
	 pvFU8ZtJJ8RD/MaalH9bPG3kv4w8SIZccVwX6Cu9UxTTbSpajGWqtmGLBi64UYlIqU
	 jFGiiN410UpNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSXf5JqN
  kg7UnOS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozGyctYCuZwVhy59p+xgXEhRxcjF4eQwBNG
  id8LXrBBONeZJC5samOHcPYwSnz5d4Kxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBB4mjn1YygdgsAqoSV5/8B7N5BRwlHkw6DVYvIaAgMeXhezCbU8BJYtLtW2C9QkA1e1
  dNY4aoF5Q4OfMJC8R8CYmDL15A9SpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVok1SUmZ5RkpuYmaNraGCga2hoCqSNdS1M9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQJDOaU4PWQH45l9v/QOMUpyMCmJ8tovMkoW4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMHLtB4oJ1iUmp5akZaZA4wrmLQEB4+SCO+6JUBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5O
  XnpUqJ887cCFQkAFKUUZoHNwIW45cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMuXQs0hSc
  zrwRu0yugI5iAjrDj0wc5oiQRISXVwOT2K/DmmjdzVkpvX9qttn3y/VsuVtF6DiENq23f2BRw
  bP27vq/n+W3J0OYdCwxMX313sPy2TPbobLGfN2q8I0/GXCpKF3GZc66Lqbw7LFNOYJrMw9kbe
  5KtpifdSVXc9H9PTCl77o4/Teevht/2ifnbmf0+lWeKydMQxaxpM6Zm5Ft52P3r91o1V0qnUf
  pwaNnCu706z1vCZedv3bb957W4xxFPFY8G7Z6zI1bH+MPLTM1PLVPyH3oWs/hkpdrU/EmMZ44
  qzJ2QMM/op+erp1WTDuxPuD1r3dcwz8WimQ8U3l397fX/s6Hcfe+tV0tDtTZffBcoHtF/Yl38
  th8/Fba2tn7X6JjEP+XunBctDfJKLMUZiYZazEXFiQAwIcV7bAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1664266918!349996!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10528 invoked from network); 27 Sep 2022 08:21:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:21:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8DAFB1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:58 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 80F85100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:21:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thrift: upgrade 0.16.0 -> 0.17.0
Date: Tue, 27 Sep 2022 16:21:23 +0800
Message-ID: <1664266883-2234-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
References: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98968

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../thrift/{thrift_0.16.0.bb => thrift_0.17.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.16.0.bb => thrift_0.17.0.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
index 8141abef51..24d07b8e52 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
           "
-SRC_URI[sha256sum] = "f460b5c1ca30d8918ff95ea3eb6291b3951cf518553566088f3f2be8981f6209"
+SRC_URI[sha256sum] = "b272c1788bb165d99521a2599b31b97fa69e5931d099015d91ae107a0b0cc58f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


