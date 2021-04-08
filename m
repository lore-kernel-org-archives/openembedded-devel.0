Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.4027.1617859708567622632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ic83AiEK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617859706; i=@fujitsu.com;
	bh=6zFOPx+RdD9eeR2LLcGpvAktMq+B+0tL22fX6lvfSoY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ic83AiEKIAGgEo1AL9fvTkbpWAM2ggkUMzZAQgVqVLDlfs+HtjsBUILrh1oGPse4L
	 rLjMbE5Ii/ie9cxbQLXkzBat0uvn+Z7j/2w+SNP2gTPcUE9g8KcCyEBNQociWj98mm
	 tyFp7VOGjaCfJHmuwXdlJlFC4V6slJ1n6XKLY4KakgW+iE+liezpzGLAdXctgnVmJH
	 lrJRNIy1YQ7HyXv5QoYpMj8AYSrF2ZmBFt/cSq4ykYeJqpwPiy68/dWzZhh0qYXTuz
	 /gIxHEj0PNikQHTYu2A9OlgY6bMHBUxFAv8UX2kXFhj2KDOGAlE2kHHK4POKqgn8LO
	 XZqgGNoTuSj0g==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 4A/26-60958-A749E606; Thu, 08 Apr 2021 05:28:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYols5JS/
  B4OJSa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPbKfeCX6wVj+beYmlg3MjaxcjFISSwlUni
  WttBNgjnOKPEqle3mboYOTnYBHQkOl50s4DYIgL6Ektn72EGsYUF7CTOfzwLVsMioCJx8fgdR
  hCbV8BNYs+6XWD1EgIKElMevmeGiAtKnJz5BCzOLCAhcfDFC2aIGkWJ7TvPQNVXSZyd/YVpAi
  PPLCQts5C0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoaa5raGyul1ilm6SXWqpbnlpcomu
  ol1herFdcmZuck6KXl1qyiREYRikFRzt3MP569UHvEKMkB5OSKG/WpLwEIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK8F9qAcoJFqempFWmZOcCQhklLcPAoifCmgbTyFhck5hZnpkOkTjEqSonz3
  p4MlBAASWSU5sG1weLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3ocgU3gy80rgpr8CWs
  wEtLjkYC7I4pJEhJRUA1N6vM6rvcxxczmueLh6yXgWbtCTNov5477sk8n6pw2836Oe1p45Hxv
  ifTWXxUNz17re5avD+8oXiXosW/fJxOpKTsA0Ea4qxpZPqQc/hRnv8LZbXHx4ydUiyf9ykx+r
  8d6vvjx9Rqr9bG4HBrPdjw4kHRBJvci6eMYJL7aKCycjFZndSmO5yk1lF4tPK+F2aFur932t/
  cyVFn+SlY9rSkuv6mNYsGFjtUzlxBdBffxeApr53Gdqd649P+9f3WUt8QkJNxhVZf6bhL7uMV
  PsFtSaqin3+3NG+OF3odyPdRn1SjZWdD068cvxa5uLzBGnX+fEE3T2h3L+O7HAkXFflFaWmNL
  Biq70R5btVz3XKbEUZyQaajEXFScCAM87zoweAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-287.messagelabs.com!1617859705!606794!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18596 invoked from network); 8 Apr 2021 05:28:25 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:28:25 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385SMp6019009
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:28:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:28:20 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.345 -> 0.346
Date: Fri, 9 Apr 2021 01:28:14 +0800
Message-ID: <1617902894-5351-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index 56d814db8..738c32d63 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.345"
-SRCREV = "5d7d97bae533401f60ce9a5a036ff7152c8aca8c"
+PV = "0.346"
+SRCREV = "a2bff16032a68b089eeb169f09dea08094891c9c"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

