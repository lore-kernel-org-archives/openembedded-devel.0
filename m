Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E4E4A73066
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:33:32 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id v125so19415677qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Mar 2017 05:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D4kkDvooB7Lq2lzwq5qQ20Q/Tmwe+j0Xd655ItMY8Es=;
	b=dM6FPEamIA1WAQBC0N4xvy/6gulr7QrEA9G0/OoclmRY9SXpYCG+BkD6cJ4SzRnW0X
	cFaZYlrurKh46ARLPeDFhDW1UzMePYymG48iOm+LIUaWk+YIyteUN0njezhyMr/dhEMa
	zVqwDhQYnFuziAwVOpimVzw8zvqu3M7TLTd5l7R1XlZIcWcCnpCn8waz+kHFelShC5rd
	r1bESBU9VAaq4AqnpbtBudu3hEsOTNhE7ab47OiRjGpv3jDFQei+md1ulA5cQVJ7TR4g
	zMRN32GzShuFig2eZT/pH/UzhlgSY+2v7jaZ6Tflioxgu/4H/AnXfZzDFSJtGTCONYwS
	uYkA==
X-Gm-Message-State: AMke39nujELVmans8aHREePGmFlvRPuFvLnmGIXQnlvykPabXZ06SPONNNHhfVO0W7H6xQ==
X-Received: by 10.200.48.244 with SMTP id w49mr14455417qta.77.1489066413745;
	Thu, 09 Mar 2017 05:33:33 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	f28sm4228347qtf.44.2017.03.09.05.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Mar 2017 05:33:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Mar 2017 08:33:08 -0500
Message-Id: <1489066388-23239-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyparsing: update to version 2.2.0
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
X-List-Received-Date: Thu, 09 Mar 2017 13:33:33 -0000

Fix the RDEPENDS and add a python3 version as well

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyparsing.inc      | 19 +++++++++++++++++++
 .../python/python-pyparsing_2.1.10.bb                 |  9 ---------
 .../recipes-devtools/python/python-pyparsing_2.2.0.bb |  2 ++
 .../python/python3-pyparsing_2.2.0.bb                 |  2 ++
 4 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyparsing.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc b/meta-python/recipes-devtools/python/python-pyparsing.inc
new file mode 100644
index 0000000..033e0db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyparsing.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Python parsing module"
+HOMEPAGE = "http://pyparsing.wikispaces.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
+
+SRC_URI[md5sum] = "0214e42d63af850256962b6744c948d9"
+SRC_URI[sha256sum] = "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb
deleted file mode 100644
index 06f9845..0000000
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Python parsing module"
-HOMEPAGE = "http://pyparsing.wikispaces.com/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
-
-SRC_URI[md5sum] = "065908b92904e0d3634eb156f44cc80e"
-SRC_URI[sha256sum] = "811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb
new file mode 100644
index 0000000..90217f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyparsing.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb
new file mode 100644
index 0000000..0805fee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyparsing.inc
-- 
2.7.4


