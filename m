Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA218C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:20:47 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.65301.1679545237690389731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IgAmyyX5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679545235; i=@fujitsu.com;
	bh=1CPdkxyNu8ux0OLbnpBK2PufLlKv7C9g0hrdpm1uX1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IgAmyyX5DkeRyXWiAC3hKP+Vf45PvnMUBy5WWb6hrXjlXliqcDphwNtp8FW6SL1Rh
	 hE97q6RwYnbg8n9nrFnWCGLcVQFASGL3OVhwr0ZD/xxvIWffnuGoj2OUxef7IMibWH
	 c3Q6LZnJugJaqT8n+jBng+E7UcKvvXaUwDwSPpslaRivD/E49mtxkO2F784JxG7I4j
	 yIvc4HPbYhroapz8iB6PstfOt65/w9Jta0WWKrpb6dnbIemOSrnvcdGU3J2fAh4xVC
	 EvFpQYGDvte3XlwwZjz6DKDTOWrTmssadlj+qUEwhc10Ts/5BEvjB5cq8nFjqdzwCl
	 Ak7GHSReNf7XA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWXfSZek
  Ug5bTFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRz29YCn4JVBzreMXewNjG38XIxSEk8JBR
  YvmV/SwQzmUmiQU7lrNDOHsYJdbv2Q2U4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8eo
  AYODmEBL4nNF6RBwiwCqhKL9/8Ca+UVcJKYO3MhWKuEgILElIfvwVo5BZwlln3dzgpiCwHVHL
  ixhwmiXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuhV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJO
  il5easkmRmDwphQn/9jBuKvvr94hRkkOJiVRXolQ6RQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rw6F4FygkWp6akVaZk5wEiCSUtw8CiJ8M49CJTmLS5IzC3OTIdInWLU5Vh89cpeZiGWvPy8VC
  lx3qBLQEUCIEUZpXlwI2BRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+M80BTeDLzSuA
  2vQI6ggnoiLgZEiBHlCQipKQamAzjfW2Zzug/WbhvZf/jsy2/2H2Kj6jb3z403yty+ku3pwXP
  0nb5O9r25U8rYEzaIrvhilTcuiJ7nXnmwt/XsNzPvjSlrNFMdop8ypbC1RE9TauLpC3/P7wQF
  nS0uNViituz/f5r/oubPeP4F7f6z+n5K+be6NtQdH3nbusJhUKcJYdv9FzIrX0pIZB81TF81r
  Z/HHcyhY7dm5Q0J+qcnbe0WFznzPumIYqv9qn8nOex6bHljHAuh99JTzXEXuUtK/h79WbRqv8
  FC49qztsvwHr8tUTy/KVBD5MtUl6yPPs1NTt0wvMtCqaTZKPKGl8dmHo8tagm2MKBzzqbn2Xj
  dIu8DQ6sUy+E3A6cz36geqMSS3FGoqEWc1FxIgAtBX5xZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1679545234!58514!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17979 invoked from network); 23 Mar 2023 04:20:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:20:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 51122150
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:34 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 449F173
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:20:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-daemon: upgrade 2.3.2 -> 3.0.1
Date: Thu, 23 Mar 2023 12:20:13 +0800
Message-ID: <1679545214-20015-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
References: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101649

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bugs Fixed:
* Migrate to use the explicitly-maintained 'packaging' library.
  The package bundled in 'setuptools.extern.packaging' is to help make that
  package self-contained, but is not a supported API.
* Declare dependency on Setuptools >= 62.4.0.
  This is necessary for establishing the version information via Setuptools. We
  use 'setuptools.command.build', 'introduced in Setuptools version 62.4.0
* Refactor calculation of file descriptor ranges to close.
	
Added:
* Document a 'ServiceRunner' class as an example of using 'DaemonContext'.
* PyPA recommended Project URLs for the distribution.
	
Changed:
* Raise a TypeError if any 'exclude' values are not valid file descriptors.
* Migrate package version handling to use Setuptools API.
	
Removed:
* Remove redundant 'wheel' from the requirements specification.
* Remove Setuptools 'test' command support.
* Remove Setuptools 'register' and 'upload' command support.
* Remove the obsolete 'runner' module.
	
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-daemon_2.3.2.bb => python3-daemon_3.0.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-daemon_2.3.2.bb => python3-daemon_3.0.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
index 49b094fce..79507bdce 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://README;md5=a3a94c615dc969a70525f1eebbacf235"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b7397fe73d516dc14921500a1245b41c"
-SRC_URI[sha256sum] = "3deeb808e72b6b89f98611889e11cc33754f5b2c1517ecfa1aaf25f402051fb5"
+SRC_URI[sha256sum] = "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5"
 
 PYPI_PACKAGE = "python-daemon"
-- 
2.34.1


