Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F536C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:40:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.48384.1681717221921303029
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hD+80Zlz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717220; i=@fujitsu.com;
	bh=V/WYhVNf89qR506yNnNZnPKcj4lmYhNTscADdvKzSBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hD+80Zlz+LRiWHxsM0eYb5fcfBTrCo+iFz0uy5VU4pOtyUdSMCCCcnf6EiFUM3D3n
	 QG2Zl74V50bUmkpw0xHv4dQWFT66yuwwy5D3SOu7gSEV9fIFcLhZFBqkHOp3sv4nwH
	 U0VOdg+Z+Be70lHSBHVueIH5WBwnYhylvQrRInAsY1/uYocbFT+b5LJe7WaHl3aKQ9
	 ufwiGAHAyOAvtTrxXi/st5r+4Ot97OZdJOa/kc3aZhfRZP7yfcqA+bMrUPMiowVhru
	 /FaR1MXDCuvJhsxFWMK06ixGkpRQq3abAw5lK6/DimpqCwB4CWZIYEKjm9uW8BJGFT
	 vEvm7U+h44epg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqPv4u02
  KwenLyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b7t3OYCh5zVvR+/8/YwPiDo4uRi0NI4Amj
  xMHf/UwQzg0mieP3TgE5nEDOXkaJ+bPzQGw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBbwllr9sBKthEVCV+LZnMSuIzSvgJLHi1TywegkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF1
  A1ihKzLzezQNiVEq0ffkHZahJXz21insDIPwtJ+ywk7QsYmVYxmhenFpWlFukaGeglFWWmZ5T
  kJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGY0px2r4djB19f/UO
  MUpyMCmJ8r5ItU4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7/ptNipBgUWp6akVaZg4wNmDSE
  hw8SiK8xs+A0rzFBYm5xZnpEKlTjIpS4rx3QPoEQBIZpXlwbbB4vMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmPcNyBSezLwSuOmvgBYzAS2WUwJbXJKIkJJqYGpR/Xhykv+7b0xx4TaNjnZ
  pG6wtFSc1mLyoYq/O+pJ9aOM6dkPrDQFXRTbszpmaZbCj9Ex5lXIRj8fbZVs+CeyzMU7hT1F9
  LnDr2Lrnua5+V03+HNyfOz3heP0kuxQnf4WLHh5a7M7noipK+irnz9v0hmGH5otNbl0ftrHrn
  M1WUs8syOCsOShx4d7F2jmKX6Q9cwsVPxcy5B3f8iz2x0Y71+R7Olk2HGVHlK57W595fUkntu
  JdQPSfsyXnWT/9uM/5bvnkgIDi1TFrpKaWPD+77vLZuAKLPYpiiwWeFnZ3zknqLNzXtY+p9Wu
  LqP5azeNKyyfp+SYzbLJ9sPv4q+snnymY1ca88Sp+NTWfQ4mlOCPRUIu5qDgRAE/d4otCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-745.messagelabs.com!1681717219!217311!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6987 invoked from network); 17 Apr 2023 07:40:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-27.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:40:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 05A461001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:19 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ECE1D100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:40:17 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.26.1 -> 3.26.3
Date: Mon, 17 Apr 2023 15:39:53 +0800
Message-ID: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102107

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 update pre-commit hooks (#350, #353) 
 bump pypa/gh-action-pypi-publish from 1.8.3 to 1.8.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.26.1.bb => python3-cmake_3.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.26.1.bb => python3-cmake_3.26.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb b/meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
index f95e2eab0..8e924acd3 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "4e0eb3c03dcf2d459f78d96cc85f7482476aeb1ae5ada65150b1db35c0f70cc7"
+SRC_URI[sha256sum] = "b54cde1f1c0573321b22382bd2ffaf5d08f65188572d128cd4867fb9669723c5"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


