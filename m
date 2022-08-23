Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709E1C32792
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:36:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.29454.1661243791053460103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CX4Tamfr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661243789; i=@fujitsu.com;
	bh=1IgGePIIQYpatrkmargpHi8uGMcLRSssBGmPgrgO2Zs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CX4TamfrK06ZsifvrhbhALWCzYxRj1qWWrYv1PyaA9r+IBOg8dPbci0iFjsmHjMsn
	 DWJymjZVoWYfwDT06DjaXGb8UoIxpIXkUGvTAsRevGVZYw069r5GNB5qE9mbMWKToM
	 Jgk2vXmRnRCYQxK97NpY4CY1CieGIuPzOWz02sluzK1qcZwMnVmIOwEzUuLo50EsGY
	 JTUCNw8Oao3Liq5rk2jR/kbqS9G5xdALNykVvNak/+6EuimwSbzmjAgZyYKIZ5ZfL+
	 kSiY2kD0J40J8skn/RVcYTOPjhXLPpVX5J3yA43pxB6Ok1/5xccldO1YO9e17mIoM7
	 YOQkRD4ouRCOA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORpNszkSX
  Z4PdtVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePw0g6mggcSFbdvbGVpYHwt2sXIxSEk8JBR
  Yvby8+wQzlUmiRdvb7BBOHsZJZ6+nAGU4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphARuJqxfusoHYLAKqEl+W97F0MXJw8Ao4ShyfLQQSlhBQkJjy8D1YK6+AoMTJmU9YIMZISB
  x88YIZokZRYvblZhYIu1Jiz6x+JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGq6SizPSMktzEzBx
  dQwMDXUNDU10DXSMTY73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCgTClm
  +LyDcUHfT71DjJIcTEqivA71LMlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHg9+oFygkWp6akVa
  Zk5wAiBSUtw8CiJ8OpPAErzFhck5hZnpkOkTjF6c1y9cmUvM8fU2f/2M3MsB5Mzv7YdYOZo39
  4FJDftA5JCLHn5ealS4rx6ICMEQEZklObBLYBF+iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIx
  KwrwHQe7kycwrgbvjFdCJTEAnBu1mBjmxJBEhJdXAtP7G5TrT+6rbT/z9MHvxbwVtpViBWyvX
  qsWLcd//9sWec7LxK++ZW+KKWXX4Zy5bp1Sbsb8gZNs/90VFlqbPMtXTu/aYm+m0cHzMXflLZ
  3fojGfrNFzv6D41sCvdIZl9hIV//eSgIytKsnf3bFndett8t7T3tOvqR202yGn9lS+b8v5S3V
  25aQz2HyPqmFuercvTXfTN/M9dnti8aV/aTD72PfdcyCgwY1f5iXWri1oSkzh/vNTaeFdBw7A
  gKCvWc87ya+f9f35kSp/DbXpJ5+2OdT2rTnJ7G0yzq/9n8X+rvqRD1lXDJ7ubzS+uafjmYvvS
  y8y0aKP/25/T0+O/vDx94/8rmVu3L25d7snEUq3EUpyRaKjFXFScCACDHMUQbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1661243788!44476!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26354 invoked from network); 23 Aug 2022 08:36:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:36:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3C56C1AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3095F1A3
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:36:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ade: upgrade 0.1.1f -> 0.1.2
Date: Tue, 23 Aug 2022 16:36:05 +0800
Message-ID: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98377

0001-use-GNUInstallDirs-for-detecting-install-paths.patch
removed since it's included in 0.1.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tallDirs-for-detecting-install-paths.patch | 39 -------------------
 .../opencv/{ade_0.1.1f.bb => ade_0.1.2.bb}    |  6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
 rename meta-oe/recipes-support/opencv/{ade_0.1.1f.bb => ade_0.1.2.bb} (79%)

diff --git a/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch b/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
deleted file mode 100644
index f038b0aa91..0000000000
--- a/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 67ccf77d97b76e8260c9d793ab172577e2393dbc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 21:33:46 -0800
-Subject: [PATCH] use GNUInstallDirs for detecting install paths
-
-This helps with multilib builds
-
-Upstream-Status: Submitted [https://github.com/opencv/ade/pull/19]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sources/ade/CMakeLists.txt | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/sources/ade/CMakeLists.txt b/sources/ade/CMakeLists.txt
-index 2d1dd20..46415d1 100644
---- a/sources/ade/CMakeLists.txt
-+++ b/sources/ade/CMakeLists.txt
-@@ -47,12 +47,14 @@ if(BUILD_ADE_DOCUMENTATION)
-                       VERBATIM)
- endif()
- 
-+include(GNUInstallDirs)
-+
- install(TARGETS ade COMPONENT dev
-         EXPORT adeTargets
--        ARCHIVE DESTINATION lib
--        LIBRARY DESTINATION lib
--        RUNTIME DESTINATION lib
--        INCLUDES DESTINATION include)
-+	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+	INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- 
- install(EXPORT adeTargets DESTINATION share/ade COMPONENT dev)
- 
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
similarity index 79%
rename from meta-oe/recipes-support/opencv/ade_0.1.1f.bb
rename to meta-oe/recipes-support/opencv/ade_0.1.2.bb
index 48a45143db..93b14ad4f3 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
@@ -4,11 +4,9 @@ and processing framework. ADE Framework is suitable for \
 organizing data flow processing and execution."
 HOMEPAGE = "https://github.com/opencv/ade"
 
-SRC_URI = "git://github.com/opencv/ade.git;branch=master;protocol=https \
-           file://0001-use-GNUInstallDirs-for-detecting-install-paths.patch \
-           "
+SRC_URI = "git://github.com/opencv/ade.git;branch=master;protocol=https"
 
-SRCREV = "58b2595a1a95cc807be8bf6222f266a9a1f393a9"
+SRCREV = "1e02d7486bdb9c87993d91b9910e7cc6c4ddbf66"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-- 
2.25.1


