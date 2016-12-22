Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 11B9E77699
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 15:18:52 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c47so237308408qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 07:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5uxLk/ti9IqG+tyFt+L9akinzMXr4OuUq1zAvAVvW5U=;
	b=LFUADaO4/TjGoxOpdJcgs/DAIM6qMv+V/Ce0ZvIaMnb9JxeUH7eepP83N+ETgeWNUR
	Mk7Qf3jUYz96eZOXnuCdo3Fbcbif+o0sPXDmnkDLEugTTBxsVxvOCp8LeW/IviRy/VZC
	zZshNEoOMJDBPCWwX2V2L1E28PXwvcODyL38qxlnY5tbUQqF6mi+8z93ZXZ36AiH6PIE
	ib32R5uL5MCoTcK62HcDXqMZs6JWC03ZObQB5kNEaFnVNQQcga3zC60CA5nbRmT8u065
	K/5/L3hV+106A8ZwxHXuOBuopdnHm96OV1O4yjJqkL1JheR4a1KCNQ0jg9Cc/ZCIIwdH
	I7rg==
X-Gm-Message-State: AIkVDXI01RaM9ADDqk6mMYqJHu0EleMBOWNSIaTT131mOgJC+0Q00uL+I+OMmwR+TbT75w==
X-Received: by 10.237.35.227 with SMTP id k32mr11300458qtc.238.1482419933816; 
	Thu, 22 Dec 2016 07:18:53 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	y52sm18200904qty.11.2016.12.22.07.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 07:18:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 10:18:45 -0500
Message-Id: <1482419925-7168-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysocks: update to version 1.6.5 and fix RDEPENDS
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
X-List-Received-Date: Thu, 22 Dec 2016 15:18:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pysocks.inc            | 8 ++++++--
 .../python/{python-pysocks_1.5.7.bb => python-pysocks_1.6.5.bb}   | 0
 meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb      | 2 --
 meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb      | 8 ++++++++
 4 files changed, 14 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysocks_1.5.7.bb => python-pysocks_1.6.5.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
index 0697fd7..edf98fe 100644
--- a/meta-python/recipes-devtools/python/python-pysocks.inc
+++ b/meta-python/recipes-devtools/python/python-pysocks.inc
@@ -3,9 +3,13 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
-SRC_URI[md5sum] = "68f4ad7a8d4fa725656ae3e9dd142d29"
-SRC_URI[sha256sum] = "e51c7694b10288e6fd9a28e15c0bcce9aca0327e7b32ebcd9af05fcd56f38b88"
+SRC_URI[md5sum] = "06524b15a3a96fe05212f12cfb87c57d"
+SRC_URI[sha256sum] = "7962f4d7c76e8414ae168c677a77f19cf8926143911f7e8d37a5d4c4eb910c6f"
 
 PYPI_PACKAGE = "PySocks"
 
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-io \
+"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb b/meta-python/recipes-devtools/python/python-pysocks_1.6.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb
rename to meta-python/recipes-devtools/python/python-pysocks_1.6.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb
deleted file mode 100644
index 6b09355..0000000
--- a/meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-pysocks.inc
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb
new file mode 100644
index 0000000..f8aa01b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb
@@ -0,0 +1,8 @@
+inherit pypi setuptools3
+require python-pysocks.inc
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-selectors \
+"
-- 
2.7.4


