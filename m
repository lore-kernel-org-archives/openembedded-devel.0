Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98089C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:36:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.2722.1653615390087864783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hJQaG7gN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615388; i=@fujitsu.com;
	bh=qjmnFB7XfD4vEHPpvMGXhoQ2d/6N8LENNT9KAICwjiI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hJQaG7gN6q4FN3nPexUIli8h/IoZuLcCf3+zo4UI+GEW5JNsl2zkFsYDa1K9MzUap
	 yVf4HbKnxc1gIPCWFzRAzsTvyIoFFXOPz+I6kYe/jYALd3uACoI+GwGyA49de2c9Wj
	 G/Wyo9r4SUbWayJ0HwwBdgVmdw+ytNZoiQHbmE9UjUOeEVNU66PfbgQTxr28bff1a/
	 qnsnI8R/rpi6LmVJ3RqmzrWmqu+60ObtsFCgK9yjZKFONgp/gtAzg0TJNRGu1+ZR4q
	 QAoxXQ96KgFmv1bjyWItGxAPlYzGljdfD10nCNaog29TUcjdHKrIKw87R9oAOjwLmQ
	 0dsgU1sCAOVWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqCutPSH
  JYNdlGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPz4BvGgr0cFefX3GJtYHzJ3sXIxSEk8IRR
  Yund7ywQzgUmiQ2XHzFDOHsYJW70PGPqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  qBRHBzCAl4SDXtcQcIsAqoS6449ZgSxeQWcJHZ8mAc2RkJAQWLKw/dgrZwCzhLLt24GqxECqn
  l1byELRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLGjG1sELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamuia6RsaWeolVuol6qaW65anFJbqGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgUGcUszyfgdjU99PvUOMkhxMSqK8mff6k4T4kvJTKjMSizPii0pzUosPM
  cpwcChJ8N5Rm5AkJFiUmp5akZaZA4womLQEB4+SCK+SDFCat7ggMbc4Mx0idYpRUUqc94omUE
  IAJJFRmgfXBoviS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZ+CTOHJzCuBm/4KaDET0OJ
  83l6QxSWJCCmpBibpm/O2egZYP567xWj/DYOJl+d0bPGwXfbG87CVZLUCU+fX3DKpex3/smdX
  z7eQKUyqcJk3lVla0HVBubnf1T2Ot1wiL5yWu1XkzRz4TuR44fYv5g9cO9sjpKT+Hzvzqz9Rx
  t9JLrP019/Ls/6fvb1pg9W3pRkvljWJlu1Qnnrrtvc7bq5A6eBF9+I2ymrN9SyYys68Wtc46O
  P78uu+UzY4qoVlG0l01D789f+KUdkKw1LHbJfkLkMRdddQw+lLbINitt6LkWLrmqvFlWL37u2
  kfBUdhretejLb7Z5Gsh+8qmTRtv92WILDupmJn3lfxNrfm8OyVX3yt1eH5JJSJ/qUJqessr0p
  O3+JsNrdXUosxRmJhlrMRcWJAK5oz5JdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1653615387!76540!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7689 invoked from network); 27 May 2022 01:36:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:36:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E9DD510018C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C590F100190
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:36:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.29.0 -> 5.29.1
Date: Fri, 27 May 2022 09:35:43 +0800
Message-ID: <1653615344-24799-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
References: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97293

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.29.0.bb => python3-web3_5.29.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.29.0.bb => python3-web3_5.29.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.29.0.bb b/meta-python/recipes-devtools/python/python3-web3_5.29.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.29.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.29.1.bb
index 660d4f6f0..b0b636b90 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.29.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "a78acc0f0150013755398ae185c8c7063d9db0777aa09733de22242a746bd30c"
+SRC_URI[sha256sum] = "14d0c4ef5d693b6cc9a36ad4ff31201add8ef1f4c1cdb920f7ce07f81841e6bc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


