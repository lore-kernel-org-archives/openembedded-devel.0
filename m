Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.27060.1612139635108878547
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 16:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1110Xhji008974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 31 Jan 2021 16:33:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 31 Jan 2021 16:33:43 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Sun, 31 Jan 2021 16:33:39 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5][PATCH] qtdeclarative: overwrite do_install_ptest
Date: Mon, 1 Feb 2021 08:33:35 +0800
Message-ID: <20210201003335.5729-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Overwrite and extend do_install_ptest for qtdeclarative. It fixes
runtime errors:

| FAIL!  : TestQmllint::initTestCase() '!m_dataDirectory.isEmpty()'
           returned FALSE. ('data' directory not found)

With this change, more tests have been run and the results are better:

passed: 993 -> 2318
failed: 182 -> 113

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-qt/qt5/qtdeclarative_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 3ff69d6..91e239f 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -27,6 +27,25 @@ PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
 PACKAGECONFIG[qml-network] = "-qml-network, -no-qml-network"
 PACKAGECONFIG[static] = ",,qtdeclarative-native"
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}
+    for var in `find ${B}/tests/auto/ -name tst_*`; do
+        case=$(basename ${var})
+        if [ -z `echo ${case} | grep '\.'` ]; then
+            dname=$(dirname ${var})
+            pdir=$(basename ${dname})
+            echo ${pdir}/${case} >> ${D}${PTEST_PATH}/tst_list
+
+            mkdir ${D}${PTEST_PATH}/${pdir}
+            install -m 0744 ${var} ${D}${PTEST_PATH}/${pdir}
+            data_dir=${S}/${dname##${B}}/data
+            if [ -d ${data_dir} ]; then
+                cp -r ${data_dir} ${D}${PTEST_PATH}/${pdir}
+            fi
+        fi
+    done
+}
+
 do_install_append_class-nativesdk() {
     # qml files not needed in nativesdk
     rm -rf ${D}${OE_QMAKE_PATH_QML}
-- 
2.17.1

