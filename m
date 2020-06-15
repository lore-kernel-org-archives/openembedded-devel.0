Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.16912.1592224740879791341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48850 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkoOA-0003qE-9o; Mon, 15 Jun 2020 15:39:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-protobuf: Consolidate in a single file
Date: Mon, 15 Jun 2020 15:38:48 +0300
Message-Id: <20200615123848.31016-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615123848.31016-1-leon.anavi@konsulko.com>
References: <20200615123848.31016-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-protobuf.inc                | 32 -----------------
 .../python/python3-protobuf_3.11.3.bb         | 34 +++++++++++++++++--
 2 files changed, 32 insertions(+), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-protobuf.inc

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
deleted file mode 100644
index 5716894f3..000000000
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Protocol Buffers"
-HOMEPAGE = "https://developers.google.com/protocol-buffers/"
-SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e"
-
-inherit pypi
-
-SRC_URI[md5sum] = "eeda7dea65fc94e560fc9a8180eb1872"
-SRC_URI[sha256sum] = "c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f"
-
-# http://errors.yoctoproject.org/Errors/Details/184715/
-# Can't find required file: ../src/google/protobuf/descriptor.proto
-CLEANBROKEN = "1"
-
-UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
-"
-
-# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
index 30ea34e90..a4c9d6699 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
@@ -1,7 +1,37 @@
-inherit setuptools3
-require python-protobuf.inc
+DESCRIPTION = "Protocol Buffers"
+HOMEPAGE = "https://developers.google.com/protocol-buffers/"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "eeda7dea65fc94e560fc9a8180eb1872"
+SRC_URI[sha256sum] = "c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f"
+
+# http://errors.yoctoproject.org/Errors/Details/184715/
+# Can't find required file: ../src/google/protobuf/descriptor.proto
+CLEANBROKEN = "1"
+
+UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 
 DEPENDS += "protobuf"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-unittest \
+"
+
+# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
+BBCLASSEXTEND = "native nativesdk"
+
 DISTUTILS_BUILD_ARGS += "--cpp_implementation"
 DISTUTILS_INSTALL_ARGS += "--cpp_implementation"
 
-- 
2.17.1

