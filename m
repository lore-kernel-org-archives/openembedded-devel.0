Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5844578733
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 13:39:04 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d8so12675823qtm.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 05:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=96qcDxkTDtB4OjMnHNDroUdb2Eeh6p82PKucEkk22n0=;
	b=LAdkCBfClD5jvjdssGWc8hpFDTXm6FwyPUZp3cOU5gTt5lRBAK07aWlW/dl3wPhiE5
	DPd4pWsPb09qTHzjFRBARkkSRg95/Snor8ISfCJBqcDntUrgqk5EW8fRB5eIfMGqSngM
	OEwdhMsPtroaCUbRTRgKbpuQVXkLitNJrYTEzIF+yFI/NpO+xDVn4TMFCEXOrE2y7E05
	Uh9bLZ+lsGC265w9bc0vRxW+Yid8lWIh1sam5vQwhRCPP7CExoyWFfUfePid1RFK35dJ
	ONOO+FntVffFGR0ZJdBMlYMB8l1+fmuQOdu5HK711ZdonWVrafFnH+zbVkCi6RDKqEhj
	OiXA==
X-Gm-Message-State: AKwxytc9rn9yyfAqPr9BKM6qEqcqLDYvWXBw1jXIFw9M3otDkPVz+3DD
	OkHGHS+wBRkzvVcxYJrBrKG/bQok
X-Google-Smtp-Source: AH8x224vH5aWwakJ5UKLhVBtBTUJNP+/w5G37Uwa5EmUpTCvEJzt54w8JjYIiDYGeFIXbBMDn3cPfQ==
X-Received: by 10.237.57.231 with SMTP id m94mr33690779qte.17.1517233145982;
	Mon, 29 Jan 2018 05:39:05 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id q6sm7749601qkj.31.2018.01.29.05.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 05:39:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jan 2018 08:39:01 -0500
Message-Id: <1517233141-5668-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-yappi: add a python3 version of the recipe
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
X-List-Received-Date: Mon, 29 Jan 2018 13:39:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-yappi.inc   | 16 ++++++++++++++++
 .../recipes-devtools/python/python-yappi_0.98.bb       | 18 ++----------------
 .../recipes-devtools/python/python3-yappi_0.98.bb      |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-yappi.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi_0.98.bb

diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
new file mode 100644
index 0000000..651ce77
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-yappi.inc
@@ -0,0 +1,16 @@
+SUMMARY  = "Yet Another Python Profiler"
+HOMEPAGE = "http://yappi.googlecode.com/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b131c3041637f6a5175a43112dde05c"
+
+SRC_URI[md5sum] = "dc56240575c99938a924eaeb7c0d8beb"
+SRC_URI[sha256sum] = "5f657129e1b9b952379ffbc009357d0dcdb58c50f3bfe88ffbb992e4b27b263c"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-threading \
+    "
diff --git a/meta-python/recipes-devtools/python/python-yappi_0.98.bb b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
index 651ce77..a3bdde5 100644
--- a/meta-python/recipes-devtools/python/python-yappi_0.98.bb
+++ b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
@@ -1,16 +1,2 @@
-SUMMARY  = "Yet Another Python Profiler"
-HOMEPAGE = "http://yappi.googlecode.com/"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b131c3041637f6a5175a43112dde05c"
-
-SRC_URI[md5sum] = "dc56240575c99938a924eaeb7c0d8beb"
-SRC_URI[sha256sum] = "5f657129e1b9b952379ffbc009357d0dcdb58c50f3bfe88ffbb992e4b27b263c"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-threading \
-    "
+require python-yappi.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-yappi_0.98.bb b/meta-python/recipes-devtools/python/python3-yappi_0.98.bb
new file mode 100644
index 0000000..07da5b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi_0.98.bb
@@ -0,0 +1,2 @@
+require python-yappi.inc
+inherit setuptools3
-- 
2.7.4


