Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BCFC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:15:17 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.64819.1679544912377195694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wbUYckLV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679544910; i=@fujitsu.com;
	bh=Oe89+eeSGH4EkafJ4bRYjfU6Tfr+3FLmVUjkd+vf5YI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wbUYckLVG43+KU98i4JP4K54e+g4w4vxSMCw7+nwsPzbyqDkX0vMZUaqxk+KZoMRL
	 w4SwiWda1D8x4Oyz2f4hlRqT4LzxLGFNuUUdGIq7jedQxwnd86pHgiv2wGDzHZYMTx
	 VN7Cx70hpKWRf2Cv5MxL0kY/WHYjdgSswbQg77P/TJbxOCbsnvogdqn6jIyoJMsaNw
	 Dgi9xmJ8yMoIK2H5w+z8wdjwzCfAo9JDKyWIILHot/M7vz92FPp0nKUe/88WxL0lvc
	 jTOBfk7+DCsOomsOkhC82lR6tPb6F4FVMeRAuAENvECh1uvFDbpG3HMXqM5fOm/mgW
	 wK1g+DFivYVWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpOt3STr
  F4PBGDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePnshuMBRt4KzYfesPewDiFp4uRi0NI4CGj
  xM+d3WwQzhUmiY9vzzNBOHsYJV5v7WXsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggQKL77HSwehYBVYlrE7eD1fMKOEk8e3GACcSWEFCQmPLwPVgvp4CzxNxJ3WC2EFBNy5
  peZoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoVE4/RDUDPVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0rXQSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pRitcc7GLf2/dU7xCjJwaQkyisRKp0ixJeUn1KZkVicEV9UmpNafIhRhoNDSYJX5
  yJQTrAoNT21Ii0zBxhJMGkJDh4lEd65B4HSvMUFibnFmekQqVOMilLivLEgfQIgiYzSPLg2WP
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMO+M80BSezLwSuOmvgBYzAS2OmyEBsrgkESE
  l1cDEfVng+iPjRi2HXe3a90P0fJ6t/xmSIfileu/TDfckDm8XWnD7RELVjw8ubgnsMyzf3TJ/
  2/r/W8wnljiD9fcdCn5Es25YLRu+PJF5s6d4tDlbR9fkqd8f7nq/a//OsP2mB2//0c5X64mbJ
  ecxZ/vj/GX/T+gdV7JM/Mabs4VBW/fJZO49B/16Fd4YsHhuu1mxb3KKzjP/VU9mXZ1R8vGQXo
  PQjY59XyV2S3s1MlZ8V9v5UcgsY7mm7Pu8qQtyVA3vdfb9fDkldl/dSec77KKl16vzbnTe0WB
  gfcLSbCbafXclW/201l2OXx45aKacLmW8nDhLYsb0oDcvZp+IYHr0Rv6U0x3zM2bXZT5deKsx
  W4mlOCPRUIu5qDgRAFIkcJhZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1679544910!49877!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26884 invoked from network); 23 Mar 2023 04:15:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:15:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D2DD81B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:09 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C78D61AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:15:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.15.0 -> 1.17.0
Date: Thu, 23 Mar 2023 12:14:39 +0800
Message-ID: <1679544881-19951-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
References: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101644

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Switch to MIT license

Changelog:
https://github.com/getsentry/sentry-python/blob/master/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-sentry-sdk_1.15.0.bb => python3-sentry-sdk_1.17.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.15.0.bb => python3-sentry-sdk_1.17.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.15.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.17.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.17.0.bb
index b3ce17451c..c0a180ad11 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.17.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "The new Python SDK for Sentry.io"
 DESCRIPTION = "This is the next line of the Python SDK \
 for Sentry, intended to replace the raven package on PyPI."
 HOMEPAGE = "https://github.com/getsentry/sentry-python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb29c83dd48cb7b112d0dd81111a89"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-urllib3 \
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "69ecbb2e1ff4db02a06c4f20f6f69cb5dfe3ebfbc06d023e40d77cf78e9c37e7"
+SRC_URI[sha256sum] = "ad40860325c94d1a656da70fba5a7c4dbb2f6809d3cc2d00f74ca0b608330f14"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


