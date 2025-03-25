Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8E1C369A6
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.61530.1742893339566841355
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fg5Ninzp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893339; x=1774429339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=je0rt+v+6jEOM6HRM7J3SNP3pcEIRlvk8djrz2u1eNk=;
  b=fg5Ninzpa+OXfcbt3uXLLp7ks5I/pVaoTZQIDmsek+GbQ2xf5M0aM3yu
   QAw6O0TXb21uClSiibp8B7wEpeCWjIkB2kj6ajp1a68L06XXvjtqTJvMV
   13uA20Tbav1jcILSiYp4k1RY0DrlDLJhZbLsKD+RrCuak6ik8E+jRhGda
   lu/SGI1SzKeJhhgwWREdXf1Yl82nkjoD44H9pMIKBR+O7Jny8R6q+BhDF
   QH9hR6p245orng1uYR6A0lw8l3Jd8+2ATd6xKpVQZ2K57Zz5LybAbODFr
   LyEeoC7ZllezGFJHoK1kwEfjfKeoBM/p6T76geVtXZWfPyFqjtM3qz9n8
   w==;
X-CSE-ConnectionGUID: Aa1oLeTBQIe8DskYQEoJ1A==
X-CSE-MsgGUID: TnlYwJQ7R0qyrcn1M0lu/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="181539250"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="181539250"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:17 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EB59D4808
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 42F62D8B0F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8AF991A00A1;
	Tue, 25 Mar 2025 17:02:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/45] libtinyxml2: upgrade 10.1.0 -> 11.0.0
Date: Tue, 25 Mar 2025 17:01:24 +0800
Message-Id: <1742893312-3809-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116243

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtinyxml2_10.1.0.bb => libtinyxml2_11.0.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_10.1.0.bb => libtinyxml2_11.0.0.bb} (94%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.1.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
similarity index 94%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.1.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index 6bea792a78..e0b07deca3 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.1.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 CVE_PRODUCT = "tinyxml2"
 
-SRCREV = "57eea48c5bfc354ac45d53b2eb499e66c80d63e0"
+SRCREV = "9148bdf719e997d1f474be6bcc7943881046dba1"
 SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
            file://run-ptest"
 
-- 
2.43.0


