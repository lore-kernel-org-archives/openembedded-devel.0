Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06B9C76196
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:15:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.65220.1679544905142462092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BfBHJBLM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679544903; i=@fujitsu.com;
	bh=2U3fkW1aQLDlOnxSJwjmR3LNHFRA/Rws0J0S64OyVKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BfBHJBLMu2Za5bNkd/jbCikFmJ5ukvpRrP5q9hojE6uNk/pYYSKqXt63Ak5KtM6VT
	 fRQ4RAgz3Lpwbx0A7falAlboG2WRtLqvmqD0zZzC/GUe2FJjJqBEFYGHTuao85O/1z
	 ezGPUho2+YsaInJOwMapqCa5V7H6+ct2IIdVLqqE+ewZEl8qtW+wIHrneyCk858sC2
	 g/ypIgox2GiozuWObYeo2lNgeWj4loPpYX4+PyZ6z1urx6S1yBn7FMWFv60PqLZXGh
	 YA7ggnJ9jQY2nzFbaO1BsshVRKZ5X4Wy7N0FE7B4+/a4xWwObxS/yXdkDzO824UYk3
	 3nDkkGAOXZ67Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWdf9knS
  Kwa5dLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ax5deYC37zVMxd+5OlgfEpdxcjF4eQwANG
  iWlzr7FDOFeYJB6/esbWxcgJ5OxhlFjf7wNiswlISdy4/x8sLiKgL7F09h5mEJtZQEXixe8ed
  hBbWMBHovHnZrAaFgFVibOTt7CC2LwCThKLGv+CxSUEFCSmPHwP1ssp4Cwxd1I3M8QuJ4mWNb
  3MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdM30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDN6VY/dcOxpl9f/UOMUpyMCmJ8kqESqcI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDVu
  QiUEyxKTU+tSMvMAcYRTFqCg0dJhHfuQaA0b3FBYm5xZjpE6hSjopQ4byxInwBIIqM0D64NFr
  uXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzzjgPNIUnM68EbvoroMVMQIvjZkiALC5JREh
  JNTAFllxcw798B+P9jQaZq0zWBq1xUX543Jfjo1dQyHymnt+5Yt06SzV+eH2IOxJ9yfjTuo0z
  vtrf/fDRaMKHIpnrkzz1/gpbeBQHeTAsi/6x6OHCDVxlWe4Lf081v1hhu1Nn6+L1ETv3Rqas8
  HqXlpxeEaBoXfOvuFJR476x/uP3q/iCxXnqGazer0kt/bVm2dV9U+TzuRKynY+s4fa5sYr/7+
  wivRNcs45y66/UnSfBpfHZ9uNvc2PbdU78n66+Oci78YyzeofSgSILn85frOqHX6drmXG+No6
  Zt6Xw0vMb929fyD0/59NKrznFrOoLFDi9D/1u7Iz1/La33Opt2eJ3c5/qME4ztpnPkJN81+Ke
  EktxRqKhFnNRcSIAP1+2mVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1679544902!760517!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5983 invoked from network); 23 Mar 2023 04:15:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:15:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C4DE573
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:02 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B80A6153
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:15:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.2.0 -> 3.2.1
Date: Thu, 23 Mar 2023 12:14:38 +0800
Message-ID: <1679544881-19951-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
References: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101643

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: delete empty line at the end of the file.

Changelog:
==========
 add missing server.start(). (#1443)
 Don't publish univeral (Python2 / Python 3) wheels (#1423)
 Remove unneccesary custom LOG_LEVEL check (#1424)
 Include py.typed in package (#1422)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.2.0.bb => python3-pymodbus_3.2.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.2.0.bb => python3-pymodbus_3.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.2.1.bb
index d792fdf970..5b3ea1bb77 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.2.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A fully featured modbus protocol stack in python"
 HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "5769ac9a00ffc154e1761c69299c1968dcab1c2a61741b1caff89c4aea81dbcf"
+SRC_URI[sha256sum] = "2a0c82651a7eb96c784493b5fc26ccca26ba8e9530258d811dab50b87ce132de"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


