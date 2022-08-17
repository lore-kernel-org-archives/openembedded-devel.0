Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C313C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:26:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.24189.1660703208121806227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ADkoF9FR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703206; i=@fujitsu.com;
	bh=lTajx5fclp+xQ8/7Wbl6Zo/x/BX26w9YJWGzOmEyab0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ADkoF9FRZA3FJ1FOHqFpZSkc60W6oMQzLR/GMdeC9pu9cD9bCidoVoxsbpIYALrtb
	 QK4q47ZjiLlZMgJuar4f6qL6iH87dBDlBS6R7pAr87K7d1lR9jx2Bdk3e2FaGjtM3S
	 SOfpjES1aqyyMqoi3E8Wz/8N12aunK923kAPRY2UkkoeHlYNLL3bB/B6jrPpfoGu9E
	 e3VexO+BkC1xKIioXKIVgHMCpYrI5XxTIkQgBfvWZ3bi2j5UNHeKIpphbjJcVbvT76
	 xwYP3GffDNYzFTcJQHq2H7pCw5mLZTqm5cq6zb3OZS1Dve7cCt+Ym3L7zradN8mA5k
	 P8DT1xS/kq0/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqPs08E+
  SwdybYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aSJ6uYCn5zVpw/sZS9gXEyZxcjF4eQwBNG
  iR0rpjN2MXICOdeZJD5c4oawTzJK3J6eBWKzCahLPL75GqxGREBfYunsPcwgNrOAqkT3xTXsI
  LawgLfEh+tNYDUsQPH1f9pYQWxeAXeJKRevsYDYEgIKElMevgfr5RTwkFh39QsTxC6gmv0bWS
  DqBSVOznzCAjFfQuLgixfMEL1KEidWfGSCsCskXh++BBVXk7h6bhPzBEbBWUjaZyFpX8DItIr
  RNqkoMz2jJDcxM0fX0MBA19DQFEgb6xqaGOklVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEBnJKcXrfDsaN+37pHWKU5GBSEuXtZ/qTJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC954/UE6wKDU9tSItMwcYVTBpCQ4eJRFe2QCgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81
  KlxHnf+gAVCYAUZZTmwY2ARfglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8+7yBpvBk5pX
  AbXoFdAQT0BHHLv4GOaIkESEl1cAkcmOqzpclf1ldeMId+g67n1txy7GNfe0OluXs8676RM7L
  Xnl1dcu0BZJT/r1aNWuzx8/Dk65dXNRt7y/69rrktUdVpw/bR5eXv7zyicn+wUOGvTvZyv66X
  QxZIF/zhsM7J3vevfNrlnIFXOp31xNUcW5tVZ3yrOUf/9UjouXO65yCM2IZ3e2cPAK6VTP/l7
  /Iu/r5sOKS6QtuBT8Km5YZHLKlr99RJ/3YrwtNU3anOj2/ebiptui80ERtv1XFyxX+LvEwith
  wTTHjvETkz3X5yQvjzySabZ2Y43p6mv6umnkPY3sFvbmfvv+3+X34jJB5xU9aply7M8/66RS/
  mz5KLSWTu2UiV69pMy7Omuf+QYmlOCPRUIu5qDgRAAyD6+9rAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-728.messagelabs.com!1660703204!290881!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8220 invoked from network); 17 Aug 2022 02:26:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:26:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C3F62100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:26:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B83D3100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:26:44 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:26:43 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycares: upgrade 4.2.1 -> 4.2.2
Date: Wed, 17 Aug 2022 10:27:57 +0800
Message-ID: <1660703277-15849-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660703277-15849-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1660703277-15849-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:26:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98271

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
  Build macOS arm64 and musllinux wheels

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pycares_4.2.1.bb => python3-pycares_4.2.2.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.2.1.bb => python3-pycares_4.2.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb b/meta-python/recipes-devtools/python/python3-pycares_4.2.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.2.2.bb
index dacaaa7878..d2de4d3b74 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.2.2.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[md5sum] = "92fa9622ba42cb895d598910722e80b5"
-SRC_URI[sha256sum] = "735b4f75fd0f595c4e9184da18cd87737f46bc81a64ea41f4edce2b6b68d46d2"
+SRC_URI[sha256sum] = "e1f57a8004370080694bd6fb969a1ffc9171a59c6824d54f791c1b2e4d298385"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.25.1


