Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52BDC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:45:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.4237.1646822727471642212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jDJKmsJe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822725; i=@fujitsu.com;
	bh=yPtSRU9N1gV+PRtziLoD/Cx0RoQyNqFetMRBDPuCgaI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jDJKmsJeOv4xTy+deErIuIyY7xIAlQDw1Fhct8W0oD5TSQSs40oVpYaTUE5wEUE2D
	 mXziGVW1AWa/FsU2nqtzzjUQl0qWhSOb4irKoYcVR4HkwnFXOcK1Dz22Wg8bP2spxR
	 nVr5j0grwRKZlFogAuOmWEpF+YgEcm6sxa/qjTsGgiV78Dn31X+9L+Su0TnYhg0lQs
	 VYu3Qp7sSgHUXZANuW0jY2LSbd3hVM4AkMBnwYaFV1lmbFQBwYPmPxQAJGQlqsaHfa
	 ycTq/NvX5xTWzmeKns4he+YJDSjpEvxHBTKgFOwSHazf3Bo07roweWdjoeiDV7+Dqn
	 a5rA3WcnRpoMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqOvaqpF
  ksPeEvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHv4EW2gjdcFfv33GBsYPzJ2cXIxSEk8IRR
  YvKWqSwQzgUmiVsbNjNDOMcZJZ5e2MzaxcjJwSagJjH91g0wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECQxJv9zYwgNgtQfEvvS7AaXgEniZaXTWA1EgIKElMevgeLcwo4S0z68Y8NxBYCqvlx/h
  xUvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRuukosz0jJLcxMwcXUMDA11DQ1NdY0tdIwMDvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src
  5JwUvbzUkk2MwEBOKVY/sYPx6cqfeocYJTmYlER5ZYI1koT4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8HY2AeUEi1LTUyvSMnOAUQWTluDgURLh/VwDlOYtLkjMLc5Mh0idYlSUEud90wyUEABJZJ
  TmwbXBIvkSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFevhagKTyZeSVw018BLWYCWmxnpAa
  yuCQRISXVwNSZ1BN5Ql/WNbCR99MHq7JNhXvWyWrrqxb5Pb7nweYQFvQsdeoTg2Szu3Pas06c
  m14a/0UqRP7/qhZZlbrJgtucFfSrDB/n7vPf+SPMkCPfS613m5/ZrPauDeoO6cHLtflLFssVJ
  5j8EEqUV9JSe6O+1D9o4sfstaZVBrG+Cn8+/GF44nDMoObh5GlJ27f3XtbznFTn+b12jtKR6D
  +bvm3dHnJmL7v+7rBtoUa/v8zf9PZRoqPW/jL7wiPLJwpMj+7pVzl/dItIzcwNSZNVryhrzlt
  q7rfx/dq7ZxT2ac3ruJx+1HNutVBAZ0vTUaUWecEvVjIHI16JJ/wLWOfUq2vdc+Foy0JuHcll
  bmX7lViKMxINtZiLihMBJkrb3V8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1646822725!28545!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15782 invoked from network); 9 Mar 2022 10:45:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:45:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C1AB41001A7
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9DC201001A4
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:45:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 10.2.3 ->
 10.3.0
Date: Wed, 9 Mar 2022 18:45:04 +0800
Message-ID: <1646822705-61973-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
References: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95903

Changelog:
=========
Show diff when black fails
Fix f-string
Fix black fail introduced
Log error code on exception
Bump protobuf to 3.19.1 and regenerate protobuf files
Bump black from 21.12b0 to 22.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_10.2.3.bb => python3-pychromecast_10.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_10.2.3.bb => python3-pychromecast_10.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_10.2.3.bb b/meta-python/recipes-devtools/python/python3-pychromecast_10.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_10.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_10.3.0.bb
index 9bd0379817..43ba3a9dd0 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_10.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_10.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "ddb86c5acdc13e8bdadd2b7f5738fda36b32c1750548f7b629ca8d178f05e0da"
+SRC_URI[sha256sum] = "4eb107446fdbed876f48c83202b6212b221286168a55c16b3eb8edf4200f10a1"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


