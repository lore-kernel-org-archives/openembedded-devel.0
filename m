Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.3364.1627007047919603785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KFzBSIQq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627007046; i=@fujitsu.com;
	bh=/EaWV94pbCS0iCLsEq08sMamTfQ+UIG1Fj14B5naxPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KFzBSIQqq+OqcqijJzhotodS43fWtfAl9P983Pou9Heg7MjctrJTmPvf6j2M8kVLP
	 ZIrp/4EMv27yV9z557EqTpzN3niMnxIvPSV3y1xRuk5DsoA1n4VB33gIhQ2V1gTr4e
	 K8YuWGMV+HsZWgxJCo3x95kD+wh4zZTOSEzhISgD558KPW6BHOkCZSPlDJiw1flDL1
	 npKynHdPYjohVcnazemU+AP/FN84eRw6pt+rL7Ridm9Bd/i39YkGTz1VblIpMaOy7K
	 HdnPR3jOZnzEl+dw78uBdUT58WsrqJj1K3M4/9gGmnY05ivfX8WcJqDJNDSz8FiWkU
	 EesaGrplgrG3A==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 77/3F-07800-5482AF06; Fri, 23 Jul 2021 02:24:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYouuq8Sv
  BYEYXk8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFl21nmgp38Fd/6rzM1MP7k7WLk4hASmM0k
  cXvpJVYI5wSjxINfjcxdjJwcbAI6Eh0vullAbBEBfYmls/eAxYUFQiWmTlnBDmKzCKhKzLv/h
  w3E5hVwk5jcsQSsRkJAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gVUjaLE9p1nWCDsCokZM7axTW
  DkmYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLYHYxEQvsUo3US+1VLc8tbhE11A
  vsbxYr7gyNzknRS8vtWQTIzCQUgoOTNjBuP/1B71DjJIcTEqivFKHfyYI8SXlp1RmJBZnxBeV
  5qQWH2KU4eBQkuBdIfMrQUiwKDU9tSItMwcY1DBpCQ4eJRHeUgmgNG9xQWJucWY6ROoUo6KUO
  O9RNaCEAEgiozQPrg0WSZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNWqABN4cnMK4Gb/g
  poMRPQ4lNdP0EWlyQipKQamDpzZBOtOyLq+db2KTYYb7mxY4bzgoUXsnxTXBd6P3N7c2RlXel
  VUaGjz56G8wlYGz7ui/aPOt356/Eyn5MnLEJ+eykxPmo7d+159a+HyQqNr/I2qP9lmbJZ4fqT
  lQe5y8Umnrw/dcknD5UZCv91hH3aDRavrOGySU899c56r6Tq1mklC3L1N4mti5OyrGicc7GV4
  cu17A3nHwRFrHvE9Sf6nH3q1Os8HT+udTFwpX6rDlx1ZqnShZCm/KP3nsm+Xtn7qlZcy95TPP
  TzWS1p91mT0nteX91/xGXdHUfHiC+r/6X7Tz5RvdPSU2JBTZZRU2th6kvltSqPLrz7/mHnY9/
  Moy87ZzyK2bh6pVTJB2ElluKMREMt5qLiRAAzna6RHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-265.messagelabs.com!1627007044!96096!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28402 invoked from network); 23 Jul 2021 02:24:05 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:24:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2O4LP010438
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:24:04 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:24:02 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-bitstring: upgrade 3.1.7 -> 3.1.9
Date: Fri, 23 Jul 2021 22:23:54 +0800
Message-ID: <1627050234-7117-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2016.

July 20th 2021: version 3.1.9 released
(version 3.1.8 was pulled due to serious issues)
Another maintenance release.

Fixed a couple of outdated results in the readme (Issue 214).
Some more documentation tidying.
Turned off some debug code by default.
Fixed a couple of failing tests in different Python versions.
Fix for consistent pos initialisation semantics for different types.
Change to allow wheels to be uploaded to PyPI.
More work for LSB0 mode, but still not finished or documented (sorry).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...python3-bitstring_3.1.7.bb => python3-bitstring_3.1.9.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_3.1.7.bb => python3-bitstring_3.1.9.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bitstring_3.1.9.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-bitstring_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_3.1.9.bb
index eae8275d6d..9c80013eb5 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_3.1.9.bb
@@ -2,10 +2,9 @@ SUMMARY = "Simple construction, analysis and modification of binary data."
 HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 AUTHOR = "Scott Griffiths <dr.scottgriffiths@gmail.com>"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d973e8e0c311da41424357236b7b8908"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7f2fd3f1cd52b5ccd39d76fb3568d3f"
 
-SRC_URI[md5sum] = "18661a3e5c47c59bd926dd0fefae0baa"
-SRC_URI[sha256sum] = "fdf3eb72b229d2864fb507f8f42b1b2c57af7ce5fec035972f9566de440a864a"
+SRC_URI[sha256sum] = "a5848a3f63111785224dca8bb4c0a75b62ecdef56a042c8d6be74b16f7e860e7"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.25.1

