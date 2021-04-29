Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.3097.1619678265109219211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rss8V6QC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678263; i=@fujitsu.com;
	bh=zUHkBa5VTTit8B9bTbtAumyBZk0oZA+gdZWalZiL/0E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Rss8V6QCbI3PPOqB52BUyMpstpqK7mP2qtyt19JKRqjycs7e8+GrfBwPHjSKAezoy
	 OEXnr4+6pBCFzfMynPpXPMNeyOMAeUqJORgo4DnkNZ5uYi0fv3t/P1OJF2Rl8P6gf9
	 JUIaimm//AXKx2ZUkt+tbi5AZaUtlaqH35969FzSKeJVHOJ5epePzUL6rNQ//JHWO3
	 wODrNyStjkuUS25eHl+rCU5l3f5sXD7mluM1QG7LL6ZQXBANlpzr/DxY7kjPDmE+xf
	 yHR7tboI8MfQXLp6JvsNwK7ERpByiQJM6O4/c+9sUZugZ6JxGXjjLokGsCnJpDPyth
	 ruIrlXpc0Qrpw==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 81/98-01834-7345A806; Thu, 29 Apr 2021 06:37:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYomse0pV
  g0PxK3OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdjZ08xSMIuz4s3/V4wNjDs5uhi5OIQEZjNJ
  fDu+gxXCOc4osXHTY5YuRk4ONgEdiY4X3WC2iIC+xNLZe5hBbGEBd4mfzVvYQGwWAVWJsxc+s
  YPYvAJuEo++3WQEsSUEFCSmPHzPDBEXlDg58wnYHGYBCYmDL14wQ9QoSmzfeYYFwq6U2D7tLO
  MERp5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19ASiE1M9BKrdBP1Ukt1y1OLS3Q
  N9RLLi/WKK3OTc1L08lJLNjECAyml4MCEHYz7X3/QO8QoycGkJMq7pbMzQYgvKT+lMiOxOCO+
  qDQntfgQowwHh5IEb2lwV4KQYFFqempFWmYOMKhh0hIcPEoivLEBQGne4oLE3OLMdIjUKUZFK
  XFeQZA+AZBERmkeXBsski4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYNAJnCk5lXAjf9Fd
  BiJqDFy863gSwuSURISTUw2eTVv3gz4ZCCfMTF478kfv5RXCYhkqtwhOFfvu/tXnFj7tjomSK
  1G2aJ2ckfNZSOF/pxc0623U1Lk7X72zpb2FfsLua++E/p54R/26yVT8ypuWCT+/TOxxWtIpnd
  L1Yon/MXWJy6wWhTmdPfxcsE97bEygX6NuvPaM3j9HHfPumdwqQIFYcZR7tqlCawFdjYZTTp7
  buwZ3biIQZDbe+lG/K/bq4oWyJkoucj92zrqnTG2ZONN9UYCU/c1jC/wrch5oJ0w8H/u6+Glf
  7t3F5z667Hiav8C/bOiBFnqTkbWp4Y5JJ1vETWIahS/ndiwMrbCTbKAjONvpascN2qfqZz3ST
  FjeaH5aWFr5zed1VciaU4I9FQi7moOBEAfvlhPR8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-265.messagelabs.com!1619678263!71144!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9932 invoked from network); 29 Apr 2021 06:37:43 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:37:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6bgll015759
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:37:42 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:37:41 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] debootstrap: upgrade 1.0.123 -> 1.0.124
Date: Fri, 30 Apr 2021 02:37:35 +0800
Message-ID: <1619721455-4801-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{debootstrap_1.0.123.bb => debootstrap_1.0.124.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.123.bb => debootstrap_1.0.124.bb} (82%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
similarity index 82%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
index c7e28534d..300c98f91 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
@@ -10,8 +10,8 @@ SRC_URI  = "\
     file://0002-support-to-override-usr-bin-arch-test.patch \
 "
 
-SRC_URI[md5sum] = "b959c7ac01839e9b96a733d27b19e59e"
-SRC_URI[sha256sum] = "5e5a8147ecdd6be0eea5ac4d6ed8192cc653e93f744dd3306c9b1cc51d6ca328"
+SRC_URI[md5sum] = "8a5e97f60236c3a63f715c056a5f0e29"
+SRC_URI[sha256sum] = "7700e9864b29f166b26c54153ed8c275b46f4b9a60468bb607e019a64c16cd8f"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.25.1

