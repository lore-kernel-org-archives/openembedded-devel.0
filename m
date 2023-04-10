Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE5C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:29:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.40241.1681115380788952984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AWgteTHs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115379; i=@fujitsu.com;
	bh=TyDLh0HUpljHkFW6ip1KtQ0fBDaaDfB84nbYVaS47Mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AWgteTHs4RKhkxaeifLphtct6x/CFIkQRIsfCdvmfQswwW9661R25c+CUPp1Deglr
	 4I2q4FbBUPPzO8fN2bXoKwJEsTt+dyOyiz/j7B5saJHu+T+S9Ij4B/ZnEQ0vMf/Hfj
	 y7E7wr9eGJjudHYMngN938UWaJpo7DWW19zg1NaTJkQyB4bAlfyFGkzi7H7cKDKTG5
	 JCtg2ClstdUFDoHJPRt5IhZXdydi/MBoOyKsKEUwwfjSsWZfOkJI2r+AKo87tIw+oR
	 C6ed4256+hcO+QosP5QoQSB+hsZ3WYKwh+1DKn2FJplZzq9UYjvftnasoCq9o0ox09
	 I/ErzHEca1k2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpPvphHG
  KQdNZHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP4X72CFq6Knlf3WBoYZ3N2MXJxCAk8ZJRY
  duo9G4RzhUni5ct97BDOHkaJzknrgDKcHGwCUhI37v8Hs0UE9CWWzt7DDGIzC6hIvPjdww5iC
  wv4SnSuaACLswioSvyZMxWsnlfASWLGhG+MILaEgILElIfvwWo4BZwlzl2/BGYLAdVs2fARql
  5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjIKzkLTPQtK+gJFpFaN
  ZcWpRWWqRrqGZXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJ
  JkZg8KYUq7vvYDzS91fvEKMkB5OSKG8Xl3GKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnehQeAc
  oJFqempFWmZOcBIgklLcPAoifBWHANK8xYXJOYWZ6ZDpE4xKkqJ89YeB0oIgCQySvPg2mDRe4
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+2w0BTeDLzSuCmvwJazAS0mMvFAGRxSSJCSqq
  BKSFPzJqZ483eVKvSOwGrFVamiQi1fBO93zGpWVW8hutpA/+LiSFSOc+ETDqnrW/+ONtnmmi9
  Y9WVCQds34kXZG9a+InRpS21cM6cK6Z/I44vnegfxnguaJqiXhrvqizz8n2LN3zf8OPhp4Rve
  0+vq3n56tLdZaHqeUv/2s+W7T22sPryop3H73tw1SucqhQ2Zu9/cmtGTm6t4JvJZczia6dzLZ
  j5un3WqcyM2Eif39Zlj+59P9LHdUn2Qc1NKbf7+WkflTm/WQhoZchvUD1bpvZvY/tulWCeHfc
  u6e69rLud5bkUo7lc4XyLitCktfOO1RRPe2Tgs1u+pvevQiLriR/dDHv6n3+Lsgz6xn0vU4ml
  OCPRUIu5qDgRALHGGzpZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1681115378!350059!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12557 invoked from network); 10 Apr 2023 08:29:38 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:29:38 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 72B801C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:38 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 67C221C7
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:29:37 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.15.1 -> 2.15.2
Date: Mon, 10 Apr 2023 16:29:20 +0800
Message-ID: <1681115363-24418-2-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Support more possible usages of "attrs" decorators.
  Closes pylint-dev/pylint#7884

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.15.1.bb => python3-astroid_2.15.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.1.bb => python3-astroid_2.15.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.1.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.2.bb
index cde2d038d..3b8a7f103 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "af4e0aff46e2868218502789898269ed95b663fba49e65d91c1e09c966266c34"
+SRC_URI[sha256sum] = "6e61b85c891ec53b07471aec5878f4ac6446a41e590ede0f2ce095f39f7d49dd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


