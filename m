Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9249731AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:15:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77737878"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 17:15:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B9724B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:08:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 17:15:59 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 01:10:18 +0800
Message-ID: <1572541818-52903-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2B9724B6EC6E.A796A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] ledmon: upgrade to 0.93
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
X-List-Received-Date: Thu, 31 Oct 2019 09:15:59 -0000
Content-Type: text/plain

1) inherit autotools-brokensep as new version use autotools.

2) Add a patch to fix compile error.
   0001-Disable-Waddress-of-packed-member-to-fix-compi.patch

3) Modify do_install_append() function to fix do_package error as follows:
   ledmon-git-r0 do_package: SYSTEMD_SERVICE_ledmon value ledmon.service does not exist

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...le-Waddress-of-packed-member-to-fix-compi.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-bsp/ledmon/ledmon_git.bb           | 13 ++++----
 2 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
new file mode 100644
index 0000000..bd2b204
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
@@ -0,0 +1,35 @@
+From 310540bbf853bc9bea384962d6acf66c7e99fd83 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Thu, 31 Oct 2019 12:52:57 +0900
+Subject: [PATCH] Disable -Waddress-of-packed-member to fix compile
+ error.
+
+"-Waddress-of-packed-member" is enabled by default with gcc-9, and raise the following waring.
+
+|   550 |  _dump_sgpio_amd(&amd_reg->amd);
+|       |                  ^~~~~~~~~~~~~
+| amd_sgpio.c: In function '_write_amd_register':
+| amd_sgpio.c:558:18: error: taking address of packed member of 'struct amd_register' may result in an unaligned pointer value [-Werror=address-of-packed-member]
+
+So disable it.
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 7bc20f8..bf89a3c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -24,6 +24,7 @@ AX_AM_CFLAGS_ADD([-Werror=alloca])
+ AX_AM_CFLAGS_ADD([-Werror=missing-field-initializers])
+ AX_AM_CFLAGS_ADD([-Werror])
+ AX_AM_CFLAGS_ADD([-Werror=format-signedness])
++AX_AM_CFLAGS_ADD([-Wno-address-of-packed-member])
+ 
+ AC_SUBST([AM_CFLAGS])
+ AC_SUBST([AM_CPPFLAGS])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
index 74ae56c..5825868 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
@@ -11,15 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "sg3-utils udev"
 
-inherit systemd
+inherit autotools-brokensep systemd
 
 SYSTEMD_SERVICE_${PN} = "ledmon.service"
 
+# 0.93
 SRC_URI = "git://github.com/intel/ledmon;branch=master \
            file://0002-include-sys-select.h-and-sys-types.h.patch \
+           file://0001-Disable-Waddress-of-packed-member-to-fix-compi.patch \
           "
 
-SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
+SRCREV = "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST_libc-musl = "null"
@@ -28,7 +30,8 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
 
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




