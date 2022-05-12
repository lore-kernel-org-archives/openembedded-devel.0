Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33115C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:18:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.2075.1652347096672920542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cn2ArapW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347094; i=@fujitsu.com;
	bh=dZYWtRUGVYfjkVUREAdvqD90n9SHdoO7FQnr/U9M0kM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cn2ArapWtx8daphgVmFmInBH7kr4WwkA8nAv30LzYTDQmJKEa7cvLo+lB5Wii+PXh
	 1GyoiswtMenrDlNcMfsZSaTMHDEw3b7tga8uJttp1fhefn897AwlGJwFGFiAs+5syv
	 NVEkqLw/3PL/AlaTC0BD3A0XpwUCpwpw+/xcmTwNaLYxBT+NocUZ6oTzbkaUTq+lre
	 9TN2ZfSvzxicrSyIDOojz94ojkq5usYc/u3c1e+EWvfqWFgWkuEppyk6knyGMpghNJ
	 AJXfoW+h4jg6eo6xaPVUdkYJrRf3Sml4OpautggxxOM4xtT3a8SLU6W0tmXZVtcTiH
	 nL6IKnQ3MG3TQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRWlGSWpSXmKPExsViZ8MRonvtQk2
  SwZalchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bR924FrdwVV7+/Ym9gnM7VxcjFISQwm0ni
  6O1XTBDOAUaJ3slXGLsYOTnYBPQlNq77xARiiwDZS2fvYQaxhQU8JRafO8UKYrMIqEqcefUNr
  J5XwEOipXkemC0hoCAx5eF7Zoi4oMTJmU9YQGxmAQmJgy9eAMU5gGoUJWZPl4cor5B4ffgS8w
  RGnllIOmYh6VjAyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2ELX0MRAL7FKN1EvtVS3PLW4RNd
  IL7G8WC+1uFivuDI3OSdFLy+1ZBMjMJRSitV6djCeWPVT7xCjJAeTkijvufM1SUJ8SfkplRmJ
  xRnxRaU5qcWHGGU4OJQkeHeeA8oJFqWmp1akZeYAwxomLcHBoyTCWwyS5i0uSMwtzkyHSJ1iN
  OY4fOXKXmaOhxtv7GUWYsnLz0uVEuf9sA+oVACkNKM0D24QLN4uMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmPQ1yK09mXgncvldApzABnbLftRLklJJEhJRUA9NUoedPZypdCXXSePL56eP
  LZwMl5nx8HCtYGPt4e1be1vmqrwN01zvHrw5XO3Z9x42Ub4cMT7Ne7OnxZt185MCEJUqnWXRK
  Q37f2zdZOl91nZh5wK5ffJO8Zqxans8e83Lu56vF1QbT30xrP6SXwbFCozNp3Z515Ra5nZ8vn
  HWTzC4vZtavCLCf5n9BVdQrun5D7VPD2C/fo25kmjaFBm38drjryFWpvOLq8sbI62fVfT6ZTT
  7Z5BD4M3JJ38uah7VdF+8+T3JU/BnGeX+WSHrZaanZ9qf3qBRlSk5o0vMJ/LeY5Z6Cxy92Wa6
  ne7a/tLmXLPKI+2hLlNOSezXqtacUfFqP7Qu4HJT+/fKNj1+UWIozEg21mIuKEwH2TQhzMgMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1652347094!166021!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20920 invoked from network); 12 May 2022 09:18:14 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:18:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 24C9I8Yg012210
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:18:14 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:18:07 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-booleanpy: upgrade 3.8 -> 4.0
Date: Thu, 12 May 2022 17:17:53 +0800
Message-ID: <1652347073-16575-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97067

License-Update: remove year from Copyright

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-booleanpy_3.8.bb => python3-booleanpy_4.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-booleanpy_3.8.bb => python3-booleanpy_4.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb b/meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
rename to meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb
index a1ce7eafc..41fd3d960 100644
--- a/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb
@@ -2,10 +2,9 @@ SUMMARY = "Define boolean algebras, create and parse boolean expressions and cre
 HOMEPAGE = "https://github.com/bastikr/boolean.py"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9b58494d4f385978ca5a7ef4f6abca53"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d118b5feceee598ebeca76e13395c2bd"
 
-SRC_URI[md5sum] = "83ccc145ba74a585637124c8bc648333"
-SRC_URI[sha256sum] = "cc24e20f985d60cd4a3a5a1c0956dd12611159d32a75081dabd0c9ab981acaa4"
+SRC_URI[sha256sum] = "17b9a181630e43dde1851d42bef546d616d5d9b4480357514597e78b203d06e4"
 
 PYPI_PACKAGE = "boolean.py"
 
-- 
2.25.1


