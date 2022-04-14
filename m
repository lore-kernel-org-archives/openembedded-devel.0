Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4F8C48BCD
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.7151.1649903652237735852
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HMQoDTiH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903650; i=@fujitsu.com;
	bh=10Ss3IYR8wA/CRGnlx90K4jJW1R7npdWCyaF9EJkOsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HMQoDTiHtrsHmgEDHPQt4QCKAA10ncdsLUCoNz1o/kGl/6R+DEgaQ85XB90kimOdQ
	 ufg0ESTMzTeVwFM5/YCW9gZHmPbKl5n/tqxb67NAkznz6IER4xKwlLqLgPnGC/iHQx
	 aU352hrsIq4mTwcljt0oX1ZXNL3jnYewU8UTlQLQaN3/YVYln+RxXkU+vDDzQV1Qqj
	 lLhfGACcbb/NslJu4ij87QTlY4V9vO6R10cuDYnGLMqiWxj3iiuR+OroRI8LjAbbP/
	 Q+t8J4RP0+yYkoMH9bKl92MyW9oJvvwkH4MP6ZzcH+/Hcvqh8jyZhkyL4y+cYr31lo
	 zAzjylE6WNFXQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqKvYEZ5
  k8PCLqsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH4fEDBV56K+XOqGhhXcHcxcnEICTxhlPi1
  pZcJwrnAJLGgu4MVwtnDKLH46GKgDCcHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373sIPYw
  gJOEle6u8DqWQRUJR623QKr5wWKH71/ig3ElhBQkJjy8D1QLwcHp4CzROdSFZCwEFDJ4rsT2C
  DKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWiUVZaZnlOQmZuboGhoY6Boamuoa6hoZGOslVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGcEox4+kdjJv6fuodYpTkYFIS5c0yDE8S4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MHr1QqUEyxKTU+tSMvMAUYTTFqCg0dJhLepBijNW1yQmFucmQ6ROsWoKCXOm98OlBAASWSU5s
  G1wSL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXm+QKTyZeSVw018BLWYCWvxtVSjI4pJ
  EhJRUA5MBmxOP4+G+xy+uRidb/UlN/L9s4y/t05MXXHcoaP+bZO79zKlywZIwm5j6i+45lpdk
  I7xebywJn9S6Sy+xS6K17vPk4ORujwffwnuX9eRqrHTfa1tqn+f3Yn2zi8KaLwf11A40LslYX
  3//smWA1KNDzD1T/rdsuffLcM3T78In1gn/D42oveRdo+elmnV8X1NaiftRHWfDfL95r3Pb98
  pHrZbX+H1P2Owv2+yHDafWc2v53d7BtG3qwfP5vdXa4XdT2P+vv/Fc4HyBjsHy5+mf/j/QaJS
  KF71wYPEpdjOT/EPKoe8sllqpXBBd47yMyT7f2GtTUHjni6Qr2iyGl7bV/tNxWNR++ZZJAM/y
  d0osxRmJhlrMRcWJANWHpzxbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1649903649!50407!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12518 invoked from network); 14 Apr 2022 02:34:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:34:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2C70E100199
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:34:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1928610018E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:34:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:34:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] s-nail: upgrade 14.9.23 -> 14.9.24
Date: Thu, 14 Apr 2022 10:33:44 +0800
Message-ID: <1649903624-17790-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649903624-17790-1-git-send-email-wangmy@fujitsu.com>
References: <1649903624-17790-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96639

Changelog:
=========
- Release tarball might be in --format=pax.
- Again honour MTA arguments passed after the "--" command line
  "option" in non-send-only mode (broken since at least v14.9.12).
- support Microsoft IMAP servers.
- Fix crash due to crafted emails.
- Fix *expandargv*#419=restrict (broken since v14.9.0).
- Fix a bug from nail 10.08 as of 2004-06-28 that leads to
  crashes when some file cannot be loaded.
  And while here fix one file-close overshoot of mine in since
  v14.9.16, that would cause panics in debug-enabled code.
- deal with argc==0 aka CVE-2021-4034.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../s-nail/{s-nail_14.9.23.bb => s-nail_14.9.24.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/s-nail/{s-nail_14.9.23.bb => s-nail_14.9.24.bb} (92%)

diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.23.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
similarity index 92%
rename from meta-oe/recipes-extended/s-nail/s-nail_14.9.23.bb
rename to meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
index 4dbb99b3d5..bc514b577a 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.23.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"
 
 SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
            file://make-errors.patch"
-SRC_URI[sha256sum] = "2c717b22f4cd8719b82b6618640da6031382d2bf8eb51283bca2c6266957bca8"
+SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1


