Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2759DC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:08:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.66340.1680516523644806002
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x5d6dVNg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516522; i=@fujitsu.com;
	bh=nG8nQJu7u9ZHUVp3gCkeMip2UcLegvKaO1MVKnA0IvU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=x5d6dVNgdjyYkAZnJTp+ScUoreOMxPmmmSJiUxlhhWy2FyRw/03/Q4YvHARKVKz44
	 PJII8gUOX8fFv8KhPUTnlEznbvVno21REbIvQdkecyQjXPIxzTcK8jPElSoeUps8r5
	 aoowZBTmgtXiAnpw83w5913tPGWB3ZJzs7uZIkqQAbv+YjGO41euLE4w7pWS46N4i8
	 QhkDt+WfSiIxJvw/Xd2cjtbDFJfc0qhCxMinf2Tx8Uv5YNcV7zbt4L/1im52e7Iv/0
	 Eksxa6ZNkz9tFRTjZVJ7Zj5ChKSvCInC6AW91WnxULrHJznnzx6IoS6oz0IBbiDeNE
	 e+f4IWTqSKT+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqLtyqVa
  KweU3WhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0bTeYCh5zVfx60s7UwPiGs4uRi0NI4Amj
  xOqH35kgnOtMEpPm/2CFcHYzSrza/hDI4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBI4u7ut2A1LEDxIxvWgPXyCjhJzHoxCcyWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDF
  GjKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGuoV5SUWZ6Rkl
  uYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYDCmFCtP3MG4ovev3iFG
  SQ4mJVFewXqtFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPMWAeUEi1LTUyvSMnOAkQGTluDgU
  RLhVVwAlOYtLkjMLc5Mh0idYlSUEueNWwKUEABJZJTmwbXBovESo6yUMC8jAwODEE9BalFuZg
  mq/CtGcQ5GJWFescVAU3gy80rgpr8CWswEtLg1SgNkcUkiQkqqgcnyfcp6raWLp89a7rNCJOP
  ilgVus5J7WF5e3Pu0TGh5vBmz4vG63M07Wzkc2Hk+3FV8wW3rK97znyds8xuWKbUJhtcOCnhI
  f7msljWh84VLXV+ID499n9rE9QccroeZtl5TC339Zb3v5k63yOmfZv35cnhy7lubGfnuJrFS9
  +elyIV4T743hWfrmq28fV9kjn3f/rS5/MDio6ev+KWH2PCuX/d67qtZfZqvEyYnftN+Nsdc5M
  h3CRGNLyos67rubN61Ol/GRmvjGtn2BO4ZwqbMNVPv339hMk9keZFY1sav07Wf+olqpRmJ1bA
  c6Uz9e8wn89KBtrOuL24dYfbitI/3OjRvQYT16ucmNuLLqx8rsRRnJBpqMRcVJwIA+NKLeEED
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1680516521!356024!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13076 invoked from network); 3 Apr 2023 10:08:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:08:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 68FE51001A8
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5D06510019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:08:39 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.10.31 -> 2023.3.23
Date: Mon, 3 Apr 2023 18:08:06 +0800
Message-ID: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101929

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Disabled repeat guards. They keep causing issues, and it's just simpler to rely on timeouts.
Re-enabled modified repeat guards due to regression in speed caused by excessive backtracking.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2022.10.31.bb => python3-regex_2023.3.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.10.31.bb => python3-regex_2023.3.23.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.10.31.bb b/meta-python/recipes-devtools/python/python3-regex_2023.3.23.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.10.31.bb
rename to meta-python/recipes-devtools/python/python3-regex_2023.3.23.bb
index 19fc153d5..176f79e0d 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.10.31.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2023.3.23.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83"
+SRC_URI[sha256sum] = "dc80df325b43ffea5cdea2e3eaa97a44f3dd298262b1c7fe9dbb2a9522b956a7"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


