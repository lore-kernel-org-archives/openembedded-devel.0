Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web09.4699.1628137049243520773
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 21:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vyyJu6Xy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628137046; i=@fujitsu.com;
	bh=hm8kaRx3lqcHv/+lfT8vJNgg5rBNqYzZSb/CvMay8gE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vyyJu6Xy2nMBRp0V+8Nz3tJk1Bqxshfmn9uF8FYSCeH6a6cz/2CwxS144cfErFGI2
	 4cqCGMpSM5gfJGWatES4pEf1KDPj01jwhs3wKhHUdZzljTc2G9nXPSmeYcahE4u9xn
	 Ma/g+NkLWw7e7yudXndjLUB3KtamciWx1LdnqPm5HSucpzJx1s1NgM9mkQq0iAfmvZ
	 RDGFKfcBBILbEy5Vhc7IOhMLD1BrSihYQpu4gKdIbpgjFTmE6mPUwF2z0ghaL0usHd
	 pcNgLv3Rv3psTL2/fFeDbhrILhzYCkhveJs+3gdsSHO+MIeNkZ80/TjSPwZUbqnWR3
	 ETtBcLzLEzAmg==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 94/87-07373-6566B016; Thu, 05 Aug 2021 04:17:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVTcsjTv
  R4NcUZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePimhPsBXvYKzrmP2drYHzK1sXIxSEkMItJ
  YuezC+wQznFGicfPfwJlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHHcQWFrCX2PrpM
  SOIzQIUX/euH6yXV8BRomvOebC4hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5tZIO
  wKiVmz2pgmMPLOQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWFrqGxgZ6iVW6SXq
  ppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIEBllJwrGkH48nXH/QOMUpyMCmJ8n6Q4E4U4kvK
  T6nMSCzOiC8qzUktPsQow8GhJMGbkQKUEyxKTU+tSMvMAQY7TFqCg0dJhLcxCSjNW1yQmFucm
  Q6ROsWoKCXOWwLSJwCSyCjNg2uDRdglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK835KBpv
  Bk5pXATX8FtJgJaPGFWE6QxSWJCCmpBqa9K2U081Ol/Z4xXX0VFLEtIbql4/6+bWqZ01rcjvi
  ufXNGzrnQYGdY6wr/9B2vpoSaTnb9/ObH7I1zVZtqJqwKSOvgyTkuVfjkiaCercini05Xs1VU
  bOKZVit+7+sSZDWUvxD+xOjMs8wD1hbzrCa0/qprj+OWu7iNsUviYJPLHnWzlay6PW+KbD7uN
  PxbtiVtxefX19LTcp6U/aubeGwFV+Xq6zenNVwzWPPahOl4zYSMbI4yKYafKs1xwS2cYc/Zjx
  TG7jD9yaj17rhQgmRGfdT5NKd1IjMtZ3pduZmaJqhcFTXpD8OOs2FXhNtq1rz8OJPv5C+JBXw
  X3h6w/JE226zo8sO3vS5M3IkHVZVYijMSDbWYi4oTAWlBCfsrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-287.messagelabs.com!1628137045!594015!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14836 invoked from network); 5 Aug 2021 04:17:26 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 04:17:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1754HKM3019559
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 05:17:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 05:17:17 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.28.0 -> 5.28.1
Date: Thu, 5 Aug 2021 12:17:08 +0800
Message-ID: <1628137028-5293-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.28.0.bb => monit_5.28.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.28.0.bb => monit_5.28.1.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.28.0.bb b/meta-oe/recipes-support/monit/monit_5.28.1.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.28.0.bb
rename to meta-oe/recipes-support/monit/monit_5.28.1.bb
index 52becf9b7..9833c0cec 100644
--- a/meta-oe/recipes-support/monit/monit_5.28.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.28.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "9fc6287fd9570b25a85c5d5bf988ee8bd4c54d0e9e01ff04cc4b9398a159849c"
+SRC_URI[sha256sum] = "57d8885f66e58a0a4ca6a967f2bb7e8c15ed988a25b5ca6ba6733f919ef07a5c"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1

