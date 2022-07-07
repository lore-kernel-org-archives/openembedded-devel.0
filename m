Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57168CCA483
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:01:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.3062.1657180904299384698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HuTKEk1P;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180908; i=@fujitsu.com;
	bh=+sb/KctAMFhuDcTDvfnzrqftS7qD7/+Yp1wNSp4xHX4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HuTKEk1P1mtO/BmftR8J6SMFkq0wpqdEWZsAxN0VCQcX8Aw9C0fmdqBihPrLQkpdW
	 BEXLnMjoB8Z5OH1w5UZa8N9/mMN+QbpnqietQFo2Cr1n9+r/88eS2CXtEPmVJ77KE3
	 jUdHz0A7CQQPY1rghDcf29NgVwxkbzj+fOschYFCmyC3MO0iNv6Zvd5UDvTKKNYCVO
	 0jyzk1nsohHSKvccGysIsPR/sDr/iLDDOD5uZAfT5ATZIw1D+ynMTnF3od0u+zpZm9
	 xyXidMSOywKvNbCVnTd4kWzEQBk9ixSj/QV7pv/K4r0MR2xzt+vy+gzvd6RNNeiqkV
	 kTbgV3S/VubkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORpPts0rE
  kg/PXhSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz2F+sYC55yVfROP8rYwPiHs4uRi0NI4CGj
  xO71X1kgnCtMEk23/kI5Jxgl5tw9ztbFyMnBJqAu8fjma0YQW0RAX2Lp7D3MIDazgKpE98U17
  F2MHBzCAiESTfuNQMIsAioSq++8YwKxeQXcJc7uvA5mSwgoSEx5+B6slVPAQ2LPrgtgI4WAao
  68vMQKUS8ocXLmExaI8RISB1+8YIboVZI4seIj1JwKideHL0HF1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1NtI1NDLTS6zSTdRLLdUtTy0u0TXSSywv1kstLtYr
  rsxNzknRy0st2cQIDOOUYoW6HYzXVv7UO8QoycGkJMq7uudYkhBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJXumJQDnBotT01Iq0zBxgTMGkJTh4lER4l4C08hYXJOYWZ6ZDpE4xWnJMnf1vPzPHcj
  A582vbAWYhlrz8vFQpcd6PIPMEQBoySvPgxsHi/hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkY
  lYd75IFN4MvNK4La+AjqICeigZflHQA4qSURISTUwbfn594lly2Q5+ZWJXjvuPJvz7q3AdSFD
  jmlXpzPc+W/x7lvB7rlBzV3C6r2qrE39lhc/777fH1t5d3OsaNvq2Zk92saPHjidX/Vlxw/lL
  VnuL3PTikpNr2632bWp0oI//8nJSnf7pn1bI55WPigw2L6czet2dqCtu3TaOt3Ga857Oxf8PJ
  X4eWLNssQfO2peJkxe1Hr07JHPnYfW6m9iN9b9uiRzuZoY/xnfvYu+cp4olV7Gsp95rtP+urK
  be15Ex2zxvOlsIViTMFk3bpXuDu0VGryySnM49tpfU8nl2hs1x5Il7d0Zf81SfyN1zh++GjoJ
  KvM/lUUzaIRuMbnzbX/ruQf/XX6IHN2eUbT5oxJLcUaioRZzUXEiAOk9SnJ2AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1657180902!74485!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14423 invoked from network); 7 Jul 2022 08:01:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 08:01:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E7F0E1BA
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D75D71B5
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 09:01:33 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-awesomeversion: upgrade 22.5.2 ->
 22.6.0
Date: Thu, 7 Jul 2022 16:01:15 +0800
Message-ID: <1657180875-31986-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97756

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
===========
Handle ValueError for possible blank values when casting to int
Remove deprecated method AwesomeVersion.ensure_strategy

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...wesomeversion_22.5.2.bb => python3-awesomeversion_22.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.5.2.bb => python3-awesomeversion_22.6.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
index c43f9ee54..cadb6f502 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "051f89efd8ba0b157fb516bda5e1dad4d63f87e8f9c0c148930023d984fce62f"
+SRC_URI[sha256sum] = "38f580bfacf1c06b674bcd0f68e0c445ebb03fcd3700c6a2c588fb9313308e0f"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.25.1


