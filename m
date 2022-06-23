Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AB1C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:08:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.4528.1655968082229598104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qFjX3KxV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968080; i=@fujitsu.com;
	bh=plt4EL7EO/E/AASpQf9Cj2jlc9J1QpQBhYTg/SqW7LE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qFjX3KxVW7jtLl6i0Q9wVSqBHb58vmM3ZwY408TtG3kPX0JZ+jPesdqL5Jat1JxDU
	 QhQ0fe4G3gIo1lMydibLKfUyxSp/y/AXpfnOgUdng/CVsEAAbd1N13fM3dl3mbTkU+
	 Tggfddy5MDZO8bmld1slSk+oMOn4ng2bG+nwbjtFmjy3Dj2IFJ+4OgrKL5i8QMzVTE
	 JCiYywJWlFVpXABXBNhFMKtcHyiN8yAHULEdmCuGpwlxlC1L/GHoIXiq8o76j54o0c
	 bEceQVoHWebPu7qcy+/YLcEqaxvuz5CE2gn97rpY3DegsvKqK6dIdcjkgzXhsq8OoJ
	 giBb/ZTsOu2Qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSddfcEu
  Swcy9shYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8arj5tZCqbwVBz5coS9gbGVu4uRi0NI4Amj
  xOGeK0wQzl0miUWTdzJDOAcYJZafv8fWxcjJwSagK/Hix2IWEFtEQF9i6ew9zCC2sICfxMaje
  xlBbBYBVYmGzW/BbF4Bd4kJy5+ygtgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRJqkoMz2jJDcxM0fX0MBA19DQFEg
  b6hqa6iVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGYEpxKv8Oxhv7fukd
  YpTkYFIS5X3GuyVJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvJX6gnGBRanpqRVpmDjAaYNISH
  DxKIrxzQNK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLnbWADKhIAKcoozYMbAYvMS4yyUs
  K8jAwMDEI8BalFuZklqPKvGMU5GJWEeX1BVvFk5pXAbXoFdAQT0BFPlm8AOaIkESEl1cC0bIX
  t32NiH6t2r58Sv3yr7uWP1avXvn+07NfvCpPYHcvvywfeUWN9dM2nltu64lu73t1+y93JSx45
  XmrbahjnVmbf73JLNyrhk82iPYri2VmPBaf+DOw8JPH6tOWEtTfSH6Ub9j1RLS6qc2gX1FrdU
  PiE8c5W7eZZE5mfzZnzVn5pulSrd4nnwem1LXM6Pz1PlVn8c0nc8dyjUx+umL2mZ4uk5+JvPv
  3e792zUmZrMq65snfjb4OHcsb73wuWXuz6uWDK+5WWugUXPyXum7w4s6VxyZxjBhf9tH2fdxf
  oijrwuFkenbaXw2/T3dNVJpF/ui/ZBSz4fNDiq9d87sh9b9n9XffrxsSph15xrpQ4p8RSnJFo
  qMVcVJwIAKEtzmJHAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-728.messagelabs.com!1655968079!41814!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23175 invoked from network); 23 Jun 2022 07:07:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:07:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DA2F81000CD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:07:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CC84D1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:07:58 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:07:57 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-wtf: upgrade 0.15.1 -> 1.0.1
Date: Thu, 23 Jun 2022 15:07:47 +0800
Message-ID: <1655968067-2398-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:08:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97574

License-Update : license check file changed from LICENSE to LICENSE.rst

Changelog from 0.15.1 to 1.0.1:
===============================
    Update compatibility with the latest Werkzeug release. #511

    Deprecated items removal #484

    Support for alternatives captcha services #425 #342 #387 #384

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...python3-flask-wtf_0.15.1.bb => python3-flask-wtf_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_0.15.1.bb => python3-flask-wtf_1.0.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.15.1.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.0.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_1.0.1.bb
index aebc1344f..678588265 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.0.1.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 
-SRC_URI[sha256sum] = "ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc"
+SRC_URI[sha256sum] = "34fe5c6fee0f69b50e30f81a3b7ea16aa1492a771fe9ad0974d164610c09a6c9"
 
 PYPI_PACKAGE = "Flask-WTF"
 
-- 
2.25.1


