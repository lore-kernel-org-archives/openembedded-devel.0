Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.6766.1628157044723409487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 02:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wIxVkjmO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628157042; i=@fujitsu.com;
	bh=jlmEvL4+H5HsBtIgaFC8A4QBu6QnASF+Tk8NjIOk48E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wIxVkjmOreEJpBF5eYtkcsgNvwXH4J+JhGRu38fKtuHL1FY7xmxFinvx7OYf5jOFK
	 NbwuaN9z9Tn6tGPdn1ZZ4jD7k9KJaa6utKFtwvdypGuVRY1PyvA2scDzlChiSNs9jL
	 cfWlfJ6tYvQkdAYfMY+dD0HrHGMtxnKuCB7cOX7MoUptQpo2WEBdGYjLBzn/d9nV74
	 RR9E7zDSMgEmNg5ypx2Eq9T1GONYO01O1WzV5ekDo9/6WUz4qkAobjRXVaUpDcOQyR
	 Xgx7Oj7/iDrjMsl9TxJSX2sztsd45MPcHSF+GcbGEG4JPha5sX6JmNfA89RqJL0W3/
	 /0wc/uaea52tQ==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 4B/60-07800-274BB016; Thu, 05 Aug 2021 09:50:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYolu0hTv
  R4PwKEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPxnxVsBce5Kl4+Pc3UwHiXs4uRi0NIYBaT
  xLSNaxghnOOMEuen7mfpYuTkYBPQkeh40Q1miwjoSyydvYcZxBYW8JA4fPUIexcjBweLgIrEp
  s1WIGFeATeJ1ze3s4HYEgIKElMevmeGiAtKnJz5BGwMs4CExMEXL5ghahQltu88wwJhV0i8Pn
  yJeQIjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraAnERmZ6iVW6iXqppbrlqcU
  luoZ6ieXFesWVuck5KXp5qSWbGIFhlFJwoG4H44PXH/QOMUpyMCmJ8ur3cicK8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuBV2QyUEyxKTU+tSMvMAYY0TFqCg0dJhHfxJqA0b3FBYm5xZjpE6hSjo
  pQ4bytIQgAkkVGaB9cGi6NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5C0Gm8GTmlcBNfw
  W0mAlo8YVYTpDFJYkIKakGpp32BqGnc20KliyzNHQvfbdq7dG1T+uyrnjPXVHX+n667Xzheax
  /Sq9G/3ljYHymwZmtf/WuSX/zMhsKXtvqf1j90d96/w71K50bY31tt70zEDeITDH85VTUapTQ
  F679IK584gO+kJT0q72uN4pPPF/6/LS02E3+bxM6F+Xy79vydIL7FovTx2v5U/lqYn7du1L+v
  2l2zOmJekHr8+qeXDT46262t0DizYHfdrH/TlVm8SRk6MV8kmYr+nSZ/74c50/TkLI9K5QlFK
  eF8N5LfZRWLiN7UqJZ8/wy3rMtf2c+CF5Tfzy9Wzc7dSXDIr9D+0zktP5KGKq1eTz15emPeHB
  nb6bxy61rn2wOKHviqsRSnJFoqMVcVJwIAJxR4hMeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-265.messagelabs.com!1628157042!716830!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2736 invoked from network); 5 Aug 2021 09:50:42 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-19.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 09:50:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1759oWjF002068
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 10:50:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 10:50:30 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-progress: upgrade 1.5 -> 1.6
Date: Fri, 6 Aug 2021 05:50:23 +0800
Message-ID: <1628200223-4506-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Fixed misspelling of names.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-progress_1.5.bb => python3-progress_1.6.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-progress_1.5.bb => python3-progress_1.6.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-progress_1.5.bb b/meta-python/recipes-devtools/python/python3-progress_1.6.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-progress_1.5.bb
rename to meta-python/recipes-devtools/python/python3-progress_1.6.bb
index 7fd6fd3ba6..1333da98da 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-progress_1.6.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Easy progress reporting for Python"
 HOMEPAGE = "http://github.com/verigak/progress/"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=00ab78a4113b09aacf63d762a7bb9644"
 
-SRC_URI[md5sum] = "408df0e3db0ad4b74f19f6beec814ae4"
-SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372"
+SRC_URI[sha256sum] = "c9c86e98b5c03fa1fe11e3b67c1feda4788b8d0fe7336c2ff7d5644ccfba34cd"
 
 inherit pypi setuptools3
 
-- 
2.25.1

