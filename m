Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A62C4743C
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.7057.1649903632024348569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jnLiWcce;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903630; i=@fujitsu.com;
	bh=RMXu9D8BI4elANBvQZNzSEilk1pJ+oam4VXPueGdSto=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jnLiWccevKDi956Oo7mda8hbVxzSdIWLVYpPdMMpbteueI5OezqevhxQ/xO4TFZu6
	 0GfnyW/DqeqULQ7qBVbPD9xBln7gXPfu7waQJiCKecqH5EoNvswQHwO2zFfYqQ1vID
	 D3PVJAHUA3GaHPYIURbnWB1nqAmvC9QPMnIrl0qgPb9QOTIcdzSlCMV/o1Oh+XM7GM
	 pJFYGRHvcnFubqxNVAxvD9NdiRpMxy3VmgWzOxiIf2qCbK935C5Kn7OHL/p3TmGfcQ
	 xkbYHAQ6QkWu5WCXRM+gOZguIL1TUKLLjZ3VUvHVioceuaZkcgaVVCnQQOnaTF6pPi
	 cPuejifQ2GeSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRosvbEZ5
  kMPmOhMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFvxTX2gqccFa8vPWZqYGzj6GLk4hASmM0k
  8XnfBaYuRk4gZw+jxP0t8iA2m4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373sIPYwgJ2Eqt2T
  2MEsVkEVCVOLX7F0sXIwcEr4CSx8Z0VSFhCQEFiysP3YK28AoISJ2c+YYEYIyFx8MULZogaRY
  nZl5tZIOwKiVmz2pgmMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hoamusa6FmZ6iVW
  6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZVSzBy2g/FP70+9Q4ySHExKorxZ
  huFJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4vVqBcoJFqempFWmZOcBQh0lLcPAoifA21QCle
  YsLEnOLM9MhUqcYFaXEeT+3ASUEQBIZpXlwbbD4usQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1
  FJmHcqyBSezLwSuOmvgBYzAS3+tioUZHFJIkJKqoFp9R7ere7uZt7cE++/zV72vIJ1fnLAwa0
  u6xJcU+7v6AlQLH7Rcszy4sdD5+6mOitqsJs1yJfrrGHfwKR+se6a7w8PCebz88PCviybFLTe
  zdu4YZdqs5/25fymhefPrNFm+qJxYfdf0/SiFVJJl5/kPhNZIRMm8vWH2ynx9u2Hd567zBU1b
  4HC8ssFdTuaSjY/55u07WXOyuztsitibp27PGuGonXepudX7jqun9koc/H1Fud7+vWGCkYtPW
  sZNr9uMLA71LHygz3T3bOKm6cevKRjstrFfdOWtBjLmurXUa42d4ov1qxdx562fxUr/2dXkbi
  +TY9UtrRd/1Kd/Cy56t9VP5/OvXJu853WbK5oVGIpzkg01GIuKk4EAEkBqfMqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1649903629!86568!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10456 invoked from network); 14 Apr 2022 02:33:49 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:33:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23E2XmFK018805
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:48 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:33:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 10.5.0 -> 10.6.3
Date: Thu, 14 Apr 2022 10:33:42 +0800
Message-ID: <1649903624-17790-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96638

Changelog from 10.5.0 to 10.6.3:
https://qpdf.readthedocs.io/en/stable/release-notes.html


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_10.5.0.bb => qpdf_10.6.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.5.0.bb => qpdf_10.6.3.bb} (90%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.5.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
similarity index 90%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.5.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
index 9644c653ee..fa33daf52d 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.5.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 DEPENDS = "libpcre zlib libjpeg-turbo"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
-SRC_URI[sha256sum] = "88257d36a44fd5c50b2879488324dd9cafc11686ae49d8c4922a4872203ce006"
+SRC_URI[sha256sum] = "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13c86d31fa33493811"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
 
-- 
2.25.1


