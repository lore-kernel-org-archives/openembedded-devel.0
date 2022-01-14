Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD30AC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 08:49:53 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.4837.1642150192708770769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 00:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NqW0mqNa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642150190; i=@fujitsu.com;
	bh=WPEriF67dBCUXdZnEe3LMgGxBC6xmmkq7/vgVWg7//8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NqW0mqNaFJgBv79dz0rYcGmEBvbP3ZxPNfu/RD/JFqBcjx36hmXVb3OJkHRjmQBAJ
	 6CxOj9QXAKSvpr+SOeywm0/lBNN19pFnSxgJvnYuYTmaV4T4b2m6o9cMIIlxO9RJnf
	 da49WXeID8O4W4/HZbYmKJOmek3TphOoMs/7W9b6e0cDfJNxU5syQ7vJILuB4ZkGNJ
	 UouKxj4rlYoUQstKMw6yHCAA8xnOoPJdoRntUTrgqP0M4vti8+zlM3TS0Ki+i4UQow
	 QSi6gls6CY0V+EN8ucvdnhrgUTJV2lCYmdeEU4roHM3/bNnO+vf43V9jJ9pbicmwdm
	 vg3iXsvawKD+g==
Received: from [100.115.7.173] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id E0/3A-11340-E2931E16;
 Fri, 14 Jan 2022 08:49:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSVfP8mG
  iwZOdHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aCR2eYCvq5Kj72b2JsYFzD2cXIxSEk8IRR
  Yu+EDhYI5wKTRM/9CVDOCUaJtldfGLsYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCTuNM8hQnEZhFQlbj9agJYPa+Ao8TP5pdgcyQEFCSmPHwP1ssp4CRx9SNEXAio5t4hCJ
  tXQFDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1VSUWZ6RkluYmaOrqGBga6hoamuga6RoaleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZgGKcUM1zfwTix76feIUZJDiYlUV5OuYeJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4Oc2AcoJFqempFWmZOcCYgklLcPAoifDqg6R5iwsSc4sz0yFSpxgVpcR5T5sDJQRAEhmleX
  BtsDi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN9YCaApPZl4J3PRXQIuZgBa//XMPZHF
  JIkJKqoGp7v2G86VmLKZ6s1/37W8w/cv3MMbheJn3/3fie9+62dUeel25hTP+xtWUDBP2Cboy
  nWaODhJ/r7zriNr5pHn1ufxfXOVbKgsaz/84697Ws5l/fsvzzaaLvdwsZX7GR2it+8Lv8bL11
  ZNXtX7FnacN/2i0OOaLa64S+S/9JOxM+POvChlPVvN9OxRR1esYsjg+3veRt+TCak9t1rJ9p+
  qSmCbavw0wDjb7MEfV7MHLtvLdt3TCf90M8ftjsV71+se6lyz3Xx70KtDQ1GkRTD1yZKPa5l3
  iv4NjFhj6R+4wCtb0f25lo6D8N/icXMcB1Q7GixrnNh41uW9r4s/Zn2ncY7whs/vU00u997fr
  uyixFGckGmoxFxUnAgB2qkgqXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1642150189!52508!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15487 invoked from network); 14 Jan 2022 08:49:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jan 2022 08:49:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9D14A100465
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:49:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8F6B3100457
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:49:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 14 Jan 2022 08:49:30 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-supervisor: upgrade 4.2.2 -> 4.2.4
Date: Fri, 14 Jan 2022 16:49:18 +0800
Message-ID: <1642150158-4679-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642150158-4679-1-git-send-email-wangmy@fujitsu.com>
References: <1642150158-4679-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 08:49:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94825

Changelog:
=========
Fixed a bug where the --identifier command line argument was ignored.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-supervisor_4.2.2.bb => python3-supervisor_4.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.2.2.bb => python3-supervisor_4.2.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.2.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
index f89c206dd..fdd8a76cf 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
-SRC_URI[sha256sum] = "5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90"
+SRC_URI[sha256sum] = "40dc582ce1eec631c3df79420b187a6da276bbd68a4ec0a8f1f123ea616b97a2"
 
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
-- 
2.25.1


