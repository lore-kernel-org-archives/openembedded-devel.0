Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web11.26112.1629951460903006267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 21:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BxiY+8rY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629951458; i=@fujitsu.com;
	bh=aTyQ0oj+4kFnaxt5ISGdWrW+g2yw6gyNzROOCsaLDm0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BxiY+8rYQlvw91jXm4lpHFi8MJ+CQxNSV+jvFauZu2xKrCP1b0w4Lv8eq7LR6gBtK
	 BeMv4ywiUmVd1Bp10dI0xmkDJyqXBKuWL9dvdX5giVIXGRQqMIBWDdutpNdR7tVk75
	 FSxI+uVq9aqRPksZE3cdwUnD6xNkSsOSsfJcxCTjN0sF8xnJCuXH7XcMGWR6f7CTEr
	 UoTW7TOWfS9dfbVWl0i9HDQlHvn1YnlGN90CUYg9xlbqn8P2qH2l9Yuw8PTnmnVEjz
	 OibHizu3DwEh4JC8iNV+b1QMyycf3HvvK8rCUA6lZrpWGqQUqFdDjiGJiWs+gETMYT
	 ycWG6emEyvJcw==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 8F/91-28466-1E517216; Thu, 26 Aug 2021 04:17:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxRfehqHq
  iwYPrWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ab0zOZC66xVnw/NZe1gbGftYuRi0NIYDaT
  xPT/+9khnBOMEt+ffGTqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAU6Jj9
  TywGhYBVYlLW78zgti8Ak4Sl4/tAbMlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCYVdIzJrVxjSBkXcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQEYiMzvcQq3US
  91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAAEspOFC3g/HB6w96hxglOZiURHm1RNQThfiS
  8lMqMxKLM+KLSnNSiw8xynBwKEnwJgoC5QSLUtNTK9Iyc4DBDpOW4OBREuGNAGnlLS5IzC3OT
  IdInWJUlBLnfSAMlBAASWSU5sG1wSLsEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3kKQ8T
  yZeSVw018BLWYCWlzApwqyuCQRISXVwJRVqqu5PsX9R/b3Km/xlQEajqV8B3+yJk6+LbvwRsY
  h/Z9PrlbPvBRRtb/1uXnnBtb/m3acPyI1d2F+WqD9aYUpHZVTbky9vuXxhM9rc3dN0Qi+9f2C
  fdttrV7t7lNbBB9bCXzlPpX2n734/sstFma7daQfGkXv/qfe8e/C09Rbni0zm09JJnL/ddD5H
  NPJKLxewqDyq656VtgPgfaOQ9UhqkwZt2ZJBT7puKeWY672ek5tRh9z4Zx/bMExy24JKWqviH
  Bg/jGJNyCZx7qWsX3F5Pp5nZGWVcui4/OEXwuVlp+9u+fSlSVhVef+TXwZZxpxZvv741eWOlx
  UbfJw/x8qKrNz0/+WG89OHuVccFyJpTgj0VCLuag4EQAqvqFVKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-271.messagelabs.com!1629951457!233302!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19095 invoked from network); 26 Aug 2021 04:17:37 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-29.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 04:17:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q4HWqm003263
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 05:17:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 05:17:29 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] can-utils: upgrade 2021.06.0 -> 2021.08.0
Date: Thu, 26 Aug 2021 12:17:11 +0800
Message-ID: <1629951432-62435-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index ad7fc596ed..8d63a10e54 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -6,9 +6,9 @@ DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
 
-SRCREV = "e9dd86fa5c4e6ecdfc34e487634a32f19e5c4d63"
+SRCREV = "3615bac17e539a06835dcb90855eae844ee18053"
 
-PV = "2021.06.0"
+PV = "2021.08.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

