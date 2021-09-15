Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.8518.1631783997763278129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XPK6ZY0u;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631783995; i=@fujitsu.com;
	bh=M4OxPtLdIsoxHm1016mEjwfSbgWwDcbZluij5dv4xhI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XPK6ZY0u/Qqa8OTZJWCUTwc9InXRqRYneM0X+i9/WZ+KbK02opcb2NEO23vcvSnf2
	 b6wLmSuojbN+S3MW3gRlKXlhbv2a9C5hC3YM7rPtaJ6Henw10POx7KK8ZV/x02Yjan
	 usJyBo8ZXdzfauMWyyHaVTz4pOAQeeYXClk/Mqnp4e8baSu3ehESQujVHIWHnicnle
	 Udyew53syl8FfVYiP87SwpS5vD8G2uvfPg79Bu0aGxoAzOKQ+5/DgPDUWCQ3fhrg53
	 9iQEOxLjNXYkl3n1hbRpqJsmysq9y6X8d/95Uk9iJ66miuRkLO4fP1YwO7UPe8/muR
	 h1JERWXJSvb4w==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id CF/79-30018-B3C03416; Thu, 16 Sep 2021 09:19:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0bXmcU4
  02LeNw+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzXi+spWlYApnxcTPDSwNjPs5uhi5OIQEZjNJ
  fHm1iRHC2cMo0fF7PlMXIycHm4CuxLnHa9lBbBEBfYmls/cwg9jCAv4SNxf8AathEVCVaJj8E
  SjOwcEr4CHx+IwZSFhCQEFiysP3YOW8AoISJ2c+YQGxmQUkJA6+eAFWLiGgKDF7ujxEeYXE68
  OXmCcw8sxC0jELSccCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpaWukZG5nqJVbpJeqmluuW
  pxSW6hnqJ5cV6xZW5yTkpenmpJZsYgUGUUnD88Q7GFW8+6B1ilORgUhLlPXjTKVGILyk/pTIj
  sTgjvqg0J7X4EKMMB4eSBC83h3OikGBRanpqRVpmDjCgYdISHDxKIrwFXEBp3uKCxNzizHSI1
  ClGRSlx3n0gCQGQREZpHlwbLIouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdQWZwpOZVw
  I3/RXQYiagxUf2O4AsLklESEk1MGkvnP8zLy7MPVX5ZqY8v2d8LEuQ3O6m19MinqldL154Va6
  dq3/xdfWk/PZ+n32dB9+ynlMo8To1tUiU5fBuKem95895S5es+bTs9/o5yfO9qjzrJX9YVZfP
  n5bJNrX4Ys8DX/eSytuLZz/NitjloR4Qw97Feco5wlAtYBsHQ8+8pU1KXLs/nJA1Xvdx6X6D/
  OnNTS8XBp8R2WPpc1lw5Z30g088lq6QiBLxSuUqdz9XsfPbqR2v7vOYTPhafKlPkePkTV6XjT
  GH+n0+ljJOS/rtlsj+s0Oog7mvNGc99+JrXb7MIuF9mmvjJl3rdpl1LOqEnkdThNG3jXu2zF/
  O/03ukh53lUffVNuw6KOOSizFGYmGWsxFxYkAY1RunR0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-287.messagelabs.com!1631783994!78554!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14425 invoked from network); 16 Sep 2021 09:19:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:19:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9JrPG004357
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:19:54 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:19:52 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 21.5.18 -> 21.9.1
Date: Wed, 15 Sep 2021 14:30:24 +0800
Message-ID: <1631687424-89250-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pulsectl_21.5.18.bb => python3-pulsectl_21.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.5.18.bb => python3-pulsectl_21.9.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.5.18.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.9.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.5.18.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.9.1.bb
index 22603209ee..5871ee2164 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.5.18.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "14e34563cdad5f01d193f1ef7cd859a0fbdaa846726d44b0b68f4451a7458458"
+SRC_URI[sha256sum] = "8eef4dbfc97d984e63fd609a3f690d005173ec5342be88d10f67dd507affdf32"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.25.1

