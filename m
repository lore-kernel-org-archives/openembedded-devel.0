Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D705C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 23:42:32 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.4892.1636501351672385085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 15:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wen4ymi/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636501349; i=@fujitsu.com;
	bh=wsHIAi7FvMXEfPVv1avOTHcfG2R4RzupN73wif4AwTA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wen4ymi/+38h/e0KriGExJWzO3qHbG6y0qC2SU2VbU/tgmYBz64NK+SENFLr5ldcZ
	 X9zuYeUaOJFfQPMZ696CuQrQIyztWjPLfLsUjmyZfHaKZmnJLdJfnw3JW8/cylO4AT
	 EVYGkA6iIll0eT8DA+N96Cvfl+avVRSlIPoiZ1CyakmJAJXNCgxm/Cgn7EvsV1zjFl
	 8Xebo8iM/WvIlNE+9zyqIfwNqa1+CSaxuBHk6bICGWT54/wzkmMAFVQx+G7kK4l5cd
	 OfsgAs9zW7KUGMb1Zw/Vm/R1HRmAvItSWYZ8OtX9FW20oIsyWqwLpOg3I03djXyLzS
	 kTketf9Qh2suQ==
Received: from [100.113.3.95] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id CB/76-32197-5670B816;
 Tue, 09 Nov 2021 23:42:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRopvC3p1
  osOqcpsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFv2XKmgk1cFV17tzI3MK7h7GLk4hASmMEk
  8fTRIkYI5zijxN2XS1i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h72LkYNDWMBeo
  mVDHUiYRUBVovfLO7BWXgEniS2rV7GD2BICChJTHr4Ha+UUcJbY8v0vWI0QUM3PbY1sEPWCEi
  dnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYJjDyz0LSMgtJywJGplWMlklFmekZJbmJmTm
  6hgYGuoaGxrrGuoaWJnqJVbqJeqmlusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzAgEwpZD60
  g/HJ6w96hxglOZiURHkjp3UlCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgDfsGlBMsSk1PrUjLz
  AFGB0xagoNHSYTXiq07UYi3uCAxtzgzHSJ1ilGXY9WB6auYhVjy8vNSpcR577ECFQmAFGWU5s
  GNgEXqJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvA9ApvBk5pXAbXoFdAQT0BEHv7SDHFG
  SiJCSamCqfcgfY3xq6dmIx7VzE6cs/ZTVfGX9aY+me9dYjE62WxR9KXGsFrzoalN0afGUdWzP
  Lh5+/X/he60/rp/mXRTbadNX77GXM5HtLP/pCpvQpv+xfLLsz51TpFddbxYy8F/30GHvA8M5I
  vr3LQ/v3qq6tMrYnevBs9QetatRFxf8nPc5PP/ElaKLc21ubZpRFxWss8ZeZ0rd8qSYNvNHMv
  0qs6bbKWZmseZ4KzGv3ST9+PO3B7IuCma2Zi4RO/T+C8Ua10426ljwwtFwUnHT7Fszuj6mr5g
  6490mb54Ox8TllkbnZypotkRreNfwGzye9Zpv1ty/OkoXTYx69umvvvpZ2Vvu0779q7e/DxP/
  /ShKiaU4I9FQi7moOBEAy5jz4U8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-226.messagelabs.com!1636501348!73871!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21498 invoked from network); 9 Nov 2021 23:42:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 23:42:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9NgMDU001659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Nov 2021 23:42:28 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 23:42:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jsoncpp: upgrade 1.9.4 -> 1.9.5
Date: Wed, 10 Nov 2021 07:42:11 +0800
Message-ID: <1636501331-62287-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636501331-62287-1-git-send-email-wangmy@fujitsu.com>
References: <1636501331-62287-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 23:42:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93892

Bug fixes:
 Minor bug-fixes (including for cmake)
 Support for Bazel
 Dropped compile-time deprecation warnings

License-Update:
 Format of LICENSE changed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncpp/{jsoncpp_1.9.4.bb => jsoncpp_1.9.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.4.bb => jsoncpp_1.9.5.bb} (85%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
similarity index 85%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
index 051304db77..c54dc94666 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
@@ -9,11 +9,11 @@ HOMEPAGE = "https://github.com/open-source-parsers/jsoncpp"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926"
 
 PE = "1"
 
-SRCREV = "9059f5cad030ba11d37818847443a53918c327b1"
+SRCREV = "5defb4ed1a4293b8e2bf641e16b156fb9de498cc"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


