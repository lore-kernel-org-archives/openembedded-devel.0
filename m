Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03989ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:56:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.32566.1661482556053106439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J/y45zCX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482554; i=@fujitsu.com;
	bh=cEMhKaF9jOQ1TdFXbYj8VSkQcFOL0Bt8f1O+boJAcVY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=J/y45zCXn7dCwURpQ8rr6CJUXv8ijf85gpsNil/QhWoDpdUtIHsf5XHeN9Yc1PlX+
	 YWIKF3EddOGsvlG3PfflWID2hq6QYvlpg7zH+tGtzQ48nk9X+5AkW98zBvqe2blMJo
	 FDKmMcyqd7WAGBGlLBUXakNtdBf3HLmLP07Lgt6gfdbxd2SlGcCWMWQl4lLAziuBaD
	 Yxw8pKjlO1SF5GffEGi1u6jVq79KxPic6P+CJKz1emAfGpTVsdPB4yhJ/wuCNIp68y
	 IC/62DgOshTAXSMAvmz9+RfuJz3NcW4QpjkAd/Wxhs3IgHNOoR86iksTG6jnEx9c/z
	 Jm+jlEeTeuS8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpGtpxpF
  s8PGFvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFnq13BOa6Ko0vnszUwPufsYuTiEBJ4yChx
  YNoyVgjnKpPEzN7ZLBDOKUaJ299nsXcxcnKwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENW
  I2wQIhE44tXTCA2C1B85pMmsHpeAXeJo2sWsILYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqlCROrPgINIcDyK6UuPE4FSKsJnH13CbmCYz8s5B0z0LSvYCRaRWjdVJRZnpGSW5iZo6uoYG
  BrqGhqa6xqa6hhYleYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYUK+/Y
  wdi26qfeIUZJDiYlUV79Z+zJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR41Uw4koUEi1LTUyvSM
  nOAEQKTluDgURLhlRYFSvMWFyTmFmemQ6ROMRpzXL1yZS8zx8yvbQeYhVjy8vNSpcR5fU2BSg
  VASjNK8+AGwSL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3lRDoCk8mXklcPteAZ3CBHS
  K1AZ2kFNKEhFSUg1MmQvqRY9PLAxNaTVLPViq85FNU0B3/VL5q6FLPFkV7TfrNfcasGypcvaN
  cInK4e96w75nEk/+iRvy/wpu/lzV+bUwQn57p131adeuQNmIJL7YpDnML56fdXzlNOXEhxPqb
  qlON0LDivjdxSeZKS5kSTjwIO/Eg55dfUdMWnqDX/5fW3j4/LM17+r7Sva/uPoi8Yf5VPkCjR
  Uf0jW2Zt8/ZfXj5iqmswscVBdx/hA17j6WJB34z8p2YSvbMc59X13DZSa2zH++qLGS6ackv/j
  2YOWMx07cby2qv91d9fEW+zeubudJk3N0ope9vRRfozU3o2V15We9x8fUe3MUTPvsG05kZp5R
  VnzPZJn5xkaJpTgj0VCLuag4EQCsQJQTVwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1661482553!169370!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23546 invoked from network); 26 Aug 2022 02:55:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:55:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7D98C1AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:53 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 71F501AC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:55:51 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fastjsonschema: upgrade 2.16.1 ->
 2.16.2
Date: Fri, 26 Aug 2022 10:57:02 +0800
Message-ID: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:56:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98455

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
===========
Fix compile to code tests to run them on any platform

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...astjsonschema_2.16.1.bb => python3-fastjsonschema_2.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.16.1.bb => python3-fastjsonschema_2.16.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.1.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.2.bb
index bb6c1ee813..a1d3392e19 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRCREV = "98399bb4029b2d7020d8abd9770661a5b2c4f9f8"
+SRCREV = "1aad747bab39d4b1201ab99917463f4079955ecd"
 PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
 
 SRC_URI += "file://run-ptest"
-- 
2.25.1


