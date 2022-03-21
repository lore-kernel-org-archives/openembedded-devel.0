Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D190CC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 11:24:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.29413.1647861867318435005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 04:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MVaEfUmp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647861865; i=@fujitsu.com;
	bh=cw1XE6nQN7pOUNCD0mt9/eEdrkuA6i54ZL/MOXYtcuo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MVaEfUmpw/Bv3J7rdn9b+QnQIejIaOaV+X/kE3M1VskrXOpSmdbFvtsJ1IsTVrsCa
	 AiGsmUEQLvxaJnP2Kyfpn9FGbzOT3y5/0Q9QgqFA16Z+nAvXID439eq//s8Ab2ZZ7X
	 J4tvmWSPWy5d+pJaLlLlXLpqKxfrx4x4zE9mFceftt96ph0fB8FfKc7d7ceD2Ahebt
	 R/QfdKq9nbnoS9mqFDtJH/yHL8VGbgtkrUsTGR/6GrueQ5k6Ch7tTje+MQfAcjcvzJ
	 T7SE2O0836lQvYyFAOO4n4p8QynZc7/JBwHUzNzZ8CE8I1vrU9Dqne3TVngePwOsyA
	 Kr5d1czrueneg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8ORqJuZYJF
  kcH8lk8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHXtpSlYDZXxbsDG1kbGFdxdjFycQgJPGGU
  2NT9gh3CucAkcfXkVEYIZw+jRMuTi2xdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwv4SGy7sAosziKgKvF4+wGwOK+Ak8SEZWvAeiUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVol1SUmZ5RkpuYmaNraGC
  ga2hoqmtmomtkYqqXWKWbqJdaqpucmldSlAiU1kssL9ZLLS7WK67MTc5J0ctLLdnECAzPlGKH
  rzsYj/f91DvEKMnBpCTKW2dkkSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvd6DFBOsCg1PbUiL
  TMHGCswaQkOHiUR3j2xQGne4oLE3OLMdIjUKUZFKXFe5nighABIIqM0D64NFp+XGGWlhHkZGR
  gYhHgKUotyM0tQ5V8xinMwKgnzNscBTeHJzCuBm/4KaDET0GJ9VjOQxSWJCCmpBqaX/w6fkWc
  XWqYu0v3Xve4Ly3JOt26uJ7UlKXmizldu30gIcdm0eMHZjOnBv5ZvMTs43ds4nfP8zA/TN9tl
  BnTX/rzsd0SETUVfPuO+6sp3Z7Ln/9NVC1XhWWvUIil1ft5Dh3ktWkeedlcdeWqYtaxtahhbT
  n6VU1F77pK2RTkv+/wyAu+UiLzbs3VLx95rM2oL1M1icw2Xnzvb8vOPa6/11i9Jt2xDBWaW1/
  a0nL+m/yunjuvUo3uOMe6Rj5Zy2S73fbryj7JMRVjEdf/GShMW7elhK7J/72fiLZ7tfdMjfaJ
  RTAjzAclEztjNU5SZVou494RscFnPGrafLXvC3tdKx66Vhzhqn5Jw7nxrocRSnJFoqMVcVJwI
  ABLe6CVKAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-545.messagelabs.com!1647861864!164750!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13660 invoked from network); 21 Mar 2022 11:24:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Mar 2022 11:24:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 833DD100185
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 11:24:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6FFA6100182
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 11:24:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 11:24:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-waitress: upgrade 2.1.0 -> 2.1.1
Date: Mon, 21 Mar 2022 19:24:08 +0800
Message-ID: <1647861848-30580-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 11:24:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96106

Aadd dependency : python3-logging

Changelog:
=========
Fix for HTTP request smuggling due to incorrect validation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-waitress_2.1.0.bb => python3-waitress_2.1.1.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_2.1.0.bb => python3-waitress_2.1.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
index e37d1cc6d6..b7f8099790 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
@@ -6,6 +6,10 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[sha256sum] = "ec8a8d9b6b15f3bb2c1a82b8f3929a029c333c35fcafb08c185a9e562d8cc9c2"
+RDEPENDS:${PN} += " \
+        python3-logging \
+"
+
+SRC_URI[sha256sum] = "e2e60576cf14a1539da79f7b7ee1e79a71e64f366a0b47db54a15e971f57bb16"
 
 inherit python_setuptools_build_meta pypi
-- 
2.25.1


