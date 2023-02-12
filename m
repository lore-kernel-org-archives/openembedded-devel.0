Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CE3C6379F
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 09:07:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7816.1676192854666867051
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 01:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WBqBgNIg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676192855; i=@fujitsu.com;
	bh=IQWG1J4ZXyj81gt9JHedj1MAl7c3/zc2X3sT47tZogY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WBqBgNIgm61P3bq4ee4HsMHsQ0uyucq9i2WhsHyPsy4vI2HaAr3FOvNnUzgWeI3gz
	 5MDIoqsRlrBTR9orrCla+auDpgLZHLYcDIeOLe594uXI80WMUCweSQyxEnfo4mUZJB
	 bwQ49Z7je91iJXkopP9mVAMxwkbC/GOSNP9YsC5941IphVl2SgMagK2VgfPIVYFBdX
	 q/riXadNZsckfB5IIFJkEngH69gXFmo/R0a6pe5v2EMSkJ1edEXdYIBetRXVCu08ud
	 BEbX29ha/+tP7vKCDkrTTmAvCmzkVoEa9IkQxnEvwCm2uuXtueFttZoh6ztSB0LQ6v
	 Q0lP4sFFTvcCg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSTd8zYt
  kg9ubeSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyTi54xFbzhq3jWfJqpgbGft4uRi0NI4Amj
  xMzHXSwQzg0miYuL21ghnL2MEs07/7N3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsICXxObdLUwgNouAqsSfm/MYQWxeASeJd02dYL0SAgoSUx6+B+vlFHCWOHfhFFANB9AyJ4
  mlzXIQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYpTi8pSi3QNDfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS
  9PJSSzYxAoM3pViRdQfjpb6/eocYJTmYlER5l21+mizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  pdl9YtkIcGi1PTUirTMHGAkwaQlOHiURHirFgCleYsLEnOLM9MhUqcYFaXEec1B+gRAEhmleX
  BtsOi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9+gqoCk8mXklcNNfAS1mAlrMIPUUZHF
  JIkJKqoHJ77hGXvXZiMufns36k8uT9FvWSCXkZKF35iGtT0pKauHfg/w4Zy6cJ76ZxXSdy4bm
  sA8/j/1heui5t0rz0uYfFy77fS3Y/DM4S9DHpMW3MvBTkeC3v0c+tqvVT2Y2Fd9zQtTG9k/Od
  C3tn4uaToUkG2wtWvFeR/Fw+4dLwstu8C9ZeWrabfOPLcZi6oer2Ob+eZHqlbTkXgOT+J+X02
  3PHH+7mSd1iUWjMrfC79AJf7fWsEhFNjFInqkz1M0PW6Vr7c/SULYo/lH01xz2a//PPZ794Ph
  zHc/c55HzXyUnshUs+DTpDcdJpvmTz6lnbTKTnrSv5OIUjUtcP+Q23HoxZ6kEo+qtECHLn8Fa
  u6vWKbEUZyQaajEXFScCABNkVJ5ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1676192855!769961!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28122 invoked from network); 12 Feb 2023 09:07:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 09:07:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E07551000DC
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:34 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D41021000D7
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 09:07:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-qrcode: upgrade 7.3.1 -> 7.4.2
Date: Sun, 12 Feb 2023 17:07:16 +0800
Message-ID: <1676192839-13378-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
References: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101044

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Allow pypng factory to allow for saving to a string
  (like qr.save("some_file.png")) in addition to file-like objects.
- Fix bad over-optimization in v7.4 that broke large QR codes. Thanks to
  mattiasj-axis!
- Restructure the factory drawers, allowing different shapes in SVG image
  factories as well.
- Add a --factory-drawer option to the qr console script.
- Optimize the output for the SVGPathImage factory (more than 30% reduction in
  file sizes).
- Add a pypng image factory as a pure Python PNG solution. If pillow is not
  installed, then this becomes the default factory.
- The pymaging image factory has been removed, but its factory shortcut and the
  actual PymagingImage factory class now just link to the PyPNGImage factory.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-qrcode_7.3.1.bb => python3-qrcode_7.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_7.3.1.bb => python3-qrcode_7.4.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.3.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-qrcode_7.3.1.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
index f6de60e1a..8c0429bbb 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
 PYPI_PACKAGE = "qrcode"
-SRC_URI[sha256sum] = "375a6ff240ca9bd41adc070428b5dfc1dcfbb0f2507f1ac848f6cded38956578"
+SRC_URI[sha256sum] = "9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845"
 
 inherit pypi setuptools3
 
-- 
2.34.1


