Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A608CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.27231.1761696915733139576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=An6e2tvy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696917; x=1793232917;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HI5gAMjToRlHqumMfooT2phuDnMXSBSLV3zGzs70k4U=;
  b=An6e2tvy8p+wXzbqBAus7H5sLmdXr8ub5QQuooPR+9lv8I2Yj1PS70+i
   WeZzpre5S9kogvsvlGTBlSpuBhdYC6DaICuA16ypiew8gh9GGu0wPL+RM
   NWqNhASNGjLek3vm2oG+HqvTVdIi7Cbb7Z8CNZK5jhxfDG/gZBvxUgRVb
   w9S01qugz4RRwpiz8cHU1m6R4uzKxjY11VLuD+TD94sSd1sftGP522c2h
   WcbtAd61LSViUt4cwNWMcHFTs2qAfONLNEXbITMZrPeDLVSUPYaOpUDV5
   uIQWdtAPbCOBT8mZ7hmLQ8Fwe+7Rhf7bkb4wUp1ysnivojxKA/7Pk/Xpj
   g==;
X-CSE-ConnectionGUID: ch/oQhRzRSKrdAfTWa083g==
X-CSE-MsgGUID: 9pK0BGPARmuqBDtaXq+/KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217402918"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217402918"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:15 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0D12A1002B91
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B84B38D205C
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0B64E82C0F2;
	Wed, 29 Oct 2025 00:15:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/32] cli11: upgrade 2.5.0 -> 2.6.0
Date: Wed, 29 Oct 2025 08:14:34 +0800
Message-ID: <20251029001505.528-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121107

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: CLI11 2.2 updated to CLI11 2.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cli11/{cli11_2.5.0.bb => cli11_2.6.0.bb}               | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_2.5.0.bb => cli11_2.6.0.bb} (84%)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb b/meta-oe/recipes-support/cli11/cli11_2.6.0.bb
similarity index 84%
rename from meta-oe/recipes-support/cli11/cli11_2.5.0.bb
rename to meta-oe/recipes-support/cli11/cli11_2.6.0.bb
index 980932165b..def32b7a6b 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.6.0.bb
@@ -1,15 +1,14 @@
-SUMMARY = "C++11 command line parser"
 DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b8bdde6bda8508bef68a39f3e0d7e939"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27559a6fd853c4b46ec4dea16597460c"
 
 DEPENDS = "catch2"
 
-SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
+SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https;tag=v${PV} \
            file://remove_tmpdir_from_test_binary.patch \
            file://run-ptest"
-SRCREV = "4160d259d961cd393fd8d67590a8c7d210207348"
+SRCREV = "3914826ef81208f37dc5843fa16f491d7f8c0829"
 
 inherit cmake ptest
 
-- 
2.43.0


