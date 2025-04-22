Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F02C3ABAF
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.35396.1745311772873861980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ppH9+qJ4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311773; x=1776847773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BY8XvJxIza84buUiJhs8Q6BaR5yn0Qlv036Ts1MYZLc=;
  b=ppH9+qJ4I2QgWgnOG+02X7WQvJ60zhAXx4xCtokmhfeSGQsxsFcfBu/D
   QfFRj2OoUcZo5a9HbkDoMPQM3M2+krURhzetIrET/Va+IcwOm8Nby3eNy
   rgkqmTM/ovjEtbYoCSVEZLqAPaRdspIzDVsWX14hCAGTZr1rJ4oAIRTHM
   FwjndpLwtzY/aO2E5nmGJe+30sISuFFd+7hK4cl/SYShs8mzFpMN0MSrO
   JcHd8LOKzRsU9uKncjS/G6b9iZapxVqPgLmZj06dkAIvPpVbgm0R4jRhX
   1Qa08RjnSSQDjpgR3mTfredIOH+RvECo2UK8WJTam70vNKMVNRV8bd6Wf
   g==;
X-CSE-ConnectionGUID: 8rU0ACz1Sq6AzUtODLOXGA==
X-CSE-MsgGUID: zO72W1dmSAm+VDLSCcb5gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="200132591"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="200132591"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73EE5D480C
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C060BDC99
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF11B1A009A;
	Tue, 22 Apr 2025 16:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] ctags: upgrade 6.1.20250413.0 -> 6.1.20250420.0
Date: Tue, 22 Apr 2025 16:48:53 +0800
Message-Id: <1745311761-1912-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117023

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250413.0.bb => ctags_6.1.20250420.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250413.0.bb => ctags_6.1.20250420.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250413.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250420.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250413.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250420.0.bb
index a1f0eca4f1..8e3ab85078 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250413.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250420.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "fccad9b77c17c60e908a69af8d251eec5f5296b5"
+SRCREV = "bbd841c8c55dd96c9ff9fa6699aea31a9f9ada42"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


