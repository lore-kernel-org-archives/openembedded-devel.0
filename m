Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C69C77B60
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:25:09 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.43139.1682306702762681804
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZiOzafUp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306701; i=@fujitsu.com;
	bh=mLVYkJpbfQsuzOKs80+J0scX8Fbn+3uVhrDXf2Hg9GA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZiOzafUprnopEE2/inJylvErsww6MMdTWrCTZcQ5eDhCabGb0Gi6LHFMN9sD9tW9E
	 uMwZyfHl8Z2Q20S2+/GaF25Eyoe9aS+ABquz0bsCYwJ60H7oP63sODoiQTuFr9EGZD
	 /C45syxOwNjuwf186LQDiqGtYbHK+vAfIWbaV6Vy1PZFZxFy2dVK2FosKv4iPBAyhg
	 4rYlCvxU3ZJ2Zxys9E6QHgtTjMMEt7H0QJ3CIhlK9JNAPLqEkXgeDpPgCWYtSc2SsX
	 +KCUe/CGhTzYltez6cTRBO6XUPa94pRqtfJc4Ffw/MsM1C577SaUxRLHOLI++I5icY
	 H8sR1ccfQBXGw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSbfnm2u
  KwaQWGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePSl/vMBe2cFVtOVTYwbuLoYuTiEBJ4wiix
  sauTFcK5wSTRu+IfUxcjJ5Czl1Fi+uk0EJtNQErixv3/bCC2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhgQCJ1We6wGpYBFQlvq9ZywJi8wo4STz+sBHMlhBQkJjy8D1YL6eAs8Sx3lvMELucJJ5fuM
  YGUS8ocXLmExaI+RISB1+8YIboVZSYfbkZak6lROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MpsWpRWWpRboWeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eakl
  mxiBgZtSzOa0g3Hirr96hxglOZiURHmXbHBJEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBW/TJN
  UVIsCg1PbUiLTMHGEUwaQkOHiUR3mVfgNK8xQWJucWZ6RCpU4yKUuK8El+BEgIgiYzSPLg2WO
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMK/kBaApPZl4J3PRXQIuZgBbv4nYBWVySiJC
  SamCSVyyZsNHwo+y23w4nZtlzv7kqsYTn7aMbPPOenX7IZdQZ62v9++zOKol/S7seZvC9fmNb
  xmW3/O/H6ZlvfJ7mL1h5pjBy46wIe3aDZr/52rwHd5+8IGcsPveQ7c0tu1dvXC90jL9TOT3Pe
  8ayu5rsR+45sa43eNOe2y8lFcjTYde6IL9tstz34zt1jC/KTsl7XqNh+vG4vZ1N2855b9+yc3
  jyZmx8vOnUA4t/Pj28qZduc0lbpVXukGJdp8btfPrnXOnyN1ai09YU2s5W9SzV9GY5H+Ot0Rf
  yZPq+F20qzyZPi/PKVpT9MtEgWjf8l+hNdbltFWz7W/IiZZjDlvQ856/7ma7YImN+hSc4h1OJ
  pTgj0VCLuag4EQBIpS15VwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1682306700!567!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28514 invoked from network); 24 Apr 2023 03:25:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:25:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 185BB10032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:25:00 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0C9C1100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:25:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:24:58 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyalsaaudio: upgrade 0.9.2 -> 0.10.0
Date: Mon, 24 Apr 2023 11:24:35 +0800
Message-ID: <1682306676-11881-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
References: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102167

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-pyalsaaudio_0.9.2.bb => python3-pyalsaaudio_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyalsaaudio_0.9.2.bb => python3-pyalsaaudio_0.10.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.2.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.10.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.2.bb
rename to meta-python/recipes-devtools/python/python3-pyalsaaudio_0.10.0.bb
index e7e706c6c..8b22faad3 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.10.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36"
+SRC_URI[sha256sum] = "e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab"
 
 DEPENDS += "alsa-lib"
 
-- 
2.34.1


