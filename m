Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 176F97D265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 08:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00E8aeXZ022468
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 00:37:12 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 14 Jan 2020 00:36:44 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jan 2020 16:36:42 +0800
Message-ID: <20200114083642.27557-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-oe][PATCH] open-vm-tools: fix build error with usrmerge feature
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
X-List-Received-Date: Tue, 14 Jan 2020 08:37:22 -0000
Content-Type: text/plain

* Pass --with-udev-rules-dir to configure.
* Only create the symbolic link of mount.vmhgfs when disable usrmerge
  feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...mounter-Makefile.am-support-usrmerge.patch | 33 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb     |  9 +++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
new file mode 100644
index 000000000..82443ee66
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-hgfsmounter-Makefile.am-support-usrmerge.patch
@@ -0,0 +1,33 @@
+From 33798f3e484ebd3470e9da791b73b4b90ba12bc3 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 14 Jan 2020 15:04:03 +0800
+Subject: [PATCH] hgfsmounter/Makefile.am: support usrmerge
+
+There is a do_package error when enable usrmerge feature due to the
+hardcoded sbin directory. Remove this piece of code because we already
+create the symbolic link in do_install.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ open-vm-tools/hgfsmounter/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/open-vm-tools/hgfsmounter/Makefile.am b/open-vm-tools/hgfsmounter/Makefile.am
+index 7c1ba1a..58bd3f8 100644
+--- a/open-vm-tools/hgfsmounter/Makefile.am
++++ b/open-vm-tools/hgfsmounter/Makefile.am
+@@ -39,9 +39,6 @@ uninstall-hook:
+ 	rm -f $(DESTDIR)$(sbindir)/mount_vmhgfs
+ else
+ install-exec-hook:
+-	-$(MKDIR_P) $(DESTDIR)/sbin
+-	-$(LN_S) $(DESTDIR)$(sbindir)/mount.vmhgfs \
+-		$(DESTDIR)/sbin/mount.vmhgfs &> /dev/null
+ uninstall-hook:
+ 	rm -f $(DESTDIR)/sbin/mount.vmhgfs
+ endif !FREEBSD
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index eda77c206..34a81d21f 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
     file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
     file://0001-utilBacktrace-Ignore-Warray-bounds.patch;patchdir=.. \
+    file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
 "
 
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
@@ -60,7 +61,8 @@ SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
          --disable-tests --without-gtkmm --without-xerces --without-pam \
          --disable-vgauth --disable-deploypkg \
-         --without-root-privileges --without-kernel-modules --with-tirpc"
+         --without-root-privileges --without-kernel-modules --with-tirpc \
+         --with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
 
 NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
 X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
@@ -83,7 +85,10 @@ CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
 RDEPENDS_${PN} = "util-linux libdnet fuse"
 
 do_install_append() {
-    ln -sf ${sbindir}/mount.vmhgfs ${D}/sbin/mount.vmhgfs
+    if ! ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        install -d ${D}/sbin
+        ln -sf ${sbindir}/mount.vmhgfs ${D}/sbin/mount.vmhgfs
+    fi
     install -d ${D}${sysconfdir}/vmware-tools
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-- 
2.17.1


