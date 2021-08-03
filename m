Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.2496.1627980041023596663
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 01:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hmAZQ0Zt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627980038; i=@fujitsu.com;
	bh=r2faSWvC4SEc6/8faqMyGGR/GcsUJZVWgaTCE6Y3lig=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hmAZQ0ZtgB3ut5wQky6rOv5vuFYTP8hJH8NfwUTn1N/IJ0Fi4VylUqkCi43U9Tvzg
	 l8VAanwHcRp9IsoGdzRFt7pndZpqFaETGGws0uzHC5iioLB6/QGZ9CY3DbILWxcZ2E
	 PfpO3HJv4CKXq2VklEVADfpCx+b9VH55tax1WRxXiHwP2pUQy++3mgOEwuFL8Xkf1w
	 xiRSN80nn/s0uxPfpcMG5VtTYqS3h37S1IBAGOVxqDpzH1yChM9pdy3SdICAawcvEd
	 bHum1ZdcXP3Jajsn3lFYdeLIfudezs1bDsHlr6H3kFdzmxUkdorrDc3u/jA/sfMH95
	 QJiAhRFtvYXxA==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 66/78-09935-50109016; Tue, 03 Aug 2021 08:40:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0WVl5Ew
  0OD1JzeLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTi6P6qgg6fiVt8q9gbGB1xdjFwcQgKzmCSa
  di1lgXCOM0q03P3J3MXIycEmoCPR8aKbBcQWEdCXWDp7D1hcWCBA4mvjQzYQm0VAReLp5s+sI
  DavgLvE63mLweISAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvmCFqFCW27zzDAmFXSLw+fIl5Ai
  PPLCQts5C0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGuoa2hipJdYpZuol1qqm5yaV1KUCJT
  VSywv1iuuzE3OSdHLSy3ZxAgMpJRCxr4djBPffNA7xCjJwaQkyit7kyNRiC8pP6UyI7E4I76o
  NCe1+BCjDAeHkgQv63+gnGBRanpqRVpmDjCoYdISHDxKIryW/4DSvMUFibnFmekQqVOMilLiv
  L9A+gRAEhmleXBtsEi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxBkCk9mXgnc9FdAi5
  mAFk/NYAVZXJKIkJJqYGI4zHP01rvTxXUfTJ6wpZ79OkPzA7dRxwaO9pf/HHhNEy1CpgkemMS
  pEx9QYXnmSuCXRzfWv2rp8Ge8tzMjvlTNe2P4q+eTbua/OLB0+6tLfqrK4h1z7q6K5hSftF8w
  TpBRyuCL25bwE06W7+MntZysNvr+yeqb5MOqtk3PWGbcE2aKPM4ZGtge9HDhy+jqmWtNf9zIm
  1HIa/fZPdont+HzY2lmt2UOHeePnKy99H+P+TIBngmPrGsWCX+4sfv0ZOPJv2UlZ3ZfPLT03q
  u6V7bqbJx+ak/8t2vt/e/bxK/T1ZP5fUKK8/W6/noW/6PC2ZflLbYIK3X+DNhu9PfZ50nZp9W
  2RYT+P/uc8aauyAklluKMREMt5qLiRACm4hZmHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-232.messagelabs.com!1627980037!10288!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26901 invoked from network); 3 Aug 2021 08:40:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Aug 2021 08:40:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1738eVOe003214
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Aug 2021 09:40:36 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 3 Aug 2021 09:40:29 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 4.0.3 -> 4.1
Date: Tue, 3 Aug 2021 16:40:22 +0800
Message-ID: <1627980022-59643-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import robot.

Robot Framework 4.1 is a feature release with several nice enhancements, for example, to the continue-on-failure mode and argument conversion, as well as some bug fixes.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-robotframework_4.0.3.bb => python3-robotframework_4.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.3.bb => python3-robotframework_4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.0.3.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.1.bb
index d95ab109a3..d80296418b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "93c2107f789fd897f234f4b8f1ba8e7b9f4ef326d9bcbfceb71dda8cc197388c"
+SRC_URI[sha256sum] = "567f2a21f0906635e21d45fe3cb84a4809a12980c9f2706a8a5f65f40f6b4ccd"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
@@ -24,4 +24,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-docutils \
     ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-numbers \
 "
-- 
2.25.1

