Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 153156156D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 07:12:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83482969"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 15:12:28 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A3D8C406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 15:02:48 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 15:12:26 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 15:12:31 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Feb 2020 06:31:11 -0800
Message-ID: <1582036271-94134-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A3D8C406AB15.A3319
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] cifs-utils: upgrade 6.9 -> 6.10
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
X-List-Received-Date: Tue, 18 Feb 2020 07:12:29 -0000
Content-Type: text/plain

add the following patch to solve build error:
0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch

Error message:
(cd /sbin && ln -sf mount.cifs mount.smb3)
  /yocto/work001/fnst/wangmy/build/tmp/hosttools/install -c mount.cifs
'/yocto/work001/fnst/wangmy/build/tmp/work/core2-64-poky-linux/cifs-utils/6.10-r0/image/sbin'
make  install-data-hook
ln: failed to create symbolic link 'mount.smb3': Permission denied

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ify-the-dir-of-install-exec-hook-and.patch | 43 +++++++++++++++++++
 .../{cifs-utils_6.9.bb => cifs-utils_6.10.bb} |  8 +++-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.9.bb => cifs-utils_6.10.bb} (89%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch b/meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
new file mode 100644
index 000000000..233ae40ce
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
@@ -0,0 +1,43 @@
+From f61f5f8a328207867b5c523b1c6bef6aaecaab88 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Sat, 15 Feb 2020 16:05:58 +0800
+Subject: [PATCH] Bugfix: Modify the dir of install-exec-hook and
+ install-data-hook
+
+Error message:
+(cd /sbin && ln -sf mount.cifs mount.smb3)
+  /yocto/work001/fnst/wangmy/build/tmp/hosttools/install -c mount.cifs
+'/yocto/work001/fnst/wangmy/build/tmp/work/core2-64-poky-linux/cifs-utils/6.10-r0/image/sbin'
+make  install-data-hook
+ln: failed to create symbolic link 'mount.smb3': Permission denied
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index fe9cd34..e9be6b3 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -119,11 +119,11 @@ endif
+ SUBDIRS = contrib
+ 
+ install-exec-hook:
+-	(cd $(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
++	(cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
+ 
+ install-data-hook:
+-	(cd $(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
++	(test -n "$(man_MANS)" || exit 0; cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
+ 
+ uninstall-hook:
+-	(cd $(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
+-	(cd $(man8dir) && rm -f $(man8dir)/mount.smb3.8)
++	(cd $(DESTDIR)$(ROOTSBINDIR) && rm -f $(DESTDIR)$(ROOTSBINDIR)/mount.smb3)
++	(test -n "$(man_MANS)" || exit 0; cd $(DESTDIR)$(man8dir) && rm -f $(DESTDIR)$(man8dir)/mount.smb3.8)
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.9.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.10.bb
similarity index 89%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.9.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.10.bb
index 51dcb23d1..8d82ee454 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.9.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.10.bb
@@ -4,9 +4,9 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PV = "6.9"
+PV = "6.10"
 
-SRCREV = "9a8c21ad9e4510a83a3a41f7a04f763a4fe9ec09"
+SRCREV = "5ff5fc2ecc10353fd39ad508db5c2828fd2d8d9a"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
@@ -22,6 +22,10 @@ PACKAGECONFIG[cifsidmap] = "--enable-cifsidmap,--disable-cifsidmap,keyutils samb
 PACKAGECONFIG[cifsacl] = "--enable-cifsacl,--disable-cifsacl,samba"
 PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disable-pam,libpam keyutils"
 
+SRC_URI += " \
+            file://0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch \
+            "
+
 inherit autotools pkgconfig
 
 do_install_append() {
-- 
2.17.1




