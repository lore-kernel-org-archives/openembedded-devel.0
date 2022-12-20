Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0159C4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:23:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.48906.1671538991609030039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QDYkezkc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538994; i=@fujitsu.com;
	bh=DpEu6GoLxyy2EKVxKXM91w4h2x1j3KGxNIU2X61rbVg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QDYkezkc3OedNC1MPq2CKrYYcbf+A547yz6Sfj9scG19iUNdSwo47QttYQt6+RqXB
	 Xz2sRVG0+E8aquLIafgBMC0mLfOuID6PC7EcMatmMDvC4jjsU3phJ8KlDJNjXH/dS5
	 NzXm49dXfCMsoKua2hFRKQKEL/kxaj5oBtlj5UfQJXqcDsYsLPlY2A0k4d+Zee2ocP
	 pAMM4yWW3d/SOGyMwB5mJNO/7gKZe24PFeigM/M5bjD29+I3Z7yXHCUcpOv6TEc90K
	 SFrH4GOVUkXxklrfUuEUGDx2lKb8mnyzItLgmlY6F5Iefd5DkaM4u5KHxFF2RJcwbZ
	 WMRxc8ukrpR3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpGu0cmG
  yweZzTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bH/3fYCo5xV3RMfsjcwLiOq4uRi0NI4CGj
  xJr731kgnMtMEpe/z2eGcPYwSpxf/4u9i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  8BqhAW8JOb+2QRmswioSjy5PAvM5hVwlOi9+Z4RxJYQUJCY8vA9WC+ngJPEpjNzWUBsIaCag3
  MOsELUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1iNC1OLSpLLdK10EsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknR
  y0st2cQIDN6UYvWtOxgPL/ujd4hRkoNJSZQ3LHxhshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  hmLgHKCRanpqRVpmTnASIJJS3DwKInw9swGSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSp
  z3xXKgIgGQoozSPLgRsKi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1whkCk9mXgncpld
  ARzABHXHo0lyQI0oSEVJSDUxHE1k5PG4bLHor/c3boGb9nYD5n3f6ejgx/mx/3XtWb5F4V9Fn
  jbvzOsweeuk13nHxXerc/73JJ3rGs1BlI+aIWSt3LLE6VC9RF3/eWP7Tm13vfvPael25+GbHX
  odvpxcXHXy+eOb2S/0xSSu/zg64rKH6u9vFTdNNd/OVWOfvDumOU48yh17adldItnb9x9tdO6
  Z7dUw3nXN/Cd+FsMbciH9Onm3BD6ae2VX49rdJe2nC2bPi5/JTL2tYPrsVtmHeSVORSJaXzse
  vKM7akPJTLNfsd1LiSbMPm250ztwd9qDxSeHc3Vwmr6T3h/u/0M6Mb3Y2yTO7fVrGMFpzm8xP
  6bXBu2fKH2Qz77bn5fqvxFKckWioxVxUnAgAkb8Km2UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1671538993!392947!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20616 invoked from network); 20 Dec 2022 12:23:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:23:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BBA871B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B016E7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:23:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyproj: upgrade 3.4.0 -> 3.4.1
Date: Tue, 20 Dec 2022 20:22:28 +0800
Message-ID: <1671538949-7267-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
References: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100148

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 WHL: Add win32 to build_wheels matrix (pull #1169)
 BUG: Changed so that the setup.cfg depends on the version code in the __init__.py instead of the other way around (issuue #1155)
 BUG: Fix CRS.to_cf() for Pole rotation GRIB convention (pull #1167)
 BUG: Fix CRS.to_authority() memory leak (pull #1178)
 REF: Use upper case EPSG code when creating CRS (pull #1162)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyproj_3.4.0.bb => python3-pyproj_3.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.4.0.bb => python3-pyproj_3.4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.4.1.bb
index a15a05ea2..49e5555fd 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.4.1.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "pyproj"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a708445927ace9857f52c3ba67d2915da7b41a8fdcd9b8f99a4c9ed60a75eb33"
+SRC_URI[sha256sum] = "261eb29b1d55b1eb7f336127344d9b31284d950a9446d1e0d1c2411f7dd8e3ac"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-certifi proj"
 
-- 
2.25.1


