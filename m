Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFA3C28B30
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4200.1741683324009471203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qlAbTx50;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683324; x=1773219324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nomZckm8dCgFZTk5+PzTkFwKKE8L85VZxkwEn2C3XCo=;
  b=qlAbTx509RLBHlxkbPhw2n+fVVlxCPpMCNVdsTiovY382dQdJublkzvm
   4foqwb4FGWjksotIAimFvqCh+IgjL63+RgxVK6MBS6TDSeXsOdepNoMQE
   P3VxdQ0XheAYnC+VJmyXrxnCh2aMJ5tDvXdV5xwCybf80SwPIMVmgHKf+
   nSnpZ5DAeeo7kPy7ZWBpM0WM1lWR7Jnsf/O5lIHovLY5BVZVw8UEV/mad
   UnaZ57VWbVV+s8Cg7x8nbt+8nU14sYKWEQbLqWaDp6eRikU65HPvon2a5
   z6iV1PbEDrfPD3FsyYpuSbtcSbCoE8sss7jvNwm3bE+zkzF6UG6nocLH6
   g==;
X-CSE-ConnectionGUID: IyiYl0S7SI60O8OLPwZmUQ==
X-CSE-MsgGUID: M2q3iXjfReuIx0G53Oz2+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="191859654"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="191859654"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A57A0C2266
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E04D729C
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 029471A0071;
	Tue, 11 Mar 2025 16:55:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/36] c-periphery: upgrade 2.4.2 -> 2.4.3
Date: Tue, 11 Mar 2025 16:54:36 +0800
Message-Id: <1741683310-8681-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115854

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:Coyright year updated to 2025

Changelog:
============
* Fix memory safety with some older 'strerror_r()' implementations in error
  formatters for all modules.
* Build
    * Fix character device GPIO support tests in Makefile for alternate
      shells and older versions of make.
    * Fix cross-compilation in Makefile from Windows.
    * Fix CMake minimum required version.
    * Add CMake package generation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{c-periphery_2.4.2.bb => c-periphery_2.4.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.4.2.bb => c-periphery_2.4.3.bb} (78%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.2.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
similarity index 78%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.4.2.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
index 8e38517448..f512111d66 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.2.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "https://github.com/vsergeev/c-periphery"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=be30d45bdc453f70a494c149c2168289"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88456d0a60de4c71ff4d787c212f253"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
-SRCREV = "91f9678d2a35a3af3c633f20165bdde8bea32209"
+SRCREV = "911e989fe41eb90c7df274cb54555346caf2a632"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


