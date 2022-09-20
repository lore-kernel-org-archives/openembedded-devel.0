Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E2EC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:24:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.7367.1663640675163345773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bIhyW8t0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640673; i=@fujitsu.com;
	bh=OFImbAj9GmmO+JMOThdBTRcpQGeZR/r6WadRhCdl+u8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bIhyW8t0VcWJycr9ixA6sSIQGxpWTVI7yYw6+0b6GBYW6WLm5kLAtTB10sEhhsi0b
	 YEHLlUTouDXb0fsXo0OL0Jv0UfSSkH+aRW6678lCQSzEM5bORx90Pqe/6VUz1SRc5M
	 8L5DXTdsD59MuSJYNnQbium2EAhsj98tWPZLi31KEy+12g8KOMS8ybDwZTQo585gFW
	 9sV4sCQdQ3RlRQr/7e5YKX5h6Mk2zkXC2G2fTMOXtd4JzTfr5D6jdJ8b0SrpkveLPZ
	 VLiQOeC5oRtVcR3vbxC4/rJHDUrt6mujqsKjvAyhNcoTipguctx70EldQOX1mW9cRi
	 ChqwgiNLek3EQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8OxWTdBRTP
  Z4OdCdYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePLvHbmgtNcFRu//WJrYLzK2cXIxSEk8JBR
  4tzu/WwQzhUmiZ8zlrNCOHsYJe6vmMPYxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAn8SsX7vYQGwWAVWJdTdugdXzCjhJ7Lt/F8yWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo1VSUWZ6RkluYmaOrqG
  Bga6hoamusaWuqZFeYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yTopeXWrKJERiWKcXqJjsY
  u1f+1DvEKMnBpCTKy1WnkSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdeUDNZSLAoNT21Ii0zB
  xgjMGkJDh4lEd6tSkBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpUqJ8zopAxUJgBRllObBjY
  DF6yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrycIFN4MvNK4Da9AjqCCeiIGyrqIEeUJCK
  kpBqY+jK/P1OWVVn79cpq0WOKdz+6LZF9Ir/UQNq3Oqi97Vd0/gLb6bJfl264k8gSdUKdn2vK
  X9NaL7EdEzar5yyJlr7p89FMSLn70wFZq+lPzX1FnFdPvs9S3i6S93HDi6W9r0+vda77Ij3fg
  SuPQ/2o1KrjJ26s8ZyqFut1YXfSF9Ffx5q3Xbvl+2/BQ+1pryMexb0SFM20DTIS4TrjN79uw4
  Mw2VMG0jadpZyirk89Hmh6ZC3Y2+UU+PxBdvwpiZkui4IuXF6WdnBfddY19mO5ywKc9VKS18/
  aKWvp35EamHtLWaR994yPK0RNlCzm/Xd4Y/k88g/bdEdd741iX1td3bWSN04RTn//5YLJom1r
  lViKMxINtZiLihMBLGf3P1IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1663640672!307102!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24552 invoked from network); 20 Sep 2022 02:24:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:24:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5AD6D157
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:24:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4E072156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:24:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:24:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 37.1.2 -> 37.2.0
Date: Tue, 20 Sep 2022 10:24:07 +0800
Message-ID: <1663640647-27610-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:24:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98886

Changelog:
==========
 ARXML refactoring preparations
 refactor the ARXML code
 Bugfix: BU_BO_REL causes 'index out of range' error
 Add missing Bus import in can/init.py
 PCAN trace (.trc) format to logreader

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_37.1.2.bb => python3-cantools_37.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_37.1.2.bb => python3-cantools_37.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_37.1.2.bb b/meta-python/recipes-devtools/python/python3-cantools_37.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_37.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_37.2.0.bb
index ec437eeceb..7d159340c5 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_37.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_37.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "0d84b879a18d869d182023cdebae9318095a8959ceee6309de59fd3c399dbfef"
+SRC_URI[sha256sum] = "bbb0e802af02a1dc792c32d10b61b51deaefc1c8e9c776b50d2d2e194b702fac"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1


