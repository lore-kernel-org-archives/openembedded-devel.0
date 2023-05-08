Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB14C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:08 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.103887.1683541440732174746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q9G2BOce;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541439; i=@fujitsu.com;
	bh=hKMElL1m7mCZL1LaUxDDAAP7lRdNTlMtCwB7G/iKFng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=q9G2BOce+YUQ6/dQDcCYQ+GR08FEPzX3rS9MUnzafBBL0g/BBxkaGQTj6zhyWUxX0
	 UieIqhBax1/7TKYhOFq8c7R18YlBs9r+0PYMdKyQt/yPYrKDjqRhZqiChtmxUY3b+d
	 dPOp1vEQutOQc5HllUqLPhAd2RMsO41DiriPsIBANtI9BTH8O8z1WLA5fUjBRMu64/
	 78D2EYyH1AJfphlqhDuT4/OrBOJGFbP63fZffjUoy43FDQq5issRCbtPLEM44BDbR3
	 MC1REsKecC8Sqcu1I93b+d2dyjakPigYluSuf/GaHpvQHBIG3MLd7HiIcPIzOExC5a
	 O05piJq5qcDSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpLvvbES
  KwalVGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0ZX717Wgj7uij8TX7M1MLZydTFycggJbGSU
  OLo0oIuRC8iexiRx5PRTFpAEm4CExPS9J9lBbBEBXYmPH+YygtjMAioSMyYfYQKxhQXCJJrez
  WIFsVkEVCUuXJ7FBmLzCjhJzNzXCFYvIaAgMeXhe2YQm1PAWWJn1zM2iMVOEm1dj1kgatQkrp
  7bxDyBkWcBI8MqRrPi1KKy1CJdQ0u9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJ
  iveLK3OScFL281JJNjMCQSClmvrGD8fPOv3qHGCU5mJREeU0PhqUI8SXlp1RmJBZnxBeV5qQW
  H2KU4eBQkuB1OR2RIiRYlJqeWpGWmQMMT5i0BAePkgiv7BGgNG9xQWJucWY6ROoUo6KUOC/fG
  aCEAEgiozQPrg0WE5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMygEzhycwrgZv+CmgxE9
  Bi/8vhIItLEhFSUg1MqhM+MijW/T3nPWfBSjWz3VLPvz56mlPKclf1/trtiwO3eVWpF/8++Du
  6flXrj7eyD6dW8bB8eu9i4OCxasKiuuyEm2WuHeyn76TE6fxf/nm9jd6ksoc2a005vqjXf5Sb
  tz3r1+57TkYc794+PC+tc7nJ9eejg6eYXY9EVt/t3ml7vz3Qw9aCq9tOnnOXJtddwQW5CWXnT
  DOY3zAt3Sjz9u/+w0wu0wwKdgfKsN45dIW7kb3LLLe/TkFMXneeO8fZK6xZy7J7jwcUXBaW/r
  mOsT/VdvnNz2wl2sY8V8We5DcY5Ni8ZllayaUU/N80Y6dsiTZXtPv6jTeZHD3n3/hvv+fdYlH
  BX5fa9p2/6syoxFKckWioxVxUnAgAtXabRAQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1683541438!504443!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28525 invoked from network); 8 May 2023 10:23:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B8581D4;
	Mon,  8 May 2023 11:23:58 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 71F731C2;
	Mon,  8 May 2023 11:23:57 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-requests-toolbelt: upgrade 0.10.1 -> 1.0.0
Date: Mon,  8 May 2023 18:23:43 +0800
Message-Id: <1683541424-25761-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
References: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Removed Google App Engine support to allow using urllib3 2.0
    Ensured the test suite no longer reaches the Internet
    Added explicit support for Python 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ts-toolbelt_0.10.1.bb => python3-requests-toolbelt_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.10.1.bb => python3-requests-toolbelt_1.0.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
index b1399c3ed5..6e5491e36e 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
 SRC_URI = "file://run-ptest \
           "
 
-SRC_URI[sha256sum] = "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
+SRC_URI[sha256sum] = "7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c88d5bc6"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


