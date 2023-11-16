Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA29EC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:29:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2787.1700123368272695336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139899512"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139899512"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:29:26 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D884FD6188
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:29:23 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 17F48C8C01
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:29:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC5222FC859A;
	Thu, 16 Nov 2023 17:29:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyaudio: upgrade 0.2.13 -> 0.2.14
Date: Thu, 16 Nov 2023 16:27:46 +0800
Message-Id: <1700123266-22328-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-0.668900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrA7f8DkoYc/+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMmjlmvb4qJdBSLvOySjpqd3ua
	nLzysoaaYRrOTRYLkoH2gv7Tv2jwzbrsKUfhRnEG1djZCIfTMcNsQ/trJTRR64EcaZO7xNmOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106795

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-pre-compiled wheels for Microsoft Windows (32-bit and 64-bit) are now
 available for Python 3.12 on PyPI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyaudio_0.2.13.bb => python3-pyaudio_0.2.14.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyaudio_0.2.13.bb => python3-pyaudio_0.2.14.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
rename to meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
index 1f0b5cf6e..1599ea834 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3152b432b96d6dc4a1cb35397da9ec"
 
 PYPI_PACKAGE = "PyAudio"
 
-SRC_URI[md5sum] = "41199ffd2abbdaf1ce6b88cf8af48cc5"
-SRC_URI[sha256sum] = "26bccc81e4243d1c0ff5487e6b481de6329fcd65c79365c267cef38f363a2b56"
+SRC_URI[sha256sum] = "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a491f790a0895bd2f87"
 
 inherit pypi setuptools3
 
-- 
2.34.1


