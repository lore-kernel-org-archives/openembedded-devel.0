Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.8567.1619071167448303111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m0lgkg4r;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071165; i=@fujitsu.com;
	bh=KGrOAgCkU/efB8hPri/xcSn7OTZ2xJaynwKJ+HXI34I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=m0lgkg4rOf2bm1uDkQkHJNjlp/oJHYBuFj9bF2R9MyhCdarkBAg7+pWPc9tUKFMzO
	 fA8GFpH1T9IZ49xm5Igh1gEZU1jgsXDTteuRJrmGVMiEpL/Rnc+zv1EOllUruEfRxi
	 rAA5ghvjmlPKkmakruI7V0DxC+ux6rxWDSeXqKSc3Js7amYQOKiIewY8hJaUhvEHbH
	 aatGb/mswwjl19aXBUDzpmt1b7z5/vc+dMSrqAidRTzmqYcQWo7TXJAMkP5ECsAESm
	 9qdQoS5SXvwQeYw1HXA+Iu9uTs61+M59LwZNXcgcTxogusnukn0Qb1dlTJetDs3dZJ
	 geTAfJyj0wjHw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id B6/00-33844-DB011806; Thu, 22 Apr 2021 05:59:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYqrtHoDH
  B4EmPocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF+6WLmgn0cFd9W32FrYDzB3sXIxSEkMJtJ
  4kDTB1YI5zijxJs1y9m6GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBWwlbl/bwQRiswioSpxvn
  McIYvMKuEms6ngGViMhoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPECqkZRYvvOMywQdqXE9mlnGS
  cw8sxC0jILScsCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa65rpGpkZ6iVW6SXqppbrJqXklRYl
  AWb3E8mK94src5JwUvbzUkk2MwFBKKWT/s4Px+usPeocYJTmYlER5F/I1JgjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4D0CkhMsSk1PrUjLzAGGNUxagoNHSYT3Ny9Qmre4IDG3ODMdInWKUVFKn
  HcnSJ8ASCKjNA+uDRZLlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ854FmcKTmVcCN/0V0G
  ImoMXaU2pBFpckIqSkGphmhqh9mvP2rFTmhZLDKZ5bRLdlcW+f98Vu7kzefWe8hZZtFjbc/sa
  tdsHnT9K6GUKC/TuXb33quuHQRTlL2Vsnn8/brNkgoP98YdO1rGti98N6D2n+ubc8JKt/WsWX
  s5PZuw03RLvWdG6J7m0WlZK+/z23QOB308QFwTk7Uj/Ot/wZ5K1tftxK8d4Pl4DpVm832fXpM
  xT25wTue3zFTIX52uqs+9wZy4Xkuxm+CHr5fFbNmz8n+Lpp186pHuePS56Meu350rSh+a93T3
  HswVtrJyuYHXbaevlXeu/ib/NXeyXM+lqmcbZh2sJgszQ/PfMlUdm3nndetdp4rpVl3caF0q0
  r517qOOnh0nNcxE9BiaU4I9FQi7moOBEAgVkj2yADAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-248.messagelabs.com!1619071164!1518967!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27729 invoked from network); 22 Apr 2021 05:59:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-26.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:59:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5xOtH026540
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:59:24 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:59:22 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.2.1 -> 6.2.2
Date: Fri, 23 Apr 2021 01:59:16 +0800
Message-ID: <1619114356-5119-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-extended/redis/{redis_6.2.1.bb => redis_6.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.1.bb => redis_6.2.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.1.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.1.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.2.bb
index 89990df3de..65b525709e 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742cf7b76aa907520"
+SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1

