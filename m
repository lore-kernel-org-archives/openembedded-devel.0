Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35A7C54E90
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16491.1747731318041994850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VPOrindg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731322; x=1779267322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Dh2uATfGE+wQwADIdTmwIrwdpZvttWDB2MrDqNmKhJg=;
  b=VPOrindg866lx6+1kkwZkBdSkbJHzVFOwIqIHjXugViTkOb/27bFbKfU
   0qUdV/7xwVzSkgJn1vi7+Tl8kLClaqFnx8fnqlRCq3SmHQ+XxicBOmEC1
   bw0sDJERsj8qNbaMfvDVzZOg7Ggk6t8cpr9AesQ1gzaXvr+BSEpBrhqh0
   vLXgk2r7eSZ0Iig2JNWy8jmhy1jdtdQXHcDOykdFFyGBGM1k7xlSaNO9z
   Lj3ZMyoyAcRKzAxzFrmAzBK3w275jWGifjrtGbyBPSGy3vfCGFn/Nm9fS
   pTsgvRbjRRp41DBz3hqjgyMWIssnRNPRs1vs17uf+34WpwitzgYQMcC8+
   g==;
X-CSE-ConnectionGUID: cigFBOTsSj6LRH448p2/bw==
X-CSE-MsgGUID: JtjLNZ4zRleyK3Yh5EPbLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="188447049"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="188447049"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 804E3E8FDB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ED73D4BCA
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9C481A009A;
	Tue, 20 May 2025 16:55:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/27] sip: upgrade 6.10.0 -> 6.11.0
Date: Tue, 20 May 2025 16:54:56 +0800
Message-Id: <1747731299-20448-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117506

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 6.11.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.10.0.bb => sip_6.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.10.0.bb => sip_6.11.0.bb} (77%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.10.0.bb b/meta-oe/recipes-devtools/sip/sip_6.11.0.bb
similarity index 77%
rename from meta-oe/recipes-devtools/sip/sip_6.10.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.11.0.bb
index 82a4bb3024..0db80c3cc0 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.10.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.11.0.bb
@@ -6,12 +6,12 @@ SUMMARY = "A Python bindings generator for C/C++ libraries"
 HOMEPAGE = "https://github.com/Python-SIP/sip"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "fa0515697d4c98dbe04d9e898d816de1427e5b9ae5d0e152169109fd21f5d29c"
+SRC_URI[sha256sum] = "237d24ead97a5ef2e8c06521dd94c38626e43702a2984c8a2843d7e67f07e799"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


