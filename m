Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A22EC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:32:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.24237.1660703539464186212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wqW0TJhH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703537; i=@fujitsu.com;
	bh=8Mg/lsc96TD4KdRASuLoVBJOwWl3a0QhcLBkk6sgMFI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wqW0TJhHLz/qxw0K3K8LiZbjvaadAA+6TAdfXduZkhHk9dXzOBW4/rUW1YFOIyZas
	 izhXbDnusnWKj5eFqXzjKIvbbq5Neb6lJZiAz/9H8ywehA7O9t9ebVcBpeiphiQWv2
	 oF5P6UQVmf07XFD7/N0k4G1Sz1ulaoM9Zh1t48GAXPEFZV33snDJKABu315uDkMu+n
	 iMdLHK8Tvr/uVeKihvLQ9LJNT/sTkSfx4bYrOE6fA4JxUj24MaT44CwlONadD6zVZJ
	 H/iyVwu60uOyjkLzeCuq70tadjM0IXiGE2irrXTsZpavF0CjWKeEJ6psSHTt5aJJzq
	 FfV7FkbLD1SJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqGsQ/Cf
  J4OkVHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz1wusBS2cFT+b3zE3MC7h6GLk4hASeMIo
  cetECzuEc51J4tyeGSwQzgFGidMP7wNlODnYBHQlXvxYzAJiiwjoSyydvYcZxBYW8JFYsvAzK
  4jNIqAqcfbYByCbg4NXwENi43FdkLCEgILElIfvwcp5BQQlTs58AjaGWUBC4uCLF8wg5RICih
  Kzp8tDlFdIvD58iRnCVpO4em4T8wRGvllIumch6V7AyLSK0SapKDM9oyQ3MTNH19DAQNfQ0FT
  X0hJIWeolVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhl9KcXL5Dsbt+37p
  HWKU5GBSEuXtZ/qTJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC954/UE6wKDU9tSItMwcYCzBpC
  Q4eJRFe2QCgNG9xQWJucWY6ROoUozHH3YV79zJzzPzadoBZiCUvPy9VSpz3rQ9QqQBIaUZpHt
  wgWIxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu88baApPZl4J3L5XQKcwAZ1y7OJvkFN
  KEhFSUg1MS1cYxZzp5xVQ3pGj7yLYmFN45MO+yFjjXy8WxDnLza8x3NZbVJLl4L9/s8ix808V
  RK8zWWZueyMp0J3gnHEwknXeHuWG17M6bPvSZ2syeXb223ZGR21m4+cx27aBL8Y9fzpn2UHOb
  rZ2X2EB4y8a+cFspoU/9lwwl1eQ1PsXma/EEn78dfe0SamXnFyvyQrkl+3KEH20S0vd7ES1b3
  B8oIb9hz9CO8y/2K25H/QluvOPifWBL/f1dJj3mfAui9iRP4/J8F22/51f/mZJ7h9+98b9eDj
  zhOGhLfIpLpKfhD+v6JIXuF4xu+PYxIikL5YVRemF0/er33DzspWQLWoRDWs5ffEB82Gv7JJV
  SizFGYmGWsxFxYkAdEUs9UwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1660703536!54127!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9207 invoked from network); 17 Aug 2022 02:32:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:32:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 27600100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:32:16 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1B957100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:32:16 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:32:14 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.3.3 -> 4.3.4
Date: Fri, 12 Aug 2022 04:18:44 +0800
Message-ID: <1660249124-20418-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:32:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98278

Changelog:
===========
Let companion ASGI app handle lifespan events
Use configured request timeout when making a WebSocket connection 

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-engineio_4.3.3.bb => python3-engineio_4.3.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.3.3.bb => python3-engineio_4.3.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.3.bb b/meta-python/recipes-devtools/python/python3-engineio_4.3.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.3.4.bb
index 1a80a556ef..d89a54dc3d 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.4.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "18474c452894c60590b2d2339d6c81b93fb9857f1be271a2e91fb2707eb4095d"
+SRC_URI[sha256sum] = "d8d8b072799c36cadcdcc2b40d2a560ce09797ab3d2d596b2ad519a5e4df19ae"
-- 
2.25.1


