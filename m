Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7808873237
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 03:08:18 +0000 (UTC)
Received: by pacan13 with SMTP id an13so150489448pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 20:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nvALMOdTKSVdDRq6/KWH8NGYPsQKXQRJFFKMyMY78+Q=;
	b=isoVu5c4qJoS7eWJMq7XBdI6VViLbt6rHZCel84A8XeOJXOEJ6AiYK/3aAhBDoSbCL
	o/CMDJ1jHd8Qcp+X70/lhUKOqgxsmeeABXEpk/L3QaHEAiZHOu4Gr7nPN6BNyz6kIq1c
	I32wlZeWty48H5lcEIcEt3stDc5LzODDZchkQf/QeBXiroCO/OXEtGKh0AMI/uKbxRH0
	l030+i9hOt3PQSpj74rutyN0mWS8FZwMH2Muv2WEsrDp1PTi5saiaMet62ZNk+gtReVR
	Z3C77WKm9qyFDdv2mH98+u5f+8L4EvpUBSS4Vjm5LpthQuzsYiphTpl1oly0eLIBjxqr
	2lUw==
X-Received: by 10.70.1.7 with SMTP id 7mr13422044pdi.38.1437620899309;
	Wed, 22 Jul 2015 20:08:19 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g10sm5830051pat.35.2015.07.22.20.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jul 2015 20:08:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Wed, 22 Jul 2015 20:08:13 -0700
Message-Id: <1437620893-8149-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] netmap: add new package
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
X-List-Received-Date: Thu, 23 Jul 2015 03:08:20 -0000

From: Armin Kuster <akuster@mvista.com>

this adds netmap, the fast packet I/O framework
http://info.iet.unipi.it/~luigi/netmap/

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 33 ++++++++++++++++++++++
 meta-networking/recipes-kernel/netmap/netmap.inc   | 14 +++++++++
 .../recipes-kernel/netmap/netmap_git.bb            | 32 +++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
 create mode 100644 meta-networking/recipes-kernel/netmap/netmap.inc
 create mode 100644 meta-networking/recipes-kernel/netmap/netmap_git.bb

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
new file mode 100644
index 0000000..63ca50f
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -0,0 +1,33 @@
+require netmap.inc
+
+DEPENDS = "virtual/kernel"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+inherit module
+
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
+
+CLEANBROKEN = "1"
+
+export INSTALL_MOD_DIR="kernel/netmap-modules"
+
+EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
+                --kernel-sources=${STAGING_KERNEL_DIR} \
+                --install-mod-path=${D} \
+                --driver-suffix="-netmap" \
+                "
+
+do_configure () {
+    cd ${S}/LINUX
+    ./configure ${EXTRA_OECONF}
+}
+
+do_compile () {
+    cd ${S}/LINUX
+    make 
+}
+
+do_install () {
+    cd ${S}/LINUX
+    oe_runmake install
+}
diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-networking/recipes-kernel/netmap/netmap.inc
new file mode 100644
index 0000000..4a101a1
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/netmap.inc
@@ -0,0 +1,14 @@
+SUMMARY = "netmap and VALE - very fast packet I/O from userspace (FreeBSD/Linux)"
+DESCRIPTION= "NETMAP is a framework for very fast packet I/O from userspace.  VALE is an equally fast in-kernel software switch using the netmap API.  Both are implemented as a single kernel module for FreeBSD and Linux, and can deal with line rate on real or emulated 10 Gbit ports."
+SECTION = "networking"
+HOMEPAGE = "http://code.google.com/p/netmap/"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://README;beginline=13;endline=14;md5=f64f2b172fe6903ff7b6272c6edde588"
+
+SRCREV = "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
+PV = "master+git${SRCPV}"
+
+SRC_URI = "git://github.com/luigirizzo/netmap.git"
+
+S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
new file mode 100644
index 0000000..da80bad
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -0,0 +1,32 @@
+require netmap.inc
+
+DEPENDS = "netmap-modules"
+
+EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
+                --kernel-sources=${STAGING_KERNEL_DIR} \
+                --install-mod-path=${D} \
+                --no-drivers \
+                --prefix=${prefix} \
+                --destir=${D} \
+                --cc='${CC}' \
+                --ld='${LD}' \
+                "
+
+do_configure () {
+    cd ${S}/LINUX
+    ./configure ${EXTRA_OECONF}
+}
+
+do_compile () {
+    cd ${S}/LINUX
+    make  apps
+}
+
+do_install () {
+    cd ${S}/LINUX
+    make install-apps DESTDIR=${D}
+}
+
+FILES_${PN} += "${bindir}"
+RDEPENDS_${PN} = "kernel-module-netmap"
+RRECOMMENDS_${PN} = "kernel-module-netmap"
-- 
2.3.5


