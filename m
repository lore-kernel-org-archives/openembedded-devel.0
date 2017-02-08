Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5A043601F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 21:41:12 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id x49so178636190qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 13:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O+F4xfQKHmjCay+7fqH1oieTjGDGcDmDA/QJLASr4jA=;
	b=dz7fDaDc8JpVffFjyGQ2xq3DmDubAaKy4SLUjuWxFatZRp2edAD0T9kRyRUwLF7mDS
	WvvOUEm3TKTsv4ASzfqBaVsdT2gyAsRH8lnv9RdjAzkE2WbAOz1Tnie8YmRokv8FKcfW
	rvzG3QXd3Wj/H3DZ6vicUPbS+KKSxhhNxkw0eoyYn+/iPhLuDe0rILAtObjH8GdUreYP
	PghgxlbE2ZAZ25eGARjuerKMb8Lj6DwDRFyUa8sp5PBtblztiqqe+Ve2FiU9hXhY2CJh
	PXLiqJ7Cco84rBuEsFSdMy+d90fsFc5U4pi2IgXejLOTNWLJXqYqyRW39kTpqbN1EKgB
	3nYA==
X-Gm-Message-State: AMke39mZ+6ZHOwSTwwks5OvHe7o0Hcp3p0c8KvCbUHakclwRi5hv8c0jPe6y6PgGF6H/KA==
X-Received: by 10.200.41.198 with SMTP id 6mr23461269qtt.130.1486590072531;
	Wed, 08 Feb 2017 13:41:12 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	f128sm7267517qkb.3.2017.02.08.13.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 13:41:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:41:05 -0500
Message-Id: <1486590065-18082-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-thrift: update to version 0.10.0
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
X-List-Received-Date: Wed, 08 Feb 2017 21:41:17 -0000

 * Verified license remains the same
 * Added a set of RDEPENDS for minimal environments

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-thrift/python-thrift_0.10.0.bb               | 17 +++++++++++++++++
 .../python-thrift/python-thrift_0.9.3.bb                |  8 --------
 2 files changed, 17 insertions(+), 8 deletions(-)
 create mode 100644 meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb

diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb
new file mode 100644
index 0000000..e6f61bd
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python bindings for the Apache Thrift RPC system"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=26a2009ddcb7c4162f8bafd5ef73c670"
+
+SRC_URI[md5sum] = "76bb768a210257dd203923110042e560"
+SRC_URI[sha256sum] = "b7f6c09155321169af03f9fb20dc15a4a0c7481e7c334a5ba8f7f0d864633209"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
deleted file mode 100644
index 652de95..0000000
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Python bindings for the Apache Thrift RPC system"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1203b6a05c3bff3229710e3f063ddca7"
-
-SRC_URI[md5sum] = "b519551d7a086bb0b4f222a8f566b7e8"
-SRC_URI[sha256sum] = "dfbc3d3bd19d396718dab05abaf46d93ae8005e2df798ef02e32793cd963877e"
-
-inherit pypi setuptools
-- 
2.7.4


