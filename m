Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69DAC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:08:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.8839.1664269707481828570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YAEwSehG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269705; i=@fujitsu.com;
	bh=FoGd6xhgDDIZ/rk+znx+IWAUrt1Nfvx33JaLc4Y0R6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YAEwSehGuCktoe1QhHIslyT81Uqc4D+lxXBXSpRZy+hfseXDl6Ux1qDieuQ/a4CJE
	 88aStE/qjc+upyicmKyshvBnBGw4MCPzoDmzDqr3m7nir68TmG93yPND3KiEOVRHSp
	 WeC1w7HfLQOeqw5pW1zhYKZLxflP15HfOr8IDTHvTCg+ytrznaybIJlMvS22Gtxbrm
	 L+Hf9+G9GazSVdYU+8M8ZigsDX1YQrPDYAMlwuqmROUMOWK+M4hkikhriD/3/fFJ9O
	 BULa7DIVQyuJssnm+5UpCy9bdYcbqbu9OjLwHRIVcBOPfgnNERFFDga/kU3T8PxY1k
	 ir6P3Tle6v1mA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORpNu51yj
  Z4NgxMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP6tAPsBXMFKzY/msLcwHiGv4uRk0NI4CGj
  xNuXbF2MXED2FSaJ2RffM0M4exgltjVPZgOpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggUuLDqT2MIDaLgKrEgSvHwXp5BRwllu14ClYjIaAgMeXhe7BeTgEnieblK5kgrnCUWP
  94LiNEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdU10jI3O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAIE4pZn28g3FN30+9Q4ySHExKorz2i4yShfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwSu4GygkWpaanVqRl5gAjCiYtwcGjJMK7bglQmre4IDG3ODMdInWK0ZJj6ux/+5k5lo
  PJmV/bDjALseTl56VKifOabgFqEABpyCjNgxsHi/pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTk
  YlYR5TfcATeHJzCuB2/oK6CAmoIPs+PRBDipJREhJNTDtWffH6J2p/+qjV1o2MU3bd6x9hf3C
  Ilf2E90dJ07H+OU59isbK9dF+Ju+lGVW1ShYfazp4t1XbtFBbnlH2PUWB67Kmfdr8TP7A/sjr
  zPf6l2XbcqTIXi6/Iw8U/Papa/KJj2LbYi19bRZazk/3Ddap95u6d95VkWbIsL/T5k3f0H334
  t3+N8yFDlEpb3g4t+87khB9gKZL4uar2+feSmx3IS/Uf+sgtc5tfh9fRPf+r78mDf140pZlcZ
  N59iFHCqfWOtuOWIckmRydp1EyqYA3cjI50r79ki/vj99NUfg5KSV06IYji+7VPrQOfuB8V/5
  pQJSjosypj66eUrATlcz032L7835/9/N53py/WOSEktxRqKhFnNRcSIA+w6H1XUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1664269705!262651!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17568 invoked from network); 27 Sep 2022 09:08:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:08:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 04F9C1AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EE4C91AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:08:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-djangorestframework: upgrade
 3.13.1 -> 3.14.0
Date: Tue, 27 Sep 2022 17:08:03 +0800
Message-ID: <1664269685-2594-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
References: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:08:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98976

Changelog:
===========
* Django 2.2 is no longer supported. [#8662]
* Django 4.1 compatibility. [#8591]
* Add --api-version CLI option to generateschema management command. [#8663]
* Enforce is_valid(raise_exception=False) as a keyword-only argument. [#7952]
* Stop calling set_context on Validators. [#8589]
* Return NotImplemented from ErrorDetails.__ne__. [#8538]
* Don't evaluate DateTimeField.default_timezone when a custom timezone is set. [#8531]
* Make relative URLs clickable in Browseable API. [#8464]
* Support ManyRelatedField falling back to the default value when the attribute
  specified by dot notation doesn't exist. Matches ManyRelatedField.get_attribute to Field.get_attribute. [#7574]
* Make schemas.openapi.get_reference public. [#7515]
* Make ReturnDict support dict union operators on Python 3.9 and later. [#8302]
* Update throttling to check if request.user is set before checking if the user is authenticated. [#8370]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.13.1.bb => python3-djangorestframework_3.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.13.1.bb => python3-djangorestframework_3.14.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.13.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.13.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
index be85827ef3..fee8a3a029 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "0c33407ce23acc68eca2a6e46424b008c9c02eceb8cf18581921d0092bc1f2ee"
+SRC_URI[sha256sum] = "579a333e6256b09489cbe0a067e66abe55c6595d8926be6b99423786334350c8"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.25.1


