Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.15276.1599550900593857638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2020 00:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0887fZMV003643
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Sep 2020 00:41:36 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Sep 2020
 00:41:23 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencv: improve reproducibility
Date: Tue, 8 Sep 2020 00:41:23 -0700
Message-ID: <20200908074123.51398-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the build host info to improve reproducibility, otherwise there
comes below detailed build host info when run below command on target.
  # python3 /usr/share/opencv4/samples/python/opencv_version.py --build
[snip]
  Extra modules:
    Location (extra):            /buildarea1/master-wr/build/User/customized_next/build/tmp/work/corei7-64-wrs-linux/opencv/4.3.0-r0/contrib/modules
[snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_4.4.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.4.0.bb b/meta-oe/recipes-support/opencv/opencv_4.4.0.bb
index 372e15cd0..c83186de0 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.4.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.4.0.bb
@@ -199,6 +199,13 @@ RDEPENDS_python3-opencv = "python3-core python3-numpy"
 
 RDEPENDS_${PN}-apps  = "bash"
 
+do_compile_prepend() {
+    # remove the build host info to improve reproducibility
+    if [ -f ${WORKDIR}/build/modules/core/version_string.inc ]; then
+        sed -i "s#${WORKDIR}#/workdir#g" ${WORKDIR}/build/modules/core/version_string.inc
+    fi
+}
+
 do_install_append() {
     # Move Python files into correct library folder (for multilib build)
     if [ "$libdir" != "/usr/lib" -a -d ${D}/usr/lib ]; then
-- 
2.17.1

