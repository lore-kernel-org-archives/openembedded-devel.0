Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AE1C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:15:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.7093.1651130101379085909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AiCDrcdE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130099; i=@fujitsu.com;
	bh=cmGdoT4DKnmqgfRjchCrVtUYlUPY9Za5keskYzUYoDU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AiCDrcdE0AtY64Fizx1drNO3LqKkD8Ar9Ba68lLDXjsT8/CMkke4dHGhSerlSI7R3
	 lKRX76MfBSyWC/sBzv4tW+3bI4PvNsnTJQFY2SU6iRPQgICT7k9PvFwFSB+ba4gwU2
	 gCMge4N2LfT04MzLWUM8Q9kYTvshH8LLnesdAgD/UnJAZu2XIkQeDC1QjbdSsQqlrj
	 OLhrwZ/ZDsiwtFjfPo6Ik/t836qIHCd3sgXHn9qc13IeOj80vz/NvCKp89LrVRWSJh
	 GoiME/T94b8MvvDR0maq782i7PEp8T5DXwVvsm8r9ogSs+698Qfs7A5+vs0YWPawLn
	 t8ReuXj3ze0GQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqPvZLiv
  JoHkjn8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFnwW+WgjccFdN3b2ZtYJzB0cXIySEk8IRR
  ov2SA4R9gUni6j2xLkYuIPsAo0Tjq+msIAk2AV2JFz8Ws4DYIgL6Ektn72HuYuTgEBYIlLjVp
  wcSZhFQlXjb9hisnFfAQ+LNtLVMILaEgILElIfvmSHighInZz4BG8MsICFx8MULsDESAooSs6
  fLQ5RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19h
  C19DEQC+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzDwUorVenYwnlj1U+8Q
  oyQHk5Ior5VpVpIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV4Fa6CcYFFqempFWmYOMApg0hIcP
  EoivDLGQGne4oLE3OLMdIjUKUZdjrsL9+5lFmLJy89LlRLnTbcFKhIAKcoozYMbAYvIS4yyUs
  K8jAwMDEI8BalFuZklqPKvGMU5GJWEeUNBpvBk5pXAbXoFdAQT0BErizJBjihJREhJNTBlfrG
  4kdd1uYf7rvzjjv2bl2ox/vrdm2VcwDg56oDFVp1jm7i/zZD4K2FhePXJpzeLGD/8MF+3xb3v
  jLCGnfKGk9tswqOuN3dP//j1cTGPkmi9957TX36lBy4NNnnz0/zGpr8n47g/+XlN1XqXcTDf5
  8Ha3ev1l9ys3N32y3N/taEm18yXBqd2nGtQLdY5c+/argcHfJ5tm7fVnG9t4pwrHfGRWj9uBp
  2dpHHgaOYym0tvp+6KC1W7/X+ft3moT5TGuRJ9wYkx9+wW5pvM8NlQt8eUXVxYfY+PzMr9oSr
  /f7HV1D64leCaxTfnxOogddlgm5asoGfB/2r5GeoaX68o21zmudc2c0ZUd2Ny2a8NSizFGYmG
  WsxFxYkA6YDRDEMDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1651130099!10642!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12484 invoked from network); 28 Apr 2022 07:14:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:14:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A3785100183
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 48F39100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:58 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:14:41 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.3.15 ->
 2022.4.24
Date: Thu, 21 Apr 2022 17:59:41 +0800
Message-ID: <1650535181-15387-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96834

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-regex_2022.3.15.bb => python3-regex_2022.4.24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.3.15.bb => python3-regex_2022.4.24.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.3.15.bb b/meta-python/recipes-devtools/python/python3-regex_2022.4.24.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.3.15.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.4.24.bb
index 9633385f60..28e16001a1 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.3.15.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.4.24.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0a7b75cc7bb4cc0334380053e4671c560e31272c9d2d5a6c4b8e9ae2c9bd0f82"
+SRC_URI[sha256sum] = "92183e9180c392371079262879c6532ccf55f808e6900df5d9f03c9ca8807255"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


