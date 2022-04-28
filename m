Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C04C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:03:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.6995.1651129403124502774
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OgUsalCW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129401; i=@fujitsu.com;
	bh=KUtWocvkELiieAbHOvG5g/qgOYB86nR+L6GBW8BoFp8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OgUsalCWcQ1jDTFoxBtEBe23zLbZLR04wcCsJzPBpZ14eOCLXJfx08RZZQG+C7JMn
	 pkH+GuwVRKQjAUCV/KzzZT6I7sD+3M3O9/Im3UUNdAiVTAxuzLSJmfj2xbgIRy+tgS
	 603MHXPCTWsYDB/QzQj1IvLJpZYeuo/s3HZ4zuYqQkW5Z2Bnz+l5gsUCyL5397Gu8w
	 w7TDr4jUExnq2vkdcwhwRzQuNDlOzc114vm1CmnMNeUFoP7UHUKXtd5Q2K+JgW+2lf
	 WgoVlHPM8lhxj9wTkQz0vZBBc3VwPLcXG8MFpbWdKe7X16JjLfFcPcavWMiJJz1oqe
	 srdNRODMPRIgQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRdfSJiv
  J4MRGZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJ8VOsBW1cFROOKzQwTuDsYuTiEBKYzSSx
  bu48VgjnJKPEicUdjF2MnBxsAuoSj2++BrNFBPQlls7ewwxiMwuoSnRfXMMOYgsL+EosadrCB
  GKzAMWXH5zOAmLzCrhJzHq6AcyWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjJHFixUcmCL
  tC4vXhS8wTGHlnIWmZhaRlASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXRNdI2NLvcQq3US91FL
  d8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwBBLKWZ5v4Oxqe+n3iFGSQ4mJVFeK9OsJCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvArWQDnBotT01Iq0zBxguMOkJTh4lER4ZYyB0rzFBYm5x
  ZnpEKlTjIpS4ryuIH0CIImM0jy4NliMXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGsGMo
  UnM68EbvoroMVMQItXFmWCLC5JREhJNTBprryZfGetFmvHxgdKPnlNs43qDHese51l8G59o/l
  /z/q7PzqOGfHP+S0T8+aRRofakhS1B7l9vIWpi7q9lm96tUw648+RlBzBL1cUVa84swV2ZtnO
  LElwmMX7c+mRarHtn9M3LZ0Y/a4idYeg483wQIWeR/8YBM02M1/79OIkl/iEHxFdxcYfuAxrZ
  t3Kin8kxhTi6b2gZMcdtQmLQo2vMn+NeSfbunTdjdkXJC41bma4+PB2w0K1vVXept5vNqcKzv
  bvay5cs/eYSv3Dw+bMHG72AeckrA6YdzVv2xB3WrFdT6vqJodMstxe7hW79vvlFvV4501d+Sn
  j/3VvZ6eP+pmV6j+alnNwV5bUrlRiKc5INNRiLipOBACGkzcgLAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1651129400!149183!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26628 invoked from network); 28 Apr 2022 07:03:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:03:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23S73FDM021997
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:03:13 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.11.2 -> 2.11.3
Date: Thu, 28 Apr 2022 15:03:31 +0800
Message-ID: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96826

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Fixed an error in the Qt brain when building instance_attrs.
    Fixed a crash in the gi brain.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-astroid_2.11.2.bb => python3-astroid_2.11.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.2.bb => python3-astroid_2.11.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
index c52008ee65..a2e9111374 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8d0a30fe6481ce919f56690076eafbb2fb649142a89dc874f1ec0e7a011492d0"
+SRC_URI[sha256sum] = "4e5ba10571e197785e312966ea5efb2f5783176d4c1a73fa922d474ae2be59f7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


