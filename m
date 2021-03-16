Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.2683.1615858999821245053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id D2/DF-07430-53D00506; Tue, 16 Mar 2021 01:43:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqmvKG5B
  gcHu5iMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFj7XHGgj6Oijufd7E0MK5j72Lk4hASmMkk
  MX3jYSYIZzejxKem62xdjJwcbAIGEvvPXmAHsUUE9CWWzt7D3MXIwSEsYC1xdGEpSJhFQFXia
  csGJhCbV8BLYvLv54wgtoSAgsSUh++ZIeKCEidnPmEBsZkFJCQOvngBNkZCQFFi9nR5iPJKib
  lvFjJNYOSZhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdY10TQ31Eqt0E/VSS3WTU/N
  KihKBknqJ5cV6xZW5yTkpenmpJZsYgUGUUshkvIPx2usPeocYJTmYlER5/ZgDEoT4kvJTKjMS
  izPii0pzUosPMcpwcChJ8B7jBsoJFqWmp1akZeYAAxomLcHBoyTC+xMkzVtckJhbnJkOkTrFq
  CglzpvPA5QQAElklObBtcGi6BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5jkPE8mXklcN
  NfAS1mAlpsKO0HsrgkESEl1cAUZr3xar7JvYNr0+aaxutfq/PtPxdRupt7mu2H5DufLzDNiKx
  v2tL80JS71qpAbM68K98KfA+LtykJKnp6/Nq3SJ256BjHe47uzxcnlP/YN29eJbcW43zZK/vX
  VEg1/Zj4bdHKqHs1hwOa1Jas9S++HC63qVjLuiRAQn7Nuyju7R+lQmp/qO39ZSEixsChe0V14
  n4Xs56pv3t/e+/8M1NhruKxHikGqXT33hniJdsnpaw4fjr2bd/TpgPu7fsMxC8LzHiiWPt0Qp
  P6vRuSlVoyz7ynsGrmO6h3r7X8mn3+xfmyJhO/Pw++HHCZHV1z4MQdAeWglA2++/rSvDZFPNt
  haLc0YakO+3YBuy/ZkWpKLMUZiYZazEXFiQDPfg+4HQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-228.messagelabs.com!1615858996!2125736!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20439 invoked from network); 16 Mar 2021 01:43:17 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:43:17 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1hGsT021272
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:43:16 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:43:14 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.36 -> 0.37
Date: Tue, 16 Mar 2021 18:43:08 +0800
Message-ID: <1615891388-3480-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.36.bb => satyr_0.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.36.bb => satyr_0.37.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.36.bb b/meta-oe/recipes-support/satyr/satyr_0.37.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.36.bb
rename to meta-oe/recipes-support/satyr/satyr_0.37.bb
index b6988baa76..4630eb0210 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.36.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.37.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "a1f232b7dbca7ff787076fcfb63ce7d7fb15b753"
+SRCREV = "4a7d0a31cdeee23bb13739f57926188a795bdf25"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.25.1

