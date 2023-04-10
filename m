Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F4FC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:29:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.40242.1681115390303447114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jZJKlKol;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115388; i=@fujitsu.com;
	bh=WJsMH3uJREP4Re/PpFmaj8qpmPDi4gqPDdUv8u9JwN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jZJKlKol6EL+vtJdCANqmdcZoZf+MFO+0bu1Vr/y1sX/eAcNUPaZzjKGQ25sTOCAr
	 GZHHRa0MIE0tIP1RPvje5Lb2o0JvnFQI6CcqC/Irn29aN8QomqT8S9paGKlvIZIT9H
	 HhI78EpzYvrfWXkOKfLQP9WgJqWcEkc6lP+8nCVK11kkpIYjGNn4PxIONviCPI2Tli
	 +FjeBgcMMOSONMtirkxvCIX2UxzH5O9Apy2rqMzW+N9jBMiRql0PhTorzrioAM7h61
	 Bi8BpOV86xeVbel9qB0jd6uxqy2EM9Hu0/ACBveuYn9k9uRcAwayCBnLQ/+B1gIwn5
	 C1yIKKUU1ZLxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqPvnhHG
  Kwao1rBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bVLefZCiZyV+y6v4WtgXE7VxcjF4eQwBNG
  icvtZxghnOtMEkefXYBy9jBKND7+xNrFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECcxP7rV8DiLAKqEjMedYPV8wo4Scye3AEWlxBQkJjy8D2YzSngLHHu+iUwWwioZsuGj1
  D1ghInZz5hgZgvIXHwxQuoXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYxMqxj
  NilOLylKLdA0t9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJL
  NjECwzelWGndDsYlfX/1DjFKcjApifJ2cRmnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgXXgAK
  CdYlJqeWpGWmQOMJZi0BAePkghvxTGgNG9xQWJucWY6ROoUo6KUOG/tcaCEAEgiozQPrg0Wv5
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNuOww0hSczrwRu+iugxUxAi7lcDEAWlyQipKQ
  amHY0vcg7bM6h1cbLdu/5ao0MB9WM/eJGAv+sc4rCns53XMdo1fVDzGZ1u/NhtkcbGR77TQuq
  Kjuy89mkwObzdvtPR5devxqyo/Z2xVKeMD9u3xOXVYLNF3j6lTJdTwmednvzv22XmAounOAKk
  sjfKDz7x353HVN/FyWO1U3sO3wCo9/v43+rrr7sZdu7pjan2Elp4Rc+sr5fJa+hnRMc3pi3dk
  vQnP8Ci7IK5B87msQeE3z9J0DynI/j+Wkc/7+ufxRfMbP02H3XN/kyOiGLHH+bHFv8uNp8r6W
  Ytr72a//eV3m63O9mmMxK8PWt2RCWtfCASsv1XbkBqp/4n7P8C72l0Dz5vllJEqPpnBQlJZbi
  jERDLeai4kQA85QxZ1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1681115387!193744!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2440 invoked from network); 10 Apr 2023 08:29:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:29:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BFCAB1001B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:47 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B3D051001B0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:29:45 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.83.0 -> 2.84.0
Date: Mon, 10 Apr 2023 16:29:22 +0800
Message-ID: <1681115363-24418-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
References: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.83.0.bb => python3-google-api-python-client_2.84.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.83.0.bb => python3-google-api-python-client_2.84.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.83.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.83.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
index 3dc69404a..f22c52702 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.83.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d07509f1b2d2b2427363b454db996f7a15e1751a48cfcaf28427050560dd51cf"
+SRC_URI[sha256sum] = "c398fd6f9ead0be23aade3b2704c72c5146df0e3352d8ff9101286077e1b010a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


