Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CB8C77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:18:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.103742.1683541119763649485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mhuOgnNl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541118; i=@fujitsu.com;
	bh=K6uHaSwMFLteCKbiOOLb1iLAa7UBenIJmEMyxYdBn+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=mhuOgnNlquzn8Q46SBubC24/089EikZeEr9Ian4GlE2OSnjHHGotk+8n/HgxPm8d0
	 sPVXpc//qD1Z9GMIj7JEUZLDBNxQrJgJqKM6+UNrgTcia0DeV1qa5gIhhOHGM0/G3s
	 C6D6wxFnH7pq8NIakjOM/geKLXMjcJKjAxlIIqCws02b5JBrwibcuOqV+q8Xa8vVmt
	 svn9HpDEie6SEptVNrQJ2SDGWg8f0waw9ciRypR0B35dAdju2HIYsrj1Rvp78eF9Uh
	 ZPV2UUd/bSPKbjhL8XdQBS2dpK+XTx7B1Shn7Vea3SjsBXcs49SDD2PG4epOF4Iwsr
	 Cay0MRZmv0o5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpFt7JiL
  F4OQfeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePGtAmMBUv4K74uC2xg3M/bxcjFISSwkVFi
  4d7HzBDONCaJZXc3MXUxcnKwCUhITN97kh3EFhHQlfj4YS4jiM0soCIxY/IRsBphAR+Jq3P7w
  WwWAVWJ+zcvg9XwCjhJHH7+lQ3ElhBQkJjy8D0ziM0p4CzRPOsGC4gtBFTzeksrM0SNmsTVc5
  uYJzDyLGBkWMVoWpxaVJZapGuql1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFd
  cmZuck6KXl1qyiREYECnFikY7GJ/s/Kt3iFGSg0lJlNf0YFiKEF9SfkplRmJxRnxRaU5q8SFG
  GQ4OJQnetm0RKUKCRanpqRVpmTnA4IRJS3DwKInwyh4BSvMWFyTmFmemQ6ROMSpKifP+OwWUE
  ABJZJTmwbXBIuISo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeyyBTeDLzSuCmvwJazAS02P
  9yOMjikkSElFQD03yfX8kqKqfUb9qxHppWc23dbt9zLJKqNrb7WifV9H/i5Hm6ssVK6XDDCVU
  9vXNVths/dr5ccSj/ef6OK50Xt1swRLq0ti7/uP/aE/a3ebvWOElu/y3x4JNiNNOsnE9/l33b
  ZXZo8p0Zmy40qBUtnrtpWlCZCWvP0beuX2KmG7yP+Mm3Q9MgdVGxiFZgt/i9vHRjjT1XNzEv6
  ZpnftIrKifvU8HqjzFx7tP/P708ocBZN+d8xZ/XTeHs23v/67fyB8Zmsp3e8OPd5aL/c1xvJZ
  s9K7c0O/HjUtfMTWbNjJM7o3Rtit88n/BSq14+LWLeG71pE95miIYFT2e5eGDCzD0C+j2qzOf
  WFfg3rWp4c0GJpTgj0VCLuag4EQCCe2OvAwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1683541117!182392!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21670 invoked from network); 8 May 2023 10:18:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:18:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 40D491D4;
	Mon,  8 May 2023 11:18:37 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 67B6D1D2;
	Mon,  8 May 2023 11:18:36 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.3 -> 7.2.5
Date: Mon,  8 May 2023 18:18:21 +0800
Message-Id: <1683541101-25407-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
References: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102410

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix: html_report() could fail with an AttributeError on isatty if run in an
  unusual environment where sys.stdout had been replaced.
- Fix: with relative_files = true, specifying a specific file to include or
  omit wouldn't work correctly (issue 1604).
- Fix: the XML report would have an incorrect <source> element when using
  relative files and the source option ended with a slash (issue 1541).
- When the HTML report location is printed to the terminal, it's now a
  terminal-compatible URL, so that you can click the location to open the HTML
  file in your browser.
- Docs: a new :ref:'Migrating page <migrating>' with details about how to
  migrate between major versions of coverage.py. It currently covers the
  wildcard changes in 7.x.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.3.bb => python3-coverage_7.2.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.3.bb => python3-coverage_7.2.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.5.bb
index 057c119a20..fa6c5203e6 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d298c2815fa4891edd9abe5ad6e6cb4207104c7dd9fd13aea3fdebf6f9b91259"
+SRC_URI[sha256sum] = "f99ef080288f09ffc687423b8d60978cf3a465d3f404a18d1a05474bd8575a47"
 
 inherit pypi setuptools3
 
-- 
2.34.1


