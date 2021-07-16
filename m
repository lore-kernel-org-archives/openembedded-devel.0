Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.639.1626397981762805218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 18:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=axdh5/A8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626397979; i=@fujitsu.com;
	bh=YJzqePnoC22pEQutoNhaZv2DDJrQWFeOjTH7PkYOH7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=axdh5/A88/TylaSwcTZduUu8x8M1Ki73lljnbypY5/QVdvMyIDCXT6kQndKOQtzsr
	 alOdsqiuIkeMJnMKBZwS20N20eNjyE2xZcheCC1MLfzYkd91l5AwiZ5oZ5AKp7hsD7
	 s5MGWW+CP19X/Dly6icEjrA1xk92KH9ZdXwJdcx/y55Gq0RFs21LRAA8dHeWHHVXN3
	 bJNK2F86YDsQNitim7keMJk9IinA+ryIU4GVoc7n2XSLoes5iIxSqDy6JW5Af4S6Wd
	 eI+fxROfhPAXrJ3dcBjZzKhLJa0vR9P+DRTlSoeCWHFmOm//5W5biGWKz8ETepBEXO
	 fR1/A1YaZ8ToA==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 6B/28-07651-A1DD0F06; Fri, 16 Jul 2021 01:12:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVVfq7oc
  Eg+3TpC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxbb5ayFpzgrOjeeI6pgfEJRxcjJ4eQwDYm
  iR2XyrsYuYDsk4wS67fuYARJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgKrHvx
  WGwehYBVYnrVx+B2bwCThLTF3SD9UoIKEhMefieGSIuKHFy5hMWiDkSEgdfvGCGqFGUmH25GS
  jOAWRXStx4nDqBkXcWko5ZSDoWMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWBZLGBnqJVbqJeqm
  lusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzA8EopZGjawfju1Qe9Q4ySHExKorzrL39IEOJL
  yk+pzEgszogvKs1JLT7EKMPBoSTBK3kbKCdYlJqeWpGWmQMMdZi0BAePkghvFEiat7ggMbc4M
  x0idYpRl+PLqiWLmIVY8vLzUqXEea/dAioSACnKKM2DGwGLu0uMslLCvIwMDAxCPAWpRbmZJa
  jyrxjFORiVhHk3gkzhycwrgdv0CugIJqAjtNe8BTmiJBEhJdXAZPbxzJaPdSzua6ZdkdG8sj2
  tPUPlwRXWf9avDlx3+ZIzbV+EWp/W9jke5y17OdL9n1uePu9pVWoh3GhYIWxZ2Zp+ba/HgYVb
  PUpZKic+7zYvj7u0ztN/s8HdBa2f2Fdc6c378jfNIze5+v57b8nuVe/uH3vAWB8istDgSPyDY
  4+enftuK5LIdGd3yBPBAEMZ0eTunglfXzME7fr5heeywI3ttk/zk9zeb3te7du0xujOFMf1kd
  8DdAz+rxByrLu/QCzP6t8D48QvWumf14YtWC4ksKf88erwtuUMhgHu5b5xO5O7brXy/czze3P
  43aETDU61zOfCf93QfvstIZWFk2XTBuv/4aKKOnk93MpdSizFGYmGWsxFxYkARBProDYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-232.messagelabs.com!1626397977!69553!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15472 invoked from network); 16 Jul 2021 01:12:58 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 01:12:58 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G1CmkA017303
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 02:12:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 02:12:45 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210406 -> 20210710
Date: Fri, 16 Jul 2021 09:12:31 +0800
Message-ID: <1626397952-27403-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../live555/{live555_20210406.bb => live555_20210710.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210406.bb => live555_20210710.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210406.bb b/meta-oe/recipes-multimedia/live555/live555_20210710.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210406.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210710.bb
index cc138adb67..9d89e1c5ad 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210406.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210710.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "0bd182fac7d6297d924af4405ce840515a38fa5438cb1a4b90fcb6bc737b36d6"
+SRC_URI[sha256sum] = "c157e848fecb335a7af2917fe787dacc5ada07e74f02026c206b092bc4cecb01"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1

