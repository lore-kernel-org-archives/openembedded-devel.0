Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF81BC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.4386.1652940199893728153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TpENXMhr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940197; i=@fujitsu.com;
	bh=gt0p82ZV2nKGOSo6g/a+QEqGlBBP+sLfsFzMrFyRujQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TpENXMhrh8U4wWHweSiwIIymFvrr01aYoyCURiJODwj+kPj9UuO1Mw7BsOl9RqCus
	 jRF49nH6+4ammhu1hmWT7WYr/WcWoTvddmBtVUHUhOveqxVdts/BrQ1tdZEtheg6b0
	 0ECiFHGoB9SCymScVPlErHJHJU3NuSQcppt0FJp3weB6pX+2qXpOF5Xuqenly3S+e1
	 XEC4NzDiz0KBMHv0i69UGYrtIvEptwA/7J9pF6+0kJj34TBpL8/idWZ/GxO16riiDQ
	 GyQpQxRrzrm7ovF3B14P6h9Yl1FYRDIfF5eJKHlNb+8+G2xdco3QPfyaZhSyU2ucm7
	 xU3CSH8FJKVxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI0V16tzX
  J4PBCRYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPFqkfMBd+4KhY8PMzWwNjK1cXIxSEkMJtJ
  YtGWvywQzgFGib6bi1i7GDk52AT0JTau+8QEYosA2Utn72EGsYUFPCUmXVkOZrMIqEqcWvAJr
  J5XwEPi2YQfYLaEgILElIfvmSHighInZz5hAbGZBSQkDr54ARTnAKpRlJg9XR6ivELi9eFLzB
  MYeWYh6ZiFpGMBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdEyDLUC+xSjdRL7VUtzy1uEQXyC0
  v1kstLtYrrsxNzknRy0st2cQIDKWUYpbUHYx9fT/1DjFKcjApifK6H2lNEuJLyk+pzEgszogv
  Ks1JLT7EKMPBoSTB+/kGUE6wKDU9tSItMwcY1jBpCQ4eJRHell1Aad7igsTc4sx0iNQpRkUpc
  d6EO0AJAZBERmkeXBssli4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZNBZnCk5lXAjf9Fd
  BiJqDFt5TBFpckIqSkGpgmrt4ksH36VHM/yb2X9wQEGxipVcyd/HJxxaRs54sy/c1XF91fmzl
  /g7jhnl1nqhNnL+jv1uRJP3ont6L+o79mvNjS5Y+TfP4t/h2091DpgwMFq87kZds17E1sjFoc
  8X73kY08UfaxTfPW7i1Z7lzzdI6ZgdC16B33789fbKj76dej7K+xR5lqX1+5HXtH4tzXkKBrk
  n8mMs05kTbdZ4GHjsb+8JVGkQu795/eX2J75Ia+36ovr1jb8loU9yQxfhVfseLC1v+qspnHHD
  6vY8ppZpYImSnOcCh266ftTiKf9vaoC2XkTY8v5zX7m5X48azOhQ3nV0k2vZwZ23ml8cYMhi2
  OX57xPH7aYjYpwCxGW4mlOCPRUIu5qDgRAGU8y8EgAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1652940197!20673!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24247 invoked from network); 19 May 2022 06:03:17 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 24J63BNx023551
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:17 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:09 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyjwt: upgrade 2.3.0 -> 2.4.0
Date: Thu, 19 May 2022 14:02:37 +0800
Message-ID: <1652940157-24882-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97173

License-Update: copyright year updated to 2022

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pyjwt_2.3.0.bb => python3-pyjwt_2.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.3.0.bb => python3-pyjwt_2.4.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.4.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.4.0.bb
index 19ba30780..a540e3651 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.4.0.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A Python implementation of JSON Web Token draft 32.\
  Original implementation was written by https://github.com/progrium"
 HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41"
+SRC_URI[sha256sum] = "d42908208c699b3b973cbeb01a969ba6a96c821eefb1c5bfe4c390c01d67abba"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1


