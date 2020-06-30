Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2025.1593537125094413615
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJng-0004sv-1d; Tue, 30 Jun 2020 20:12:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-keras-preprocessing: Upgrade 1.1.0 -> 1.1.2
Date: Tue, 30 Jun 2020 20:11:16 +0300
Message-Id: <20200630171119.25540-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630171119.25540-1-leon.anavi@konsulko.com>
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Switch to pypi. Upgrade to release 1.1.2:

- Allow zoom_range to be int or int tuple
- Make sure image iterator classes subclass the tf.keras
  Sequence class if it is available
- Minor optimization and dtype check

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-keras-preprocessing_1.1.0.bb  | 15 ---------------
 .../python/python3-keras-preprocessing_1.1.2.bb  | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
deleted file mode 100644
index eacb3402d..000000000
--- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Easy data preprocessing and data augmentation for deep learning models"
-HOMEPAGE = "https://github.com/keras-team/keras-preprocessing"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4"
-
-SRC_URI = "git://github.com/keras-team/keras-preprocessing.git"
-SRCREV ?= "ff90696c0416b74344b91df097b228e694339b88"
-
-inherit setuptools3
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
new file mode 100644
index 000000000..749b6c8c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Easy data preprocessing and data augmentation for deep learning models"
+HOMEPAGE = "https://github.com/keras-team/keras-preprocessing"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "d2a0e10437cfa5c2d09458a84fb58d05"
+SRC_URI[sha256sum] = "add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3"
+
+PYPI_PACKAGE = "Keras_Preprocessing"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/5e/f1/b44337faca48874333769a29398fe4666686733c8880aa160b9fd5dfe600/Keras_Preprocessing-${PV}.tar.gz"
+
+BBCLASSEXTEND = "native"
+
-- 
2.17.1

