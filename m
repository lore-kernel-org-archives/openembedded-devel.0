Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 230427DDA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:57:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5L2vHtw029102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2019 19:57:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 20 Jun 2019 19:56:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 22:56:09 -0400
Message-ID: <1561085769-208620-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: fix generated initramfs boot failure under bash 5
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
X-List-Received-Date: Fri, 21 Jun 2019 02:57:19 -0000
Content-Type: text/plain

If shebang is set to /bin/sh and /bin/sh is a symlink to /bin/bash,
bash turn on posix mode.

Since bash is upgraded to 5.0, it follows 'IEEE 1003.2 POSIX Shell
Standard', to implement 'functions do not have local traps or options,
and it is not possible to define local variables'

For more detail, see variables.c:push_posix_temp_var in the following commit
http://git.savannah.gnu.org/cgit/bash.git/commit/?id=d233b485e83c3a784b803fb894280773f16f2deb

The IEEE 1003.2 POSIX Shell Standard:
https://www.cs.ait.ac.th/~on/O/oreilly/unix/ksh/appa_02.htm

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dracut/0001-set-viriable-_drv-not-local.patch  | 69 ++++++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-set-viriable-_drv-not-local.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-set-viriable-_drv-not-local.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-set-viriable-_drv-not-local.patch
new file mode 100644
index 0000000..13d2cfa
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-set-viriable-_drv-not-local.patch
@@ -0,0 +1,69 @@
+From 6e0da103effe64832eea52fad5c44a328f7141b7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jun 2019 17:31:11 +0800
+Subject: [PATCH] set viriable _drv not local
+
+If shebang is set to /bin/sh and /bin/sh is a symlink to /bin/bash,
+bash turn on posix mode.
+
+Since bash is upgraded to 5.0, it follows 'IEEE 1003.2 POSIX Shell
+Standard', to implement 'functions do not have local traps or options,
+and it is not possible to define local variables'
+
+For more detail, see variables.c:push_posix_temp_var in the following commit
+http://git.savannah.gnu.org/cgit/bash.git/commit/?id=d233b485e83c3a784b803fb894280773f16f2deb
+
+The IEEE 1003.2 POSIX Shell Standard:
+https://www.cs.ait.ac.th/~on/O/oreilly/unix/ksh/appa_02.htm
+
+While /bin/sh points to bash 5.0, it caused the following issue:
+
+$ cat <<ENDOF>case.sh
+fsck_drv_com(){
+  echo "issuing \$_drv"
+}
+
+fsck_able() {
+  _drv="_drv=e2fsck fsck_drv_com"
+}
+
+fsck_single() {
+  local _drv
+  fsck_able
+  eval "\$_drv"
+}
+fsck_single
+ENDOF
+$ chmod a+x case.sh
+
+Unexpected:
+$ ./cash.sh
+issuing _drv=e2fsck fsck_drv_com
+
+Set viriable _drv not local, get expected result:
+$ ./case.sh
+issuing e2fsck
+
+Upstream-Status: Submitted [https://github.com/dracutdevs/dracut/pull/587]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ modules.d/99fs-lib/fs-lib.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules.d/99fs-lib/fs-lib.sh b/modules.d/99fs-lib/fs-lib.sh
+index d39ca1b..60877ee 100755
+--- a/modules.d/99fs-lib/fs-lib.sh
++++ b/modules.d/99fs-lib/fs-lib.sh
+@@ -142,7 +142,7 @@ fsck_single() {
+     local _fs="${2:-auto}"
+     local _fsopts="$3"
+     local _fop="$4"
+-    local _drv
++    _drv=""
+ 
+     [ $# -lt 2 ] && return 255
+     # if UUID= marks more than one device, take only the first one
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 344dfec..13cf5f6 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -13,6 +13,7 @@ SRCREV = "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
            file://0001-dracut.sh-improve-udevdir.patch \
+           file://0001-set-viriable-_drv-not-local.patch \
            "
 
 DEPENDS += "kmod"
-- 
2.8.1


