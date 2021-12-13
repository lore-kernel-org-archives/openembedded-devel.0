Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2330C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:46:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.12065.1639406811492795417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 06:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R+Mkz8+X;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639406803; i=@fujitsu.com;
	bh=ZoVRyrnckWGfQ4CaBm12LIPF2xhQ3zsMXr6tERJ5WSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R+Mkz8+XRtsm/tM+iH7QgaklngKQDPe8QWfUxlAb22kFZFHbkvez5waxnojsPGh7l
	 bE7A6kSxOGmOLx5BO3tzKrzd1+SJFfM+OUni0ETahkTLOyWrsp8TvPtZzL3MDGIVxq
	 4LprIpYmh9aPU3Pales21vDz4d/s/WBKyUKGPoLITL1M9sGmz/DnCpNkzlNy6R6VWp
	 496pQNNDGdDH8y9IWNLsppVM91beFttZkT6KR1aQ2cJ4q+pnXPiVAsNWIjJVXaJwEA
	 PtjdGHrqb1dJRLp3z0BLha9UI4C85VAX5bTLnUFDzGo3lh2gJMc437l3SR3imWqVPh
	 1/ObEJMHkKqGQ==
Received: from [100.115.39.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id BD/C6-09428-3DC57B16;
 Mon, 13 Dec 2021 14:46:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MxRfdyzPZ
  Eg0n7JC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy9PU+YC1ZwVpzvbmdrYFzF0cXIySEkMJNJ
  4u533S5GLiD7BKPEosWbmUASbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCwvYS+z/c
  hbMZhFQldj0fhcLiM0r4CRx5HUP2BwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvN7
  NA2BUSs2a1MU1g5J2FpGUWkpYFjEyrGK2TijLTM0pyEzNzdA0NDHQNDU11jc11Dc2M9BKrdBP
  1Ukt1y1OLS3SB3PJivdTiYr3iytzknBS9vNSSTYzAIEspVl20g3H/qp96hxglOZiURHmDWbcn
  CvEl5adUZiQWZ8QXleakFh9ilOHgUJLgFQeGrZBgUWp6akVaZg4w4GHSEhw8SiK8l6OB0rzFB
  Ym5xZnpEKlTjIpS4rxHQRICIImM0jy4NliUXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzL
  sNZApPZl4J3PRXQIuZgBYzVm4GWVySiJCSamCaELVuU5hJotUbtuhVp/Zb3Zt6h99z8q5PW9V
  WnF/SuvGawpGy66KZrDYLs26sEnkS2NiWnrj1r+vO9fLBRxIjzazsVcMq90dKdn7RrQ71DC+V
  TY9sZBCrX2rYwltlGtfpMmPurYMup++tUNLNzH5XF1Bbd1Y2T+nD5K0/uBiq/tyY5RQpds2rP
  z7vYPZ35Sl1bDyrxC98YyjwWZHz98VL7yk1l5Mv2B1WrZ29+Bpr2NoQx+s3YnvT1/poWXUVrF
  oV/9xj2tTYvw3Msct9EvyOm178LsZrtfcQryJX0PU1ypt12Mp4u4Kkpuxxmr1gTmrNJs5I1nN
  /FurZNuwIeNYVruwzPaLQ/fnE/Ye8dZRYijMSDbWYi4oTAb9J5mAtAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1639406803!25415!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29808 invoked from network); 13 Dec 2021 14:46:43 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 14:46:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BDEkh53008845
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:46:43 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 14:46:41 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mozjs: upgrade 91.2.0 -> 91.4.0
Date: Mon, 13 Dec 2021 22:46:32 +0800
Message-ID: <1639406792-28083-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 14:46:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94333

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mozjs/{mozjs-91_91.2.0.bb => mozjs-91_91.4.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91_91.2.0.bb => mozjs-91_91.4.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
index c04e8fe9d7..dd02ed94cb 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            "
-SRC_URI[sha256sum] = "3ef3cfd321d0c2c80ee1b41b8baf7a1ea4daf93c29e1377274933440ff5e42c3"
+SRC_URI[sha256sum] = "e722829db490f9332712a81c35996541737bbfb05232d47190fee779c4fcb327"
 
 S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
-- 
2.25.1


