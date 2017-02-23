Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8770871E12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:06:36 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x35so2507825qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:06:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NoCBMHUXhBuFcw7CIPCslZ0F8HZjI8zZ32L6f9zryyk=;
	b=msACp21AXFVH2aBeVXRh/tYK2PTiraol0GvLnlm0MZ5ld4jxNkcgr/IONC1sKmMcCx
	R8ZLCShBfJ1daxa5jRv9v+logmv/yiRW7k8fdnae5AdZWMpBspMEsKIwjcC0xFxMJH+S
	7YGZDFJDOBymjdx13kuUaKLOZlibybcbaTGdiI8te2WW5pRVt/lLqlMW7TpuS2P9PBwc
	ku+hwOTWXPQiIx3k9BpQloksaV18cGIw42KJH+UYNpTumWbXeaoS4hvCq1UmkjcDAROx
	iuiaaatV9JxnyjkwASe/hKdMMOk785eTIcHK0SsNtRB+jZLnXkv5d4Vtk5ScpIcQVYfm
	FzIA==
X-Gm-Message-State: AMke39n8nfDrMcrGa9+0q1pbjbLXos/XQLiaIuxzL5Z8NhC8RrrQzcgTP+RBJroTQOJFlg==
X-Received: by 10.200.37.141 with SMTP id e13mr32445501qte.226.1487808397248; 
	Wed, 22 Feb 2017 16:06:37 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id z8sm1702420qkz.42.2017.02.22.16.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:06:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:06:29 -0500
Message-Id: <1487808389-25625-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-serpent: update to version 1.18.1
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
X-List-Received-Date: Thu, 23 Feb 2017 00:06:37 -0000

Verified license terms remain the same and updated the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent_1.16.bb  | 13 -------------
 .../recipes-devtools/python/python-serpent_1.18.1.bb        | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-serpent_1.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python-serpent_1.18.1.bb

diff --git a/meta-python/recipes-devtools/python/python-serpent_1.16.bb b/meta-python/recipes-devtools/python/python-serpent_1.16.bb
deleted file mode 100644
index 2f31e3a..0000000
--- a/meta-python/recipes-devtools/python/python-serpent_1.16.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Serialization based on ast.literal_eval"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=506280bc092b1a0be25c79fb0ed4aaa6"
-
-SRC_URI[md5sum] = "9d0cfe1f57f468100d3ae94c4de47950"
-SRC_URI[sha256sum] = "c26e98c2155228a69eb0dc14ba7b888cb70099b6c4ca47fd9d1f099f7d561c3e"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    "    
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb b/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb
new file mode 100644
index 0000000..f18343a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Serialization based on ast.literal_eval"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2669deccb79531c74a5ddd71b45f5095"
+
+SRC_URI[md5sum] = "e2cd7b751274c59b420d4f54db9a49cf"
+SRC_URI[sha256sum] = "9afebb58ac8b827050e1969324388349dc9738b0a03b0d91567b328834a27732"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    "    
-- 
2.7.4


