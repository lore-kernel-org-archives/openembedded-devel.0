Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84476CCFA03
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:53:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2277.1693965180227197574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="110265881"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="110265881"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:52:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EB01DDC61
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:52:55 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B4F4ABF49C
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:52:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D0C4A2FC7C3F;
	Wed,  6 Sep 2023 10:52:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 10.1.0 -> 10.1.1
Date: Wed,  6 Sep 2023 09:52:45 +0800
Message-Id: <1693965165-13882-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10--1.409300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrsnK72MaPSqfDZ+9HI5nLbCxX
	wd9S2XGhb7vhAFDgsdNNhLl88xPkFMa3bF0uxjdk72Rb2bEJC+0rYYq12IWZOTVrjeSxUraF7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+ARCE2NlBjIjctE8mz+ry/JQhjp
	75eLVqH+0B0MT8S0EkgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyJzXKn1rBJmbs023wxwIT7y6E1
	S0ilrCm/0xgNjXKeRHMB2ds8bjbBy0VFVLM58ZuoqCqFxyMhSXFtkcM7A7uikzJj1D4TJ53/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104733

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Added formatters for std::atomic and atomic_flag (#3574, #3594).
Fixed an error about partial specialization of formatter<string> after instantiation when compiled with gcc and C++20 (#3584).
Fixed compilation as a C++20 module with gcc and clang (#3587, #3597, #3605).
Made fmt::to_string work with types that have format_as overloads (#3575).
Made formatted_size work with integral format specifiers at compile time (#3591).
Fixed a warning about the no_unique_address attribute on clang-cl (#3599).
Improved compatibility with the legacy GBK encoding (#3598, #3599).
Added OpenSSF Scorecard analysis (#3530, #3571).
Updated CI dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_10.1.0.bb => fmt_10.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_10.1.0.bb => fmt_10.1.1.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_10.1.0.bb b/meta-oe/recipes-support/fmt/fmt_10.1.1.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_10.1.0.bb
rename to meta-oe/recipes-support/fmt/fmt_10.1.1.bb
index f8d7edcdfe..d6706d3e7a 100644
--- a/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_10.1.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "e57ca2e3685b160617d3d95fcd9e789c4e06ca88"
+SRCREV = "f5e54359df4c26b6230fc61d38aa294581393084"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


