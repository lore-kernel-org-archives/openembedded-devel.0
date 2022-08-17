Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00230C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:24:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.24169.1660703054355226504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A3D7L4sY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703052; i=@fujitsu.com;
	bh=nJ47prXPA+gzk+9nZuox+BG63QKoHCMXVQw9ZqLFCME=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A3D7L4sYGYvrwjhrxJjaxoPo5iBoFu/mZSsbRZQ/CQXcljPJMrEHxXAmUvsr/Tvh6
	 kcjGqlD76hGQAu23geqWPyU46LrvkUtAvVTr1Vb4b9DNIv3bo6hLq/3yJXOM91Ce0s
	 EqmObDqB/VRQefa9ff2L3W2PPhIPsOLs6pQc4THWqvOdxfBrA8NaYWM0tYy6MqejZd
	 7nG70tPjvDfk1ihcPD4D6hLhNZDJC3jZ9SUI9PMeFIxMuBZAPGJW8KkBI20h85InML
	 9YGBtlccI8N4Y1g27UUq+iLj/B5oq/2bSxOVSTndwErTcMv1K7Qnqo1lDKpwJuchIS
	 ilpUAneBRaGhw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxSdc78E+
  SQcdELYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePhqoVsBRu5Kk4+28fawLiVs4uRi0NI4Amj
  xP6nr5khnOtMEl+6fjNBOCcZJSbN/8/axcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  ewgtrCAj8TG2bPA6lmA4qdaL4DV8Aq4S/RubQerkRBQkJjy8D1YnFPAQ2Ld6iNsILYQUM3lly
  dZIOoFJU7OfMICMV9C4uCLF8wQvUoSJ1Z8ZIKwKyReH74EFVeTuHpuE/MERsFZSNpnIWlfwMi
  0itEmqSgzPaMkNzEzR9fQwEDX0NBU19ISSFnqJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfm
  Juek6OWllmxiBIZySnFy+Q7G7ft+6R1ilORgUhLl7Wf6kyTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgveeP1BOsCg1PbUiLTMHGFcwaQkOHiURXtkAoDRvcUFibnFmOkTqFKMlx9TZ//YzcywHkz
  O/th1gFmLJy89LlRLnfesD1CAA0pBRmgc3Dhb7lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCo
  J8+7zBprCk5lXArf1FdBBTEAHHbv4G+SgkkSElFQDU9Czgrik63uknzBcVxSSelF07heDQk3G
  jnU/rrxw7swNi84+t0rY/ZuBf4nvpQP2O9acrAhyMyywnrOuc2t7z4/DJuz1wk273i3l9q26e
  25j/7lpEU2vJcPutX070sPWe6trcq2yZ/MRpe54Zs+Nrvefhsw2q2thenFd21/xcJb6tEq/2N
  pTfYfb7La26AnbsORsEnnim341Lc7qjscsH6s/SU4Pul67G0dPMbTs6fsS3HacaVPPpLNzM59
  t7J0r1td36pkU1zMXB4E3i4q7tZM9WQXOCr2125d3uKvjhfqBlbEM6wOmsphuXnFYX/XX1XNf
  9m7fUnqg6KAiRx3v8mCppescIv6p8zM990pUYinOSDTUYi4qTgQA3jQ7n3gDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1660703051!289249!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14735 invoked from network); 17 Aug 2022 02:24:11 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:24:11 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1E8521000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1055C100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:11 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:24:09 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 4.2.3 -> 4.3.0
Date: Wed, 17 Aug 2022 10:25:16 +0800
Message-ID: <1660703120-15786-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:24:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98268

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Added
-------
    Add Greek translation
    Polish: Added thousand, fixed big numbers

Fixed
------
    Fix intword for negative numbers

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-humanize_4.2.3.bb => python3-humanize_4.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.2.3.bb => python3-humanize_4.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.2.3.bb b/meta-python/recipes-devtools/python/python3-humanize_4.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.3.0.bb
index 2e4822cad8..55386b6907 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.3.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "2bc1fdd831cd00557d3010abdd84d3e41b4a96703a3eaf6c24ee290b26b75a44"
+SRC_URI[sha256sum] = "0dfac79fe8c1c0c734c14177b07b857bad9ae30dd50daa0a14e2c3d8054ee0c4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


