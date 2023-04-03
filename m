Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9082C77B62
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:02:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.65451.1680512552885923442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CxylaDiI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512551; i=@fujitsu.com;
	bh=B5tn5KrttS/h5WlfF5Mw5NKdrtGNsjd3AYBbrZkRAlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CxylaDiIsjYTXG+3ouH62UaUJR0Ng5tmlvWTSef9LMjy2uydzHAaRiWQ8tVtjtp1y
	 98bE7i2EErtlxeVXND63+ce8ZaJWiS1WdFp0/JU0ACtlPXs2kOZhWu1bBhZkzOrC0r
	 UyxelMUvLWfHvbyVXlPxaPqE8jfxXvVy29MqlMw/fA/s91sYLpWIrrHXDBRq7UF2H3
	 TVGeiIkhsmq66/y4JfUrvLm6wD6GmkrWqYmgZkWOvtdqpImxwPFaDvYz//Hciw30/l
	 Bp8wo4fLMTha4EGA4Lf5PaYWVi0HDW0bYxQxbWOgDxWkCv3Ath63OqKZedijKLUwFJ
	 aiR4Cp/YRXPbg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqKs2TSv
  F4OZETYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePpsj9MBX+EKt5P6mVsYPwo0MXIySEk8IRR
  YsHbtC5GLiD7OpPEne0bmCGc3YwSzSe+MoFUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJbFi7xFWEJsFKP725DqwGl4BJ4lf/zeD2RICChJTHr4HszkFnCUuLH7BCnGFk8Sqk9
  1sEPWCEidnPmGBmC8hcfDFC6heRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2LU4vKUot0DS31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelOO3rDsbZfX/1DjFKcjApifIK1mulCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgP
  TgBKCdYlJqeWpGWmQOMJZi0BAePkghvcC9Qmre4IDG3ODMdInWKUVFKnNdvClBCACSRUZoH1w
  aL30uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlfTQSawpOZVwI3/RXQYiagxa1RGiCLSxI
  RUlINTElfbfLK5hyOecbQrvfvlVZf/K4ymyyFGbvaO7sP/DrnFrlK6Pr6xNVva/lijwZpux59
  3vhu/XEeM7fSi9OWi0nNsHGIrvUKeyq1P2szr0ddWEpiYdTiuhubOBewBLZMnd/H6Cd0WubAf
  jFV6V/zWzYZ/6hsazFxCBNWCGTN/BQedcST/VJ9SazVFb8f6+pFg9S29XWo7FnpLdlV6xRwo+
  BuYbZEwEe77g/OqXfPVrAs/+XFdI3h2eH4xQmFYW8nxLka1wsJRPYtl0zRe/expPP4NLPFS3L
  f+z5d9PeDtdrTlaKJiqtY/ioXdWzPzFkdtH7megbpGaInX1/Y9r52Z8kk2516TAtsMnJc90gr
  sRRnJBpqMRcVJwIATCsSo1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1680512550!917108!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5064 invoked from network); 3 Apr 2023 09:02:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:02:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 18EBF1001B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:30 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0C4051001A8
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:02:28 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyproj: upgrade 3.4.1 -> 3.5.0
Date: Mon, 3 Apr 2023 17:02:02 +0800
Message-ID: <1680512525-30501-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
References: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101903

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
============
 DEP: Minimum PROJ version 9.0 (issue #1223)
 WHL: PROJ 9.2 in wheels (pull #1243)
 ENH: Add return_back_azimuth: bool to allow compatibility between the azimuth output of the following functions (issue #1163):
      fwd and fwd_intermediate, inv and inv_intermediate
 ENH: Added only_best kwarg to Transformer.from_crs() (issue #1228)
 PERF: Optimize point transformations (pull #1204)
 REF: Raise error when CRS.to_wkt(), CRS.to_json(), or CRS.to_proj4() returns None (issue #1036)
 CLN: Remove AzumuthalEquidistantConversion & LambertAzumuthalEqualAreaConversion.
      AzimuthalEquidistantConversion & LambertAzimuthalEqualAreaConversion should be used instead (pull #1219)
 BUG: Fix Derived Projected CRS support (issue #1182)
 BUG: Add horizontal_datum_name for geographic CRS in CRS.to_cf() (issue #1251)
 BUG: Add datum ensemble support to GeographicCRS (pull #1255)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyproj_3.4.1.bb => python3-pyproj_3.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.4.1.bb => python3-pyproj_3.5.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.4.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
index 49e5555fd..f67090da7 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python interface to PROJ (cartographic projections and coordinate transformations library)"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc4bb2668871655e24030dfe8d2a7ce7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=873757af01d2d221eedb422c4c1dd163"
 DEPENDS = "python3-cython proj"
 DEPENDS:append:class-target = " python3-cython-native proj-native"
 
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "pyproj"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "261eb29b1d55b1eb7f336127344d9b31284d950a9446d1e0d1c2411f7dd8e3ac"
+SRC_URI[sha256sum] = "9859d1591c1863414d875ae0759e72c2cffc01ab989dc64137fbac572cc81bf6"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-certifi proj"
 
-- 
2.34.1


