Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99B6C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:18:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.101791.1670066333780339964
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EuucuKkx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066332; i=@fujitsu.com;
	bh=m2gRos2DY3JxNeJvIPI0q3JlRboFei9aA+6mLUy+qrM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EuucuKkxUCAzzth5FB4kGtoG0cky2RccVTJ69OInwJIhB41NSTY0869R5ai8izZQT
	 p6Snh2jDUrRN46THlpUcb8qqqYgROIpGjR1NC71DRqJpwAJBsHT257zQTu7BU+D801
	 DFb7YpqTgkcdzi30MPvYVm3adPsoRAUYKEMgrf5pSKCHQCkc/mG9d98qu50Mc5ZhJd
	 E+h/vBTj189ZhHyifXxYcnP9nEKv0LXJ2DxJzxQkx3XIclhkrmg7e8M5ORXp+AfdvZ
	 DZtjF9nCNzgaPcfJhwgmtQil4XvXNvGzXB0sUTwIhU5UKftGIi9icXVSINJbX2Lvud
	 hkNPAzxA6mkXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqDvboDv
  Z4P8ZEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPLtB9sBRO5K64/fcHawLidq4uRi0NI4Amj
  xK01J1ghnOtMElu7bkA5uxklTqxYxN7FyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAnESb86dYgSxWYDix38sYwKxeQWcJPoOnwKzJQQUJKY8fA/WyyngLPGlrRnMFgKquX/vNj
  NEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNqiZahJXz21insAoOAtJ+ywk7QsYmVY
  xmhanFpWlFuka6SUVZaZnlOQmZuboJVbpJuqlluqWpxaXAGUSy4v1UouL9Yorc5NzUvTyUks2
  MQKDN6VY4fsOxu6lf/QOMUpyMCmJ8h4L60oW4kvKT6nMSCzOiC8qzUktPsQow8GhJMEbqN+dL
  CRYlJqeWpGWmQOMJJi0BAePkghvlypQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rxKID
  MEQIoySvPgRsCi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4xPaApPJl5JXCbXgEdwQR
  0xEb+LpAjShIRUlINTBmfBaNX+n5xOpvgwv352ec3xz/v19Le/Cn6r/KcQ1HvHxXe7mrfyDht
  p973/KZFM1vmHwjhcdAVmrE8LNzo35PMqbNPKv1fn1mwQVTuk0yuxpOUWsOrQivrJ/UIRSxT9
  xM21C3ZIWJS8Ny4ibukTyTx4HLL+qNdIl9YJ8yNe9N+laOozfa0y60JF8677948j3dp7+eZco
  xVB5yDLnzU0hTp9/s7r8bNLvzMu4CHTIqzkjz3mghMOFtV81hs8upiicYuZxF75p+ZJ9s7De8
  f1lNdd4rn6grWa75Tps/2rG61TvpRr6x91atqhdJj020x8jxdQqf3nZr4RE9+ynb5DywmKyc4
  rvN/NPHK89o1m5VYijMSDbWYi4oTAXK5zZBlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1670066331!44444!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 767 invoked from network); 3 Dec 2022 11:18:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:18:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 113D710018D
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 04BEE100182
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:18:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.66.0 -> 2.68.0
Date: Sat, 3 Dec 2022 19:18:15 +0800
Message-ID: <1670066295-24879-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
References: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99935

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.66.0.bb => python3-google-api-python-client_2.68.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.66.0.bb => python3-google-api-python-client_2.68.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.66.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.68.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.66.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.68.0.bb
index 3a985cd78..e6ca3ba98 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.66.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.68.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "4cfaf0205aa7c538c8fb1772368be3d049dfed7886adf48597e9a766e9828a6e"
+SRC_URI[sha256sum] = "19177411b7dcf8fcd66bff085c6838ecea5fd6b598998d594be1f7290dfc34b4"
 
 inherit pypi setuptools3
 
-- 
2.25.1


