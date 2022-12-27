Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D67EC4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:48:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.153590.1672123691615143012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tBNmBe4Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123689; i=@fujitsu.com;
	bh=AmbuVl6kEvTzJKqn4FPXtYFhHK4MdOUPTifqLdHdpqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tBNmBe4ZmCHsdl0e3fYAImgkd1MDSsPVusFGHfgYygg8MXP2KZb9Q9yWCPZmLt/F2
	 kdUinc4bfPA39ruNl0i1JRQn+bRB4tl2uzQFsToSkSrVqDgDjLh6bsql942KuM0soB
	 +V03225hlID692JANBsY1QAKo3SDpfPXr3FfTfiJX6VnSz4Hv0fZTmS94FrY1Dpptq
	 XzXMjCcS6iqIthZMlON9qoJuY9XIIcUgu6dGAXbqhDj77xhrtpqvkG4oAriD/PL2P3
	 HbRKVgbViIC6jzAIQS2cG1D/M5zX1zBuAxBxcR3xTGgdqUnCJa5uQrsi2/WBhhNm9u
	 SRK5SLBEPGNjA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWVdj6qp
  kg+tvzSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxFZ56zFEwUrLg29x1jA+Mzvi5GLg4hgQeM
  El/anrJAOJeZJNqPbody9jBKTLi/gLWLkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFHiVU7p4LVsAioSvxpa2MEsXkFnCQOvZoNVi8hoCAx5eF7MJtTwFliaUMLmC0EVNNybj
  cLRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRrPi1KKy1CJdQ1O9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDwTSlmL97B+GDZH71DjJIcTEqivFLdq5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfCWT
  gLKCRalpqdWpGXmAGMJJi3BwaMkAtHKW1yQmFucmQ6ROsWoKCXO+xWkTwAkkVGaB9cGi99LjL
  JSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR51UHG82TmlcBNfwW0mAlo8YdDK0EWlyQipKQamFz
  1Ju+ZcKGpcUPuMXeN6wsDnZQmzXp22JrvSbNB/k6NssXh709zKC9UVLwds2Fx9+wz3W0K5Qfe
  +L5QXVxu8GdHwIuGaTr8ma6X19Q8MqiJ+fpx3+TtBqvLjKYVfLhmtUJ1i97BDI/kVRHt14/st
  l3YyjuXOSzsz8I/8W1mlvdnz7m8YbXWnYzYGTfdH/cXvpnE9kbSOzS+We7ljflvFVSPs+zPy4
  4xMxQ94jOb9e2RL5o2jE6zpy88PedmwTqW3m2CKmqP/wYbS0p9Cb37MeaUbpApk4ljGedzpjX
  Ln8+sDOs3fqX+3G+pmSSj6L1vIg4T8k794H5XeX6Lw337LQIRS1KuJXvo5yzw87R6+1GJpTgj
  0VCLuag4EQDLazZ9WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1672123688!181689!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15614 invoked from network); 27 Dec 2022 06:48:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:48:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 842F073
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 772297B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:48:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tesseract: upgrade 5.2.0 -> 5.3.0
Date: Tue, 27 Dec 2022 14:47:29 +0800
Message-ID: <1672123650-32043-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
References: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100277

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * Fix the training tools for the legacy OCR engine (fix issue #3925).
 * PDF renderer: Ignore non-text blocks (fix issue #3957).
 * Remove colormap before thresholding (fix issue #3940).
 * Fix a number of performance issues reported by Coverity Scan.
 * Training tools: Replace call of exit function by return statement in main function.
 * Fix double free in function vigorous_noise_removal (fix issue #3876).
 * Create to_win if needed in Textord::make_spline_rows (fix issue #3875).
 * Bug fixes for ScrollView viewer:
   * Fix memory issues in ScrollView::MessageReceiver.
   * Catch potential nullptr in SVNetwork::SVNetwork.
   * Move svpaint.cpp from src/viewer to src/.
   * Add rule for svpaint executable in Autotools.
 * Bug fixes and improvements for build tools:
   * Fix AMD64 detection with autobuild on FreeBSD (fix issue #3964).
   * Fix tesseract.pc generated from CMake to match Autotools.
   * Detect availability of AVX512-VNNI.
   * configure.ac: fix build on aarch64_be.
 * Drop CI for old versions of macOS and Ubuntu.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.2.0.bb => tesseract_5.3.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.2.0.bb => tesseract_5.3.0.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.2.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.2.0.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
index 8eb207356..f791ad546 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.2.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "5ad5325a0aa8effc47ca033625b6a51682f82767"
+SRCREV = "080da83cc51c4ef8b324a7e03146fe0bd7e0944b"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https \
           "
 
-- 
2.25.1


