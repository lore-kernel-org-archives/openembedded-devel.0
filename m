Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.5375.1625794706520232673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XU/DG7YB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794704; i=@fujitsu.com;
	bh=wkZgrlf9isHBwAd1sJWmcTNctaaGC/xB4EVQQzzDT6w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XU/DG7YBtDKizEJvy4oCaL7tNdGJGNmAnR0p0eQr5l9XowszrQFhrMrZReTs0OgHh
	 Kyda7WonzfGdpzu0WdGV/BXuXqiokMaNdzESdYIpEttz9Zjb5uMj65uVIktPFaL+LT
	 eFOsvo2v46aI5nbzMY7+pUxXghEAE2x5g2sE1h3iRsY354SWjHGCFt2NN2WCMXM0HU
	 KJGMc6kYHrPIVxsGrCZ5bzJ1RpoIhyMiuRYURhPc0wZeXj5qBUYj3+TTnqsIvtinhs
	 J1qzqO8L8LeyfVsmncWzWC+ITSwkI+rssAPcIB+yxY0eMBHiM3yUJBO8URU9snov2F
	 byvV7qVeuqRCA==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 6C/38-07224-F88A7E06; Fri, 09 Jul 2021 01:38:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYotu/4nm
  CwcOv6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zr5zz2gmM8FR/ud7M0MK7i7mLk4hASmMUk
  sXHvOSYI5zijxMy2n4xdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAp4S86d8A6thEVCRmLrgI
  zuIzSvgLnF1+gowW0JAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gUzRI2ixPadZ1gg7AqJGTO2sU
  1g5JmFpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11zXWNTI30Eqt0k/RSS3WTU/NKihK
  BsnqJ5cV6xZW5yTkpenmpJZsYgaGUUsj+Zwfj9dcf9A4xSnIwKYnyas14niDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgvfIEqCcYFFqempFWmYOMKxh0hIcPEoivJyLgNK8xQWJucWZ6RCpU4yKU
  uK8wcuAEgIgiYzSPLg2WCxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMq7McaApPZl4J3P
  RXQIuZgBYzHH4KsrgkESEl1cAkpX6lbQ37eeET4ev+/nu37HLStjgrncyqecVyjB/l43a/XzL
  T5cLr2lsp5j4Sux+0H36vs3rzjVsrKhMFj9numrPHTLNzroNRy8/QFr/ZDTFKpakLdV1MwxfF
  SKz9WPQi+0VY7/SCo/wSavcean0RmsbmHLJ2qaW8mMLLeV+sTqh6zrNoaXz4evt5K5OeWNHPF
  +cvvh2qWhnTOMfY6kPhpgOCjy/H5K0IuZtr9lRBfNNv/4QP2YI9C7MY6uvORos+aTt74fJfBd
  nSC03Zr/Nl5kz4cyT5wFu7fZwrj343uFUzvzpN953pRBHB2LQrcsFuEpxd61bOs2Pe4Wky+dE
  1870PbwdlNHEfnNjwzFtViaU4I9FQi7moOBEAiaFlfiADAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-248.messagelabs.com!1625794703!94846!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15437 invoked from network); 9 Jul 2021 01:38:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:38:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691cMPp023427
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:38:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:38:20 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyusb: upgrade 1.1.1 -> 1.2.0
Date: Fri, 9 Jul 2021 09:38:14 +0800
Message-ID: <1625794694-29700-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Added:

core: implement Device.__eq__() (#147)
Changed:

libusb0: implement is_kernel_driver_active() for FreeBSD and DragonFly BSD (#365)
libusb0: implement is_kernel_driver_active() for Mac OS (#374)
Fixed:

setup: prevent installation on unsupported Python versions (PR #364)
control: fix undefined USBError (#372)
tests: fix legacy/hardware tests for Python 3.9 (#373)

Add runtime dependency to resolve errors that occurred when import usb.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-pyusb_1.1.1.bb => python3-pyusb_1.2.0.bb}      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.1.1.bb => python3-pyusb_1.2.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
index a8c7031b65..06f7c1c82b 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905"
 
 DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38"
+RDEPENDS_${PN} += " \
+	python3-logging \
+"
+
+SRC_URI[sha256sum] = "d68597d2cf7df766bdf816b1a337b72ab8233c19825e170ae18714f16b838cbc"
 
 inherit pypi setuptools3
 
-- 
2.25.1

