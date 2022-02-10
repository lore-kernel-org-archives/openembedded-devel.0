Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:25:16 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.8351.1644488714963749253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W3ZOvb0X;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644488712; i=@fujitsu.com;
	bh=hDVKNm33PMbsQ9vE66vSvELMn/+NhVYYdLKKhrHkJtE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=W3ZOvb0XpqYvljZzkz5tSuJW+LO1pEnY94wz3OgiXtE6525FXXU57wnOyJVzbDQ/f
	 AWiDRTL6+rXbmfx1+firWSM22yZooxKl/iREUWcqWZ2kfH7hwTMLGs/JUYJShhBJEU
	 ih5hwBdyM8Zy2Xkzsvjbxv++oH/ZVTLSPmRfH5QmvvQYbcVKbJqD/xNW0O/nXsyqI2
	 1cmEZGz5DUIpoVxOXPeG3sZitWx3dSSTmxTHUizqRTiRd9FB+CO9p/vX0XUk5JQucT
	 REjMtuzKcTpe5z9KVd8rM7JBSlzWOb4uuM61wRzvxo9WtGObLKMLFRcAiNoBqBV4Uf
	 6Cg0Od2tbovkw==
Received: from [100.115.70.56] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 36/E0-24566-808E4026; Thu, 10 Feb 2022 10:25:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSZfjBUu
  Swarf8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSM24FnQIVC3uXMjUwXubrYuTiEBJ4wijR
  v/QYM4RzgUli4rYJjBDOSUaJo9uOAjmcHGwC6hKPb74Gs0UE9CWWzt7DDGIzC6hKdF9cww5iC
  wskSjS+m8YCYrMAxZ+vOgBWzyvgJtE+awlYjYSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2aIGi
  WJEys+MkHYFRKvD1+CiqtJXD23iXkCI/8sJO2zkLQvYGRaxWiXVJSZnlGSm5iZo2toYKBraGi
  qa2aha2hirJdYpZuol1qqm5yaV1KUCJTWSywv1kstLtYrrsxNzknRy0st2cQIDM6UYpf+HYz3
  +37qHWKU5GBSEuUNOseSJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd94FoJxgUWp6akVaZg4wU
  mDSEhw8SiK8r28DpXmLCxJzizPTIVKnGBWlxHm3PgNKCIAkMkrz4Npg0XmJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjCvDMgUnsy8Erjpr4AWMwEt3jadCWRxSSJCSqqBKVTAaueMBI2QYs4
  uVQmlR80Cgl/UDstwvPd8r56dKWS7ftHr2vJLUl1vzFmWrWEyKvK/yzNp3qfKrli+rM1KyrM/
  23ybutliJqu8usKB7CcXJfkLfTjdG7rzRPcyea7/uXfaykaXgKN2c5fP/3Ps6aqbwcvuW/yPv
  /C55IZbTeG2Mxl5b30Dp606t3pd/VLV4oLoh0o2FwKS5DXuye4NXHc3jznsXcALv8an3yYt95
  Xbsb+vlyd58iqF+G9WqyTOvDj67Pji0z35P/8XypiElzhv52O381h4xGTT1z/SR5nnq7zY8WB
  O+uHtIpGT1XqPfNiec9b935+me39kZk459lyn/NWSSKnvhT2605VOhiuxFGckGmoxFxUnAgCZ
  vN5XSQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1644488712!7481!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5645 invoked from network); 10 Feb 2022 10:25:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Feb 2022 10:25:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0AE1D10045A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F2C49100453
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 10 Feb 2022 10:25:02 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/5] [oe] [meta-python] [PATCH] python3-requests-oauthlib:
 upgrade 1.3.0 -> 1.3.1
Date: Thu, 10 Feb 2022 18:25:35 +0800
Message-ID: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 10:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95279

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
Add initial support for OAuth Mutual TLS (draft-ietf-oauth-mtls)
Add eBay compliance fix
Add Spotify OAuth 2 Tutorial
Add support for python 3.8, 3.9
Fixed LinkedIn Compliance Fixes
Fixed ReadTheDocs Documentation and sphinx errors
Moved pipeline to GitHub Actions

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/python3-requests-oauthlib_1.3.0.bb            | 9 ---------
 .../python/python3-requests-oauthlib_1.3.1.bb            | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
deleted file mode 100644
index 12531d75fe..0000000000
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
-
-SRC_URI[md5sum] = "1ebcd55f1b1b9281940b4bc33010e2ba"
-SRC_URI[sha256sum] = "b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
new file mode 100644
index 0000000000..e02ff7911e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
@@ -0,0 +1,8 @@
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
+
+SRC_URI[sha256sum] = "75beac4a47881eeb94d5ea5d6ad31ef88856affe2332b9aafb52c6452ccf0d7a"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "${PYTHON_PN}-requests ${PYTHON_PN}-oauthlib"
-- 
2.25.1


