Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.5939.1610434184444472528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 22:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="103391313"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 14:49:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CC52F4CE4B3E
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 14:49:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 14:49:19 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.11 -> 6.12
Date: Tue, 12 Jan 2021 14:49:19 +0800
Message-ID: <1610434159-106144-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CC52F4CE4B3E.A938A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
Removed since this is included in 6.12.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ify-the-dir-of-install-exec-hook-and.patch | 43 -------------------
 ...{cifs-utils_6.11.bb => cifs-utils_6.12.bb} |  6 +--
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.11.bb => cifs-utils_6.12.bb} (90%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch b/meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
deleted file mode 100644
index 233ae40ce0..0000000000
--- a/meta-networking/recipes-support/cifs/cifs-utils/0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f61f5f8a328207867b5c523b1c6bef6aaecaab88 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Sat, 15 Feb 2020 16:05:58 +0800
-Subject: [PATCH] Bugfix: Modify the dir of install-exec-hook and
- install-data-hook
-
-Error message:
-(cd /sbin && ln -sf mount.cifs mount.smb3)
-  /yocto/work001/fnst/wangmy/build/tmp/hosttools/install -c mount.cifs
-'/yocto/work001/fnst/wangmy/build/tmp/work/core2-64-poky-linux/cifs-utils/6.10-r0/image/sbin'
-make  install-data-hook
-ln: failed to create symbolic link 'mount.smb3': Permission denied
-
-Upstream-Status: Pending
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- Makefile.am | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index fe9cd34..e9be6b3 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -119,11 +119,11 @@ endif
- SUBDIRS = contrib
- 
- install-exec-hook:
--	(cd $(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
-+	(cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
- 
- install-data-hook:
--	(cd $(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
-+	(test -n "$(man_MANS)" || exit 0; cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
- 
- uninstall-hook:
--	(cd $(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
--	(cd $(man8dir) && rm -f $(man8dir)/mount.smb3.8)
-+	(cd $(DESTDIR)$(ROOTSBINDIR) && rm -f $(DESTDIR)$(ROOTSBINDIR)/mount.smb3)
-+	(test -n "$(man_MANS)" || exit 0; cd $(DESTDIR)$(man8dir) && rm -f $(DESTDIR)$(man8dir)/mount.smb3.8)
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.12.bb
similarity index 90%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.12.bb
index de3fbb0947..c68b474cc6 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.12.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "ded4e81796a18cde73329e838357f084aa05720f"
+SRCREV = "73008e3292e4d46fde3eab5d5f618886210ec4a1"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
@@ -20,10 +20,6 @@ PACKAGECONFIG[cifsidmap] = "--enable-cifsidmap,--disable-cifsidmap,keyutils samb
 PACKAGECONFIG[cifsacl] = "--enable-cifsacl,--disable-cifsacl,samba"
 PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disable-pam,libpam keyutils"
 
-SRC_URI += " \
-            file://0001-Bugfix-Modify-the-dir-of-install-exec-hook-and.patch \
-            "
-
 inherit autotools pkgconfig
 
 do_install_append() {
-- 
2.25.1



