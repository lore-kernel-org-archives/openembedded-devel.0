Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38229C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:36:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.1719.1654133814602681273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=orUj3AhN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133812; i=@fujitsu.com;
	bh=3vswUCzjK4gkUxVMDK3q1UL9rTxmp6OYqF1SCZiJSXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=orUj3AhNB2wMxKkC9UsCWjOkinj5HJE0hjy2rLq6QsmsYRsR7D4umAcTzWAKYc1qv
	 wN8q0ppP/Iv9C2JvdxJ2O/v2uSS0D7G61v4L9wYcRJBEyhysxIlegQqIqYqMOvGdQt
	 FNIxPyBP1kPgS8soEqslXVUDPeKLjQDROrpOJyui3l6t+DIubmR1PSGut8B49+nQWE
	 rAWJ+a/R5k3l0o8Iv3YvyLkdaw4L96XBD6Vb1nDCvJT0Sj9IxQn1oulnnahfd7Xk6m
	 Or5ZoNN2Jzy3PzttyNUQAsX1xqp5LYQouTeraEUDSndw/Ha1yomdhh6GXdZPtEUVUi
	 Io/t/aaNdwd1w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqGssMiP
  J4NoqM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPimzlMBR+4Ku6f7GRvYPzF2cXIxSEk8IRR
  4vLqF8wQzgUmid/nJkA5JxglHrz9y9rFyMnBJqAu8fjma0YQW0RAX2Lp7D3MIDazgKpE98U17
  CC2sICfxNR9y5m6GDk4WARUJJ531oGEeQXcJf7/OssGYksIKEhMefgerJVTwEPixO5HLCC2EF
  DNh3f/GCHqBSVOznzCAjFeQuLgixfMEL1KEidWfGSCsCskXh++BBVXk7h6bhPzBEbBWUjaZyF
  pX8DItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdY19DSUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCIU4qZj+9gnNL3U+8QoyQHk5Io707H6UlCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHi7+WckCQkWpaanVqRl5gAjCiYtwcGjJMKbxwiU5i0uSMwtzkyHSJ1iVJQS560TAk
  oIgCQySvPg2mBRfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK+kMNAUnsy8Erjpr4AWMwE
  tvvZtCsjikkSElFQD03wPlhWRDtd09y67eGry+Wuv2BkbtSbmTT9Q1tcq+ehxumJwUKqp0u6l
  7OrHhDgV1d/7mAgxa12QlqhffrC25UkVh5lq1radBZqMEgyFvO8W1Zr/451U2/r57z/NqMQ5j
  7Xcfk0ttbNvKk1Y86D1IPMtnuq9Byaf38YTsTb+4PK7ikrNC7lumL4M8d0XOveUdGz1SdY7Sc
  9Z5JS+J7a8dtux736vwxzdI4ELbk/yXVrdJeKq1eId91BLwcoj9rLI2/pnO0w049V3e5hVVH0
  7ecA4905w2FS+mZxJH15NDihijt2cH1OSXLvu7UnVWS8/ecTt+iAWuu3ki7I16zud5E6krLXd
  2jZtESPPevcTSizFGYmGWsxFxYkAQpg9Yl0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1654133811!164098!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29130 invoked from network); 2 Jun 2022 01:36:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:36:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 68FFF100196
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2E3AF10018E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:36:42 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.2.1 -> 4.2.2
Date: Thu, 2 Jun 2022 09:36:18 +0800
Message-ID: <1654133778-20912-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:36:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97372

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
    Update .github/workflows/ci.yml template, #637, #640
    Change note in skeleton to emphasize it can be removed/renamed, #641

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-pyscaffold_4.2.1.bb => python3-pyscaffold_4.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.2.1.bb => python3-pyscaffold_4.2.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.2.2.bb
index 724bbd7f7..5b61c06ad 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.2.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "c8cfa9983503f31b301f4b0bec0a8f41518f9a3a3853471ce94f9f9dc770a3e2"
+SRC_URI[sha256sum] = "11be56d21a0047ea604e7bc4349e95592cdc734b0a405082a6a4f2a7028dc896"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.25.1


