Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67F6C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:16:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.101894.1670066206472478930
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T6XgHlOr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066204; i=@fujitsu.com;
	bh=PT1iqoFlau33vLXsE/WokdE93m1Gxi8ARxKhEs2XUDw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=T6XgHlOr3N8OT+VOD9UGh9UPfrJrSu01/nSnC85/dH/TGnsnG8sdp3lue+MrVy1l8
	 GMr6ImLHyFjgj1Dg0M63/NOQlQXO1qHjgUNp8EH7PRYt46Led7CKhS6h0ukpgffxPj
	 UQXD6lsFUTzgLOEvV+wd1KZXnsyv5JEwLXv5CvJaq0lhfItICiPMAhM6uxTDlKOqm+
	 mbwCajq07bEBPhv9BUFuaIQcA3Uj+1tT2/ZndXmSNqUlW//zc0DlNewTeo1SbSZYUc
	 cWnDConLtxsH+vn2dUzEj+0RZNRxmsLVzS4xdVxMLkAC5AYVyVuxzDzyOtVgLqBSdi
	 piOzSG724sl4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORqCtj0J1
  s8GEHk8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF372qWgoVCFW37PzI1MD7g72Lk4hASeMIo
  8WXRWRYI5zqTxJK+O8xdjJxAzm5GiV9dviA2m4CUxI37/9lAbBEBfYmls/eA1TALqEi8+N3DD
  mILCzhIHH0LYnNwsADF2+/Kg4R5BZwkFv2ZCdYqIaAgMeXhe7BWTgFniT29N1lAyoWAat7eFI
  EoF5Q4OfMJC8R0CYmDL14wQ7QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFqcWlSWWqRrqpdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5da
  sokRGLYpxUp9Oxi7lv3RO8QoycGkJMp7LKwrWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb6B+d
  7KQYFFqempFWmYOMIZg0hIcPEoivF2qQGne4oLE3OLMdIjUKUZ7jqtXruxl5pg6+99+Zo7lYH
  Lm17YDzEIsefl5qVLivJv0gNoEQNoySvPghsJi/hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkY
  lYV4xkCk8mXklcLtfAZ3FBHTWRv4ukLNKEhFSUg1MIRrxuRfs73uFRkz8VtqvpPJJ8NpZo42v
  XtyRu8J72pe7wTB1rpJu8ZRP93PbtW99vMJoe3X3y5lRah0r9599fHVvS+tM1ZOCXCftJdZwT
  2w89aU14kov49aKNG7XS36/SpNcT2+PPHHVMM5zxeZ1xw6vD9tzUW2DaHH5D7ujUSrbFP8WLn
  71Lnwbj+vtyYy5yg/3nDdte/c8900O69HpzDLX/Z3nzxZKOSDZMjlree2KpqfXE8QU3GZ84hV
  4+LX3tf1me/e+X4HXLokvzNVuzcwqCVz8qa3nfabCjOOJb8KUhRdkeetm50x2mt4dJLLp7jSP
  ybP8Mv/sqJsWkZ15t+OV0vet9m/kzkel/DUxV2Ipzkg01GIuKk4EAP1aFLt0AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1670066203!79856!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31910 invoked from network); 3 Dec 2022 11:16:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:16:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BD50E10018D
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B1490100182
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:16:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opensc: upgrade 0.22.0 -> 0.23.0
Date: Sat, 3 Dec 2022 19:16:13 +0800
Message-ID: <1670066176-24685-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99927

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Support signing of data with a length of more than 512 bytes (#2314)
 By default, disable support for old card drivers (#2391) and remove support for old drivers MioCOS and JCOP (#2374)
 Bump minimal required OpenSSL version to 1.1.1 and add support for OpenSSL 3.0 (#2438, #2506)
 Compatibility with LibreSSL (#2495, #2595)
 Remove support for DSA (#2503)
 Extend p11test to support symmetric keys (#2430)
 Notice detached reader on macOS (#2418)
 Support for OAEP padding (#2475, #2484)
 Fix for PSS salt length (#2478)
 Improve fuzzing by adding new tests (#2417, #2500, #2520, #2550, #2637)
 Fixed various issues reported by OSS-Fuzz and Coverity regarding card drivers, PKCS#11 and PKCS#15 init
 Fix issues with OpenPACE (#2472)
 Containers support for local testing
 Add support for encryption and decryption using symmetric keys (#2473, #2607)
 Stop building support for Gost algorithms with OpenSSL 3.0 as they require deprecated API (#2586)
 Fix detection of disconnected readers in PCSC (#2600)
 Add configuration option for on-disk caching of private data (#2588)
 Skip building empty binaries when dependencies are missing and remove needless linking (#2617)
 Define arm64 as a supported architecture in the Installer package (#2610)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opensc/{opensc_0.22.0.bb => opensc_0.23.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.22.0.bb => opensc_0.23.0.bb} (96%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
similarity index 96%
rename from meta-oe/recipes-support/opensc/opensc_0.22.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.23.0.bb
index f8b4af0c4..078e4e686 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
@@ -12,7 +12,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 
 #v0.21.0
-SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
+SRCREV = "5497519ea6b4af596628f8f8f2f904bacaa3148f"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
           "
 DEPENDS = "virtual/libiconv openssl"
-- 
2.25.1


