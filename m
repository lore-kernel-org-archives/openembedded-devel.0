Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.12816.1597386086962520113
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 23:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07E6L4gQ024109
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 23:21:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 23:20:41 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mozjs: fix multilib conflict
Date: Fri, 14 Aug 2020 14:15:57 +0800
Message-ID: <20200814061557.313730-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
.do_rootfs.2023872:4562:  file /usr/bin/js60-config conflicts between attempted installs of mozjs-dev-60.9.0-r0.core2_64 and lib32-mozjs-dev-60.9.0-r0.core2_32
log.do_rootfs.2023872:4563:  file /usr/include/mozjs-60/js-config.h conflicts between attempted installs of mozjs-dev-60.9.0-r0.core2_64 and lib32-mozjs-dev-60.9.0-r0.core2_32

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
index f13a184b6..554d8338b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -117,6 +117,14 @@ do_install_prepend() {
     export PYTHONPATH=`cat ${B}/PYTHONPATH`
 }
 
+inherit multilib_script multilib_header
+
+MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js60-config"
+
+do_install_append() {
+       oe_multilib_header mozjs-60/js-config.h
+}
+
 PACKAGES =+ "lib${BPN}"
 FILES_lib${BPN} += "${libdir}/lib*.so"
 FILES_${PN}-dev += "${bindir}/js60-config"
-- 
2.17.1

