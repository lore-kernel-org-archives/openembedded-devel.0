Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TVhoX-00041G-1W
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 12:59:29 +0100
Received: from localhost ([127.0.0.1]:34893 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TVhb9-0003GA-LG; Tue, 06 Nov 2012 11:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=POvBATzf+2WgnlrQteTR1/5f
	XZg=; b=ILkunRHoiU0RTtqWEc4gdt04sN6zlcmpg/neFbzv4f1oJwKKODsbm1+w
	RWv+TtK59hTEsNonW9ECGvC8avIQPPuvAJ5mb8nqPq7tkbBnFN4MnAvjdEv7E4F+
	d8iNe/ezhoa9SMxXMkVDIrau/tXYnG1c1BiOf3R54X+wJqGZyk0=
Received: from [195.171.99.130] (port=40268 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TVhb9-0003G5-HS; Tue, 06 Nov 2012 11:45:39 +0000
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Nov 2012 11:47:31 +0000
Message-Id: <1352202451-5869-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH] hiawatha: update to 8.6 and disable caching by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2012 11:59:29 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/hiawatha_8.5.bb         | 45 ----------------------
 .../recipes-httpd/hiawatha/hiawatha_8.6.bb         | 45 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 45 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
deleted file mode 100644
index 71cc885..0000000
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "Lightweight secure web server"
-HOMEPAGE = "http://www.hiawatha-webserver.org"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "libxml2 libxslt"
-
-SECTION = "net"
-
-SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
-           file://hiawatha-init"
-
-SRC_URI[md5sum] = "71d3903657953c93fc930758d158097d"
-SRC_URI[sha256sum] = "2567e6b4b4c6666388087b586238e6e91a4afd80e10a879920020a097fcdc946"
-
-inherit cmake update-rc.d
-
-INITSCRIPT_NAME = "hiawatha"
-INITSCRIPT_PARAMS = "defaults 70"
-
-EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
-                  -DENABLE_CACHE=ON \
-                  -DENABLE_DEBUG=OFF \
-                  -DENABLE_SSL=OFF \
-                  -DENABLE_TOOLKIT=OFF \
-                  -DENABLE_CHROOT=OFF \
-                  -DENABLE_XSLT=ON \
-                  -DENABLE_TOMAHAWK=OFF \
-                  -DCMAKE_INSTALL_MANDIR=${mandir} \
-                  -DCMAKE_INSTALL_BINDIR=${bindir} \
-                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
-                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
-                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
-                  -DLOG_DIR=/var/log/hiawatha \
-                  -DPID_DIR=/var/run \
-                  -DWEBROOT_DIR=/var/www/hiawatha \
-                  -DWORK_DIR=/var/lib/hiawatha "
-
-do_install_append() {
-
-    # Copy over init script and sed in the correct sbin path
-    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
-    mkdir -p ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
-
-}
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
new file mode 100644
index 0000000..2e6955e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Lightweight secure web server"
+HOMEPAGE = "http://www.hiawatha-webserver.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "libxml2 libxslt"
+
+SECTION = "net"
+
+SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
+           file://hiawatha-init"
+
+SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
+SRC_URI[sha256sum] = "1a7fa98ce66beb54fc8490cc787461d719a98cb0e4a81caedfa18ac8b5ba3b3b"
+
+inherit cmake update-rc.d
+
+INITSCRIPT_NAME = "hiawatha"
+INITSCRIPT_PARAMS = "defaults 70"
+
+EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
+                  -DENABLE_CACHE=OFF \
+                  -DENABLE_DEBUG=OFF \
+                  -DENABLE_SSL=OFF \
+                  -DENABLE_TOOLKIT=OFF \
+                  -DENABLE_CHROOT=OFF \
+                  -DENABLE_XSLT=ON \
+                  -DENABLE_TOMAHAWK=OFF \
+                  -DCMAKE_INSTALL_MANDIR=${mandir} \
+                  -DCMAKE_INSTALL_BINDIR=${bindir} \
+                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
+                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
+                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
+                  -DLOG_DIR=/var/log/hiawatha \
+                  -DPID_DIR=/var/run \
+                  -DWEBROOT_DIR=/var/www/hiawatha \
+                  -DWORK_DIR=/var/lib/hiawatha "
+
+do_install_append() {
+
+    # Copy over init script and sed in the correct sbin path
+    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
+    mkdir -p ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
+
+}
-- 
1.8.0



