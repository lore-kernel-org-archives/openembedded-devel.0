Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CB5C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:14:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.7089.1651130066479712433
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yFNfqoYx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130064; i=@fujitsu.com;
	bh=STA+//KwpSKIssG7su3c01JuiJeK6RkAsL6AIWQTLvk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yFNfqoYxssh9f5pwlbOnmfGTWnQhO0SAIv+YcgPh0NyIU7BkqFF5bUHq0975RNGPh
	 rk7ilIaZY2KNAYPPbJqBzIEVldqVk7dlWPwTdwSNw9SsOz4w5yOuVqGRq7181f73Gn
	 VIaVAWCX5TGAOunYaqik/5+vzRGA1l+vI/xdlgtjbtpJWcEkm28NB9T1a9e4nmzJJe
	 8+drWqQO8Qh9DYOfLXqI8aEi+I7pZ85bxjPyyhj6o5ZXybiQtBtGVktuRh4sgdJxgy
	 zLnSZ5wbiG+NvepaBOMB2Y7EpvevQ5VJ7x7FS2YRO57VrADWS0NF59+JorMILsenZy
	 ruw7ylFWwuznw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRonvBLiv
  J4P5icYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNP91GmggNcFRM2+jUw7uTsYuTiEBKYzSQx
  d9U7FgjnAKPEy8sXgBxODjYBfYmN6z4xgdgiQPbS2XuYQWxhAX+Jaa9fM4LYLAKqEjd2r2ADs
  XkFPCSu9a4Ei0sIKEhMefieGSIuKHFy5hOwmcwCEhIHX7wAinMA1ShKzJ4uD1FeIfH68CXmCY
  w8s5B0zELSsYCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhqa6xroWZXmKVbqJeaqlueWpxia6hXmJ
  5sV5qcbFecWVuck6KXl5qySZGYBilFDOH7WD80/tT7xCjJAeTkiivlWlWkhBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJXgVroJxgUWp6akVaZg4wpGHSEhw8SiK8MsZAad7igsTc4sx0iNQpRl2Ou
  wv37mUWYsnLz0uVEudNtwUqEgApyijNgxsBi69LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlY
  R5Q0Gm8GTmlcBtegV0BBPQESuLMkGOKElESEk1MEV49QVsefldg9f29YbzN3pXKm9bv/uqQop
  b89EbTBOuai6VCNeZtIN7wvVgrSwdpagzvllRHj/2FXj+OhBtYGQWwMz88aCt4P2ytzuTb4es
  ygl4tzdW822s9N7DAW1771xSuLRb+nqG6/MEzdfpuaz7vhuutn6fZ3rvS4NW06HbSSIeaWvEF
  jou7XjduY3ze8bNsiSPE4orisMt8lbO3DPh2mazdXqyol+PyBb6rTr3Zm5O7eo7G59G7Xv9zE
  6uY5JAmHjunxZu5t0lc6rsXHjMftfE/5GsvjT/c2DK5yzF5VsbJxXfvyCbf3TZsRUrImY6TPp
  belVLqeF9dMDRv89fn77xbWFjWJcv4yxPhUQlluKMREMt5qLiRABxU1E/KgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1651130064!7619!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7152 invoked from network); 28 Apr 2022 07:14:24 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:14:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23S7ENHM010203
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:23 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:14:22 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-langtable: upgrade 0.0.57 ->
 0.0.58
Date: Thu, 21 Apr 2022 17:59:29 +0800
Message-ID: <1650535169-15349-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:14:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96833

Changelog:
=========
    Add syr locale
    Get translation changes from CLDR
    Add more translations from CLDR
    Fix names for keyboard layouts which have changed
    Add ab_GE locale
    Add rif language

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-langtable_0.0.57.bb => python3-langtable_0.0.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.57.bb => python3-langtable_0.0.58.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.58.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.58.bb
index 948f7651a0..025ceb6811 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.58.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "6c3c0a6577652c81871cbaf139046e1c88ead8439c585bd83976b3092f57e9d7"
+SRC_URI[sha256sum] = "47128c06008acedee1745f2d56151461d94526b2be95a4124692013af35496b6"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


