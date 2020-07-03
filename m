Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3219.1593746373949549502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 20:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,306,1589212800"; 
   d="scan'208";a="95745894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jul 2020 11:19:28 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 85D174CE4BD0
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Jul 2020 11:19:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Jul 2020 11:19:25 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH] upm:Fix build error when enable multilib.
Date: Fri, 3 Jul 2020 11:19:18 +0800
Message-ID: <1593746358-124780-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 85D174CE4BD0.A8DEB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

ERROR: upm-2.0.0+gitAUTOINC+5cf20df96c-r0 do_package: QA Issue: upm:
Files/directories were installed but not shipped in any package:
  /usr/lib/python3.8/site-packages/upm/pyupm_adc121c021.py
  /usr/lib/python3.8/site-packages/upm/pyupm_hmc5883l.py
  /usr/lib/python3.8/site-packages/upm/_pyupm_mma8x5x.so
  /usr/lib/python3.8/site-packages/upm/_pyupm_m24lr64e.so
  /usr/lib/python3.8/site-packages/upm/pyupm_tca9548a.py
  /usr/lib/python3.8/site-packages/upm/pyupm_mb704x.py
  /usr/lib/python3.8/site-packages/upm/_pyupm_ehr.so
  ......

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 5b3585c14..6a7611f38 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -46,6 +46,10 @@ PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '',
 PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
+do_configure_prepend() {
+    sed -i s:\"lib/${_packages_path}:\"${baselib}/${_packages_path}:g ${S}/cmake/modules/OpenCVDetectPython.cmake
+}
+
 FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS_${PYTHON_PN}-${PN} += "${PYTHON_PN}"
 
-- 
2.17.1



