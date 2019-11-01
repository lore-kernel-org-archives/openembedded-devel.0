Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D9DAC7FC46
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 05:55:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77780880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 13:55:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A4C4C4CE19E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 13:47:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 1 Nov 2019 13:55:08 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 17:34:50 +0800
Message-ID: <1572600890-65720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A4C4C4CE19E2.AA72D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] ledmon: upgrade to 0.93
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
X-List-Received-Date: Fri, 01 Nov 2019 05:55:09 -0000
Content-Type: text/plain

1) inherit autotools as new version use autotools.

2) Add a patch to fix compile error.
   0001-Don-t-build-with-Werror-to-fix-compile-error.patch

3) Modify do_install_append() function to fix do_package error as follows:
   ledmon-git-r0 do_package: SYSTEMD_SERVICE_ledmon value ledmon.service does not exist

4) Add ${S}/config in CFLAGS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-t-build-with-Werror-to-fix-compile-error.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-bsp/ledmon/ledmon_git.bb           | 17 +++++++++----
 2 files changed, 41 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
new file mode 100644
index 0000000..b65f1a7
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH] Don't build with -Werror to fix compile error.
+
+|   550 |  _dump_sgpio_amd(&amd_reg->amd);
+|       |                  ^~~~~~~~~~~~~
+| amd_sgpio.c: In function '_write_amd_register':
+| amd_sgpio.c:558:18: error: taking address of packed member of 'struct amd_register' may result in an unaligned pointer value [-Werror=address-of-packed-member]
+
+Upstream-Status: Pending
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7bc20f8..7e01bd5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,6 @@ AX_AM_CFLAGS_ADD([-Werror=format-truncation=1])
+ AX_AM_CFLAGS_ADD([-Werror=shift-negative-value])
+ AX_AM_CFLAGS_ADD([-Werror=alloca])
+ AX_AM_CFLAGS_ADD([-Werror=missing-field-initializers])
+-AX_AM_CFLAGS_ADD([-Werror])
+ AX_AM_CFLAGS_ADD([-Werror=format-signedness])
+ 
+ AC_SUBST([AM_CFLAGS])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
index 74ae56c..f9ae9aa 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
@@ -11,15 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "sg3-utils udev"
 
-inherit systemd
+inherit autotools systemd
 
 SYSTEMD_SERVICE_${PN} = "ledmon.service"
 
+# 0.93
 SRC_URI = "git://github.com/intel/ledmon;branch=master \
            file://0002-include-sys-select.h-and-sys-types.h.patch \
+           file://0001-Don-t-build-with-Werror-to-fix-compile-error.patch \
           "
 
-SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
+SRCREV = "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST_libc-musl = "null"
@@ -27,8 +29,13 @@ COMPATIBLE_HOST_libc-musl = "null"
 S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
 
+# The ledmon sources include headers in ${S}/config to build but not in CFLAGS. 
+# We need to add this include path in CFLAGS.
+CFLAGS += "-I${S}/config"
+
 do_install_append() {
-	install -d ${D}/${systemd_unitdir}/system
-	oe_runmake  DESTDIR=${D}  install
-	oe_runmake  DESTDIR=${D}${systemd_unitdir}/system  install-systemd
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	        install -d ${D}${systemd_unitdir}/system
+	        install -m 0755 ${S}/systemd/ledmon.service ${D}${systemd_unitdir}/system
+        fi
 }
-- 
2.7.4




