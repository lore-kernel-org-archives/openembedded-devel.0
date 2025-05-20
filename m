Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C2FC54EDA
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.16219.1747731313782674913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dkZojT2x;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731314; x=1779267314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fjyZsb4e5ja9T3vEiVYtQW4dAWxNtt/9MXDI3JNb/Bw=;
  b=dkZojT2xjViEwLcb41dCecLxVFY44Znx5Oyi8b9GqPnLPCeRaKDYkvjL
   8KoFk5kibX5qEALld9QGpbzzC7NIoavOXjxiwZAf0+yPhLQ65GpmQeIjF
   fh5dItS1EIncoaNkqxhJSMiHg6uQ4Adou5/uNDTxWRcc1PWjOfqXpjBYu
   5N58GxgUB2dE84yFmPVwTFpneVzjNINm0FYfb4/psU2kH5IK1owG2Nuq+
   h6Mbfnwf24VVeordzV4OmuPBNBg3LIe7TBuJrzeDbAA3ChJpqYCB6R1r4
   r3ZXnkLm36uujS1OMLc0djGUk/3UaN/+PD3PXH0F4nxe+nPJbszeNYT3F
   A==;
X-CSE-ConnectionGUID: Ph6N7gG4RdKSkkjhJQMjUA==
X-CSE-MsgGUID: QaWiFEbbTB6eNoUpjRI2aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200024043"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200024043"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B0B35D8FCD
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 702B1D4BDC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0746D1A0078;
	Tue, 20 May 2025 16:55:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/27] googlebenchmark: upgrade 1.9.2 -> 1.9.3
Date: Tue, 20 May 2025 16:54:35 +0800
Message-Id: <1747731299-20448-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117485

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Use the top-level ::benchmark namespace to resolve make_unique
- Refactor threading run
- Threading api v3
- Templated fixture methods
- Macro fix
- Deprecate ubuntu-20.04 images in actions
- deps: Update nanobind_bazel to v2.7.0
- Fix error handling of getloadavg
- Improve user UX on empty benchmarks
- Detect and report ASLR status
- Automatic ASLR disablement
- dev: Update pre-commit hooks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.9.2.bb => googlebenchmark_1.9.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.9.2.bb => googlebenchmark_1.9.3.bb} (86%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.2.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.3.bb
similarity index 86%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.2.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.3.bb
index 03adffce82..3eba27c3c1 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.2.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.3.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "afa23b7699c17f1e26c88cbf95257b20d78d6247"
+SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "299e5928955cc62af9968370293b916f5130916f"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


