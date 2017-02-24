Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1BF7315A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 04:29:45 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id b16so1393646qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 20:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+guB6JRTdalV2/MiF8ZCQATjxTQ++DJOXt+ykOnpetE=;
	b=Ax9hxzkn7b9FAq453lXEFR4Q6xmg9lo6rEwWfx1KkrqkD3FunoB7feUL93kYj0FxhS
	b/bx8R0kgIa4bm/bjGUJ/hfI+NJugoBSznCoPPMoedygCfDtV3iD7n1JvAtqYUDh323x
	nU0Eay3Q2SUtl3JLts/GLgH4LBcVdslcRK9moKWei9iBr94RpClvs6OMCqtNzDZOyUJk
	f/yJcmOm0j+6CEIVJi0BZJF9t0HGbIW8UstUV9WTNayN+o+X7K28wbkfv4l7ALCDWCeG
	vtJAQf+36r37y5xiw/Mzfs51PdaUOoZGr0Og8+u3iSOiTRrDWrUIZMpT/1GOBaFWZ05E
	RJ6A==
X-Gm-Message-State: AMke39nn1M3M1AqbZtZ0QMweZhG+lyEWeTC69SOIezVyqLm1gfzKQoYzQbd79pSPV3GKAw==
X-Received: by 10.237.35.210 with SMTP id k18mr654713qtc.219.1487910586647;
	Thu, 23 Feb 2017 20:29:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	b36sm4129503qte.21.2017.02.23.20.29.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 20:29:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 23:29:41 -0500
Message-Id: <1487910581-28227-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-gdata: update to version 2.0.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 04:29:49 -0000

Verified the license terms remain the same and update
RDEPENDS

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-gdata_1.2.4.bb   | 17 -----------------
 .../recipes-devtools/python/python-gdata_2.0.18.bb  | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-gdata_2.0.18.bb

diff --git a/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
deleted file mode 100644
index 2205584..0000000
--- a/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Google Data APIs Python Client Library"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.txt;md5=473bd4dff0ddca1f958244b2dc7a162c"
-HOMEPAGE = "http://code.google.com/p/gdata-python-client/"
-
-inherit distutils
-
-SRC_URI = "http://gdata-python-client.googlecode.com/files/gdata.py-${PV}.tar.gz"
-SRC_URI[md5sum] = "521f33a377d64f8a6505ba119415b787"
-SRC_URI[sha256sum] = "fc5ddb8f76b17abd728721a0e0177ea35f55a70106f44dc9010b22eceb06abde"
-
-S = "${WORKDIR}/gdata.py-${PV}"
-
-FILES_${PN} += "${datadir}"
-
-RDEPENDS_${PN} = "python-xml"
diff --git a/meta-python/recipes-devtools/python/python-gdata_2.0.18.bb b/meta-python/recipes-devtools/python/python-gdata_2.0.18.bb
new file mode 100644
index 0000000..897581f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-gdata_2.0.18.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Google Data APIs Python Client Library"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.txt;md5=4c8f0e6846e52a7fe4943acf462d808d"
+HOMEPAGE = "http://code.google.com/p/gdata-python-client/"
+
+SRC_URI[md5sum] = "13b6e6dd8f9e3e9a8e005e05a8329408"
+SRC_URI[sha256sum] = "56e7d22de819c22b13ceb0fe1869729b4287f89ebbd4bb55380d7bcf61a1fdb6"
+
+S = "${WORKDIR}/gdata.py-${PV}"
+
+inherit pypi distutils
+
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-xml \
+"
-- 
2.7.4


