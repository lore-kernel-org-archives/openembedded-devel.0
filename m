Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09644C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:30:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.43227.1682307045454061308
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YdmQnq9F;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307043; i=@fujitsu.com;
	bh=iV6TNrky6qQ6ADkaLtuLPNHgt6i5saMxmLX4f50Pwf8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YdmQnq9F20DCtG9tRzPHg+t6q7f90Qp0KFl2uUtndZTZ9O+Xsx3OWAfN9mPHR/N5y
	 X24xqX0OLgT8txKZ69dltfbBCyI0ruasGrcBwFcbLUSGXInIH6lCSA3RLEQ6v7Aw9e
	 XlUmBTUVLc+IpXd3Gf8Ie2/xJpCqRfybkN/Xu0qOX6Gak2mHIPEf7YlYFu9OnUZfMY
	 aAI9oLbOQYBnBZ0AvjVXzpMt6ViMByczb8Up9gFSs8sn+31jjIaVEjoRIuL15oD8Al
	 WhtPBij4ewDKsau12aIYS/urwsCHR/Cu19OfTW3YN5jntrtRjJNpif+0Yh4b9dtv7U
	 +YgrtWB+pPOnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpPvou2u
  Kwe/fqhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aclivMBa1cFa97H7I2MM7j7GLk4hASeMgo
  0b55OwuEc5VJ4knHceYuRk4gZy+jxKn7RiA2m4CUxI37/9lAbBEBfYmls/eA1TALqEi8+N3DD
  mILCwRIrLrYAFbDIqAqsX7lW1YQm1fASWJG7zGwGgkBBYkpD9+D9XIKOEsc23+YBWKXk0T7l4
  8sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0LfWSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDN6U4dfYOxsW7/uodYpTkYFIS5V2ywSVFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv0
  SfXFCHBotT01Iq0zBxgJMGkJTh4lER4l30BSvMWFyTmFmemQ6ROMSpKifP6fwNKCIAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCv5AegKTyZeSVw018BLWYCWryL2wVkcUk
  iQkqqgSm9fLtkZPSjzflPzGbahd/8+fbZ7Oalc28sy754hqFwxgtNTvme2W8MY1Jz+raxyEw5
  +z5rR4LXD5kF551kv1aJzN5+YdGEtDaD2cIPlvBPKr+v+mXjvJyzh5Lub+N+t3qKTdKZd+vj3
  n8PeFzxe1Yww/6gag5uCY5b/b+qkp/vObqxKiFp73pTmfwDN+M1psRc9N94JT7/6fW9KuHmbK
  lT/m5gTRHW/+Zn+Co+WUKHeUfGq4zNCh8uvzpneM4j3oydeV7Jwkk3NCxYqySMF5yU9Cyek3c
  ghVHLzzGkMCLwRY+51VEZhjTpfRysB/P2rEiad222cNu6L89lLsVLtHs61p22rg4p+lh/7pcM
  y08lluKMREMt5qLiRACNV+hbWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1682307042!288865!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25080 invoked from network); 24 Apr 2023 03:30:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:30:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1478F1B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:42 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 081821AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:30:40 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 11.0.1 -> 11.0.2
Date: Mon, 24 Apr 2023 11:30:12 +0800
Message-ID: <1682307012-11984-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
References: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102173

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed a deadlock in the threading implementation when closing a connection without reading all messages.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-websockets_11.0.1.bb => python3-websockets_11.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_11.0.1.bb => python3-websockets_11.0.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_11.0.1.bb b/meta-python/recipes-devtools/python/python3-websockets_11.0.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_11.0.1.bb
rename to meta-python/recipes-devtools/python/python3-websockets_11.0.2.bb
index 06110d38b..1653c7716 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_11.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_11.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "369410925b240b30ef1c1deadbd6331e9cd865ad0b8966bf31e276cc8e0da159"
+SRC_URI[sha256sum] = "b1a69701eb98ed83dd099de4a686dc892c413d974fa31602bc00aca7cb988ac9"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


