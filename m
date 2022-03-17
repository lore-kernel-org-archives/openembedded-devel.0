Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7657CC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 13:46:31 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.10538.1647524789561183396
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FOrR0VoM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647524787; i=@fujitsu.com;
	bh=z39/Kj92/q7UO1zn6Cy12gziTY4w1r1ePQO+Vb9v4w8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FOrR0VoMm8Ofw34HZISL2GTo2KFuQcQiTAAl9vqQHBMb5s1YP5wPLWLspaGIYEvdw
	 VcbW6ozB0PUiJjddz3cCPdAUXCnI6W0cjobHEJAAkyPhe3nm5ZC1P97R7lizOTsSUl
	 diqobQXEyeSDlo5Dq89ChxI3nnYUQKj3BC1j7Qim0nmFOKSKYYSunPnFzzIdSHb7YI
	 yYsXiyhrFmGNjJGS9h0Q5effMWQ+W5r7UMOhp2c5f5kGRv8CnDAQ/SySym4xPqKSki
	 kSt2KkDjjtNtZO4JYSRKxHokRwyVNYLZpzTQB7VzJz2eRllBYfbP7D8VIoJyr+/mJo
	 IYSp9QPcv5NrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MRorvZ2jj
  JoPGHksXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHi4gu2giecFTM3HmRqYGzm7GLk4hASmMkk
  seDIJRYI5ySjxPr1f5m6GDk52ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64hh3EFhaIkpj59
  SmYzQIUf/zxPJjNK+Au8f7zEjBbQkBBYsrD92C9nAIeEos7X4PNFwKqafm/jQ2iXlDi5MwnLB
  DzJSQOvnjBDNGrJHFixUcmCLtC4vXhS8wTGPlnIWmZhaRlASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXUNdIwNjvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwKBMKWY8vYNx
  U99PvUOMkhxMSqK8R9WNk4T4kvJTKjMSizPii0pzUosPMcpwcChJ8DJaAuUEi1LTUyvSMnOAE
  QKTluDgURLhDdcBSvMWFyTmFmemQ6ROMSpKifN+sgJKCIAkMkrz4NpgUXmJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjBvGMgUnsy8Erjpr4AWMwEtbhQwAllckoiQkmpgYjGZ9uzczpUf0v1
  +lvG9vh+/+YdGc9y/g1opzQb6eyL3ne5ebdNXstI+W9F9/mrBh7OZje5J5PFbHuDm/Jwpk98f
  dcBE96jLjxffnt63a978tTn/dJaydKF9p7yM5PKmhBXKDDfE36fYcO+5f1/lv9+8E9WvM5lPy
  18ovyVSucqk8bOKmVbUKu6Pv7063kfxp044zcXuc9tbQvizN7PsrogmBhmX61LPXy1amrHvjH
  GiXVu39IsjP5p2RbdK3uVjtvWSSD3DoL833+z8BcmzjLeDVjIqFjLaqTGfcb+eZt60ryA2q23
  vzHaxLxt2mRhl/BLbIMl1Y/P3L5pZu/iuNJxYEbE+/13zDc6NTplKLMUZiYZazEXFiQArpaw+
  RQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1647524787!15385!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9747 invoked from network); 17 Mar 2022 13:46:27 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Mar 2022 13:46:27 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22HDkLMQ012949
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 13:46:27 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 17 Mar 2022 13:46:20 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/3] [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade
 1.5.6 -> 1.5.7
Date: Thu, 17 Mar 2022 21:46:47 +0800
Message-ID: <1647524807-17685-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647524807-17685-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1647524807-17685-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 13:46:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96036

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:

fix(serializer): Make sentry_repr dunder method to avoid mock problems

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-sentry-sdk_1.5.6.bb => python3-sentry-sdk_1.5.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.6.bb => python3-sentry-sdk_1.5.7.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.6.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.7.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.6.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.7.bb
index 915fc47352..1594fb5dd7 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "ac2a50128409d57655279817aedcb7800cace1f76b266f3dd62055d5afd6e098"
+SRC_URI[sha256sum] = "aa52da941c56b5a76fd838f8e9e92a850bf893a9eb1e33ffce6c21431d07ee30"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


