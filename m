Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBE2C64EC5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:13:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.3793.1675843983369200471
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=poDYw54C;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843981; i=@fujitsu.com;
	bh=YK7xrzILWxjvu5rh6pBQ/tBAFxIhNk9HiKaAmPW+ttM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=poDYw54CCQoSUAZQmWb5uc+gzlTZ8PkFbh9fxKgWErurvwp5iHA2QM9+7DMbS0oDo
	 AKd9xvWH1H8WO2qhXJi/Zdyr0WhElfIw4ZfsAs2VRDeUpNoQakWoMoj0/jJ6gQF6Am
	 OGsPOjMMtHjmWp+2ywyFJqhf6Qq+rXc+V2tdOj0dmX0ipFeddfcLVUgrthgevp2gUh
	 8y2x7ReVybiqcePSO20vgNW4vPM53npBKDR/kCKy8DVbg6ciErVfkvkNuRBGfWIw7G
	 lu4Ma2KLURkUxZFG1c/fsVErKDJ2WKedCXV+4wp735nzOulvaVf4blSdWK8yZrrWHl
	 A7XlcEJ3XKATA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqNsb+Tj
  Z4Ok+LouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPLGYGC2TwV36efYm1gnMzdxcjFISTwhFHi
  2MnVbBDODSaJ611z2SGcPYwSkzdOZu1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBC4uy3PYwgNgtQ/Pn7RWC9vAJOEg+O/AOrlxBQkJjy8D2YzSngLHH3aScLiC0EVNPU+p
  EJol5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jWXFqUVlqka6hgV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5q
  ySZGYPCmFDMm72C82vdX7xCjJAeTkiivp9jjZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvBHhQ
  DnBotT01Iq0zBxgJMGkJTh4lER4I0OB0rzFBYm5xZnpEKlTjIpS4rxXQfoEQBIZpXlwbbDovc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDcgDGgKT2ZeCdz0V0CLmYAWh6g+BFlckoiQkmp
  g4jx7f/WRU8+FJcxeaLIX7/u1LyMl6v0FjWfLVx3amXPDRvWB3kX+5xm1nX+nqrvkeFh8FAh5
  veih9G7fTbILiq7uC1UonBG8/c5+td8P3z46cOuu5RWG6wIHPY4HZb6Sixd+5iOTemlWc3f/p
  vBz0iFTdV8wLCjN2c+12lvkR8juG45djL2X2mNLD26X61pbIiRR2fnm39eG3d4JL1qrb/MZcr
  qztiys9Tr8VNhI6otd9Zmb97dUcU69ODmsSzc6tiGT30zCsL7s0qlpemde613MZEkqLwzezad
  fnlroGLLr4IrtG7svabZP4TG903m33STkmfmJo2/1/eed0ZkzvdtOt67b6tEy4dpue+nTSizF
  GYmGWsxFxYkAgiFfZFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1675843980!175820!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11513 invoked from network); 8 Feb 2023 08:13:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:13:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BAC54100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:13:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ADFE4100043
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:13:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:12:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-license-expression: upgrade 30.0.0 -> 30.1.0
Date: Wed, 8 Feb 2023 16:12:42 +0800
Message-ID: <1675843963-11324-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
References: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100986

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Use latest skeleton (and updated configure script)
  Update license list to latest ScanCode and SPDX 3.19
  Use correct syntax for python_require
  Drop using Travis and Appveyor
  Drop support for Python 3.7 and add Python 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.0.0.bb => python3-license-expression_30.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-license-expression_30.0.0.bb => python3-license-expression_30.1.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_30.0.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_30.1.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-license-expression_30.0.0.bb
rename to meta-python/recipes-devtools/python/python3-license-expression_30.1.0.bb
index eeb91723e..5dfd02be4 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_30.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_30.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ad638292aa8493f84354909b517922cb823582c2ce2c4d880e42544a86bea8dd"
+SRC_URI[sha256sum] = "943b1d2cde251bd30a166b509f78990fdd060be9750f3f1a324571e804857a53"
 
 inherit pypi ptest python_setuptools_build_meta
 
-- 
2.34.1


