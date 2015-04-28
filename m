Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE54716CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 06:05:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3S6540a000826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 23:05:04 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 23:05:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 14:05:00 +0800
Message-ID: <1430201100-15248-3-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1430201100-15248-1-git-send-email-rongqing.li@windriver.com>
References: <1430201100-15248-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][meta-networking] opensaf: create the node_name configuration file after install pkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2015 06:05:03 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

not create the node_name file when building by calling "hostname -s",
and create it after install pkg, since it works on cross-compile
environment

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../opensaf/0001-not-install-node_name.patch       | 30 ++++++++++++++++++++++
 .../recipes-daemons/opensaf/opensaf_4.5.0.bb       | 13 +++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-not-install-node_name.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-not-install-node_name.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-not-install-node_name.patch
new file mode 100644
index 0000000..d152de0
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-not-install-node_name.patch
@@ -0,0 +1,30 @@
+[PATCH] not install node_name
+
+Upstream-Status: Inappropriate [cross compiling specific]
+
+when cross-compile, the compile host name is written into node_name file,
+but target host name should be written, so not install node_name, and create
+it when pkg-install
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ osaf/services/saf/clmsv/config/Makefile.am | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/osaf/services/saf/clmsv/config/Makefile.am b/osaf/services/saf/clmsv/config/Makefile.am
+index 15b8702..88c8d24 100644
+--- a/osaf/services/saf/clmsv/config/Makefile.am
++++ b/osaf/services/saf/clmsv/config/Makefile.am
+@@ -39,9 +39,3 @@ dist_pkgimmxml_svc_DATA += \
+ endif
+ 
+ endif
+-
+-install-data-hook:
+-	hostname -s > $(DESTDIR)$(pkgsysconfdir)/node_name
+-
+-uninstall-hook:
+-	rm -f $(DESTDIR)$(pkgsysconfdir)/node_name
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index 6d31b1c..fc77f2f 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -14,7 +14,9 @@ HOMEPAGE = "http://www.opensaf.org"
 inherit autotools useradd systemd pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
-           file://install-samples-from-srcdir.patch"
+           file://install-samples-from-srcdir.patch \
+           file://0001-not-install-node_name.patch \
+"
 
 SRC_URI[md5sum] = "534c0a99438a62c4c8dda56cfa67300c"
 SRC_URI[sha256sum] = "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035ba354c97b5471b590"
@@ -45,3 +47,12 @@ do_install_append() {
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
 }
+
+pkg_postinst_${PN} () {
+    if [ "x$D" != "x" ]; then
+        exit 1
+    fi
+
+    hostname -s > /etc/opensaf/node_name
+}
+
-- 
2.1.0


