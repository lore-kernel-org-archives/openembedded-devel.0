Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9705C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.61531.1742893340436711089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XqHTdQ+k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893344; x=1774429344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zx+yTbAHr7gOdijpTMBDK0+QXQhGaZVPv9jVS8z2L5A=;
  b=XqHTdQ+k0HUgODgGREQ9RQCDVtugKZ93cbtmRjyfHlXKFxsc3Se4cu4E
   gCzV/LBioO6kYkvGavh0L9mcfQEq4ZxLrHcPsDyPkaGXYJwl/PcsWITdD
   TUz20RKF50zDvV5Gf+HUQrjWDjPBpcU8VhEfBEIVatmr3Z5Cp5/rG73My
   qRhGqCm273wxi4vdBgXbHqM/tS96i6Mdq3pxBzpdRH/9CFw6s9D9rUgU/
   qpPbnkeHO7Cvyb5NIoEWe4G+whyyDb5ugduPY1dWkj278uqzDvTaek6L6
   3y5p8XQEMxS32Vvw/MntdHoGLw9sRf5qM8Ko+5iuEilUWGQu+23q2V4qF
   Q==;
X-CSE-ConnectionGUID: Odl7F4aHRtSEkj8j846E8A==
X-CSE-MsgGUID: m356YGlITlmKDV3FcBpvdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="196914949"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="196914949"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A93EDC726
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 608F7BDCB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1DD51A00A1;
	Tue, 25 Mar 2025 17:02:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/45] python3-xmlschema: upgrade 3.4.3 -> 3.4.5
Date: Tue, 25 Mar 2025 17:01:48 +0800
Message-Id: <1742893312-3809-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116265

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Migrate project metadata to pyproject.toml
- Fix static typing errors with mypy==1.15.0 and elementpath==4.8.0
- Fix xs:all groups occurs check

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.4.3.bb => python3-xmlschema_3.4.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.4.3.bb => python3-xmlschema_3.4.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.3.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.4.3.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.4.5.bb
index 8f2fd9af4d..f4e76d7a2e 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "0c638dac81c7d6c9da9a8d7544402c48cffe7ee0e13cc47fc0c18794d1395dfb"
+SRC_URI[sha256sum] = "243244743f151ec859ec0bbf1368fa3f70e5f29e977b77f72e1c9b8f8ae670f6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


