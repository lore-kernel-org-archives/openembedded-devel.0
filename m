Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6230C433FE
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:50:12 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.1710.1639709411114070855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gpM9HKz+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639709409; i=@fujitsu.com;
	bh=cDSrg6tL9kk+5Foz97/5a8waBnaUQlaAm74FQzBEOBU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gpM9HKz+4iDz92c5JjA0dCU6qEFK7IvcvHtA4UWXtW0T2eGjvRZECwLigF+5QDTyt
	 xSMKyHnETF3xL6k6Mr8DQFdZpwM7MpotlFadhMzPUm67sNrO8yq6V9chyzo+ziJjA2
	 iBYYCrra3ZczLfaU2hPLrJKD2dXV8JOi/udvWzORgGMHCNVjXVkkM3istYoeB3zPLE
	 wjmGKKz4UVEm2YfkTBuxSmYAxs2w91/lWt3q9t/0sw+5sWlPLjBeI5sc67T9wz13pv
	 b6jM/EZKVTyv+QkNWsQ3WtlbaH/JqO1XZ+sGttStD3eSFEDJYyxNBjnWBnN/s8SGg2
	 n0lrLmJ1F3laQ==
Received: from [100.115.6.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 5C/43-30341-0EAFBB16;
 Fri, 17 Dec 2021 02:50:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqPvg1+5
  Eg88NyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aXiRkF0zkrFj1Yz9jAeJiji5GTQ0jgCaPE
  qZM1XYxcQPYFJomJ/2+zQzgnGCVaJq9gBqliE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawQIDE8b9tYDUsAqoSN3/vYAKxeQWcJPatu8YCYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25Gaq+QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbLpKLM9IyS3MTMHF1DAwN
  dQ0NTXWNdCzO9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAgEwpZg7bwfin
  96feIUZJDiYlUd74C7sThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwdn8DygkWpaanVqRl5gCjA
  yYtwcGjJMLr9xMozVtckJhbnJkOkTrFqCglzrsWJCEAksgozYNrg0XkJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvJN+AE3hycwrgZv+CmgxE9Di8CSwxSWJCCmpBiaj3cyvP2bt0g/cbFf
  3wUtCLvPx3jmHmSxmWaXcuD4v+tlZf33peMWnlmdMT81P1j30ylbp9pNiZZNXlULZvMazFTff
  Mpk6U09QYJnd90TrQz5CFzXOy+mtcMj0i9OymSaxTH8us94jH66pjlvlWi0cBVJ0tn19f/CI+
  PQnzQuEEs4tefskULPgpj0DQ+bSb/c+VhQ95wsTVix7mCS8cIerdZ3fs+OmPcd/fjvd+3PSH5
  O54XvXFD1c5O+/5dnvvxsKBX4c9cifEnowvMpk54TNm5MfCx6Z7Pb1xd9mzszj8wyEu6ISJ+2
  8mpe9qKDUOneCnUKqlWxrwofqTV3mWX+ktnseaI31t5rpytdc1anEUpyRaKjFXFScCAATjV+I
  QwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1639709408!59157!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19860 invoked from network); 17 Dec 2021 02:50:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Dec 2021 02:50:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1B0751009F7
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:50:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 05BFB100331
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:50:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 17 Dec 2021 02:49:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.27 ->
 1.4.28
Date: Fri, 17 Dec 2021 10:49:43 +0800
Message-ID: <1639709384-38298-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94420

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.27.bb => python3-sqlalchemy_1.4.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.27.bb => python3-sqlalchemy_1.4.28.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.27.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.28.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.27.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.28.bb
index 3dad546fb..7a19f96f6 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.27.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.28.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "d768359daeb3a86644f3854c6659e4496a3e6bba2b4651ecc87ce7ad415b320c"
+SRC_URI[sha256sum] = "7fdb7b775fb0739d3e71461509f978beb788935bc0aa9e47df14837cb33e5226"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


