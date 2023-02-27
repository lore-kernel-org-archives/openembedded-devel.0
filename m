Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51276C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:06:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.85501.1677485169351376338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z5wQ643n;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485167; i=@fujitsu.com;
	bh=Xb0bNfV8LbnqNIKp0f0FGvZivrA3ptXL+LUyiPUVyfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Z5wQ643n7HoEsyQM2iEfpSQKq1UXGJ6sWL4pUQMW4/TJWX4gnmHfOkMhQRl+iNVD0
	 HXcOfjzQjD2wmto6yYoOj7DV+x1SjYcFABbMDqHyMbrUlgUrMXfAGKAitsOTF4hsA0
	 oyI2DJGQ3TGBww3sewRnohpD7ab8aI2z3YSH7X/K9WEtfuQTFDYR9CLnCnDQ2kKxZB
	 pnogIovErwDgDNB7axihLUWel4Ks4jEogh/2EGhVA2zEkGHLs/YOgNAOrowm8CVTeX
	 kvH1xfGdph6/30IO2vcxvLnXwZWu9WTU9YWk0xl3k9rrROFmC5SuQjQ1ZmxtHm05qG
	 g4DOpdJfnK2lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqJuf8if
  ZYNkpWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOtZQ5TwTPOisNHn7E2MLZxdjFycQgJPGGU
  WLxjA2MXIyeQc4NJoq/BGyKxl1Hi85v1LCAJNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  e9i5OAQFvCXONkpAhJmEVCV2N/4hR3E5hVwktg0cwOYLSGgIDHl4XuwVk4BZ4lXzw6zQex1kn
  h8YhcTRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRtPi1KKy1CJdM72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwU
  vbzUkk2MwMBNKVb/tYNxZt9fvUOMkhxMSqK8i5z+JAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  D2YBJQTLEpNT61Iy8wBRhFMWoKDR0mEl9kIKM1bXJCYW5yZDpE6xagoJc7LlwiUEABJZJTmwb
  XBIvcSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeqASgKTyZeSVw018BLWYCWrz94Q+QxSW
  JCCmpBqYVQQZRaxRuPLMpTqxq8uDeJFfGuP178/Kp3/UW3DrnX5syf6WDtavZfaU6Xh6O5AQV
  4b16puzJj8tW6T84tOROWwX7p3zVq/LWF77GpHPsq/W7c6zwmcPCBn6XSu42e1NF1WC7Ks4Dx
  wseBKRybFGbkbv0zDOr0B/3Zs7Ze3L39KgTxSK/EgoZvrF2HXd6LektIvntgMWbPqYFrpf4OV
  fOMfz1YGrSiXermNYdvy/Tdl/s/I0pLNmzJ4vd/ir5wmS+66bPBX/XZjlN8Fji63OYW/Zl7JE
  /jKUa0sZHzi/clNFdeOPoQZE3Pb8yfnds7L4j3750ZsfCb9K5P1L+vNmzaFVUl7dLbWKPr1LM
  ESElluKMREMt5qLiRAC331DDVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1677485167!410346!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14861 invoked from network); 27 Feb 2023 08:06:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:06:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 144DD10019D
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:07 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 06C10100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:06:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstruct: upgrade 8.15.1 -> 8.17.0
Date: Mon, 27 Feb 2023 16:05:51 +0800
Message-ID: <1677485153-11495-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
References: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101270

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Text encoding and errors to compile().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstruct_8.15.1.bb => python3-bitstruct_8.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.15.1.bb => python3-bitstruct_8.17.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.15.1.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.17.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.15.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.17.0.bb
index fe3aeb7b5..d1d30cdb3 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.17.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "6fa6adbfb8f3b8cb68c21b13aa65d23eb2c3ac32419ab926f3fd1fff717a9125"
+SRC_URI[sha256sum] = "eb94b40e4218a23aa8f90406b836a9e6ed83e48b8d112ce3f96408463bd1b874"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.34.1


