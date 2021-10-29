Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1D3C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 05:31:11 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.1672.1635485470495614283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 22:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NoV6lfJ8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635485468; i=@fujitsu.com;
	bh=+jcU3mUyI00JjMa9XQ8qwLZIA8S2MMB13ksHBfmrmfI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NoV6lfJ8MLv9BykEqPqUA7JjMlFGLE1s723bClBxM+faU81Ydbhxxgzr3SlEKeG9t
	 ayHzsVOh5iPyA+im7Vc/MTG0gOqYeJIH2lb5OBLBkq2bpAd0yk4rdghqBV3johibnO
	 M3jqeIzC0KCvejf4TnPy5EDrpF5YXt5qOIfewDfaLoYSe/dAZFU4IO/YgOosSd/gk+
	 gUtARCf1aozk6OvOelyhYGfXEM5AHAfuSLRT0+ExVbt7hdnwTtAyUON1Vk3Y1+GRxC
	 t2gqFBHuFQwiuP01S7wwrXsgcDDjQvh18aDTT4+1YwBypuKRPbonU/RQDDy0WUKEHj
	 8LXm6NzCI0XKg==
Received: from [100.113.4.229] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 0A/3B-01506-C178B716;
 Fri, 29 Oct 2021 05:31:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8ORqCvdXp1
  o8PGPhcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF7ynrWgtkiFdvWHWBvYNwh2MXIxSEk8IRR
  Yvb9DmYI5wKTxK+HrewQzglGiX23Wlm6GDk52AR0JDpedIPZIgL6Ektn72EGsYUF/CQmzXgMF
  mcRUJXYs+4kO4jNK+AusbShmxHElhBQkJjy8D0zRFxQ4uTMJ2D1zAISEgdfvGCGqFGU2L7zDA
  uEXSHx+vAlqLiaxNVzm5gnMPLNQtI+C0n7AkamVYyWSUWZ6RkluYmZObqGBga6hobGuqa6Ria
  GeolVukl6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMDgSylk/biD8dDrD3qHGCU5mJRE
  eZOzqxOF+JLyUyozEosz4otKc1KLDzHKcHAoSfDuTwHKCRalpqdWpGXmACMBJi3BwaMkwivfB
  pTmLS5IzC3OTIdInWJUlBLnvdsKlBAASWSU5sG1waLvEqOslDAvIwMDgxBPQWpRbmYJqvwrRn
  EORiVh3t81QFN4MvNK4Ka/AlrMBLSYWakCZHFJIkJKqoFp8v83nfqCu80u153dm3GuWd94dXg
  s60QZzaUvHoo/XifudrPx5Y6M/JYkrzWOa98Kx3hvT3i4bLXKnMM2ZU9TGi7UXuN5NGv71T0r
  /ghINn95uGNVj/GzdbebQr7ubN9o3nB6dbZ1UlXQ9E89DO/3q86YbHKlaJ5oo+ypK1tUt7uuz
  DL31GE8l1R+/H179vHM3TuWvgt3XF23of4tf7CNv9hrDq15e4MzbrJutKpmEVybLde72+XVC6
  M16vrvxT+kqc3+c2dThlJf8b/6A+2Rb+aK8d75u6k0W4RdXKvw/MvKbOnQ7f4HT/K57+IN98s
  /y3Nz3eEVzQG+ftOztxmdsHu09LCwmWPH803rVj19oMRSnJFoqMVcVJwIANrP/C05AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1635485467!174107!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32435 invoked from network); 29 Oct 2021 05:31:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Oct 2021 05:31:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7038E1009DE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 06:31:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5596410025A
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 06:31:07 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Fri, 29 Oct 2021 06:30:55 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH v2] python3-smpplib: upgrade 2.1.0 -> 2.2.0
Date: Sat, 30 Oct 2021 01:30:51 +0800
Message-ID: <1635528651-24541-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 05:31:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93643

License-Update: README.md is modified as follows
- client = smpplib.client.Client('example.com', SOMEPORTNUMBER)
+ client = smpplib.client.Client('example.com', SOMEPORTNUMBER, allow_unknown_opt_params=True)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/python3-smpplib_2.1.0.bb           | 24 ---------------
 .../python/python3-smpplib_2.2.0.bb           | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
deleted file mode 100644
index 56d8f9eea..000000000
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "SMPP library for python"
-SECTION = "devel/python"
-LICENSE = "GPLv3.0"
-LIC_FILES_CHKSUM = "file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
-
-PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-unittest \
-"
-
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-	sed -i 's/mock/unittest.mock/g' ${D}${PTEST_PATH}/tests/*
-}
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
new file mode 100644
index 000000000..00a493914
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "SMPP library for python"
+SECTION = "devel/python"
+LICENSE = "GPLv3.0"
+LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
+
+PYPI_PACKAGE = "smpplib"
+SRC_URI[sha256sum] = "3d513178a35573f66faac4ef2127c4bd73307ddb463d145b17b013cf709d9ddd"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN} += " \
+        ${PYTHON_PN}-logging \
+        ${PYTHON_PN}-six \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-unittest \
+        ${PYTHON_PN}-profile \
+        ${PYTHON_PN}-mock \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/smpplib/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


