Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1988DECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:50:53 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.32527.1661482246868815669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i7si84Q1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482245; i=@fujitsu.com;
	bh=rD7QDsErzR58A1000yxCISlbyfxiJuryLupyWJ7OZK0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i7si84Q1nsPeyFBwzC7hl46+7qx/Yoe8Ql4DOu8jl19PKNvAAVMFWp5MuMTyCPVZR
	 v6hR79vuSAEFvRorg+VAdgGChnJ/bZnyG/D4DG8fm+Ynf7EzWZWE+4Td0Fd3voDEoT
	 2yhTlxt0rwMqMFEWhVCSN6jAb4tEV7t3TIL2OKPakLBlmNCbxUtDtZ7jDymZDCefy9
	 F3bpIY++qYvDAYFm2heWBrCR8dZg57kdfoYp322Hhj2qxxoCq86cj+g9zPLDhVkRFG
	 sSV2H2jYe21guenrRseVkMc9bkMsqTI4aM+VsmS6chMULJJNFw8oIDQ8Rr6eOxys+u
	 2yzPaIE6AF32w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8OxWZfFlCP
  ZYNlObouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPZuWvsBX85KlomL2NpYFzM0cXIySEk8JBR
  YtENqS5GLiD7CpPEt/9tbBDOQUaJJxvfMoNUsQnoSrz4sZgFxBYR0JdYOnsPWFxYwFfi9cd2o
  DgHB4uAqkT3/GAQk1fAQ2LN6mCQCgkBBYkpD9+DVfMKCEqcnPkEbAqzgITEwRcvmEHKJQQUJW
  ZPl4cwKyVuPE6F6FSTuHpuE/MERr5ZSJpnIWlewMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11T
  XyNRUL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMOhSiln/72Ds7vupd4hR
  koNJSZRX/xl7shBfUn5KZUZicUZ8UWlOavEhRhkODiUJXjUTjmQhwaLU9NSKtMwcYATApCU4e
  JREeKVFgdK8xQWJucWZ6RCpU4yKUuK8/42AEgIgiYzSPLg2WNRdYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMm2oINIUnM68EbvoroMVMQIulNrCDLC5JREhJNTCFTDw970vk94/p6UuzW9R
  4yvd+3Mk1rXEii7Wop9Hv3Qk3HA6+srzLOuFX1dGv03aJzVrC6DFnzd6aJw//71n3Pi9l9Qfl
  kO+s1+8GfnJS2/1VY3Wpik1PGUPiVMmnrWs69uxhm7dm7rUf2Wc+bbQ00nfW995qZdMu9LZra
  c3isy6fb7qqPtDdqcnBb6Sr0v/u6Am1+wEs0bPWqfZPmsk9uVP1rd0T77NXikPNfylOf2obka
  YvsHpF3ev9Zt65rHYBL11e/oi8mXFpeuXb6W8O3bJdKJ8S3mFQptDpfD0xaJLEYjnz3y4r1x5
  bes/H0XJqIbti/77bF+caiJfISoitb1hZcesz9/rtKx6E39jHrsRSnJFoqMVcVJwIABYHM4I1
  AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1661482243!106680!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28118 invoked from network); 26 Aug 2022 02:50:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:50:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C8579142
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:50:43 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id AF7417B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:50:43 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:50:42 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-asttokens: upgrade 2.0.7 -> 2.0.8
Date: Fri, 26 Aug 2022 10:50:34 +0800
Message-ID: <1661482234-13098-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:50:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98450

Changelog:
  Fix mypy explicit re-export issues

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-asttokens_2.0.7.bb => python3-asttokens_2.0.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.7.bb => python3-asttokens_2.0.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.0.8.bb
index 5e3ca9e30f..973c57661b 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.8.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8444353e4e2a99661c8dfb85ec9c02eedded08f0006234bff7db44a06840acc2"
+SRC_URI[sha256sum] = "c61e16246ecfb2cde2958406b4c8ebc043c9e6d73aaa83c941673b35e5d3a76b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


