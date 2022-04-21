Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7B7C7115E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.19219.1650531595829498776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XxHNEbhK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650531593; i=@fujitsu.com;
	bh=GnUG/FLs84UBWM/COAurxxcvrHHUG97FPncpMVDHq0w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XxHNEbhKjcF4Ct9l+7XJDZBB0AdtUS0wjt/lasd8+dgEtqVyQu59EUBl1LJcaD9Nn
	 h9CYoBdAc+PRRo/eWf2SQGQNcd9CVf/rOnTLiV/CcxI4EPA6A+45q7OdVHRT89TLjD
	 yvMaoRcf9HRnnwaf7XlPkZcGpk3aSBkU7cgUjglTHXTZ+9bQZxtXE64/gSWn9fN1WM
	 VQsJyXruBW1d1NCrruyTaHSNm0jFVdlZhGu8ZULerHCb0EpM0rHCzfIu6M9mGWjTiK
	 vmZccScJf4josjQ1ETOP4HK7IrctBwFRdCldGk06YDsQUlQjmnDw88ga1XS6Q7Ewk1
	 WPwJVeIDOas8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MxRZdTNjH
  J4EmTpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnG95Q5TwQTOigO/DrE0MO7g6GLk4hASmM0k
  cXTdFmYI5ySjxI+WGyxdjJwcbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cww5iCwv4SfxoX
  QpmswDFt138ydbFyMHBK+AucaMtHyQsIaAgMeXhe7BWXgFBiZMzn7BAjJGQOPjiBTNEjZLEiR
  UfmSDsConXhy8xT2DknYWkZRaSlgWMTKsY7ZKKMtMzSnITM3N0DQ0MdA0NTXXNDXUNLQ30Eqt
  0E/VSS3WTU/NKihKB0nqJ5cV6qcXFesWVuck5KXp5qSWbGIGhllLsvm8H44u+n3qHGCU5mJRE
  efMlEpOE+JLyUyozEosz4otKc1KLDzHKcHAoSfDOlQLKCRalpqdWpGXmAMMeJi3BwaMkwlsvD
  ZTmLS5IzC3OTIdInWJUlBLnVRcHSgiAJDJK8+DaYLF2iVFWSpiXkYGBQYinILUoN7MEVf4Voz
  gHo5Iw7zqQ8TyZeSVw018BLWYCWlw9JRZkcUkiQkqqgUlZ8e1DuZf3Fx8JvPGq2NX+24vb57s
  PTuTyVTV/dWfOhCptj28BEy/sLnV58dRuisSVk2safz9JV3M2kLrCpcGlNCmfqfCHYeWKauOM
  4GWGM9/8qtn/9aWx0c/8Us75a+d47JkrGcjs6F3cOynTZkK5wBmVZUbZ8/1MS+8eri4p4Awx2
  Rj1tfLBxpPTtz59qnGmeZLtdpGHYUuZzW7FHFnPVnSXpaE4xa6w1Wtjob+0kkz8xFVvkj8wz+
  MNL1xky1mpXBxkfnaXyC0VEZk1CeEan5Tdun7e9tibL3T8QlJXyKypqlIx4v02BXPmTDZi6Iy
  7+vmi1zG34IZ7V98+4WfrTtv+mKOmskv2ksyHVCWW4oxEQy3mouJEAJy0cXcwAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-532.messagelabs.com!1650531593!452898!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3436 invoked from network); 21 Apr 2022 08:59:53 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-21.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Apr 2022 08:59:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23L8xbqX001305
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 09:59:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Apr 2022 09:59:35 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 1/5] python3-aenum: upgrade 3.1.8 -> 3.1.11
Date: Thu, 21 Apr 2022 16:59:20 +0800
Message-ID: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96721

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-aenum_3.1.8.bb => python3-aenum_3.1.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.8.bb => python3-aenum_3.1.11.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.8.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.11.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.8.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.11.bb
index 86217c5fc9..b2fba6f010 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "8dbe15f446eb8264b788dfeca163fb0a043d408d212152397dc11377b851e4ae"
+SRC_URI[sha256sum] = "aed2c273547ae72a0d5ee869719c02a643da16bf507c80958faadc7e038e3f73"
 
 inherit pypi setuptools3
 
-- 
2.25.1


