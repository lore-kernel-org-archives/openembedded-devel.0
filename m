Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4785CC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 07:38:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.6920.1644910679473193890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZMFr8j7M;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644910677; i=@fujitsu.com;
	bh=/aQDLXqSBRWvx5ng98mt5H7AtMD4i9+GMu7h+I3qZu8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZMFr8j7MY+3sLjkjDp76X1sPaEfTsC11xDyLiOoZzHXQDPxM+Xei0ku6mNUKEs7Gg
	 H/pD1pqy+FHjU0Kcag2SlmTon2qH1UHRCY1I8yeteTkmZs9NQAfi9jhaFId9/5iHpS
	 UMqJZXIcnHC0hyoArI1s2cH006j3h8k1zFeatYPWPx3vDQmA0ECId+EKE4IiO8RsiQ
	 H0iglKE324LxGLckRxcqEmzND7u5soXBWAeaMUGLDhRsCctEGnu6Mh8qwdhavO8ppU
	 Iclk7ziNnuPuqrHux5YWIxyiB0BfwiNiiG0zAHVHv2s3zX8UUDoU3J7xgg7vDlLetX
	 v4Lkrkkq3fPWA==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 C4/79-30582-5585B026; Tue, 15 Feb 2022 07:37:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MxSTc0gjv
  J4OYVRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP39DO2gi2cFe9/drM3MJ7m6GLk4hASeMIo
  sWrjJGYI5wKTxNrrM1ghnBOMErce72TqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAW2JX12UWEJtFQFViwf2tjCA2r4CjxNfPXWC9EgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRLKspMzyjJTczM0TU
  0MNA1NDTVNbPQNTQx1kus0k3USy3VTU7NKylKBErrJZYX66UWF+sVV+Ym56To5aWWbGIEhmdK
  sUv/Dsb7fT/1DjFKcjApifJ663MnCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgfRYGlBMsSk1Pr
  UjLzAHGCkxagoNHSYR3vh9Qmre4IDG3ODMdInWKUVFKnNcsHCghAJLIKM2Da4PF5yVGWSlhXk
  YGBgYhnoLUotzMElT5V4ziHIxKwrzTQabwZOaVwE1/BbSYCWixYiMXyOKSRISUVAPTai2P8je
  O3u8fnNzD/IOtVi/ztwDn+VlyxSVW8z/3bSxY1Nl53HE9+wY+lysOOj8my5/pfvpgX+3/SLUp
  DGZrZx7SYeJT3HHSdWlU9QNvx9my6t7zXFzttPZOqpaepKO5yktxu1QQ37EuX9GF96febNupG
  vyr58hbc/YdW2etVDvzxMh3t2OuwI+6NCPeZas61nf9mK/zaWuCh/Zdb6uG2m8GgeuMLa88X7
  eAa4ekjfa8TwGHo7/o1lxMWql+wy51pt2WVVIimsbH9/1qfN8aKmk/V1KxdF6nMq9ivcku4+r
  nSnu3cRbp7fNWbJ66q1nu8W63N9w3UlQEVr1uyHZx4Ji9Wa5VPGTC3qXOj+4rsRRnJBpqMRcV
  JwIAQEgn1UoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-528.messagelabs.com!1644910676!28707!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25003 invoked from network); 15 Feb 2022 07:37:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Feb 2022 07:37:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8DD19100446
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 816091000D2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:56 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 07:37:34 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-natsort: upgrade 8.0.2 -> 8.1.0
Date: Tue, 15 Feb 2022 15:37:25 +0800
Message-ID: <1644910647-5613-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 07:38:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95312

Changelog:
=========
When using ns.PATH, only split off a maximum of two suffixes from a file name.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-natsort_8.0.2.bb => python3-natsort_8.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_8.0.2.bb => python3-natsort_8.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.0.2.bb b/meta-python/recipes-devtools/python/python3-natsort_8.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_8.0.2.bb
rename to meta-python/recipes-devtools/python/python3-natsort_8.1.0.bb
index 1a54fcb240..1ba40d3a14 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "feb87e0ce1dc1f8f3f21e18a85216c790e746d76a5ff6889563394605f504a2b"
+SRC_URI[sha256sum] = "c7c1f3f27c375719a4dfcab353909fe39f26c2032a062a8c80cc844eaaca0445"
 
 inherit pypi setuptools3
 
-- 
2.25.1


