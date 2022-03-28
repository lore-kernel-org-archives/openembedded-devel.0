Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A05C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 11:44:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.9796.1648467839682412101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 04:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lp+qyFL2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648467837; i=@fujitsu.com;
	bh=xNZmlpl0TkRg/15PnJhCedd+DKPXyuQYL5JLoqoazko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lp+qyFL2UPkEFoCwjSlw2+kJ0eT6DP/QmGDlGXDOTijJg6sVTGx0ty5HO34KOg8ge
	 AoUa2O76xNA0H6KuGo3r1oFTjmVp1F7ryjfOxneDMps4jrcJTzfbaVO91sVPLBlaNA
	 6h4v/eRaGdo/I4zKs9mHaQmtUjBRRDoNwMJ6Z1QI1FObDtJ+M+rEONbUOclK//UHgM
	 crlUopImNnec/x1yXEqQKSnIuIO3haMwAMphw+8lACDOZcyxUDGvPyJedcoL56dOHc
	 v1sfxvxJDfGjPvJzIiyc+AGhLyHlyd5Qp/T0cQrJEefEqNdE10pT/9h8ywW9n4RKnB
	 fiN286m26JgaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRols73zH
  J4PsyCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPmjvmsBQ85KhZ8v8TWwNjD0cXIxSEkMJtJ
  4s7/x8wQzh5Gicu3NwE5nBxsAmoS02/dYAWxRQT0JZbO3gMWZxZQkXjxu4cdxBYW8JU4sOABG
  4jNIqAqMfP7f0YQm1fASWL3yx4mEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdU10jY2O9xCrdRL3
  UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAIEspZn25g3F630+9Q4ySHExKorwX5zom
  CfEl5adUZiQWZ8QXleakFh9ilOHgUJLg9ZgNlBMsSk1PrUjLzAEGPExagoNHSYQ3ACTNW1yQm
  FucmQ6ROsWoKCXOO3keUEIAJJFRmgfXBouyS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeX
  tBpvBk5pXATX8FtJgJaPHad7Ygi0sSEVJSDUwBRXd/f2ouvH6S53uMJ5/1/iyBRcITHAWcZn7
  avldeZIdWt3ThnxoW9dgPIdXXzi0KSomOEZvt+m3q1u65P9siWS4HqZ87rMOiZMUr6yHLKb/k
  OPfdxbt+xu/f9+2Q35S1uzaFp+RtTlq8hsGDSeWJep3hY9Et8ZWvshPU+ia9KcnQjp32wtRXq
  6zh/IqiRMHFlnEHrBhmJpx9bfjym8ZWqe/6Rl/451fJ+3Iu9jiRJKZ07dktwaygWuNbb7sXcH
  vcDzhS4lvo+8/rVfy3Cdt+f2NQXyxtEPPdoaJm8oOpJ4Muvjm+Xup8a3PC7wqhqIkq/hYX+VR
  X5B1T79USXXo8+aDmB04G+VdmpksKdymxFGckGmoxFxUnAgBEQnGTLQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1648467836!177350!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24381 invoked from network); 28 Mar 2022 11:43:57 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 11:43:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22SBhoI2008427
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 12:43:56 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 12:43:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.11.0 -> 2.11.2
Date: Mon, 28 Mar 2022 19:43:35 +0800
Message-ID: <1648467815-16371-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 11:44:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96235

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.11.0.bb => python3-astroid_2.11.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.0.bb => python3-astroid_2.11.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.11.0.bb b/meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
index 1a69be2f98..c52008ee65 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "d56f6a5239981567ceaa3413d4971936c7b4b0c796fcff90c24254dcf8b05b62"
+SRC_URI[sha256sum] = "8d0a30fe6481ce919f56690076eafbb2fb649142a89dc874f1ec0e7a011492d0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


