Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE12C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:02:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.66205.1680516151485891997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gNIfaPMe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516149; i=@fujitsu.com;
	bh=MbhnuymAq45BoZwYJGFf5u3GVyKqpYrWcZAIE4FGxZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gNIfaPMejnsLiroxpAjTDUYpKgzJMjADD8FFvPtom+tWSuqLnt7cId4Q0gTX1qD7C
	 9zWoPrnKJcmylPJPZtewlJ1Tb8W4kPzX8dtc6dXwYZNRgtzUaO5z2cgeDmiFQpNUD3
	 KoIbi2+4KJceF6BZCbMDzhiZbhHXbsyfcnVRGzgO4o1v9EFyrBjpsw7f/4keaxoXeB
	 pA+pl9mv6sJBFa5rlxI+Ic1mlRtSeAypsz6cSMphTK4QoxXHWgeNzbZqzH7aWLgc1x
	 n+iUWvV4hCvgBdhnlvDd7kOBZLHfklVydBdV9WKBPb8RoXSE9uNEj3HzoTC6Gy3r/Z
	 3B1QB7vHRUQ/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpGu6RCv
  FYOs9MYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+nnPsBe84K+7MmcncwNjK2cXIxSEk8JBR
  YmnDYTYI5wqTxJ3Gg1DObkaJc82trF2MnBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hL7N9yhRHEZgGKr5m4DCzOK+AkMeHyejBbQkBBYsrD92C9nALOEv+u7QOyOYCWOUm8/C
  AIUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itGsOLWoLLVI19BcL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMweFOKlY/sYNzR91fvEKMkB5OSKK9gvVaKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnee
  YuAcoJFqempFWmZOcBIgklLcPAoifAqLgBK8xYXJOYWZ6ZDpE4xKkqJ854G6RMASWSU5sG1wa
  L3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXrHFQFN4MvNK4Ka/AlrMBLS4NUoDZHFJIkJ
  KqoEpfsH+9Z355R7bnD8rcv90XTlz9t6vm4yWLXijOWtD5UqeZ8uFGQMv1ex8/nvRHzlfq9ty
  0rMZl04T+vOFS0Qu/u2rLfGHjP40mM45+ozlaPuFyXyz8v5/NKk0UDdwbrrE16BvbbqoT5vV7
  deRJq7XR0snvt7dXrTqx/OD186rJM4wMZJYmGL83rnod94ETvat5XrfFCNjF7ydHaP2gzM0J2
  yNqtZPD9bkugJN7Tnvkgq+SFnHm6aqOQauPir/+bL7C3uXwu7vu4UM+5lirTt8F39wD5qfPjM
  /peBY9+7eIwaHZqhs9PwgrLUhZJ7gcZYZLCxz5B2SVD4obDItK+vfzLnf1e26bATrFumuxllK
  LMUZiYZazEXFiQAabdpFWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1680516149!191646!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13641 invoked from network); 3 Apr 2023 10:02:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:02:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0CCD01D0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:29 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 01BFE1C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:02:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.26.0 -> 3.26.1
Date: Mon, 3 Apr 2023 18:01:47 +0800
Message-ID: <1680516108-30896-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
References: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101912

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
chore(deps): bump pypa/gh-action-pypi-publish from 1.7.1 to 1.8.3
chore(deps): update pre-commit hooks 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.26.0.bb => python3-cmake_3.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.26.0.bb => python3-cmake_3.26.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.26.0.bb b/meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.26.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
index e4644d9aa..f95e2eab0 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "c18185c9cc147d0fa1e9228962aa37901b37866bd5d617e9efa23dfe706f7321"
+SRC_URI[sha256sum] = "4e0eb3c03dcf2d459f78d96cc85f7482476aeb1ae5ada65150b1db35c0f70cc7"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


