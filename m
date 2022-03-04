Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C13C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 09:41:08 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.5227.1646386866155220994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 01:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2249f56g018679
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 4 Mar 2022 01:41:05 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2249f4dB001583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 4 Mar 2022 01:41:05 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 4 Mar 2022 01:41:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 01:41:04 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 4 Mar 2022 01:41:03 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-blivet: fix up base_libdir
Date: Fri, 4 Mar 2022 17:41:00 +0800
Message-ID: <20220304094100.13768-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 09:41:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95780

From: Kai Kang <kai.kang@windriver.com>

It fails to run do_install when multilib enabled that systemd service
files are installed in ${nonarch_base_libdir}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.4.3.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
index 85575df7b..187e0330c 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
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


