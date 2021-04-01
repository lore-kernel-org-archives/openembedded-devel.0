Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.2115.1617243994893981753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id CB/4A-03420-85F25606; Thu, 01 Apr 2021 02:26:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYohuhn5p
  gcGiHmMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGzYwJzwQeOio+rpjE3MPZxdDFycQgJbGWS
  aF3Qwwjh7GaUmPftLnsXIycHm4CBxP6zF8BsEQF9iaWz9zCD2MICrhJblk8Ds1kEVCT6lp1hA
  bF5BbwlNrybA1YvIaAgMeXhe2aIuKDEyZlPwGqYBSQkDr54ARTnAKpRlJg9XR6ivEri7OwvTB
  MYeWYh6ZiFpGMBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdY11DSxO9xCrdRL3UUt3k1LySokS
  grF5iebFecWVuck6KXl5qySZGYCClFDIf2sH45PUHvUOMkhxMSqK8U6alJAjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4D2klZogJFiUmp5akZaZAwxqmLQEB4+SCK+NBlCat7ggMbc4Mx0idYpRU
  Uqcl0sPKCEAksgozYNrg0XSJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvDIgU3gy80rgpr
  8CWswEtPjKo0SQxSWJCCmpBibe938q6z6vvfty3ea4onWC1fMVHs5uX9uw47i7i+TvSYtDeTX
  EV8u63PgTcmBO3DonjZYYbr4fr6uUHe2YJ0tvyzYNj+o6fqBKSW2ysTKbSNXV1Ia5cc17OD/c
  FqvLTP+sl7t0Y4PfjdaihV5lvsKn2xtL+beoccasM1jgds3vi9xf6Y9nvY8nfNjscr/m7rePn
  +blHGec63Cg0iklxSVi8QdujXYtHYNd90W6vX74FUZNnvr4MMMK72cvHsb/bznBcb5yfvy1nK
  uBtvLHliqf3zu3WZH7CPuSgK1rfgpVB06p2pfeuubmzebK132Lgm9tTtxzpUP9critfUrHFKZ
  I5TXfSlO8fJecTKjtXajEUpyRaKjFXFScCABeFPHXHwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-232.messagelabs.com!1617243991!537146!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19261 invoked from network); 1 Apr 2021 02:26:32 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:26:32 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312QVNB023770
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:26:31 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:26:30 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.4 -> 1.0.8
Date: Thu, 1 Apr 2021 18:58:14 +0800
Message-ID: <1617274694-49897-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.4.bb => lldpd_1.0.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.4.bb => lldpd_1.0.8.bb} (94%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
similarity index 94%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
index 8fdaf848f..bd94c0919 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[md5sum] = "33e8d58623f99184e4e709cbbfe45db3"
-SRC_URI[sha256sum] = "5319bc032fabf1008d5d91e280276aa7f1bbfbb70129d8526cd4526d7c22724f"
+SRC_URI[md5sum] = "000042dbf5b445f750b5ba01ab25c8ba"
+SRC_URI[sha256sum] = "98d200e76e30f6262c4a4493148c1840827898329146a57a34f8f0f928ca3def"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.25.1

