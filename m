Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5597C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:57:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.16363.1666594626833024719
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dACVCzSY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594624; i=@fujitsu.com;
	bh=n+uSy54AxLJ+cGcqlUPnpuaaWNHnH5ETWyrEwUdNK1I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dACVCzSYbbrDfX2p2YJR/fKwI6lmnqcWWDUDmnhTh4Ha27qmqw+MO2nmmtPJSmQtV
	 QyH4JpnrKCeZKeeb9gFpmWqu7ml2yqd3Op36FONRtXg9Ktk1ErcCWQE7qCka5cmiub
	 5lz1Ma9EVlKMlo8hLbYPfgSXrBUaD1UaoZad15s7g/7ttGXy84ztWHL0Js04PhHVBF
	 nQTnbEqNbb3s958VXbEFc820H+A5brHTn2mPa5LvYrfbZdmwBCgcy8KjvVucLGTYVQ
	 aCPpwB2KzViuNSLcYKXOc9q+bzc0JPKz5jJhMCC1eCqwmTr84gB/gQEKCBVwh777cs
	 doiydEYNV+3yw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWdfBPCz
  ZYN0/RYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPij5WsBat4KmauKmxgnMbdxcjFISTwkFFi
  Y+8cZgjnMpPEysuTWSGcPYwSv+5sAHI4OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYW8Jc48XcWWJxFQFWioecumM0r4CTxbc5qMFtCQEFiysP3QDYHB6eAs8Sb/XwgYSGgknsHG9
  kgygUlTs58wgIxXkLi4IsXUK2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xmhanFpWlFuma6CUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWW
  bGIEBm5KsarnDsY/S//oHWKU5GBSEuVlEA9LFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBW6MFl
  BMsSk1PrUjLzAFGEUxagoNHSYR3lhFQmre4IDG3ODMdInWKUVFKnJfbDCghAJLIKM2Da4NF7i
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrx+pkBTeDLzSuCmvwJazAS0+NKKIJDFJYkIKak
  GJu+weT2eXpofFPp5vHXP8HYnaj2L0V5tuU9px5LC29Onp02aP+FTi4ldMevVBTLbz326GHK0
  yLg2/MvcIyZbvrcmG8afqVrHE2R3wsnLKmbb8busE1fY5R9eJ1D6MNFAbIZ8Qaf+julC7PPnv
  2We5lC5NeldwY3Z3ZI1d1+rHu5bm1nm82bHQX7BjD+6HYu7un4azFz+6ojnTQX3f9mf9fZvMk
  ztXbUq/O5CY463njZ3zxv02N7WOx4Rp51i73J429+961muqSlmbp75sqzfZ+ftyu93pxgc3b3
  mm8PzEi6DuPj/q7t/Xrszqe/2FzX+TzeZHab5/v2lHv96jfIpK7WG68qpXUx39PUUf89m3a7E
  UpyRaKjFXFScCAB+pPHeVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1666594624!199609!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31472 invoked from network); 24 Oct 2022 06:57:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:57:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3D4BE150
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:57:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2FE887B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:57:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:57:02 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pastedeploy: upgrade 2.1.1 -> 3.0.1
Date: Mon, 24 Oct 2022 14:56:37 +0800
Message-ID: <1666594597-29274-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666594597-29274-1-git-send-email-wangmy@fujitsu.com>
References: <1666594597-29274-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99284

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Fix python_requires package metadata to support Python 3.7+.
 Drop support for Python 2, as well as 3.4, 3.5, and 3.6.
 Fix a broken compatibility shim that would cause the ConfigParser to fail on Python 3.12 when ConfigParser.readfp is removed.
 Drop setuptools dependency and start using importlib.metadata instead.
 Refactor repository into a src folder layout.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pastedeploy_2.1.1.bb => python3-pastedeploy_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pastedeploy_2.1.1.bb => python3-pastedeploy_3.0.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.0.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pastedeploy_3.0.1.bb
index 86f29e119d..cb10dd98df 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
 inherit pypi
 PYPI_PACKAGE = "PasteDeploy"
 
-SRC_URI[sha256sum] = "6dead6ab9823a85d585ef27f878bc647f787edb9ca8da0716aa9f1261b464817"
+SRC_URI[sha256sum] = "5f4b4d5fddd39b8947ea727161e366bf55b90efc60a4d1dd7976b9031d0b4e5f"
 
 S = "${WORKDIR}/PasteDeploy-${PV}"
 
-- 
2.25.1


