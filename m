Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.7218.1620698880693405447
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14B27xei017120
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 10 May 2021 19:07:58 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 10 May 2021 19:07:58 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-paho-mqtt: add package python3-paho-mqtt-examples
Date: Tue, 11 May 2021 10:07:11 +0800
Message-ID: <20210511020711.18776-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

package examples under source into python3-paho-mqtt-examples

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python/python3-paho-mqtt_1.5.1.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
index d93bc884e..d002c0fc5 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
@@ -13,6 +13,17 @@ SRC_URI[sha256sum] = "9feb068e822be7b3a116324e01fb6028eb1d66412bf98595ae72698965
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
+do_install_append() {
+        install -d -m0755 ${D}${datadir}/${BPN}/examples
+        cp --preserve=mode,timestamps -R ${S}/examples/* ${D}${datadir}/${BPN}/examples
+}
+
+PACKAGES =+ "${PN}-examples"
+
+RDEPENDS_${PN}-examples += "${PN}"
+
+FILES_${PN}-examples = "${datadir}/${BPN}/examples"
+
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
-- 
2.17.1

