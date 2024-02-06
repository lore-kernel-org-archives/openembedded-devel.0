Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84BCC48297
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:11:57 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.10482.1707268313296025356
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gZC+FIv8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268312; x=1738804312;
  h=from:to:cc:subject:date:message-id;
  bh=2cmQuf0JbDiZCBYKRoRqJS02nINq2Om07pqnMAfxOyA=;
  b=gZC+FIv8l2l59sXotb+ZVQmTKKp4438XvELQvFanvktYDIo13j1FZwNY
   sNQhwb0G0nBd0AYTKJsFvQIExjmJRgVY/tXs+HdRbAFcsN+vtPbcsFaLJ
   mX/BsjoRNxCdV8OS+qmcNYE1tPVpQjnP/vvwCS4ZhASVAgB05BclztquW
   DBG6/iAyg/qtUn78eOtubADJuTBItzPc/PMUSXlbWJEmqyWvVoXFAq/92
   aE+xqUtiBxkeDJL+h+uB6irKjVP/YwCu6OSXr6jj+W9hYi9gFpE2gTQOr
   XegPc4HlTzi6YQFeE77OF5JcvXPrzhrq7XzebXzDEgzCP8e9DOYUMlveK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="128005865"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="128005865"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:11:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A4EB91F9380
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:11:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E8FACF3652
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:11:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 831EA6BE5A
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:11:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 334491A006B;
	Wed,  7 Feb 2024 09:11:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-psutil: upgrade 5.9.5.20240106 -> 5.9.5.20240205
Date: Tue,  6 Feb 2024 16:48:24 +0800
Message-Id: <1707209304-6052-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10-1.582400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrKQNhMboqZloK0JChQbm0Mr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzuixrgIem/+zoa2
	dNJjG5OAG0dEYaJC5lmWJAG5eeEqmWq+IGkgmkjVabedfaSuK/1tPgLsyuOfrfG8Y3Kzcae/Hb2
	sBBkID2iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108640

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 A new shade of Black

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...5.9.5.20240106.bb => python3-types-psutil_5.9.5.20240205.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.20240106.bb => python3-types-psutil_5.9.5.20240205.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240106.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240205.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240106.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240205.bb
index b4b9c5119..736024d45 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240106.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240205.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "60b233fb613b41fe859526103dbda0b4812d7a16c5f791119ec7016fbe1c8128"
+SRC_URI[sha256sum] = "51df36a361aa597bf483dcc5b58f2ab7aa87452a36d2da97c90994d6a81ef743"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


