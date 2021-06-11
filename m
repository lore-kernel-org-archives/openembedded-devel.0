Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3808.1623382270618449339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15B3V9Li031540
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 20:31:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 10 Jun 2021 20:31:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 10 Jun 2021 20:31:08 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minifi-cpp: set correct python processor directory in configure file
Date: Fri, 11 Jun 2021 11:28:51 +0800
Message-ID: <20210611032851.40094-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Yi Zhao <yi.zhao@windriver.com>

Set an appropriate python processor directory in configure file to fix
the minifi startup warning:
[org::apache::nifi::minifi::python::PythonCreator] [error] Could not access /etc/minifi/minifi-python/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 86c149ba5..fdbb65e1c 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -89,6 +89,7 @@ do_install() {
     install -d ${D}${MINIFI_BIN}
     install -d ${D}${MINIFI_HOME}/conf
     install -m 755 -d ${D}${localstatedir}/lib/minifi
+    install -m 755 -d ${D}${libexecdir}/minifi-python
     cp -a ${WORKDIR}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
     cp -a ${WORKDIR}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
 
@@ -102,6 +103,8 @@ do_install() {
         ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file='${MINIFI_HOME}'/conf/config.yml|g' \
         ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i 's|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
 
     sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
     sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
-- 
2.17.1

