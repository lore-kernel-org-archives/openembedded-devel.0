Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFA1C47093
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.7902.1649746986471924898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J0mNld/2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649746984; i=@fujitsu.com;
	bh=53iukDX8wOcbzmFuBnk0xRcoVx4kkrjCQxSECHlXoPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J0mNld/27akim8a3R1SKTlAN7ZNgxhEfotl/IlCicNoVPqiX2IVv6k8Q3TKE2e5sb
	 wl7Qn2tCGYokMafPGcI+b9GPZFoPcgCRAeLLjgl10VoeJFsQkTWd1cqFMjn9EEnfvW
	 rwqHRF0WXsN9UqqclkQlzqHWeKKM/NumLR22opAQsDWMwcq/NH5k+6SNUfpBKplPbv
	 DmvLT6OnJ2MxK7zTioqi1bqFnaBXc793oDCRvHDfi1iuE6gJqrZMyLqJ1rOGAYpyer
	 u7+Ke4XCPvhNrOfmhesXnZNf0ZUTwB0KzkzJLhTx7cFDy2Ws+3Fj7wYYjoSV3pGxUg
	 RFOEgCr95ECGw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxRVdFJTT
  JYPIHE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePs2Z1MBa85Ks53NzI3MPZxdDFycQgJzGaS
  WN10hhnC2cMocfHfO9YuRk4ONgE1iem3boDZIgL6Ektn72EGsZkFVCRe/O5hB7GFBWwllj9sY
  AOxWYDiP9a9YgKxeQUcJfquvGcBsSUEFCSmPHwP1MvBwSngJLFkvi9IWAioZMrzq1DlghInZz
  5hgRgvIXHwxQtmiFZFidmXm6HGVEjMmtXGNIGRfxaSlllIWhYwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NtI1NDLTS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMqUYoW6
  HYzXVv7UO8QoycGkJMprwBOaJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV1kZKCdYlJqeWpGWm
  QOMEJi0BAePkgjvdwWgNG9xQWJucWY6ROoUo6KUOG84SJ8ASCKjNA+uDRaVlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ89qBTOHJzCuBm/4KaDET0OLQbYEgi0sSEVJSDUzLCvK3RJU3hKQ
  dejr7RMDRPe1zDcXcWern1f94XXrvr8Tbl6bvFv5Y+dFmRuZOI42IpPdxbwsCni3pT9qjIi5z
  nlX+O1vAP57Hc/qF1t1brf5U3uxwqfQlv7a82oV5MZ4H5V5yzmCPdVN9GR2/WKU1roH9Aou1U
  5LRwdBvKSnPThTp2bcc6rimUnBr6Yvj29eXuN3hlRc4tfTQ1jqFI8VPJSvdHmb0MNU+3FfJ/1
  qjoHkay1rZ2Z17Zp1u2qP6+OU1hl3xvkVXUv1V+z0ET9/2CD/37dWeklvZtxZsvCK/YcLGnpd
  Nh2YJ/VwdIbxzwqXNk3O6HL7tW+N385ru8QA+D73NRVetw44cZKxf4xKqxFKckWioxVxUnAgA
  NHDzzUUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1649746980!40667!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2202 invoked from network); 12 Apr 2022 07:03:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 07:03:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23C72vF4017796
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:03:00 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 08:02:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mpich: upgrade 3.4.3 -> 4.0.2
Date: Sat, 9 Apr 2022 21:59:33 +0800
Message-ID: <1649512774-4814-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649512774-4814-1-git-send-email-wangmy@fujitsu.com>
References: <1649512774-4814-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96580

Changelog from 3.4.3 to 4.0.2:
https://www.mpich.org/category/news/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_3.4.3.bb => mpich_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_3.4.3.bb => mpich_4.0.2.bb} (95%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.3.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
similarity index 95%
rename from meta-oe/recipes-devtools/mpich/mpich_3.4.3.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
index 52648eb18b..42adcc2089 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.4.3.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8154d89f3051903181018166678018155f4c2b6f04a9bb6fe9515656452c4fd7"
+SRC_URI[sha256sum] = "5a42f1a889d4a2d996c26e48cbf9c595cbf4316c6814f7c181e3320d21dedd42"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.25.1


