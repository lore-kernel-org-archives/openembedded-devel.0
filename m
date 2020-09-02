Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5210.1599046106304242308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQwB-0000FC-Rr; Wed, 02 Sep 2020 14:28:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-gevent: Consolidate in a single file
Date: Wed,  2 Sep 2020 14:28:07 +0300
Message-Id: <20200902112808.18547-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-gevent.inc | 35 ------------------
 .../python/python3-gevent_1.4.0.bb            | 37 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent.inc

diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
deleted file mode 100644
index bc89d104a..000000000
--- a/meta-python/recipes-devtools/python/python-gevent.inc
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "A coroutine-based Python networking library"
-DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
-a high-level synchronous API on top of the libevent event loop."
-HOMEPAGE = "http://www.gevent.org"
-LICENSE = "MIT & Python-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
-                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
-                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
-                    "
-DEPENDS += "libevent"
-DEPENDS += "${PYTHON_PN}-greenlet"
-RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
-		  ${PYTHON_PN}-mime \
-		  ${PYTHON_PN}-pprint \
-		 "
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
-
-SRC_URI_append = " \
-    file://libev-conf.patch;patch=1;pnum=1 \
-    file://0002-setup.py-do-not-query-for-include-dir.patch \
-"
-
-SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
-SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
-
-# The python-gevent has no autoreconf ability
-# and the logic for detecting a cross compile is flawed
-# so always force a cross compile
-do_configure_append() {
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
-}
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
index df688e424..e42980d38 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
@@ -1,2 +1,35 @@
-require python-gevent.inc
-inherit setuptools3
+SUMMARY = "A coroutine-based Python networking library"
+DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
+a high-level synchronous API on top of the libevent event loop."
+HOMEPAGE = "http://www.gevent.org"
+LICENSE = "MIT & Python-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
+                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
+                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
+                    "
+DEPENDS += "libevent"
+DEPENDS += "${PYTHON_PN}-greenlet"
+RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
+		  ${PYTHON_PN}-mime \
+		  ${PYTHON_PN}-pprint \
+		 "
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
+
+SRC_URI_append = " \
+    file://libev-conf.patch;patch=1;pnum=1 \
+    file://0002-setup.py-do-not-query-for-include-dir.patch \
+"
+
+SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
+SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
+
+# The python-gevent has no autoreconf ability
+# and the logic for detecting a cross compile is flawed
+# so always force a cross compile
+do_configure_append() {
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
+}
+
+inherit pypi setuptools3
-- 
2.17.1

