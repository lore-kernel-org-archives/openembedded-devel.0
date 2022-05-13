Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF6BC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:33:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.3794.1652409212032350650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LsrXjKsH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652409209; i=@fujitsu.com;
	bh=o/UbAmxtx1zbpY/gf2LABdm8ux6gkY7jbdAUMAaS4ig=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LsrXjKsHrjgssNs5uGdI6T/tdbQc/95mMSe4nhpP77QSNcqDza6/kuxVv/GMb1oWU
	 VcQdykegFkU5b4gqU1h8+w9ObGJZy7ItRWOHpdzi1l2L+wUHqc2d0TMCj8xc6GTwil
	 WZGwZgC5425RozoYl8Wm4vYOlZHFOkj7upM6oxK52CebTZ7hTDIO2vLBUfsqKAmksv
	 /TenXxUxpIj+wUwNs2hndkf79WI3duv0sFzIZKFAOZDsnHqTORsikb++XAcBs2ANjK
	 8dW8RowtUQPuVewCV7TfbQyC3fqxJPmTvU6B6WA0+k0poORz0nxNNcg9fdzxjYbORz
	 Zz8gxAF7tThjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxRbficG2
  SQetTS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN78WG2grVcFYuXbWZsYNzP2cXIySEkMJtJ
  YtUK3y5GLiD7JKPExj0fmEESbALqEo9vvmYEsUUE9CWWzt4DFmcWUJXovriGHcQWFvCXePR3O
  1sXIwcHC1D88HQxkDCvgLvE+7PXwUokBBQkpjx8zwwRF5Q4OfMJC8QYCYmDL14wQ9QoSZxY8Z
  EJwq6QeH34EvMERt5ZSFpmIWlZwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11DXyNBcL7FKN1E
  vtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMMBSihlv7mBs7fupd4hRkoNJSZT3TXxt
  khBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3tZDQDnBotT01Iq0zBxgsMOkJTh4lER4dx0ESvMWF
  yTmFmemQ6ROMSpKifN6bAZKCIAkMkrz4NpgEXaJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkj
  DvRJDxPJl5JXDTXwEtZgJaHG8FtrgkESEl1cAkteaolA371jNxB4TCmoWPWhkv4rybfnnfAnH
  DeZE9JnN6nea7i9zeFVd1yoghvP3jse3ira/0Z7NfcHyc/UXjPNOGqm8FKwqK7jNxOSfdjjFb
  s/77grprD4P47UOY1/JWe31tVFO6lV8yZ9PvCRuMVZ/YGBX3qJ1YwxPWVVLj0Wb4/sVmw2yLA
  82dh5YdnC8vslHVlXV1kZLgxFz7Mzy6FT0vO+fJTRc+GM34z/ztgq03XnxgWSalkxjvlsNdEW
  W46GUI10fjq/5Nfr65AUmX/M+WvGRhbZ00ScV68a4Zyt3tu7ZMP6AvYLR/hZCrbvT9YvYlnzv
  iE4uYHikdMWFxWjdzUwzfDu6Pm6P8RZVYijMSDbWYi4oTAfyqrMErAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1652409208!324473!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24962 invoked from network); 13 May 2022 02:33:28 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 May 2022 02:33:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 24D2XHjq025695
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 13 May 2022 03:33:15 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.6.3 ->
 2.6.6
Date: Fri, 13 May 2022 10:32:58 +0800
Message-ID: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 May 2022 02:33:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97086

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
fix missing import in _default.py
add additional missing import in _default.py
silence TypeError during tear down stage

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-google-auth_2.6.3.bb => python3-google-auth_2.6.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.6.3.bb => python3-google-auth_2.6.6.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.6.3.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.6.6.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.6.6.bb
index ee5311f4f..d51790f36 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.6.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d65bb0e3701eaaa64fd2aa85e1325580524b0bddc6dc5db3ab89c481b6a20141"
+SRC_URI[sha256sum] = "1ba4938e032b73deb51e59c4656a00e0939cf0b1112575099f136babb4563312"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


