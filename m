Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC907C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 09:06:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.36365.1640682399491713553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 01:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ax3p9Gfz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640682397; i=@fujitsu.com;
	bh=Bujt+XF9MxH3GJXHwVDzeGnfccjOn4gwpHSkmlfQgvc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ax3p9GfzfGWBLyloS8cym4UQ6qRbDjKXO6ngSPjCGafU4g9AIsHushqnEPJ51UGWc
	 7NhtHuBGdc3B+gNFArt515bHNg437Udql64cuXEnHGGCbAM0FEsGuQKMfnEeIcGcxn
	 m9Qt1p6ZK0+ao7XH5deeqoMMBKN5hLVoW9rcpHlZUzhimq1/O11alYuXfH++eCxthp
	 WFpp59aLswqwUclY0petsv+AabTu+hWt5VYGomVXdAaEyIBAWFlXIRABRHiF6Qcf3Q
	 Uv2Gpsj7Gv5RXJGqZ1t5hCotkvm7VAksvg+obqEYJA5txGI+jXx3IVIgvIs/ZYyNXB
	 w5o7dcHV09tDg==
Received: from [100.115.33.138] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 0E/32-09428-C93DAC16;
 Tue, 28 Dec 2021 09:06:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRXfW5VO
  JBh2XzC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyXp96xFXznqri2aB5jA2MbVxcjF4eQwEwm
  iX/vtjNCOCcZJf7P7QJyODnYBNQlHt98DWaLCOhLLJ29hxnEZhZQlei+uIYdxBYWCJeY+2AyU
  A07BwtQvEUDJMor4C5x6M92NhBbQkBBYsrD98wQcUGJkzOfsEBMkZA4+OIFM0SNksSJFR+ZIO
  wKideHLzFPYOSdhaRlFpKWBYxMqxitk4oy0zNKchMzc3QNDQx0DQ1NdY3NdQ3NjPQSq3QT9VJ
  LdctTi0t0gdzyYr3U4mK94src5JwUvbzUkk2MwBBLKVZdtINx/6qfeocYJTmYlER5i/efShTi
  S8pPqcxILM6ILyrNSS0+xCjDwaEkwXvxPFBOsCg1PbUiLTMHGO4waQkOHiUR3t5LQGne4oLE3
  OLMdIjUKUZFKXFeGZCEAEgiozQPrg0WY5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNOBJ
  nCk5lXAjf9FdBiJqDFMx2OgywuSURISTUw9e90YP1Z/Opjg+zEr8y3mJf+djMLzVlommanPfN
  Le80Xzx7tA6IBIW9ml23erK+80ZzbeXfChOgFp+pV97fsEpGJ+bSiYM7RS7mKDgpZhauEtmoI
  /J8o/82FJyK0Tlutwd4/q8Foq9aL3md+zBxb1jxw/cyZeCVy2+S6pXPZlrBsV5o3/af6k2e8A
  mYBbFNSolO6J/eqNfv/7sh62axyTp55QfAmpiNqOua+cdlSr3ou6M/2dvA1MY6+8La5rkMp4P
  iX8Nr3U2Y0L7Fqm7+l7X2U7XqzfMs/QW4GN5tNlnFu+nzAyH5KWY0ef3fNtsKQuJOshXuvKB+
  749qj1lDGMcNWyPnh+YeflnP+M1NiKc5INNRiLipOBAAfgmDdLAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1640682394!297644!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25480 invoked from network); 28 Dec 2021 09:06:34 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Dec 2021 09:06:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BS96SDC026910
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 09:06:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 28 Dec 2021 09:06:26 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/2] [oe] [meta-python] [PATCH] python3-wheel: upgrade 0.37.0
 -> 0.37.1
Date: Tue, 28 Dec 2021 17:05:14 +0800
Message-ID: <1640682315-13256-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 09:06:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94548

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
Fixed wheel pack duplicating the WHEEL contents when the build number has
changed (#415)
Fixed parsing of file names containing commas in RECORD

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-wheel_0.37.0.bb => python3-wheel_0.37.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.37.0.bb => python3-wheel_0.37.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.37.0.bb b/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-wheel_0.37.0.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
index aae4903d01..6c7a31db9e 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "e2ef7239991699e3355d54f8e968a21bb940a1dbf34a4d226741e64462516fad"
+SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
 
 inherit pypi setuptools3
 
-- 
2.25.1


