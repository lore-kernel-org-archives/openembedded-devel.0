Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091B3C02199
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.30502.1735032438455142389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pzcxIHE9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032451; x=1766568451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hD/eqv3M5bF6rktCu0FmTrwOfachhsWhcdjmHRVpmTU=;
  b=pzcxIHE94gnO5fbFuJ8rbhG9oGeGFuxLDCF77tCkXOT9VR3H64/D1kSN
   wIdKzJTyMzucrS+kV4hucYVCBSS09l7BrFAVFDvaOTnYhTUhC5yxyInRR
   8988S1g7XY/9GoISfo0cv2gz9nxzpX32SLakQJFe16X4Y5ugHxVTF3w3a
   xQglIZowOpaa7j1hEVenOIZLMEUiGwKfqTnVAAdlBfeMvVx/a0PsfeQjX
   t8oiSLBdpM2833owEGVk8dJM5v3lFfScvS8eecEabdsO/xFYz0o+yuUhK
   6J/1/IdUrOoZpYavkS58mKysxscpKGTp/eos6j/5avHEEIhk3LFT+oZeU
   A==;
X-CSE-ConnectionGUID: euWkzvpHSdmFl2uFupiG8Q==
X-CSE-MsgGUID: 51H5L32pTROZHA5R+JM1GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248064"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248064"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BA296D480C
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 89C41D8CAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EF436BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D94511A0073;
	Tue, 24 Dec 2024 17:27:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/67] python3-python-multipart: upgrade 0.0.12 -> 0.0.20
Date: Tue, 24 Dec 2024 17:26:47 +0800
Message-Id: <1735032421-13513-53-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--2.398500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr2FA7wK9mP9eWufoHnGUNfgjJ
	lierVE/ndnLCqPd2a8ebf27+X2x9Mh1YpEPWJiyz/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ2uX
	Hvx4h0c2K6+iS4xVS+OuLFZZYlisfHxPMjOKY7A+6vVBUUydJCsRB0bsfrpPIcSqbxBgG0w648j
	QwcOHrsS6AT8Guc+CUvXVLxpnkXFEcmg+yn8Gb9/UQ1WEjtuxynQtL+k0rG6LtBBXGXYJ5zkSY9
	jdthctQ+g5xgOP5iFaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114524

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Handle messages containing only end boundary #142.
- Don't warn when CRLF is found after last boundary on MultipartParser #193.
- Hard break if found data after last boundary on MultipartParser #189.
- Handle PermissionError in fallback code for old import name #182.
- Add dunder attributes to multipart package #177.
- Replace FutureWarning to PendingDeprecationWarning #174.
- Add missing files to SDist #171.
- Fix import scheme for multipart module (#168).
- Rename import to python_multipart

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.12.bb => python3-python-multipart_0.0.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.12.bb => python3-python-multipart_0.0.20.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
index b1ed5e5522..db5e7bb45a 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
-SRC_URI[sha256sum] = "045e1f98d719c1ce085ed7f7e1ef9d8ccc8c02ba02b5566d5f7521410ced58cb"
+SRC_URI[sha256sum] = "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


