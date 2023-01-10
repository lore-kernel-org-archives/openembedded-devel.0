Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40847C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:40:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.96891.1673329233247853783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MLg8L/Lq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329231; i=@fujitsu.com;
	bh=eRKB1tDeFDDLp4vnVj1DN8lVR+kD7deBfczAlnjCEsI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MLg8L/Lq0aKISDvF5CThh7aWmPoNwHeaseLjededp9BtcZDzLXgLlr7JaqX3Efzqo
	 3tpsZBf/jZLbIASMX/veDyXWchDtTnw2AaIWFtmIGPRUhMkMkah278bBDgzOhhg4x6
	 7CIFBG9/TH9oUuhlEeQ/59Ku5xZJT0jJeUaXDIrs8hAO2N8tYSQiuWNtsxNQcK4Hrk
	 mbucZWdchXO1kWoyWTlyy4h+cebR/ZSAtWlO798gBbFB0zOVCbAtmNmpj694SbGNFU
	 apvVBxC/8CEg75fjMJfwCm8wpDAAQLk7AAplJoHuWQxw9fGIeEvef6x/bXpVESsyr6
	 Fbj3p2dUSB/Zw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8OxWdfv155
  kg3WPdS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz9z2ewFLRwVmxftoC5gXE+RxcjF4eQwENG
  id7XXxkhnCtMEluXL2LrYuQEcvYySty+qANiswlISdy4/x8sLiKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAWeJU6vAwiwCqhLLn2xjBAnzCjhKPNhjABKWEFCQmPLwPVgJr4CgxMmZT1ggpkhIHH
  zxghmiRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdQ0u9pKL
  M9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBATClmu76Dccay
  P3qHGCU5mJREeYs+7UkW4kvKT6nMSCzOiC8qzUktPsQow8GhJMGr8wMoJ1iUmp5akZaZA4wKm
  LQEB4+SCO+860Bp3uKCxNzizHSI1ClGRSlx3kk/gRICIImM0jy4NlgkXmKUlRLmZWRgYBDiKU
  gtys0sQZV/xSjOwagkzGv9FWgKT2ZeCdz0V0CLmYAW/5i6E2RxSSJCSqqBaeHSVa3xK57aP74
  meNDUMKEg5s/GEEel0zJP/04172ZVlFLukL/4sqNJbPJWj5Z2tjszi8N8mEzXfLAyF9ns3CAb
  fMXliFIyU6We9LJ9CiUHOO9HTTKbMWXVH+nvW6TPSVlYq6SadS9o1/DMfKPEccFnGccSk6cc0
  4+GPDJb2Olrvtvwr7Xl1giGBXKz7zR15cmJbGLUnm+/+v33OoG5Tid/n7brUJ5zfL/RjIInSv
  Yn1nR8dAtaw7CyO9tlzWrLPac5i1TEuS06XZNylx48sHBXyjMt/mVpFj27TRxiHpjy9iSEeqZ
  JvFOI0vbculXp2Tezixw5GcYBRkcTDrov72XZfit1T+vzHflPM94rsRRnJBpqMRcVJwIAvhZr
  UT8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1673329230!415127!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31361 invoked from network); 10 Jan 2023 05:40:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:40:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5E3A2150
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 526977C
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:40:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.54 -> 4.55
Date: Tue, 10 Jan 2023 13:40:16 +0800
Message-ID: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100504

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
remove dependency on Test::Deep (GH #254)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.54.bb => libcgi-perl_4.55.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.54.bb => libcgi-perl_4.55.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.55.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.55.bb
index 4c9864094..2278d14f6 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.55.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "9608a044ae2e87cefae8e69b113e3828552ddaba0d596a02f9954c6ac17fa294"
+SRC_URI[sha256sum] = "67895e94b13fdf46a3893c9a17c2d0d4c3d4cd2550e1f41e26696c10cb8c64b2"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.25.1


