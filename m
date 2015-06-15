Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 513A073CF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:01:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97058803"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 17:05:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F8xPGZ030480
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:59:25 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Jun 2015 17:01:11 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 16:52:10 +0800
Message-ID: <1434358336-34981-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 1/7] wafsamba: add class
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
X-List-Received-Date: Mon, 15 Jun 2015 09:01:01 -0000
Content-Type: text/plain

wafsamba is a build system used by samba related software

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/classes/wafsamba.bbclass | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-oe/classes/wafsamba.bbclass

diff --git a/meta-oe/classes/wafsamba.bbclass b/meta-oe/classes/wafsamba.bbclass
new file mode 100644
index 0000000..764b530
--- /dev/null
+++ b/meta-oe/classes/wafsamba.bbclass
@@ -0,0 +1,55 @@
+# waf is a build system which is used by samba related project.
+# Obtain details from https://wiki.samba.org/index.php/Waf
+# 
+inherit qemu pythonnative
+
+DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
+
+CONFIGUREOPTS = " --prefix=${prefix} \
+                  --bindir=${bindir} \
+                  --sbindir=${sbindir} \
+                  --libexecdir=${libexecdir} \
+                  --datadir=${datadir} \
+                  --sysconfdir=${sysconfdir} \
+                  --sharedstatedir=${sharedstatedir} \
+                  --localstatedir=${localstatedir} \
+                  --libdir=${libdir} \
+                  --includedir=${includedir} \
+                  --oldincludedir=${oldincludedir} \
+                  --infodir=${infodir} \
+                  --mandir=${mandir} \
+                "
+
+do_configure() {
+    qemu_binary="${@qemu_target_binary(d)}"
+    if [ ${qemu_binary} == "qemu-allarch" ]; then
+        qemu_binary="qemuwrapper"
+    fi
+
+    libdir_qemu="${STAGING_DIR_HOST}/${libdir}"
+    base_libdir_qemu="${STAGING_DIR_HOST}/${base_libdir}"
+    oldest_kernel_qemu=${OLDEST_KERNEL}
+
+    CROSS_EXEC="${qemu_binary} \
+                -r ${oldest_kernel_qemu} \
+                -L ${STAGING_DIR_HOST} \
+                -E LD_LIBRARY_PATH=${libdir_qemu}:${base_libdir_qemu}"
+
+    export BUILD_SYS=${BUILD_SYS}
+    export HOST_SYS=${HOST_SYS}
+    export BUILD_ARCH=${BUILD_ARCH}
+    export HOST_ARCH=${HOST_ARCH}
+    export STAGING_LIBDIR=${STAGING_LIBDIR}
+    export STAGING_INCDIR=${STAGING_INCDIR}
+    export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+
+    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile --cross-execute="${CROSS_EXEC}"
+}
+
+do_compile () {
+    base_do_compile
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
-- 
1.8.4.2


