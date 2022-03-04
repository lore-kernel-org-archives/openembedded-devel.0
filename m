Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18042C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 09:38:57 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.5240.1646386735524038263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 01:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2249cqPY018532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 4 Mar 2022 01:38:53 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 4 Mar 2022 01:38:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 01:38:52 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 4 Mar 2022 01:38:51 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-blivet: fix up base_libdir and update
 licence
Date: Fri, 4 Mar 2022 17:38:50 +0800
Message-ID: <20220304093850.10998-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 09:38:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95779

From: Kai Kang <kai.kang@windriver.com>

It fails to run do_install when multilib enabled that systemd service
files are installed in ${nonarch_base_libdir}.

And update LICENSE variable to use SPDX license identifiers as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.4.3.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
index 85575df7b..1d2add87a 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A python module for system storage configuration"
 HOMEPAGE = "http://fedoraproject.org/wiki/blivet"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
@@ -26,7 +26,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 do_install:append() {
     mv ${D}${PYTHON_SITEPACKAGES_DIR}${exec_prefix}/* ${D}${exec_prefix}
     mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir} ${D}
-    mv ${D}${PYTHON_SITEPACKAGES_DIR}${base_libdir} ${D}
+    mv ${D}${PYTHON_SITEPACKAGES_DIR}${nonarch_base_libdir} ${D}
 }
 
 RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
-- 
2.17.1


