Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2042BC46467
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:06:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.111328.1669615589248186288
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YXekMFM3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615587; i=@fujitsu.com;
	bh=odY6Gh55A3Agl2swIYt6Y7eVbCkQEHhU91v6ifsKsNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YXekMFM3aEF0eQHiOsAZ8pm2ruItJtsutHCYXceSp4rzJvzs0xzb2acc8x/Xr8dro
	 jazuUM+j0QTJO9tKJtinr+Bmw4HFdo3rIQdCaDdMhsd7TVNiQojqCBCVCTZLT7t4wY
	 2ctQgXQbELk9Si/+6m8C/OR5lhgzVUqQ+uw3WaYl3K0DAXlwMtuwqgiiPPqK/QJ2QC
	 gAOo3iUZPqOvFcyZpFUYtEhKPygiiWSOQCci4eQ8zVfFxCseK+eJWIYscHjfYF5WHv
	 eyP+imIROq0Nuybmeb3d57SaW9cMFl5J3t4FVRjbP0LbhhgEd2moWT4rN0/kZTObq5
	 JXIlDNzjmznEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORpPvIvyX
  ZoG2HmsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjF1VQdTwQy+ir9PrjE1MC7g6WLk4hASeMgo
  8f5jIzOEc4VJYuPch2xdjJxAzh5GiemTEkBsNgEpiRv3/4PFRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hINH9rYAGxWQRUJTYt7gWyOTh4BZwkNq4CC0sIKEhMefgerJVTwFmia8dxZohVThJ7Jz
  5nBbF5BQQlTs58wgIxXkLi4IsXzBC9ihKzLzdDzamQmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bw4tagstUjX0EIvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMweFOKUwJ2MG5a9kfvEKMkB5OSKO/CS03JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR413u2JAsJFqWmp1akZeYAIwkmLcHBoyTCu9geKM1bXJCYW5yZDpE6xWjJMXX2v/3MHMvB5M
  yvbQeYhVjy8vNSpcR55/oBNQiANGSU5sGNg0X7JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjEr
  CvIIgU3gy80rgtr4COogJ6KBNik0gB5UkIqSkGpj8zp5X4qlJVKw1Np4q9uHN+UM1WaLWensY
  6p+rei4/7srOq+azets2vm3VmyQWF0Wqf1Ve8e3Ud4NO042/5Hu77GX3B7Om8r0SdpBzfWHjK
  lVd4Zl3Uy5UaWeHXVt+RVYSU5br5Bpu5/WdC2bfyFuk6dbrY3mNLXT2N1m/5Zt98wJPbLQvT7
  L+6l638ZzAcR7+ZRrTj8WbrBN0asif9amZZwHj0n+aSx/oXv+80v7OrkTNRbs+vXM02qOtcP7
  KbiuN/UdMY7Q3THxUHWqj8neu0aptRfU7l31yaT0f97VRwqVII+jJYr6X32xPF1+R733GcP5N
  UPiJV02V9nc2vco+51bcHuF7X/FlxYa+40osxRmJhlrMRcWJANXkzbFxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-728.messagelabs.com!1669615586!9822!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30664 invoked from network); 28 Nov 2022 06:06:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:06:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1BE871B2
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 10AA21B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:06:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ccid: upgrade 1.5.0 -> 1.5.1
Date: Mon, 28 Nov 2022 14:05:49 +0800
Message-ID: <1669615552-13033-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
References: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99787

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Add support of
   Access IS ATR220 with idProduct: 0x0184
   Alcor Link AK9567
   Alcor Link AK9572
   BLUTRONICS TAURUS NFC
   CHERRY SmartTerminal ST-1144
   CREATOR CRT-603(CZ1) CCR
   Dexon Tecnologias Digitais LTDA DXToken
   ESMART Reader ER433x ICC
   ESMART Reader ER773x Dual & 1S
   Flight system consulting Incredist
   Ledger Nano S
   Ledger Nano S Plus
   Ledger Nano SP
   Ledger Nano X
   SafeNet eToken Fusion
   Sensyl SSC-NFC Reader
* Adjust USB drivers path at run-time via environment variable PCSCLITE_HP_DROPDIR
* configure.ac: add --enable-strict option
* Fix a problem with AUTO PPS readers and ATR convention inverse cards
* macOS: log non sensitive strings as "%{public}s"
* Some other minor improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/ccid/{ccid_1.5.0.bb => ccid_1.5.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.5.0.bb => ccid_1.5.1.bb} (78%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.5.0.bb b/meta-oe/recipes-support/ccid/ccid_1.5.1.bb
similarity index 78%
rename from meta-oe/recipes-support/ccid/ccid_1.5.0.bb
rename to meta-oe/recipes-support/ccid/ccid_1.5.1.bb
index 9775d82fa..42bc95772 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.5.0.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.5.1.bb
@@ -10,8 +10,7 @@ SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[md5sum] = "f246d6601856775310c86b841b616de5"
-SRC_URI[sha256sum] = "81549b3422469d503996d03a3aed2ef1375b359167f10d66be9e3844e729322e"
+SRC_URI[sha256sum] = "e7a78c398ec0d617a4f98bac70d5b64f78689284dd0ae87d4692e2857f117377"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


