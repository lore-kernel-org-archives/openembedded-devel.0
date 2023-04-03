Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26242C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:07:44 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.66326.1680516458705374924
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=buVD7svF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516457; i=@fujitsu.com;
	bh=SmzARIZjuxjnZMJ5NU/w1V/QAWDqSG7+DRwaDKUT5C8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=buVD7svFJTHTGd40V8d5AgZpo6T/v4x+hhl0fMOO3dRYm2LiysekTOPumiKkdqdcm
	 I9vM7kBzT8WPE0g/c24Um4tlIL7ewJK/LoX77Qzof7LeJ/OUvevFixKFk24KspJt7F
	 +uITcp/phcUDWKouUCeSQZVKsI2Tu5PwMQn5qy4lUDlRs6p8mJ41Kq9UVb3ZNixcf8
	 MRSKHWRK68MiyMwGMi/sT21VYlsTQrA8XjPv8UdKV9FutPzfloWxFKpDnzdsyp05cD
	 VDZW2mKALR+E629Rj3iCxcUXe83o0RtIRJ8bMS/ros73890LapSKZgpgsKSIKMl8Yh
	 FrZXUFmKncaKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTdjqVa
  KweI1qhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bvxQ+sBWf4K85u+crUwPiat4uRi0NI4Amj
  xOt5a1ghnOtMEpOf/WOEcHYzSvy494O5i5GTg01ASuLG/f9sILaIgL7E0tl7wOLMAioSL373s
  IPYwgKeEs8+LmLqYuTgYAGKd80pAgnzCjhJzH/xhgnElhBQkJjy8D1YK6eAs8T2w69ZQWwhoJ
  qedZ9ZIeoFJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRKN0w9BzVSTuHpuE/MERsFZSNpnIWl
  fwMi0itG0OLWoLLVI11AvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uAQok1herJdaXKxXXJmbnJOi
  l5dasokRGLopxSzMOxgP9/zVO8QoycGkJMorWK+VIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd
  94ioJxgUWp6akVaZg4wjmDSEhw8SiK8iguA0rzFBYm5xZnpEKlTjIpS4rxxS4ASAiCJjNI8uD
  ZY7F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwrthhoCk9mXgnc9FdAi5mAFrdGaYAsLkl
  ESEk1MLF3Zp19nRSZtFzZtEdpz5tjSxapS/5ayLwnNkpGcvceU2Oh/JnJc09eeXDtud/nH0wf
  325rjDf0Nfvwjm3qO6kfJl88Hi94sOhYzLrE+y+ezz8V2cAgsP8i33rx828/itw9Ur4nl098T
  dk/to6u3CTl/wvCfodOOqN1MkB2jRHHv0/VOxLk3ugnRC3pbV6xaS2TRqPJ4dBrYTb7s66efV
  r+4cWtw4VZc78bapZZrs6466ku4Kehc2yf2sYN56fmX9R9o7Fukoz5z95s97nHHlQ1vD1r1JS
  wgMVfqoSxwEp1LcPpXbPUjcou2dZYHgksLP8ru32H8JcHQt9vPimO625d53Gr4bfhJ8Ntd9Yk
  RT9VYinOSDTUYi4qTgQAON3u/lgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1680516456!1040115!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14907 invoked from network); 3 Apr 2023 10:07:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:07:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2E9191009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:36 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 226E61009B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:07:34 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.5.1 -> 4.5.4
Date: Mon, 3 Apr 2023 18:06:56 +0800
Message-ID: <1680516416-31035-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
References: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101928

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Upgrade urgency: SECURITY, contains fixes to security issues.
--------------------------------------------------------------
    (CVE-2023-28859) - Cancelling an async future does not, properly trigger, leading to a potential data leak in specific cases.
    (CVE-2023-28858) - Cancelling an async future does not, properly trigger, leading to a potential data leak in specific cases.

Bug Fixes
-------------
    Fixing cancelled async futures (#2666)
    Fix: do not use asyncio's timeout lib before 3.11.2 (#2659)
    Fix UDS in v4.5.2: UnixDomainSocketConnection missing constructor argument (#2630)

Maintenance
--------------
    Minor fixes for #2666 and enhanced async test (#2673)
    Fix issue 2660: PytestUnraisableExceptionWarning from asycio client (#2669)
    Removing accidentally checked in files (#2642)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.5.1.bb => python3-redis_4.5.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.5.1.bb => python3-redis_4.5.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.5.1.bb b/meta-python/recipes-devtools/python/python3-redis_4.5.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.5.4.bb
index 9b2698589..1a439cdc3 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.5.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "1eec3741cda408d3a5f84b78d089c8b8d895f21b3b050988351e925faf202864"
+SRC_URI[sha256sum] = "73ec35da4da267d6847e47f68730fdd5f62e2ca69e3ef5885c6a78a9374c3893"
 
 inherit pypi setuptools3
 
-- 
2.34.1


