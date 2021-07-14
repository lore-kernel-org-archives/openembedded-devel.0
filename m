Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.4471.1626255275758529191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zINqXjck;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255273; i=@fujitsu.com;
	bh=2jE+n+za8AtscSj8q7YRCZlwDR/3Q0nm85x8AR7OZ84=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=zINqXjckIfju8ukpFPCPki6XsxfnLr21UcO5nbyVTfL4QApF6SaSbEwV/tQDicKkB
	 rH/1F5Ypvxnak5Qv2UmGFbw1og+PSqdKfdZLyy0RPLo9cfhbL5JD04gmYddf9Szzx9
	 dzplkSrNakIvMkA8G8lNfprYYC4l32sUIN2Pd0QiTkHjm+m10aJUkEHS3EZyWKnUop
	 8SSK71gTcnDhhtSWxydgVXltZYPPNEiyES3vJHB15KY3Y3DhtYolBP5AZHWOKz7upg
	 Kp+HiYxWdnO0vdRfFB1Xcea/HJjiaH3XoVOMbMtQd5MoMIc00V07dXGYWsqM9fJmaC
	 /M8qP0M11dx2w==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 34/B7-27654-9AFAEE06; Wed, 14 Jul 2021 09:34:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0V25/l2
  Cwb9znBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aJW1fZCo5zVTz68oKxgfEuZxcjJ4eQwDYm
  iX3H7bsYuYDsk4wSe/YvYQVJsAnoSHS86GYBsUUE9CWWzt7DDGILCwRKzJy3AsxmEVCV2Ld7F
  huIzSvgJrH56G+wXgkBBYkpD98zQ8QFJU7OfAI2h1lAQuLgixfMEDWKEtt3nmGBsCsl9szqZ5
  rAyDMLScssJC0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6ZqZ6CVW6SbppZbqlqcWl+g
  a6iWWF+sVV+Ym56To5aWWbGIEBlFKwRGHHYz3X3/QO8QoycGkJMp7w+dtghBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJXsa17xKEBItS01Mr0jJzgAENk5bg4FES4XUHSfMWFyTmFmemQ6ROMSpKi
  fN6rwNKCIAkMkrz4NpgUXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvWZDxPJl5JXDTXw
  EtZgJarL3mLcjikkSElFQDk9cf82MOapYPS2qfmvV86yxWuvCIc2WKNINOwqtHDH4uBfEFvS8
  ZPEwn6Nz9MpmF7WdEp6JZKaNGvX3RTufPwh1SpfMr3NQTTi1/Lavhd78w6qJ9+gVPnZmbNey+
  fTJYkbhkeWr+33fvfjS6iF+SObGweO0s/zMvNp30YZR/1XlwQ+3hP3Xhig6m7L71Fn66u5ava
  ZhmHTG9xveo1Q+LiLPT+6fMWfNCv2Shr+X+WOv27XrNlzkWTf4vb7Pp+pWOuQl3lNs17u/KFT
  /6cNlH91Udky73vUxNjlz85p7Ogl0yWmcMFtfkaAvWXH3i/35O9a3PZ4Vnvo5+HyVw5uJF5m/
  NhdfV3v3z33OvJM6GSYmlOCPRUIu5qDgRAEtsfHUdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-285.messagelabs.com!1626255272!79509!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19155 invoked from network); 14 Jul 2021 09:34:33 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:34:33 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9YWbW023455
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:34:32 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:34:30 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-migrate: upgrade 3.0.0 -> 3.0.1
Date: Thu, 15 Jul 2021 05:34:24 +0800
Message-ID: <1626298464-4607-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Add support for Alchemical in addition to Flask-SQLAlchemy (commit)
Remove Flask-Script references from the documentation (commit)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-flask-migrate_3.0.0.bb => python3-flask-migrate_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_3.0.0.bb => python3-flask-migrate_3.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_3.0.1.bb
index 8f84e05972..77fd172bc4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "a6607e66bf1d68489b2281ead5caa6fdf7a21b71984fae922ef5f915ac45bbcb"
+SRC_URI[sha256sum] = "4d42e8f861d78cb6e9319afcba5bf76062e5efd7784184dd2a1cccd9de34a702"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.25.1

