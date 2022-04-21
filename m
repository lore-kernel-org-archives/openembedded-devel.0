Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE3C83027
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.19129.1650531641558318160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H4D/36DF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650531639; i=@fujitsu.com;
	bh=qQATxJ/ch8zhLm3PmeB4YJ2OJAWThlEpln0BiIK8flQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H4D/36DFItzabNTcsP+TMdp3QgsYVzDQvMy2zaaxfCrXPwSAOLPE0sETwZkKiyoPh
	 w5qHU7kF+WgY4AG02NOjQpXHlrpW7Mjv0SRqPC3nwMripupmLFSRCFpwVJPw88dxyo
	 4ak2ZnYUmjfKB5z29Zs+sFBWEaCZ7C9uJrIwqjPyqjsXOR73KH24A4UtpVsmsPd0Ns
	 QWOHqU57pehySWJIL1480ymFWtyytmiB3RQuFr1FOr6CtPQhjdgdmB6CLyktjCA3Ga
	 BRxYPG0Wa94O0t18YEn4PB0Itx8FAwYpXPjgKTFpQnaHzB/W+kBTZnnM68gzNlT2+n
	 BtAUMmDSsUX4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSVdWNjH
  J4McTaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePEpPmsBV85Khbuf8vawDido4uRi0NI4Amj
  RNu0DjYI5wKTxMeN+1kgnJOMEodfr2PtYuTkYBNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1ggQGLd/z9gNgtQ/PerK2C9vALuEnuvLgWLSwgoSEx5+B6ol4ODU8BDYt1LH5CwEFDJ6T
  9dbBDlghInZz5hgRgvIXHwxQtmiFYliRMrPjJB2BUSrw9fgoqrSVw9t4l5AqPgLCTts5C0L2B
  kWsVom1SUmZ5RkpuYmaNraGCga2hoqmtmomtsopdYpZuol1qqm5yaV1KUCJTVSywv1kstLtYr
  rsxNzknRy0st2cQIDOWUYgelHYxn+37qHWKU5GBSEuXNl0hMEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBO1cKKCdYlJqeWpGWmQOMK5i0BAePkghvvTRQmre4IDG3ODMdInWKUVFKnFddHCghAJ
  LIKM2Da4PF8iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryLZICm8GTmlcBNfwW0mAlocfW
  UWJDFJYkIKakGJs1nW645vz8hvqr82Ievx/hyC3bdCVdx1Xmtz/3goTp7fOssl+lWUfpRCtsc
  KmQ5r4VVOidZ3p9zUzvG9865a5knS1w3BXa87J/JZGbTKeOSVbtA/uN6UeNFMp++9eypSOGsz
  5nAsS7j0qsJO+5t5M1S1Lyn8v/+mn/yB9TKgk43FbjKFVz/1+9z+MWyNenHb5t7bpo1ofuIyW
  fbhSe+MOqpZC5KCZux5O7a1TkNb24ZrfKMUXGV4JD8p6FToZnmaCK0fe8qTYn/v6qe7n5b5BN
  2/cfKGyVss4vXyz2a92svz/STe8T3zTjSc3nP5x9bJVokysIKbO7ZmlWFHOQ/ca1U+POy5x5e
  dh6aT9mdbimxFGckGmoxFxUnAgDinKRgYAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-528.messagelabs.com!1650531613!13419!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3073 invoked from network); 21 Apr 2022 09:00:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Apr 2022 09:00:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F24BA1009B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E545E1009A5
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Apr 2022 09:59:52 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 4/5] python3-django: upgrade 2.2.27 ->
 2.2.28
Date: Thu, 21 Apr 2022 16:59:23 +0800
Message-ID: <1650531564-26234-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96725

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-django_2.2.27.bb => python3-django_2.2.28.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.27.bb => python3-django_2.2.28.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.27.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-django_2.2.27.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 786afab248..9ef988176e 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -5,7 +5,7 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "1ee37046b0bf2b61e83b3a01d067323516ec3b6f2b17cd49b1326dd4ba9dc913"
+SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


