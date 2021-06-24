Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web08.1600.1624500477840337238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ejsf83TN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500475; i=@fujitsu.com;
	bh=vYAsXhtEldWTWLRy4+BEZQo+MrbkdhUum/omMwRJlHc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ejsf83TNsC8cZA8mPktxpSHOvePqVddWxRQLX4Qz6ogB0XMB83vWV6LLQ+hdIHDgS
	 1S37CnmYcjRVFUo7Pd/lea4KIBJQjKpD+fxGyoRbu1+wh12hiyxOZXcxpApTsI6lcZ
	 wrpSCT03nhOyYMK3BlLhPReYOgy73Ssellgnxo7aRnlwJDG19382fbhsN2FdWyYKsf
	 gmMY410hTXire96HF6fEn3q9wFapkcyErIH/aCDCItk2SKGoNNAN5Ob55J3urS/MJx
	 D9CTwj39qH0KQXrNZuB3sOtOFgr0Hu/xES3+MeCId14PrtVRklVzr4Etci3nsWr/+V
	 AoW+QaPYx0HPA==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 56/BD-14259-BF8E3D06; Thu, 24 Jun 2021 02:07:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1f394nK
  CwYOJrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRJ5uZCvq5Ky7M2sDawPiTs4uRi0NIYDaT
  xOnVnYwQzglGiWl33zB3MXJysAnoSHS86GYBsUUE9CWWzt4DFhcW8JQ49vYdG4jNIqAqcW7WE
  0YQm1fAXWLp6xdMILaEgILElIfvmSHighInZz4Bm8MsICFx8MULZogaRYntO8+wQNgVEjNmbG
  ObwMgzC0nLLCQtCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa65rqGhlb6CVW6SbppZbqJqfmlRQ
  lAmX1EsuL9Yorc5NzUvTyUks2MQJDKaWQ9d0OxmevP+gdYpTkYFIS5S1tv5wgxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYI3HBicQoJFqempFWmZOcCwhklLcPAoifBaPgFK8xYXJOYWZ6ZDpE4xK
  kqJ83aC9AmAJDJK8+DaYLF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw79lnQFN4MvNK4K
  a/AlrMBLRY4fdFkMUliQgpqQamHN3vjfUnD7u8M/U2fxe6z97m64sTdt8sUgo9l+1RLvm87L3
  g169sNdN/tdsarr5+hd1Yt/eYBPNNH8u64P6766fdE7G6W8jgcLz48mkZJcbd9x6ePjJxxu+5
  jKwfYr72/3j8zviI4jWGxrbDa6cH1XpuPFMp4zgp1Sx5puU34fPJusk5hnX82+ccD9r4IPV97
  Q/1s1c/R/rwnD/fXj7p7IrgpD8MAQFrbtgs+JCqdNTuzdOK/ynHrHcrmR623nFX5IGip2mL1r
  u7Zjpr0h1+L3c4/15AcVPawpeRrzIXzD78oCBqzgLPCNeJnr/83z3atnah8SGFXWtdzkkGCD8
  IfLBh5YKgFyv0XqlOyKxnTlZiKc5INNRiLipOBACjE/LTIAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-245.messagelabs.com!1624500474!211242!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28566 invoked from network); 24 Jun 2021 02:07:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:07:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O27sRe018600
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:07:54 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:07:52 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.8.0 -> 5.9.1
Date: Thu, 24 Jun 2021 10:07:46 +0800
Message-ID: <1624500466-11152-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import isort.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-isort_5.8.0.bb => python3-isort_5.9.1.bb}      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.8.0.bb => python3-isort_5.9.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.8.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.9.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-isort_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.9.1.bb
index 36de825d2a..273067c159 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.9.1.bb
@@ -4,13 +4,17 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6"
+SRC_URI[sha256sum] = "83510593e07e433b77bd5bff0f6f607dbafa06d1a89022616f02d8b699cfcd56"
 
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-difflib \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

