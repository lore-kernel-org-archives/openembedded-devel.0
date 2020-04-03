Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.4483.1585942966526335973
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=kJvNONdO;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 8E102600BB;
	Fri,  3 Apr 2020 21:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585942964;
	bh=LxcYkkAjuruwAYZS/dd/YzY40h5Lo2L1KOUuYjeuckY=;
	h=From:To:Cc:Subject:Date:From;
	b=kJvNONdOIrByJ5QNr1llRif1Pf69ZEZ+JBmlBGv1cRtn5o6q041WCjhsLva5p0L2h
	 aW1f8hHcRMsH3MH8sPGQTJaLFlI8KN1Bh4H83vN4FO/6S3Sj+WUsZUFa0qHNyBg2WW
	 HcwamfuKMQ8Lc6zAypvNDHzpLGOgyrsLBnJnFdOhs7+FvassLDHkr2Nu/Up+uG6Vun
	 EdpbB+ahAKY2fYsyMWr8i8Y2xGGNeUTrNg5yxL1pj2D5KS8Sl2cMCwvWIco3m/E460
	 7gsXv5S/YusG2BxRJDrDT04ei68VsVHa1HW/cfhQW+pho1gmg+8ysr9G3kwiaPOaLd
	 xhzggi9uJ4XAw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 1/5] python-pyroute2: consolidate into a single file
Date: Fri,  3 Apr 2020 21:42:39 +0200
Message-Id: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-devtools/python/python-pyroute2.inc    | 25 ----------------------
 .../python/python3-pyroute2_0.5.9.bb               | 25 ++++++++++++++++++++--
 2 files changed, 23 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyroute2.inc

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
deleted file mode 100644
index add7b7b..0000000
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A pure Python netlink and Linux network configuration library"
-LICENSE = "GPLv2 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
-
-SRC_URI[md5sum] = "4ee568832c98c39253230293a2ca3d59"
-SRC_URI[sha256sum] = "240ed116fabef02c284cc40d27986e629f02aa788311a8059905b8988752d5b7"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-unixadmin \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
index a23e72c..90d9486 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
@@ -1,2 +1,23 @@
-require python-pyroute2.inc
-inherit setuptools3
+SUMMARY = "A pure Python netlink and Linux network configuration library"
+LICENSE = "GPLv2 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
+
+SRC_URI[md5sum] = "4ee568832c98c39253230293a2ca3d59"
+SRC_URI[sha256sum] = "240ed116fabef02c284cc40d27986e629f02aa788311a8059905b8988752d5b7"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-unixadmin \
+"
-- 
2.7.4

