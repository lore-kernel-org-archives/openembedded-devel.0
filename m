Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31A7178864
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vANC9lwc014627
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Nov 2017 04:09:47 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:13 -0500
Message-ID: <7273bf5503a8a71e2acc3ba2389e6bb5ed5cc1ff.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/15] meta-installer: add recipe anaconda 26.21.11
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:47 -0000
Content-Type: text/plain

The anaconda is from fedora 26 and customized based
on OE platform.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../anaconda/files/0001-do-not-support-po.patch    |  41 ++
 ...02-widgets-Makefile.am-do-not-compile-doc.patch |  28 +
 ...t-Use-system-Python-when-running-Anaconda.patch |  42 ++
 ...4-pyanaconda-flags.py-drop-selinux-module.patch |  48 ++
 ...ckage-site-dir-for-installclass-searching.patch |  38 ++
 ...06-do-not-load-the-system-wide-Xresources.patch |  53 ++
 .../0007-tweak-iso-mount-dir-and-kernel-name.patch |  95 ++++
 .../0008-dnfpayload.py-customize-for-WRLinux.patch | 597 +++++++++++++++++++++
 ...cessary-noverifyssl-for-http-ftp-protocol.patch |  32 ++
 .../0010-dynamic-detect-workable-locale.patch      |  77 +++
 .../files/0011-improve-thread-monitor.patch        |  55 ++
 .../anaconda/files/0012-disable-audit.patch        |  64 +++
 ...py-Change-grub2-settings-to-match-oe-core.patch | 137 +++++
 .../files/0014-tweak-detect-kernel-version.patch   |  96 ++++
 .../0015-tweak-grub-config-file-for-WRLinux.patch  |  28 +
 ...time.tzset-to-apply-timezone-changes-when.patch |  66 +++
 ...rt-Authconfig-Firewall-Firstboot-Timezone.patch | 216 ++++++++
 .../files/0018-invisible-help-button.patch         |  32 ++
 .../0019-disable-non-implemented-functions.patch   |  41 ++
 .../files/0020-disable-geoloc-by-default.patch     |  30 ++
 .../anaconda/files/0021-support-UEFI-boot.patch    |  38 ++
 ...o-not-verify-ssl-certification-by-default.patch |  44 ++
 .../files/0023-tweak-default-nfs-mount-point.patch |  30 ++
 .../0024-fix-quoted-empty-string-failed.patch      |  46 ++
 ...support-ISO-hold-by-hard-drive-partitions.patch |  31 ++
 ...x-cannot-stat-usr-share-gettext-gettext.h.patch |  27 +
 .../0027-fix-Wind-River-boot-menu-not-work.patch   |  35 ++
 .../files/0028-tweak-bootloader-fs-type.patch      |  31 ++
 .../files/0029-support-timezone-setting.patch      |  95 ++++
 .../anaconda/files/0030-disable-ntp-support.patch  | 230 ++++++++
 .../0031-do-not-support-manually-set-time.patch    |  32 ++
 .../files/0032-support-user-account-creation.patch |  73 +++
 .../files/0033-detect-existence-of-Xorg.patch      |  45 ++
 ...-write-network-conf-failed-while-liveinst.patch |  40 ++
 ...mmits-to-support-reboot-for-live-installs.patch |  72 +++
 ...tory-setting-do-not-support-local-ISO-fil.patch |  72 +++
 ...ext-repository-setting-support-http-proxy.patch |  95 ++++
 ...-set-keyboard-xlayouts-with-us-by-default.patch |  50 ++
 ...xt-do-not-support-network-setting-for-now.patch |  33 ++
 .../0040-tweak-boot-storage-sanity-check.patch     |  31 ++
 ...tart-do-not-support-network-configuration.patch |  29 +
 ...042-support-to-get-kickstart-from-network.patch |  48 ++
 ...0043-support-authentication-for-kickstart.patch | 133 +++++
 ...nloading-file-from-http-ftp-server-to-tar.patch | 175 ++++++
 .../0045-live-install-supports-kickstart.patch     |  47 ++
 .../files/0046-support-initramfs-boot.patch        |  48 ++
 ...47-fix-hang-while-installed-system-reboot.patch |  30 ++
 ...talled-system-boot-from-encrypt-fs-failed.patch |  48 ++
 ...n-destination-disable-iSCSI-network-disks.patch |  29 +
 .../0050-update-region-while-city-changes.patch    |  32 ++
 .../0051-timezone-fix-set-US-Alaska-failed.patch   |  38 ++
 ...remove-incorrect-prefix-of-addon-repo-url.patch |  42 ++
 .../0053-fix-write-sysconfig-network-failed.patch  |  32 ++
 ...naconda-ui-gui-utils.py-tweak-mouse-arrow.patch |  31 ++
 ...5-tweak-search-location-of-new-kernel-pkg.patch |  30 ++
 .../0056-always-write-fstab-after-install.patch    |  31 ++
 ...e-grub-install-to-generate-efi-filesystem.patch |  60 +++
 .../files/0058-do-not-support-closest-mirror.patch |  96 ++++
 .../0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch |  42 ++
 .../anaconda/files/0060-tweak-time-setting.patch   | 106 ++++
 ...62-Add-dracut-args-for-home-to-bootloader.patch |  35 ++
 .../files/0063-do-not-customize-window-theme.patch |  55 ++
 .../files/0064-tweak-product-short-name.patch      |  33 ++
 .../anaconda/files/0065-disable-dmraid.patch       |  57 ++
 .../files/0066-tweak-shebang-of-bash.patch         |  25 +
 .../anaconda/files/0067-Tweak-label-name.patch     |  56 ++
 ...068-livepayload.py-copy-grub-from-host-os.patch |  51 ++
 .../files/0069-test-existence-of-noverifyssl.patch |  31 ++
 .../anaconda/files/81-edit-sudoers.ks              |   3 +
 .../recipes-installer/anaconda/files/wrlinux.py    | 112 ++++
 .../anaconda/python3-anaconda_26.21.11.bb          | 161 ++++++
 71 files changed, 4712 insertions(+)
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0001-do-not-support-po.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0002-widgets-Makefile.am-do-not-compile-doc.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0003-Revert-Use-system-Python-when-running-Anaconda.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0004-pyanaconda-flags.py-drop-selinux-module.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0005-add-package-site-dir-for-installclass-searching.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0006-do-not-load-the-system-wide-Xresources.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0007-tweak-iso-mount-dir-and-kernel-name.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0008-dnfpayload.py-customize-for-WRLinux.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0009-Remove-unnecessary-noverifyssl-for-http-ftp-protocol.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0010-dynamic-detect-workable-locale.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0011-improve-thread-monitor.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0012-disable-audit.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0013-bootloader.py-Change-grub2-settings-to-match-oe-core.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0014-tweak-detect-kernel-version.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0015-tweak-grub-config-file-for-WRLinux.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0016-Revert-Use-time.tzset-to-apply-timezone-changes-when.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0017-kickstart-Authconfig-Firewall-Firstboot-Timezone.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0018-invisible-help-button.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0019-disable-non-implemented-functions.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0020-disable-geoloc-by-default.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0021-support-UEFI-boot.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0022-do-not-verify-ssl-certification-by-default.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0023-tweak-default-nfs-mount-point.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0024-fix-quoted-empty-string-failed.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0025-do-not-support-ISO-hold-by-hard-drive-partitions.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0026-fix-cannot-stat-usr-share-gettext-gettext.h.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0027-fix-Wind-River-boot-menu-not-work.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0028-tweak-bootloader-fs-type.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0029-support-timezone-setting.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0030-disable-ntp-support.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0031-do-not-support-manually-set-time.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0032-support-user-account-creation.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0033-detect-existence-of-Xorg.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0034-fix-write-network-conf-failed-while-liveinst.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0035-revert-commits-to-support-reboot-for-live-installs.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0036-text-repository-setting-do-not-support-local-ISO-fil.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0037-text-repository-setting-support-http-proxy.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0038-set-keyboard-xlayouts-with-us-by-default.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0039-text-do-not-support-network-setting-for-now.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0040-tweak-boot-storage-sanity-check.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0041-kickstart-do-not-support-network-configuration.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0042-support-to-get-kickstart-from-network.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0043-support-authentication-for-kickstart.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0044-support-downloading-file-from-http-ftp-server-to-tar.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0045-live-install-supports-kickstart.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0046-support-initramfs-boot.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0047-fix-hang-while-installed-system-reboot.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0048-fix-installed-system-boot-from-encrypt-fs-failed.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0049-installation-destination-disable-iSCSI-network-disks.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0050-update-region-while-city-changes.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0051-timezone-fix-set-US-Alaska-failed.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0052-remove-incorrect-prefix-of-addon-repo-url.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0053-fix-write-sysconfig-network-failed.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0054-pyanaconda-ui-gui-utils.py-tweak-mouse-arrow.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0055-tweak-search-location-of-new-kernel-pkg.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0056-always-write-fstab-after-install.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0057-invoke-grub-install-to-generate-efi-filesystem.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0058-do-not-support-closest-mirror.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0060-tweak-time-setting.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0062-Add-dracut-args-for-home-to-bootloader.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0063-do-not-customize-window-theme.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0064-tweak-product-short-name.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0065-disable-dmraid.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0066-tweak-shebang-of-bash.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0067-Tweak-label-name.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0068-livepayload.py-copy-grub-from-host-os.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/0069-test-existence-of-noverifyssl.patch
 create mode 100644 meta-installer/recipes-installer/anaconda/files/81-edit-sudoers.ks
 create mode 100644 meta-installer/recipes-installer/anaconda/files/wrlinux.py
 create mode 100755 meta-installer/recipes-installer/anaconda/python3-anaconda_26.21.11.bb

diff --git a/meta-installer/recipes-installer/anaconda/files/0001-do-not-support-po.patch b/meta-installer/recipes-installer/anaconda/files/0001-do-not-support-po.patch
new file mode 100644
index 0000000..7bde9f3
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0001-do-not-support-po.patch
@@ -0,0 +1,41 @@
+From 063bb9bc5a21564c2935e94ca21c71d54a27fdae Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 9 May 2017 04:10:03 -0400
+Subject: [PATCH 01/65] do not support po
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 552afd1..387614b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -17,7 +17,7 @@
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = data docs dracut po pyanaconda scripts tests widgets utils
++SUBDIRS = data docs dracut pyanaconda scripts tests widgets utils
+ 
+ EXTRA_DIST = COPYING .coveragerc
+ 
+diff --git a/configure.ac b/configure.ac
+index 9a9955d..1237f76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -128,7 +128,6 @@ AC_CONFIG_FILES([Makefile
+                  data/window-manager/Makefile
+                  data/window-manager/config/Makefile
+                  data/window-manager/theme/Makefile
+-                 po/Makefile
+                  scripts/Makefile
+                  pyanaconda/Makefile
+                  pyanaconda/version.py
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0002-widgets-Makefile.am-do-not-compile-doc.patch b/meta-installer/recipes-installer/anaconda/files/0002-widgets-Makefile.am-do-not-compile-doc.patch
new file mode 100644
index 0000000..8c4224f
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0002-widgets-Makefile.am-do-not-compile-doc.patch
@@ -0,0 +1,28 @@
+From a1787c64202305aa374e287572ba2c855a35b378 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 9 May 2017 04:36:48 -0400
+Subject: [PATCH 02/65] widgets/Makefile.am: do not compile doc
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ widgets/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/widgets/Makefile.am b/widgets/Makefile.am
+index 6478ce8..222aeaa 100644
+--- a/widgets/Makefile.am
++++ b/widgets/Makefile.am
+@@ -19,7 +19,7 @@
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = src python glade doc
++SUBDIRS = src python glade
+ 
+ MAINTAINERCLEANFILES = Makefile.in aclocal.m4 config.guess config.h.in config.sub \
+ 	configure depcomp install-sh ltmain.sh missing py-compile \
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0003-Revert-Use-system-Python-when-running-Anaconda.patch b/meta-installer/recipes-installer/anaconda/files/0003-Revert-Use-system-Python-when-running-Anaconda.patch
new file mode 100644
index 0000000..2d3b3a4
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0003-Revert-Use-system-Python-when-running-Anaconda.patch
@@ -0,0 +1,42 @@
+From 71baa574de0810c5698f5f749f074648e1747895 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 10 May 2017 03:56:04 -0400
+Subject: [PATCH 03/65] Revert "Use system Python when running Anaconda"
+
+The OE does not support it.
+
+This reverts commit b23760dcac91fcc77cc629d3e87757a8b4b6aae0.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ anaconda.py      | 2 +-
+ anaconda.spec.in | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/anaconda.py b/anaconda.py
+index 4c9fef6..25f227c 100755
+--- a/anaconda.py
++++ b/anaconda.py
+@@ -1,4 +1,4 @@
+-#!/usr/libexec/system-python
++#!/usr/bin/python3
+ #
+ # anaconda: The Red Hat Linux Installation program
+ #
+diff --git a/anaconda.spec.in b/anaconda.spec.in
+index e92d82c..776150d 100644
+--- a/anaconda.spec.in
++++ b/anaconda.spec.in
+@@ -83,7 +83,6 @@ The anaconda package is a metapackage for the Anaconda installer.
+ 
+ %package core
+ Summary: Core of the Anaconda installer
+-Requires: python3-libs
+ Requires: python3-dnf >= %{dnfver}
+ Requires: python3-blivet >= 1:2.1.9-1
+ Requires: python3-blockdev >= %{libblockdevver}
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0004-pyanaconda-flags.py-drop-selinux-module.patch b/meta-installer/recipes-installer/anaconda/files/0004-pyanaconda-flags.py-drop-selinux-module.patch
new file mode 100644
index 0000000..d3e187a
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0004-pyanaconda-flags.py-drop-selinux-module.patch
@@ -0,0 +1,48 @@
+From 4cb2dba790b7f4ef274b43fb8cdd516c36ca32b8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 11 May 2017 14:19:06 +0800
+Subject: [PATCH 04/65] pyanaconda/flags.py: drop selinux module
+
+And we do not use selinux module for wrlinux, so drop it.
+
+The fix is to revert upstream commit
+...
+commit b359e1a011ca71e5431969ae4f12bb847017eaa9
+Author: Chris Lumens <clumens@redhat.com>
+Date:   Wed Aug 10 13:08:26 2011 -0400
+
+    Remove as many of the /selinux path hardcodings as possible (#729563).
+...
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/flags.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/flags.py b/pyanaconda/flags.py
+index 63c2f37..7374a39 100644
+--- a/pyanaconda/flags.py
++++ b/pyanaconda/flags.py
+@@ -17,7 +17,7 @@
+ # along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ #
+ 
+-import selinux
++import os
+ import shlex
+ import glob
+ from pyanaconda.constants import SELINUX_DEFAULT, CMDLINE_APPEND, ANACONDA_ENVIRON
+@@ -91,7 +91,7 @@ class Flags(object):
+                   "nombr", "gpt", "noefi"):
+             self.set_cmdline_bool(f)
+ 
+-        if not selinux.is_selinux_enabled():
++        if not os.path.exists("/selinux/load"):
+             self.selinux = 0
+ 
+ cmdline_files = ['/proc/cmdline', '/run/install/cmdline',
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0005-add-package-site-dir-for-installclass-searching.patch b/meta-installer/recipes-installer/anaconda/files/0005-add-package-site-dir-for-installclass-searching.patch
new file mode 100644
index 0000000..f2423e6
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0005-add-package-site-dir-for-installclass-searching.patch
@@ -0,0 +1,38 @@
+From c23cb67a0bf9960357c66651527e959ccb754076 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 15 May 2017 13:47:30 +0800
+Subject: [PATCH 05/65] add package site dir for installclass searching
+
+The default dir searching is incorrect.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/installclass.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/pyanaconda/installclass.py b/pyanaconda/installclass.py
+index 4bb7dff..0311ca7 100644
+--- a/pyanaconda/installclass.py
++++ b/pyanaconda/installclass.py
+@@ -22,6 +22,7 @@
+ #
+ 
+ from distutils.sysconfig import get_python_lib
++from site import getsitepackages
+ import os, sys
+ import imp
+ 
+@@ -192,7 +193,7 @@ def availableClasses(showHidden=False):
+ 
+     path = []
+ 
+-    env_path = []
++    env_path = ["%s/pyanaconda/installclasses" % p for p in getsitepackages()]
+     if "ANACONDA_INSTALL_CLASSES" in os.environ:
+         env_path += os.environ["ANACONDA_INSTALL_CLASSES"].split(":")
+ 
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0006-do-not-load-the-system-wide-Xresources.patch b/meta-installer/recipes-installer/anaconda/files/0006-do-not-load-the-system-wide-Xresources.patch
new file mode 100644
index 0000000..d20f5d0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0006-do-not-load-the-system-wide-Xresources.patch
@@ -0,0 +1,53 @@
+From 68fe87ef2ff8b79dc17a35afcdce95f87f9da022 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 15 May 2017 11:07:19 +0800
+Subject: [PATCH 06/65] do not load the system-wide Xresources
+
+- In https://github.com/rhinstaller/anaconda, revert the
+  following commit:
+-----------------------------------------------
+commit ef85e16c80609efc6bdd50c3a5aa6333fcdf0a57
+Author: David Shea <dshea@redhat.com>
+Date:   Wed Mar 9 14:43:03 2016 -0500
+
+    Load the system-wide Xresources (#1241724)
+-----------------------------------------------
+
+The reason is OE does not have spice-vdagent.
+
+- Use terminal vt7 to display X
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/display.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pyanaconda/display.py b/pyanaconda/display.py
+index 91c9a83..fd255a4 100644
+--- a/pyanaconda/display.py
++++ b/pyanaconda/display.py
+@@ -130,7 +130,7 @@ def start_x11():
+ 
+     # Start Xorg and wait for it become ready
+     iutil.startX(["Xorg", "-br", "-logfile", "/tmp/X.log",
+-                  ":%s" % constants.X_DISPLAY_NUMBER, "vt6", "-s", "1440", "-ac",
++                  ":%s" % constants.X_DISPLAY_NUMBER, "vt7", "-s", "1440", "-ac",
+                   "-nolisten", "tcp", "-dpi", "96",
+                   "-noreset"], output_redirect=subprocess.DEVNULL)
+ 
+@@ -306,8 +306,8 @@ def setup_display(anaconda, options, addon_paths=None):
+             anaconda.gui_startup_failed = True
+             time.sleep(2)
+ 
+-        if not anaconda.gui_startup_failed:
+-            do_extra_x11_actions(options.runres, gui_mode=anaconda.gui_mode)
++        #if not anaconda.gui_startup_failed:
++        #    do_extra_x11_actions(options.runres, gui_mode=anaconda.gui_mode)
+ 
+     if anaconda.tui_mode and anaconda.gui_startup_failed and flags.vncquestion and not anaconda.ksdata.vnc.enabled:
+         message = _("X was unable to start on your machine. Would you like to start VNC to connect to "
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0007-tweak-iso-mount-dir-and-kernel-name.patch b/meta-installer/recipes-installer/anaconda/files/0007-tweak-iso-mount-dir-and-kernel-name.patch
new file mode 100644
index 0000000..b67e273
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0007-tweak-iso-mount-dir-and-kernel-name.patch
@@ -0,0 +1,95 @@
+From 7576c994c1af5d6f4302e6393e407beded480514 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 18 May 2017 13:41:01 +0800
+Subject: [PATCH] tweak iso mount dir and kernel name
+
+- Tweak iso mount dir based on WRLinux
+
+- Tweak kernel name based on OE
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/constants.py        |  4 ++--
+ pyanaconda/payload/__init__.py | 20 ++++++++++++--------
+ 2 files changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/pyanaconda/constants.py b/pyanaconda/constants.py
+index f2b62d0..b514bf5 100644
+--- a/pyanaconda/constants.py
++++ b/pyanaconda/constants.py
+@@ -52,8 +52,8 @@ DD_RPMS = "/tmp/DD-*"
+ TRANSLATIONS_UPDATE_DIR = "/tmp/updates/po"
+ 
+ ANACONDA_CLEANUP = "anaconda-cleanup"
+-MOUNT_DIR = "/run/install"
+-DRACUT_REPODIR = "/run/install/repo"
++MOUNT_DIR = "/media/realroot"
++DRACUT_REPODIR = MOUNT_DIR + "/Packages"
+ DRACUT_ISODIR = "/run/install/source"
+ ISO_DIR = MOUNT_DIR + "/isodir"
+ IMAGE_DIR = MOUNT_DIR + "/image"
+diff --git a/pyanaconda/payload/__init__.py b/pyanaconda/payload/__init__.py
+index 7e78145..87b88d8 100644
+--- a/pyanaconda/payload/__init__.py
++++ b/pyanaconda/payload/__init__.py
+@@ -42,7 +42,7 @@ if __name__ == "__main__":
+     from pyanaconda import anaconda_log
+     anaconda_log.init()
+ 
+-from pyanaconda.constants import DRACUT_ISODIR, DRACUT_REPODIR, DD_ALL, DD_FIRMWARE, DD_RPMS, INSTALL_TREE, ISO_DIR
++from pyanaconda.constants import DRACUT_ISODIR, DRACUT_REPODIR, DD_ALL, DD_FIRMWARE, DD_RPMS, INSTALL_TREE, ISO_DIR, MOUNT_DIR
+ from pyanaconda.constants import THREAD_STORAGE, THREAD_WAIT_FOR_CONNECTING_NM, THREAD_PAYLOAD
+ from pyanaconda.constants import THREAD_PAYLOAD_RESTART
+ from pykickstart.constants import GROUP_ALL, GROUP_DEFAULT, GROUP_REQUIRED
+@@ -859,7 +859,7 @@ class PackagePayload(Payload):
+         if "kernel" in self.data.packages.excludedList:
+             return []
+ 
+-        kernels = ["kernel"]
++        kernels = ["kernel-image"]
+ 
+         if blivet.arch.is_x86(32) and isys.isPaeAvailable():
+             kernels.insert(0, "kernel-PAE")
+@@ -887,14 +887,17 @@ class PackagePayload(Payload):
+         files = []
+ 
+         ts = rpm.TransactionSet(iutil.getSysroot())
+-        mi = ts.dbMatch('providename', 'kernel')
++        mi = ts.dbMatch()
++        mi.pattern('name', rpm.RPMMIRE_GLOB, 'kernel-image*')
+         for hdr in mi:
++            log.info("hdr.filenames %s" % hdr.filenames)
+             unicode_fnames = (f.decode("utf-8") for f in hdr.filenames)
+-            # Find all /boot/vmlinuz- files and strip off vmlinuz-
++            # Find all /boot/* files and strip off *-
+             files.extend((f.split("/")[-1][8:] for f in unicode_fnames
+-                if fnmatch(f, "/boot/vmlinuz-*") or
+-                   fnmatch(f, "/boot/efi/EFI/%s/vmlinuz-*" % self.instclass.efi_dir)))
++                if(fnmatch(f, "/boot/*") or fnmatch(f, "/boot/efi/EFI/%s/*" % self.instclass.efi_dir))
++                   and len(f.split("/")[-1]) > 7))
+ 
++        log.info("kernelVersionList %s" % files)
+         return sorted(files, key=functools.cmp_to_key(versionCmp))
+ 
+     @property
+@@ -1097,12 +1100,13 @@ class PackagePayload(Payload):
+             sslverify = not (method.noverifyssl or flags.noverifyssl)
+         elif method.method == "cdrom" or (checkmount and not method.method):
+             # Did dracut leave the DVD or NFS mounted for us?
+-            device = blivet.util.get_mount_device(DRACUT_REPODIR)
++            device = blivet.util.get_mount_device(MOUNT_DIR)
+ 
+             # Check for valid optical media if we didn't boot from one
+-            if not verifyMedia(DRACUT_REPODIR):
++            if not verifyMedia(MOUNT_DIR):
+                 self.install_device = opticalInstallMedia(storage.devicetree)
+ 
++            log.info("device %s, install_device %s" % (device, self.install_device))
+             # Only look at the dracut mount if we don't already have a cdrom
+             if device and not self.install_device:
+                 self.install_device = storage.devicetree.get_device_by_path(device)
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0008-dnfpayload.py-customize-for-WRLinux.patch b/meta-installer/recipes-installer/anaconda/files/0008-dnfpayload.py-customize-for-WRLinux.patch
new file mode 100644
index 0000000..cccc2c5
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0008-dnfpayload.py-customize-for-WRLinux.patch
@@ -0,0 +1,597 @@
+From b975f1e037d87f068fcf21517a74665b02ad3988 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 18 May 2017 15:23:24 +0800
+Subject: [PATCH 08/65] dnfpayload.py: customize for WRLinux
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/payload/dnfpayload.py | 366 ++++++++++++++++++++++++++++++---------
+ 1 file changed, 285 insertions(+), 81 deletions(-)
+
+diff --git a/pyanaconda/payload/dnfpayload.py b/pyanaconda/payload/dnfpayload.py
+index 6d196e2..8cad37b 100644
+--- a/pyanaconda/payload/dnfpayload.py
++++ b/pyanaconda/payload/dnfpayload.py
+@@ -18,6 +18,7 @@
+ # Red Hat, Inc.
+ #
+ import os
++import os.path
+ 
+ from blivet.size import Size
+ from pykickstart.constants import GROUP_ALL, GROUP_DEFAULT, KS_MISSING_IGNORE
+@@ -44,7 +45,13 @@ import sys
+ import time
+ import threading
+ from requests.exceptions import RequestException
++import inspect
++import collections
+ 
++if __name__ == "__main__":
++    from pyanaconda import anaconda_log
++    anaconda_log.init()
++    anaconda_log.logger.setupVirtio()
+ log = logging.getLogger("packaging")
+ 
+ import dnf
+@@ -54,6 +61,7 @@ import dnf.repo
+ import dnf.callback
+ import dnf.conf.parser
+ import dnf.conf.substitutions
++import dnf.const
+ import rpm
+ import librepo
+ 
+@@ -225,7 +233,18 @@ class PayloadRPMDisplay(dnf.callback.TransactionProgress):
+         """Report an error that occurred during the transaction. Message is a
+         string which describes the error.
+         """
+-        self._queue.put(('error', message))
++        token = "error"
++        if message.startswith("Non-fatal"):
++            token = "warn"
++        self._queue.put((token, message))
++        log.info("error: %s" % message)
++
++    def scriptout(self, msgs):
++        if msgs is None:
++            return
++
++        log.info("scriptout: %s" % msgs)
++
+ 
+ 
+ class DownloadProgress(dnf.callback.DownloadProgress):
+@@ -294,6 +313,14 @@ class DNFPayload(payload.PackagePayload):
+         self._updates_enabled = True
+         self._configure()
+ 
++        self.requiredPackages += ['base-files', 'base-passwd', 'shadow']
++        # Support grub-mkconfig
++        self.requiredPackages += ['sed', 'coreutils', 'busybox']
++        # The extra packages make sure lvm initramfs generation
++        #self.requiredPackages += ['ldd', 'gzip', 'iputils']
++        # Support create new user
++        self.requiredPackages += ['shadow']
++
+         # Protect access to _base.repos to ensure that the dictionary is not
+         # modified while another thread is attempting to iterate over it. The
+         # lock only needs to be held during operations that change the number
+@@ -303,12 +330,26 @@ class DNFPayload(payload.PackagePayload):
+         # save repomd metadata
+         self._repoMD_list = []
+ 
++        # WRlinux specific
++        self.image = {}
++        self.tasks = {}
++
++    def setup(self, storage, instClass):
++        log.info("%s %s" % (self.__class__.__name__, inspect.stack()[0][3]))
++
++        self.image, self.tasks = instClass.read_buildstamp()
++        super(DNFPayload, self).setup(storage, instClass)
++
+     def unsetup(self):
+         super(DNFPayload, self).unsetup()
+         self._base = None
+         self._configure()
+         self._repoMD_list = []
+ 
++        # WRlinux specific
++        self.image = {}
++        self.tasks = {}
++
+     def _replace_vars(self, url):
+         """Replace url variables with their values.
+ 
+@@ -405,21 +446,12 @@ class DNFPayload(payload.PackagePayload):
+         super(DNFPayload, self).addRepo(ksrepo)
+ 
+     def _apply_selections(self):
+-        if self.data.packages.nocore:
+-            log.info("skipping core group due to %%packages --nocore; system may not be complete")
+-        else:
+-            try:
+-                self._select_group('core', required=True)
+-                log.info("selected group: core")
+-            except payload.NoSuchGroup as e:
+-                self._miss(e)
+-
+         env = None
+ 
+-        if self.data.packages.default and self.environments:
+-            env = self.environments[0]
+-        elif self.data.packages.environment:
++        if self.data.packages.environment:
+             env = self.data.packages.environment
++        elif self.environments:
++            env = self.environments[0]
+ 
+         excludedGroups = [group.name for group in self.data.packages.excludedGroupList]
+ 
+@@ -461,7 +493,7 @@ class DNFPayload(payload.PackagePayload):
+             except payload.NoSuchPackage as e:
+                 self._miss(e)
+ 
+-        for group in self.requiredGroups:
++        for group in self.requiredGroups or []:
+             try:
+                 self._select_group(group, required=True)
+                 log.debug("selected required group: %s", group)
+@@ -497,6 +529,33 @@ class DNFPayload(payload.PackagePayload):
+             conf.proxy_username = None
+             conf.proxy_password = None
+ 
++    def _oe_configure(self, dnf_conf):
++        # Refers oe-core's recipes of dnf and rpm
++        os.environ['RPM_NO_CHROOT_FOR_SCRIPTS'] = "1"
++
++        # Refers oe-core's meta/lib/oe/package_manager.py
++        # def _prepare_pkg_transaction(self) in class RpmPM(PackageManager)
++        target_rootfs = pyanaconda.iutil.getSysroot()
++        os.environ['D'] = target_rootfs
++        os.environ['OFFLINE_ROOT'] = target_rootfs
++        os.environ['IPKG_OFFLINE_ROOT'] = target_rootfs
++        os.environ['OPKG_OFFLINE_ROOT'] = target_rootfs
++
++        # Refer oe-core's meta/lib/oe/package_manager.py
++        # def _configure_dnf(self) in class RpmPM(PackageManager)
++        # directly read its result from installer system
++        dnf_conf.substitutions['arch'] = open("/etc/dnf/vars/arch", "r").readline()
++
++    def _oe_configure_post(self):
++        # Refers oe-core's meta/lib/oe/package_manager.py
++        # def _configure_rpm(self) and def _configure_dnf(self)
++        # in class RpmPM(PackageManager)
++        # directly copy its result from installer system
++        target_sysconf = "%s/etc" % pyanaconda.iutil.getSysroot()
++        pyanaconda.iutil.execWithRedirect("cp", ["-fr", "/etc/rpmrc", target_sysconf])
++        pyanaconda.iutil.execWithRedirect("cp", ["-rf", "/etc/dnf", target_sysconf])
++        pyanaconda.iutil.execWithRedirect("cp", ["-rf", "/etc/rpm", target_sysconf])
++
+     def _configure(self):
+         self._base = dnf.Base()
+         conf = self._base.conf
+@@ -508,12 +567,17 @@ class DNFPayload(payload.PackagePayload):
+         conf.installroot = pyanaconda.iutil.getSysroot()
+         conf.prepend_installroot('persistdir')
+ 
++        self._oe_configure(conf)
++
+         self._base.conf.substitutions.update_from_etc(conf.installroot)
+ 
+         # NSS won't survive the forking we do to shield out chroot during
+         # transaction, disable it in RPM:
+         conf.tsflags.append('nocrypto')
+ 
++        conf.errorlevel = dnf.const.VERBOSE_LEVEL
++        conf.debuglevel = dnf.const.VERBOSE_LEVEL
++
+         if self.data.packages.multiLib:
+             conf.multilib_policy = "all"
+ 
+@@ -551,9 +615,9 @@ class DNFPayload(payload.PackagePayload):
+         # reserve extra
+         return Size(size) + Size("150 MB")
+ 
+-    def _install_package(self, pkg_name, required=False):
++    def _install_package(self, pkg_name, required=False, strict=True):
+         try:
+-            return self._base.install(pkg_name)
++            return self._base.install(pkg_name, strict=strict)
+         except dnf.exceptions.MarkingError:
+             raise payload.NoSuchPackage(pkg_name, required=required)
+ 
+@@ -589,25 +653,47 @@ class DNFPayload(payload.PackagePayload):
+         return pkgdir
+ 
+     def _select_group(self, group_id, default=True, optional=False, required=False):
+-        grp = self._base.comps.group_by_pattern(group_id)
+-        if grp is None:
+-            raise payload.NoSuchGroup(group_id, required=required)
+-        types = {'mandatory'}
+-        if default:
+-            types.add('default')
+-        if optional:
+-            types.add('optional')
+-        exclude = self.data.packages.excludedList
+-        try:
+-            self._base.group_install(grp.id, types, exclude=exclude)
+-        except dnf.exceptions.MarkingError as e:
+-            # dnf-1.1.9 raises this error when a package is missing from a group
+-            raise payload.NoSuchPackage(str(e), required=True)
+-        except dnf.exceptions.CompsError as e:
+-            # DNF raises this when it is already selected
+-            log.debug(e)
++        log.info("_select_group %s" % group_id)
++        if not group_id:
++            return
++
++        glob = self._complementary_glob(group_id)
++
++        # get all available languages in repos
++        available_packs = self._base.sack.query().available() \
++            .filter(name__glob = "*-%s"%glob)
++        allpkgnames = [p.name for p in available_packs]
++        log.info("allpkgnames %d" % len(allpkgnames))
++        for pkgname in allpkgnames:
++            self._install_package(pkgname, strict=False)
++
++    def _select_linguas(self, image_linguas):
++        lc_globs = []
++        for ling in image_linguas.split():
++            if ling not in lc_globs:
++                lc_globs.append(ling)
++
++            baselang = ling.split('-')[0]
++            if ling != baselang and baselang not in lc_globs:
++                lc_globs.append(baselang)
++
++        log.info("lc_globs: %s" % lc_globs)
++        for glob in lc_globs:
++            self._select_group("locale-%s" % glob)
+ 
+     def _select_environment(self, env_id, excluded):
++        (image_name, description)  = self.environmentDescription(env_id)
++        log.info("image_name %s, des %s" % (image_name, description))
++        image_id = image_name.split()[0]
++        (image_summary, image_description, package_install, package_install_attemptonly, image_linguas) = self.image[image_id]
++        log.info("package_install %s, attempt %s, linguas %s" %
++                   (package_install, package_install_attemptonly, image_linguas))
++
++        for pkg in package_install.split():
++            self.requiredPackages.append(pkg)
++
++        self._select_linguas(image_linguas)
++
+         # dnf.base.environment_install excludes on packages instead of groups,
+         # which is unhelpful. Instead, use group_install for each group in
+         # the environment so we can skip the ones that are excluded.
+@@ -655,20 +741,25 @@ class DNFPayload(payload.PackagePayload):
+     def baseRepo(self):
+         # is any locking needed here?
+         repo_names = [constants.BASE_REPO_NAME] + self.DEFAULT_REPOS
++        log.info("repo_names %s" % repo_names)
+         with self._repos_lock:
+             for repo in self._base.repos.iter_enabled():
++                log.info("repo.id %s" % repo.id)
+                 if repo.id in repo_names:
+                     return repo.id
+         return None
+ 
+     @property
+     def environments(self):
+-        return [env.id for env in self._base.comps.environments]
++        """ List of environment ids. """
++        log.info("%s %s: %s" % (self.__class__.__name__, inspect.stack()[0][3], self.tasks.keys()))
++        return sorted(self.tasks.keys())
+ 
+     @property
+     def groups(self):
+-        groups = self._base.comps.groups_iter()
+-        return [g.id for g in groups]
++        """ List of group ids. """
++        log.info("%s %s" % (self.__class__.__name__, inspect.stack()[0][3]))
++        return sorted(self.tasks.keys())
+ 
+     @property
+     def mirrorEnabled(self):
+@@ -738,7 +829,7 @@ class DNFPayload(payload.PackagePayload):
+         return grp.visible
+ 
+     def _groupHasInstallableMembers(self, grpid):
+-        return True
++        return False
+ 
+     def checkSoftwareSelection(self):
+         log.info("checking software selection")
+@@ -792,50 +883,49 @@ class DNFPayload(payload.PackagePayload):
+         super(DNFPayload, self).enableRepo(repo_id)
+ 
+     def environmentDescription(self, environmentid):
+-        env = self._base.comps.environment_by_pattern(environmentid)
+-        if env is None:
+-            raise payload.NoSuchGroup(environmentid)
+-        return (env.ui_name, env.ui_description)
++        log.info("%s %s, %s" % (self.__class__.__name__, inspect.stack()[0][3], environmentid))
++
++        if environmentid not in self.tasks:
++                raise NoSuchGroup(environmentid)
++
++        if environmentid in self.tasks:
++            log.info("environmentDescription %s" % self.tasks)
++            (name, description, group) = self.tasks[environmentid]
++
++            return (name, description)
++        return (environmentid, environmentid)
+ 
+     def environmentId(self, environment):
+         """Return environment id for the environment specified by id or name."""
+-        env = self._base.comps.environment_by_pattern(environment)
+-        if env is None:
+-            raise payload.NoSuchGroup(environment)
+-        return env.id
++        log.info("%s %s, environment %s" % (self.__class__.__name__, inspect.stack()[0][3], environment))
++        # TODO
++        return environment
+ 
+     def environmentGroups(self, environmentid, optional=True):
+-        env = self._base.comps.environment_by_pattern(environmentid)
+-        if env is None:
+-            raise payload.NoSuchGroup(environmentid)
+-        group_ids = (id_.name for id_ in env.group_ids)
+-        option_ids = (id_.name for id_ in env.option_ids)
+-        if optional:
+-            return list(itertools.chain(group_ids, option_ids))
+-        else:
+-            return list(group_ids)
++        log.info("%s %s, %s" % (self.__class__.__name__, inspect.stack()[0][3], environmentid))
++
++        if environmentid in self.tasks:
++            log.info("environmentDescription %s" % self.tasks)
++            (name, description, groups) = self.tasks[environmentid]
++
++            return groups.split()
++        return [environmentid]
+ 
+     def environmentHasOption(self, environmentid, grpid):
+-        env = self._base.comps.environment_by_pattern(environmentid)
+-        if env is None:
+-            raise payload.NoSuchGroup(environmentid)
+-        return grpid in (id_.name for id_ in env.option_ids)
++        log.info("%s %s, %s, %s" % (self.__class__.__name__, inspect.stack()[0][3], environmentid, grpid))
++        # TODO
++        return True
+ 
+     def environmentOptionIsDefault(self, environmentid, grpid):
+-        env = self._base.comps.environment_by_pattern(environmentid)
+-        if env is None:
+-            raise payload.NoSuchGroup(environmentid)
+-
+-        # Look for a group in the optionlist that matches the group_id and has
+-        # default set
+-        return any(grp for grp in env.option_ids if grp.name == grpid and grp.default)
++        log.info("%s %s, %s, %s" % (self.__class__.__name__, inspect.stack()[0][3], environmentid, grpid))
++        # TODO
++        return True
+ 
+     def groupDescription(self, grpid):
+         """Return name/description tuple for the group specified by id."""
+-        grp = self._base.comps.group_by_pattern(grpid)
+-        if grp is None:
+-            raise payload.NoSuchGroup(grpid)
+-        return (grp.ui_name, grp.ui_description)
++        log.info("%s %s, %s" % (self.__class__.__name__, inspect.stack()[0][3], grpid))
++        (name, description, group) = self.tasks[grpid]
++        return (name, description)
+ 
+     def groupId(self, group_name):
+         """Translate group name to group ID.
+@@ -858,6 +948,31 @@ class DNFPayload(payload.PackagePayload):
+         self._base.read_comps()
+         self._refreshEnvironmentAddons()
+ 
++    # Refer upstream oe-core meta/lib/oe/package_manager.py
++    def _save_rpmpostinst(self, pkg):
++        def _script_num_prefix(path):
++            files = os.listdir(path)
++            numbers = set()
++            numbers.add(99)
++            for f in files:
++                numbers.add(int(f.split("-")[0]))
++            return max(numbers) + 1
++
++        log.info("Saving postinstall script of %s" % (pkg))
++
++        target_rootfs = pyanaconda.iutil.getSysroot()
++        args = ["-q", "--root=%s" % target_rootfs, "--queryformat", "%{postin}", pkg]
++
++        output = pyanaconda.iutil.execWithCapture('rpm', args, log_output=False)
++        log.info(output)
++
++        target_path = "%s/etc/rpm-postinsts" % target_rootfs
++        pyanaconda.iutil.execWithRedirect("mkdir", ["-p", target_path])
++        num = _script_num_prefix(target_path)
++        saved_script_name = os.path.join(target_path, "%d-%s" % (num, pkg))
++        open(saved_script_name, 'w').write(output)
++        os.chmod(saved_script_name, 0o755)
++
+     def install(self):
+         progress_message(N_('Starting package installation process'))
+ 
+@@ -889,6 +1004,7 @@ class DNFPayload(payload.PackagePayload):
+                 _failure_limbo()
+ 
+         log.info('Downloading packages finished.')
++        failed_scriptlets_pkgnames = collections.OrderedDict()
+ 
+         pre_msg = (N_("Preparing transaction from installation source"))
+         progress_message(pre_msg)
+@@ -921,6 +1037,9 @@ class DNFPayload(payload.PackagePayload):
+             elif token == 'quit':
+                 msg = ("Payload error - DNF installation has ended up abruptly: %s" % msg)
+                 raise payload.PayloadError(msg)
++            elif token == 'warn':
++                if msg.startswith("Non-fatal POSTIN scriptlet failure in rpm package"):
++                    failed_scriptlets_pkgnames[msg.split()[-1]] = True
+             elif token == 'error':
+                 exc = payload.PayloadInstallError("DNF error: %s" % msg)
+                 if errors.errorHandler.cb(exc) == errors.ERROR_RAISE:
+@@ -929,7 +1048,12 @@ class DNFPayload(payload.PackagePayload):
+             (token, msg) = queue_instance.get()
+ 
+         process.join()
++
+         self._base.close()
++
++        for pkg in failed_scriptlets_pkgnames.keys():
++            self._save_rpmpostinst(pkg)
++
+         if os.path.exists(self._download_location):
+             log.info("Cleaning up downloaded packages: %s", self._download_location)
+             shutil.rmtree(self._download_location)
+@@ -940,6 +1064,39 @@ class DNFPayload(payload.PackagePayload):
+             # we don't have to care about clearing the download location ourselves.
+             log.warning("Can't delete nonexistent download location: %s", self._download_location)
+ 
++    def _list_installed(self):
++        output = pyanaconda.iutil.execWithCapture(
++                      'dnf',
++                      [
++                        'repoquery',
++                        '--installed',
++                        '--installroot='+pyanaconda.iutil.getSysroot(),
++                        '--queryformat=Package:%{name}'
++                      ],
++                      log_output=False
++                 )
++        output = output.rstrip()
++        lines = output.splitlines()
++        installed = []
++        for line in lines:
++            if not line.startswith("Package:"):
++                continue
++            installed.append(line.replace("Package:", ""))
++        return installed
++
++    def _complementary_glob(self, group):
++        complementary_glob = {}
++        complementary_glob['dev-pkgs'] = 'dev'
++        complementary_glob['staticdev-pkgs'] = 'staticdev'
++        complementary_glob['doc-pkgs'] = 'doc'
++        complementary_glob['dbg-pkgs'] = 'dbg'
++        complementary_glob['ptest-pkgs'] = 'ptest'
++
++        if group in complementary_glob:
++            return complementary_glob[group]
++
++        return group
++
+     def getRepo(self, repo_id):
+         """Return the yum repo object."""
+         return self._base.repos[repo_id]
+@@ -959,16 +1116,7 @@ class DNFPayload(payload.PackagePayload):
+         return True
+ 
+     def languageGroups(self):
+-        locales = [self.data.lang.lang] + self.data.lang.addsupport
+-        match_fn = pyanaconda.localization.langcode_matches_locale
+-        gids = set()
+-        gl_tuples = ((g.id, g.lang_only) for g in self._base.comps.groups_iter())
+-        for (gid, lang) in gl_tuples:
+-            for locale in locales:
+-                if match_fn(lang, locale):
+-                    gids.add(gid)
+-        log.info('languageGroups: %s', gids)
+-        return list(gids)
++        return []
+ 
+     def preInstall(self, packages=None, groups=None):
+         super(DNFPayload, self).preInstall(packages, groups)
+@@ -986,12 +1134,12 @@ class DNFPayload(payload.PackagePayload):
+         self._repoMD_list = []
+ 
+     def updateBaseRepo(self, fallback=True, checkmount=True):
+-        log.info('configuring base repo')
+         self.reset()
+         url, mirrorlist, sslverify = self._setupInstallDevice(self.storage,
+                                                               checkmount)
+         method = self.data.method
+-
++        log.info('configuring base repo: url %s, mirrorlist %s, sslverify %s, method %s'
++                    % (url, mirrorlist, sslverify, method.method))
+         # Read in all the repos from the installation environment, make a note of which
+         # are enabled, and then disable them all.  If the user gave us a method, we want
+         # to use that instead of the default repos.
+@@ -1161,6 +1309,17 @@ class DNFPayload(payload.PackagePayload):
+ 
+         super(DNFPayload, self).postInstall()
+ 
++        self._oe_configure_post()
++
++        # For the generation of anaconda-ks.cfg
++        for pkg in self._list_installed():
++            if pkg not in self.data.packages.packageList:
++                self.data.packages.packageList.append(pkg)
++
++        pyanaconda.iutil.execWithRedirect("depmod",
++                                          ["-a"],
++                                          root=pyanaconda.iutil.getSysroot())
++
+     def writeStorageLate(self):
+         pass
+ 
+@@ -1234,3 +1393,48 @@ class RepoMDMetaHash(object):
+                 log.debug("Can't download new repomd.xml from %s. Error: %s", url, e)
+ 
+         return repomd
++
++
++# For testing
++if __name__ == "__main__":
++    log.info("God bless us")
++
++    from pykickstart.version import makeVersion
++
++    # set up ksdata
++    ksdata = makeVersion()
++
++    ksdata.method.method = "cdrom"
++
++    from pyanaconda.installclass import DefaultInstall
++    instClass = DefaultInstall()
++
++    import blivet
++    storage = blivet.Blivet(ksdata=ksdata)
++    storage.set_default_fstype("ext4")
++
++    _payload = DNFPayload(ksdata)
++
++    _payload.setup(storage, instClass)
++
++    # Keep setting up package-based repositories
++    # Download package metadata
++    try:
++        _payload.updateBaseRepo(fallback=False, checkmount=True)
++    except payload.PayloadError as e:
++        log.error("PayloadError: %s", e)
++        _payload.unsetup()
++        exit(0)
++
++    # Gather the group data
++    _payload.gatherRepoMetadata()
++    _payload.release()
++    _payload.addDriverRepos()
++
++    log.info("baseRepo %s" % _payload.baseRepo)
++
++    _payload.preInstall()
++
++    _payload.install()
++
++    _payload.postInstall()
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0009-Remove-unnecessary-noverifyssl-for-http-ftp-protocol.patch b/meta-installer/recipes-installer/anaconda/files/0009-Remove-unnecessary-noverifyssl-for-http-ftp-protocol.patch
new file mode 100644
index 0000000..72c92d9
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0009-Remove-unnecessary-noverifyssl-for-http-ftp-protocol.patch
@@ -0,0 +1,32 @@
+From cb5140f12ba1dbe2f67f5f47eddaecc1b54790ed Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 19 May 2017 14:03:54 +0800
+Subject: [PATCH 09/65] Remove unnecessary --noverifyssl for http/ftp protocol
+
+We set --noverifyssl by default, but it makes sense for https only
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/install.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/pyanaconda/install.py b/pyanaconda/install.py
+index 224ef8f..929b89d 100644
+--- a/pyanaconda/install.py
++++ b/pyanaconda/install.py
+@@ -68,6 +68,10 @@ def _writeKS(ksdata):
+                 ksdata.partition.dataList() + ksdata.raid.dataList():
+         obj.passphrase = ""
+ 
++    # The true of '--noverifyssl' makes sense for https only
++    if ksdata.method.method == "url" and not ksdata.method.url.startswith("https://"):
++        ksdata.method.noverifyssl = False
++
+     # Make it so only root can read - could have passwords
+     with iutil.open_with_perm(path, "w", 0o600) as f:
+         f.write(str(ksdata))
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0010-dynamic-detect-workable-locale.patch b/meta-installer/recipes-installer/anaconda/files/0010-dynamic-detect-workable-locale.patch
new file mode 100644
index 0000000..52bfbd0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0010-dynamic-detect-workable-locale.patch
@@ -0,0 +1,77 @@
+From 7cd183175a63c48fcdc6c3f87a3aa18d4f925460 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 19 May 2017 14:36:30 +0800
+Subject: [PATCH 10/65] dynamic detect workable locale
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/localization.py                          | 18 +++++++++++++++++-
+ pyanaconda/ui/gui/spokes/lib/lang_locale_handler.py |  3 +++
+ pyanaconda/ui/tui/spokes/langsupport.py             |  2 +-
+ 3 files changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/localization.py b/pyanaconda/localization.py
+index 5c9054c..3fa1a91 100644
+--- a/pyanaconda/localization.py
++++ b/pyanaconda/localization.py
+@@ -28,7 +28,7 @@ import sys
+ import io
+ 
+ from pyanaconda import constants
+-from pyanaconda.iutil import upcase_first_letter, setenv, execWithRedirect
++from pyanaconda.iutil import upcase_first_letter, setenv, execWithRedirect, execReadlines
+ 
+ import logging
+ log = logging.getLogger("anaconda")
+@@ -770,3 +770,19 @@ def setup_locale_environment(locale=None, text_mode=False, prefer_environment=Fa
+     for varname in ("LANGUAGE", "LC_ALL", "LC_MESSAGES"):
+         if varname in os.environ:
+             del os.environ[varname]
++
++_all_locales = []
++def list_all_locales():
++    global _all_locales
++
++    if _all_locales == []:
++        for lang in execReadlines("locale", ["-a"]):
++            parts= parse_langcode(lang)
++            locales = langtable.list_locales(languageId=parts["language"],
++                                             territoryId=parts.get("territory", ""),
++                                             scriptId=parts.get("script", ""))
++            _all_locales += locales
++
++        log.info("all locales: %s" % _all_locales)
++
++    return _all_locales
+diff --git a/pyanaconda/ui/gui/spokes/lib/lang_locale_handler.py b/pyanaconda/ui/gui/spokes/lib/lang_locale_handler.py
+index 9061350..2903b9b 100644
+--- a/pyanaconda/ui/gui/spokes/lib/lang_locale_handler.py
++++ b/pyanaconda/ui/gui/spokes/lib/lang_locale_handler.py
+@@ -154,6 +154,9 @@ class LangLocaleHandler(object):
+         self._localeStore.clear()
+         locales = localization.get_language_locales(lang)
+         for locale in locales:
++            if locale not in localization.list_all_locales():
++                continue
++
+             self._add_locale(self._localeStore,
+                              localization.get_native_name(locale),
+                              locale)
+diff --git a/pyanaconda/ui/tui/spokes/langsupport.py b/pyanaconda/ui/tui/spokes/langsupport.py
+index 96c02ea..abfe25a 100644
+--- a/pyanaconda/ui/tui/spokes/langsupport.py
++++ b/pyanaconda/ui/tui/spokes/langsupport.py
+@@ -83,7 +83,7 @@ class LangSpoke(FirstbootSpokeMixIn, NormalTUISpoke):
+ 
+         if args:
+             self._window += [TextWidget(_("Available locales"))]
+-            displayed = [TextWidget(localization.get_english_name(z)) for z in args]
++            displayed = [TextWidget(localization.get_english_name(z)) for z in args if z in localization.list_all_locales()]
+         else:
+             self._window += [TextWidget(_("Available languages"))]
+             displayed = [TextWidget(z) for z in self._langs]
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0011-improve-thread-monitor.patch b/meta-installer/recipes-installer/anaconda/files/0011-improve-thread-monitor.patch
new file mode 100644
index 0000000..db79cc8
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0011-improve-thread-monitor.patch
@@ -0,0 +1,55 @@
+From 3ea4a87110523bea46212590b2875f8f0683687d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 19 May 2017 14:43:24 +0800
+Subject: [PATCH 11/65] improve thread monitor
+
+Set thread name, it is easy to monitor thread status by ps
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/threads.py | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/pyanaconda/threads.py b/pyanaconda/threads.py
+index b3fe610..bce389c 100644
+--- a/pyanaconda/threads.py
++++ b/pyanaconda/threads.py
+@@ -21,6 +21,8 @@ import logging
+ log = logging.getLogger("anaconda")
+ 
+ import threading
++import prctl
++from functools import wraps
+ 
+ _WORKER_THREAD_PREFIX = "AnaWorkerThread"
+ 
+@@ -223,6 +225,14 @@ class AnacondaThread(threading.Thread):
+     _prefix_thread_counts = dict()
+ 
+     def __init__(self, *args, **kwargs):
++        def set_thread_name(target):
++            @wraps(target)
++            def inner_target(*args, **kwargs):
++                prctl.set_name(self.name)
++                return target(*args, **kwargs)
++
++            return inner_target
++
+         # if neither name nor prefix is given, use the worker prefix
+         if "name" not in kwargs and "prefix" not in kwargs:
+             kwargs["prefix"] = _WORKER_THREAD_PREFIX
+@@ -234,6 +244,9 @@ class AnacondaThread(threading.Thread):
+             self._prefix_thread_counts[prefix] = thread_num
+             kwargs["name"] = prefix + str(thread_num)
+ 
++        if "target" in kwargs:
++            kwargs["target"] =  set_thread_name(kwargs["target"])
++
+         if "fatal" in kwargs:
+             self._fatal = kwargs.pop("fatal")
+         else:
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0012-disable-audit.patch b/meta-installer/recipes-installer/anaconda/files/0012-disable-audit.patch
new file mode 100644
index 0000000..8c0b704
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0012-disable-audit.patch
@@ -0,0 +1,64 @@
+From b9b8bae1021093b9593367a1672fc54a2eb23d2d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Jul 2017 02:39:14 -0400
+Subject: [PATCH 12/65] disable audit
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ anaconda.py                 | 7 -------
+ configure.ac                | 3 ---
+ pyanaconda/isys/Makefile.am | 6 ------
+ 3 files changed, 16 deletions(-)
+
+diff --git a/anaconda.py b/anaconda.py
+index 25f227c..ad7bf6b 100755
+--- a/anaconda.py
++++ b/anaconda.py
+@@ -467,13 +467,6 @@ if __name__ == "__main__":
+ 
+         sys.excepthook = _earlyExceptionHandler
+ 
+-    if can_touch_runtime_system("start audit daemon"):
+-        # auditd will turn into a daemon and exit. Ignore startup errors
+-        try:
+-            iutil.execWithRedirect("/sbin/auditd", [])
+-        except OSError:
+-            pass
+-
+     log.info("anaconda called with cmdline = %s", sys.argv)
+     log.info("Default encoding = %s ", sys.getdefaultencoding())
+ 
+diff --git a/configure.ac b/configure.ac
+index 1237f76..a946770 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,9 +68,6 @@ AC_CHECK_FUNCS([getcwd memset mkdir strchr strdup],
+                [],
+                [ANACONDA_SOFT_FAILURE([Function $ac_func not found.])])
+ 
+-AC_CHECK_LIB([audit], [audit_open], [:],
+-             [ANACONDA_SOFT_FAILURE([libaudit not found])])
+-
+ AM_PATH_PYTHON(python_required_version)
+ 
+ # Check for the python extension paths
+diff --git a/pyanaconda/isys/Makefile.am b/pyanaconda/isys/Makefile.am
+index 3318eb8..227deda 100644
+--- a/pyanaconda/isys/Makefile.am
++++ b/pyanaconda/isys/Makefile.am
+@@ -28,10 +28,4 @@ _isys_la_LDFLAGS      = -module -avoid-version
+ _isys_la_LIBADD       = $(PYTHON3_LIBS)
+ _isys_la_SOURCES      = isys.c
+ 
+-auditddir             = $(libexecdir)/$(PACKAGE_NAME)
+-auditd_PROGRAMS       = auditd
+-auditd_SOURCES        = auditd.c
+-auditd_CFLAGS         = $(SELINUX_CFLAGS)
+-auditd_LDFLAGS        = -laudit
+-
+ MAINTAINERCLEANFILES = Makefile.in
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0013-bootloader.py-Change-grub2-settings-to-match-oe-core.patch b/meta-installer/recipes-installer/anaconda/files/0013-bootloader.py-Change-grub2-settings-to-match-oe-core.patch
new file mode 100644
index 0000000..7f4142d
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0013-bootloader.py-Change-grub2-settings-to-match-oe-core.patch
@@ -0,0 +1,137 @@
+From 80f24da9a6a564f642ce2e4badd8d78515f4914e Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@windriver.com>
+Date: Fri, 19 May 2017 15:30:43 +0800
+Subject: [PATCH 13/65] bootloader.py: Change 'grub2' settings to match oe-core
+
+There is no 'grub2' package in oe-core, it's called 'grub'.  Adjust settings
+to match this naming.  Also before writing out a variety of configuration
+files, as necessary -- create the directories required.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 39 +++++++++++++++++++++++++++++++++------
+ 1 file changed, 33 insertions(+), 6 deletions(-)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 339cc2f..3c8ae40 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -944,6 +944,10 @@ class BootLoader(object):
+             raise BootLoaderError("no config file defined for this boot loader")
+ 
+         config_path = os.path.normpath(iutil.getSysroot() + self.config_file)
++        config_dir = os.path.dirname(config_path)
++        if not os.path.isdir(config_dir):
++            os.mkdir(config_dir, 755)
++
+         if os.access(config_path, os.R_OK):
+             os.rename(config_path, config_path + ".anacbak")
+ 
+@@ -1214,6 +1218,11 @@ class GRUB(BootLoader):
+     def write_device_map(self):
+         """ Write out a device map containing all supported devices. """
+         map_path = os.path.normpath(iutil.getSysroot() + self.device_map_file)
++
++        map_dir = os.path.dirname(map_path)
++        if not os.path.isdir(map_dir):
++            os.mkdir(map_dir, 755)
++
+         if os.access(map_path, os.R_OK):
+             os.rename(map_path, map_path + ".anacbak")
+ 
+@@ -1399,9 +1408,9 @@ class GRUB2(GRUB):
+ 
+     """
+     name = "GRUB2"
+-    packages = ["grub2"]
++    packages = ["grub"]
+     _config_file = "grub.cfg"
+-    _config_dir = "grub2"
++    _config_dir = "grub"
+     defaults_file = "/etc/default/grub"
+     terminal_type = "console"
+     stage2_max_end = None
+@@ -1460,6 +1469,11 @@ class GRUB2(GRUB):
+     def write_device_map(self):
+         """ Write out a device map containing all supported devices. """
+         map_path = os.path.normpath(iutil.getSysroot() + self.device_map_file)
++
++        map_dir = os.path.dirname(map_path)
++        if not os.path.isdir(map_dir):
++            os.mkdir(map_dir, 755)
++
+         if os.access(map_path, os.R_OK):
+             os.rename(map_path, map_path + ".anacbak")
+ 
+@@ -1485,6 +1499,11 @@ class GRUB2(GRUB):
+ 
+     def write_defaults(self):
+         defaults_file = "%s%s" % (iutil.getSysroot(), self.defaults_file)
++
++        defaults_dir = os.path.dirname(defaults_file)
++        if not os.path.isdir(defaults_dir):
++            os.mkdir(defaults_dir, 755)
++
+         defaults = open(defaults_file, "w+")
+         defaults.write("GRUB_TIMEOUT=%d\n" % self.timeout)
+         defaults.write("GRUB_DISTRIBUTOR=\"$(sed 's, release .*$,,g' /etc/system-release)\"\n")
+@@ -1517,7 +1536,7 @@ class GRUB2(GRUB):
+         passwords = "%s\n%s\n" % (self.password, self.password)
+         os.write(pwrite, passwords.encode("utf-8"))
+         os.close(pwrite)
+-        buf = iutil.execWithCapture("grub2-mkpasswd-pbkdf2", [],
++        buf = iutil.execWithCapture("grub-mkpasswd-pbkdf2", [],
+                                     stdin=pread,
+                                     root=iutil.getSysroot())
+         os.close(pread)
+@@ -1530,6 +1549,11 @@ class GRUB2(GRUB):
+             return
+ 
+         users_file = iutil.getSysroot() + "/etc/grub.d/01_users"
++
++        users_dir = os.path.dirname(users_file)
++        if not os.path.isdir(users_dir):
++            os.mkdir(users_dir, 755)
++
+         header = iutil.open_with_perm(users_file, "w", 0o700)
+         header.write("#!/bin/sh -e\n\n")
+         header.write("cat << \"EOF\"\n")
+@@ -1567,12 +1591,12 @@ class GRUB2(GRUB):
+                 log.warning("Failed to find default image (%s), defaulting to 0", self.default.label)
+                 default_index = 0
+ 
+-            rc = iutil.execInSysroot("grub2-set-default", [str(default_index)])
++            rc = iutil.execInSysroot("grub-set-default", [str(default_index)])
+             if rc:
+                 log.error("failed to set default menu entry to %s", productName)
+ 
+         # now tell grub2 to generate the main configuration file
+-        rc = iutil.execInSysroot("grub2-mkconfig",
++        rc = iutil.execInSysroot("grub-mkconfig",
+                                  ["-o", self.config_file])
+         if rc:
+             raise BootLoaderError("failed to write boot loader configuration")
+@@ -1599,7 +1623,7 @@ class GRUB2(GRUB):
+                 else:
+                     log.info("bootloader.py: mbr will be updated for grub2")
+ 
+-            rc = iutil.execWithRedirect("grub2-install", grub_args,
++            rc = iutil.execWithRedirect("grub-install", grub_args,
+                                         root=iutil.getSysroot(),
+                                         env_prune=['MALLOC_PERTURB_'])
+             if rc:
+@@ -2407,6 +2431,9 @@ def writeSysconfigKernel(storage, version, instClass):
+ 
+     kernel = h.name.decode()
+ 
++    if not os.path.isdir(iutil.getSysroot() + "/etc/sysconfig"):
++        os.mkdir(iutil.getSysroot() + "/etc/sysconfig", 755)
++
+     f = open(iutil.getSysroot() + "/etc/sysconfig/kernel", "w+")
+     f.write("# UPDATEDEFAULT specifies if new-kernel-pkg should make\n"
+             "# new kernels the default\n")
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0014-tweak-detect-kernel-version.patch b/meta-installer/recipes-installer/anaconda/files/0014-tweak-detect-kernel-version.patch
new file mode 100644
index 0000000..ce2adef
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0014-tweak-detect-kernel-version.patch
@@ -0,0 +1,96 @@
+From 08cdf7e69a40c16e16b927ea1b58cbf33ab64d3d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 19 May 2017 16:14:01 +0800
+Subject: [PATCH 14/65] tweak detect kernel version
+
+According kernel layout in oe-core, tweak the detection
+rather than using redhat's.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py          | 32 ++++++++++++++++++--------------
+ pyanaconda/payload/livepayload.py |  9 +++++++--
+ 2 files changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 3c8ae40..a8fc01f 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -2404,16 +2404,23 @@ def get_bootloader():
+ 
+ def writeSysconfigKernel(storage, version, instClass):
+     # get the name of the default kernel package based on the version
+-    kernel_basename = "vmlinuz-" + version
+-    kernel_file = "/boot/%s" % kernel_basename
+-    if not os.path.isfile(iutil.getSysroot() + kernel_file):
+-        efi_dir = instClass.efi_dir
+-        if flags.cmdline.get("force_efi_dir") is not None:
+-            efi_dir = flags.cmdline.get("force_efi_dir")
+-        kernel_file = "/boot/efi/EFI/%s/%s" % (efi_dir, kernel_basename)
+-        if not os.path.isfile(iutil.getSysroot() + kernel_file):
+-            log.error("failed to recreate path to default kernel image")
+-            return
++    for kernel_basename in ["vmlinux", "bzImage"]:
++        kernel_file = "/boot/%s" % kernel_basename
++        if os.path.isfile(iutil.getSysroot() + kernel_file):
++            break
++        else:
++            efi_dir = instClass.efi_dir
++            if flags.cmdline.get("force_efi_dir") is not None:
++                efi_dir = flags.cmdline.get("force_efi_dir")
++            kernel_file = "/boot/efi/EFI/%s/%s" % (efi_dir, kernel_basename)
++            if not os.path.isfile(iutil.getSysroot() + kernel_file):
++                break
++
++        kernel_file = None
++
++    if kernel_file is None:
++        log.error("failed to recreate path to default kernel image")
++        return
+ 
+     try:
+         import rpm
+@@ -2421,6 +2428,7 @@ def writeSysconfigKernel(storage, version, instClass):
+         log.error("failed to import rpm python module")
+         return
+ 
++    log.debug("kernel_file %s" % kernel_file)
+     ts = rpm.TransactionSet(iutil.getSysroot())
+     mi = ts.dbMatch('basenames', kernel_file)
+     try:
+@@ -2493,10 +2501,6 @@ def writeBootLoader(storage, payload, instClass, ksdata):
+     # add whatever rescue kernels we can find to the end
+     kernel_versions = list(payload.kernelVersionList)
+ 
+-    rescue_versions = glob(iutil.getSysroot() + "/boot/vmlinuz-*-rescue-*")
+-    rescue_versions += glob(iutil.getSysroot() + "/boot/efi/EFI/%s/vmlinuz-*-rescue-*" % instClass.efi_dir)
+-    kernel_versions += (f.split("/")[-1][8:] for f in rescue_versions)
+-
+     if not kernel_versions:
+         log.warning("no kernel was installed -- boot loader config unchanged")
+         return
+diff --git a/pyanaconda/payload/livepayload.py b/pyanaconda/payload/livepayload.py
+index 632c798..1c41402 100644
+--- a/pyanaconda/payload/livepayload.py
++++ b/pyanaconda/payload/livepayload.py
+@@ -191,8 +191,13 @@ class LiveImagePayload(ImagePayload):
+         return Size(iutil.getDirSize("/") * 1024)
+ 
+     def _updateKernelVersionList(self):
+-        files = glob.glob(INSTALL_TREE + "/boot/vmlinuz-*")
+-        files.extend(glob.glob(INSTALL_TREE + "/boot/efi/EFI/%s/vmlinuz-*" % self.instclass.efi_dir))
++        for kernel in ["vmlinux", "bzImage"]:
++            files = glob.glob(INSTALL_TREE + "/boot/%s-*" % kernel)
++            files.extend(glob.glob(INSTALL_TREE + "/boot/efi/EFI/%s/%s-*" % (self.instclass.efi_dir, kernel)))
++            versions = sorted((f.split("/")[-1][8:] for f in files if os.path.isfile(f)))
++            if versions:
++                log.info("kernel versions: %s", versions)
++                break
+ 
+         self._kernelVersionList = sorted((f.split("/")[-1][8:] for f in files
+            if os.path.isfile(f) and "-rescue-" not in f), key=functools.cmp_to_key(versionCmp))
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0015-tweak-grub-config-file-for-WRLinux.patch b/meta-installer/recipes-installer/anaconda/files/0015-tweak-grub-config-file-for-WRLinux.patch
new file mode 100644
index 0000000..16a7c27
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0015-tweak-grub-config-file-for-WRLinux.patch
@@ -0,0 +1,28 @@
+From 9f516ae49d4ce95dc9054934733ee63eb8ba37bc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 19 May 2017 16:22:20 +0800
+Subject: [PATCH 15/65] tweak grub config file for WRLinux
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index a8fc01f..2a91759 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -1506,7 +1506,7 @@ class GRUB2(GRUB):
+ 
+         defaults = open(defaults_file, "w+")
+         defaults.write("GRUB_TIMEOUT=%d\n" % self.timeout)
+-        defaults.write("GRUB_DISTRIBUTOR=\"$(sed 's, release .*$,,g' /etc/system-release)\"\n")
++        defaults.write("GRUB_DISTRIBUTOR=\"%s\"\n" % productName)
+         defaults.write("GRUB_DEFAULT=saved\n")
+         defaults.write("GRUB_DISABLE_SUBMENU=true\n")
+         if self.console and self.has_serial_console:
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0016-Revert-Use-time.tzset-to-apply-timezone-changes-when.patch b/meta-installer/recipes-installer/anaconda/files/0016-Revert-Use-time.tzset-to-apply-timezone-changes-when.patch
new file mode 100644
index 0000000..21173b0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0016-Revert-Use-time.tzset-to-apply-timezone-changes-when.patch
@@ -0,0 +1,66 @@
+From b61aa798c2ad66862f00fb185441d2595faa3149 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 19 May 2017 16:43:39 +0800
+Subject: [PATCH 16/65] Revert "Use `time.tzset()` to apply timezone changes
+ when we can"
+
+This reverts commit 40adf6e3f8ce842c953f3376440dbd9bf8d8b303.
+
+The python3 in oe-core does not support time.tzset().
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/isys/__init__.py                | 2 --
+ pyanaconda/ui/gui/spokes/datetime_spoke.py | 4 ----
+ 2 files changed, 6 deletions(-)
+
+diff --git a/pyanaconda/isys/__init__.py b/pyanaconda/isys/__init__.py
+index fe2a9ae..391a067 100644
+--- a/pyanaconda/isys/__init__.py
++++ b/pyanaconda/isys/__init__.py
+@@ -119,8 +119,6 @@ def set_system_date_time(year=None, month=None, day=None, hour=None, minute=None
+     if not tz:
+         tz = utc
+ 
+-    time.tzset()
+-
+     # get the right values
+     now = datetime.datetime.now(tz)
+     year = year if year is not None else now.year
+diff --git a/pyanaconda/ui/gui/spokes/datetime_spoke.py b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+index 9a63d65..c3eedbc 100644
+--- a/pyanaconda/ui/gui/spokes/datetime_spoke.py
++++ b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+@@ -53,7 +53,6 @@ from pyanaconda.threads import threadMgr, AnacondaThread
+ import datetime
+ import re
+ import threading
+-import time
+ import locale as locale_mod
+ import functools
+ 
+@@ -621,7 +620,6 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+ 
+         if is_valid_timezone(self.data.timezone.timezone):
+             self._tzmap.set_timezone(self.data.timezone.timezone)
+-            time.tzset()
+ 
+         self._update_datetime()
+ 
+@@ -1003,11 +1001,9 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+                 offset = -float(city[3:])
+ 
+             self._tzmap.set_selected_offset(offset)
+-            time.tzset()
+         else:
+             # we don't want the timezone-changed signal to be emitted
+             self._tzmap.set_timezone(timezone)
+-            time.tzset()
+ 
+         # update "old" values
+         self._old_city = city
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0017-kickstart-Authconfig-Firewall-Firstboot-Timezone.patch b/meta-installer/recipes-installer/anaconda/files/0017-kickstart-Authconfig-Firewall-Firstboot-Timezone.patch
new file mode 100644
index 0000000..3554064
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0017-kickstart-Authconfig-Firewall-Firstboot-Timezone.patch
@@ -0,0 +1,216 @@
+From 471899dfb432b452566b1c7cd032a840597059fb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:09:17 +0800
+Subject: [PATCH 17/65] kickstart: Authconfig/Firewall/Firstboot/Timezone
+
+We do not support kickstart for now
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/kickstart.py | 162 +++---------------------------------------------
+ 1 file changed, 8 insertions(+), 154 deletions(-)
+
+diff --git a/pyanaconda/kickstart.py b/pyanaconda/kickstart.py
+index 470a12e..2210845 100644
+--- a/pyanaconda/kickstart.py
++++ b/pyanaconda/kickstart.py
+@@ -249,29 +249,10 @@ class Authconfig(commands.authconfig.FC3_Authconfig):
+         self.packages = []
+ 
+     def setup(self):
+-        if self.seen:
+-            self.packages = ["authconfig"]
++        pass
+ 
+     def execute(self, *args):
+-        cmd = "/usr/sbin/authconfig"
+-        if not os.path.lexists(iutil.getSysroot()+cmd):
+-            if flags.automatedInstall and self.seen:
+-                msg = _("%s is missing. Cannot setup authentication.") % cmd
+-                raise KickstartError(msg)
+-            else:
+-                return
+-
+-        args = ["--update", "--nostart"] + shlex.split(self.authconfig)
+-
+-        if not flags.automatedInstall and \
+-           (os.path.exists(iutil.getSysroot() + "/lib64/security/pam_fprintd.so") or
+-            os.path.exists(iutil.getSysroot() + "/lib/security/pam_fprintd.so")):
+-            args += ["--enablefingerprint"]
+-
+-        try:
+-            iutil.execInSysroot(cmd, args)
+-        except RuntimeError as msg:
+-            log.error("Error running %s %s: %s", cmd, args, msg)
++        pass
+ 
+ class AutoPart(commands.autopart.F26_AutoPart):
+     def parse(self, args):
+@@ -692,71 +673,17 @@ class Firewall(commands.firewall.F20_Firewall):
+         self.packages = []
+ 
+     def setup(self):
+-        if self.seen:
+-            self.packages = ["firewalld"]
++        pass
+ 
+     def execute(self, storage, ksdata, instClass):
+-        args = []
+-        # enabled is None if neither --enable or --disable is passed
+-        # default to enabled if nothing has been set.
+-        if self.enabled == False:
+-            args += ["--disabled"]
+-        else:
+-            args += ["--enabled"]
+-
+-        if "ssh" not in self.services and "ssh" not in self.remove_services and "22:tcp" not in self.ports:
+-            args += ["--service=ssh"]
+-
+-        for dev in self.trusts:
+-            args += ["--trust=%s" % (dev,)]
+-
+-        for port in self.ports:
+-            args += ["--port=%s" % (port,)]
+-
+-        for remove_service in self.remove_services:
+-            args += ["--remove-service=%s" % (remove_service,)]
+-
+-        for service in self.services:
+-            args += ["--service=%s" % (service,)]
+-
+-        cmd = "/usr/bin/firewall-offline-cmd"
+-        if not os.path.exists(iutil.getSysroot() + cmd):
+-            if self.enabled:
+-                msg = _("%s is missing. Cannot setup firewall.") % (cmd,)
+-                raise KickstartError(msg)
+-        else:
+-            iutil.execInSysroot(cmd, args)
++        pass
+ 
+ class Firstboot(commands.firstboot.FC3_Firstboot):
+     def setup(self, ksdata, instClass):
+-        if not self.seen:
+-            if flags.automatedInstall:
+-                # firstboot should be disabled by default after kickstart installations
+-                self.firstboot = FIRSTBOOT_SKIP
+-            elif instClass.firstboot and not self.firstboot:
+-                # if nothing is specified, use the installclass default for firstboot
+-                self.firstboot = instClass.firstboot
++        pass
+ 
+     def execute(self, *args):
+-        action = iutil.enable_service
+-        unit_name = "initial-setup.service"
+-
+-        # find if the unit file for the Initial Setup service is installed
+-        unit_exists = os.path.exists(os.path.join(iutil.getSysroot(), "lib/systemd/system/", unit_name))
+-        if unit_exists and self.firstboot == FIRSTBOOT_RECONFIG:
+-            # write the reconfig trigger file
+-            f = open(os.path.join(iutil.getSysroot(), "etc/reconfigSys"), "w+")
+-            f.close()
+-
+-        if self.firstboot == FIRSTBOOT_SKIP:
+-            action = iutil.disable_service
+-            # Also tell the screen access manager, so that the fact that post installation tools
+-            # should be disabled propagates to the user interaction config file.
+-            screen_access.sam.post_install_tools_disabled = True
+-
+-        # enable/disable the Initial Setup service (if its unit is installed)
+-        if unit_exists:
+-            action(unit_name)
++        pass
+ 
+ class Group(commands.group.F12_Group):
+     def execute(self, storage, ksdata, instClass, users):
+@@ -1729,84 +1656,11 @@ class Timezone(commands.timezone.F25_Timezone):
+     def __init__(self, *args):
+         commands.timezone.F25_Timezone.__init__(self, *args)
+ 
+-        self._added_chrony = False
+-        self._enabled_chrony = False
+-        self._disabled_chrony = False
+-
+     def setup(self, ksdata):
+-        # do not install and use NTP package
+-        if self.nontp or NTP_PACKAGE in ksdata.packages.excludedList:
+-            if iutil.service_running(NTP_SERVICE) and \
+-                    can_touch_runtime_system("stop NTP service"):
+-                ret = iutil.stop_service(NTP_SERVICE)
+-                if ret != 0:
+-                    log.error("Failed to stop NTP service")
+-
+-            if self._added_chrony and NTP_PACKAGE in ksdata.packages.packageList:
+-                ksdata.packages.packageList.remove(NTP_PACKAGE)
+-                self._added_chrony = False
+-
+-            # Both un-enable and disable chrony, because sometimes it's installed
+-            # off by default (packages) and sometimes not (liveimg).
+-            if self._enabled_chrony and NTP_SERVICE in ksdata.services.enabled:
+-                ksdata.services.enabled.remove(NTP_SERVICE)
+-                self._enabled_chrony = False
+-
+-            if NTP_SERVICE not in ksdata.services.disabled:
+-                ksdata.services.disabled.append(NTP_SERVICE)
+-                self._disabled_chrony = True
+-        # install and use NTP package
+-        else:
+-            if not iutil.service_running(NTP_SERVICE) and \
+-                    can_touch_runtime_system("start NTP service"):
+-                ret = iutil.start_service(NTP_SERVICE)
+-                if ret != 0:
+-                    log.error("Failed to start NTP service")
+-
+-            if not NTP_PACKAGE in ksdata.packages.packageList:
+-                ksdata.packages.packageList.append(NTP_PACKAGE)
+-                self._added_chrony = True
+-
+-            if self._disabled_chrony and NTP_SERVICE in ksdata.services.disabled:
+-                ksdata.services.disabled.remove(NTP_SERVICE)
+-                self._disabled_chrony = False
+-
+-            if not NTP_SERVICE in ksdata.services.enabled and \
+-                    not NTP_SERVICE in ksdata.services.disabled:
+-                ksdata.services.enabled.append(NTP_SERVICE)
+-                self._enabled_chrony = True
++        pass
+ 
+     def execute(self, *args):
+-        # write out timezone configuration
+-        if not timezone.is_valid_timezone(self.timezone):
+-            # this should never happen, but for pity's sake
+-            log.warning("Timezone %s set in kickstart is not valid, falling "
+-                        "back to default (America/New_York).", self.timezone)
+-            self.timezone = "America/New_York"
+-
+-        timezone.write_timezone_config(self, iutil.getSysroot())
+-
+-        # write out NTP configuration (if set) and --nontp is not used
+-        if not self.nontp and self.ntpservers:
+-            chronyd_conf_path = os.path.normpath(iutil.getSysroot() + ntp.NTP_CONFIG_FILE)
+-            pools, servers = ntp.internal_to_pools_and_servers(self.ntpservers)
+-            if os.path.exists(chronyd_conf_path):
+-                log.debug("Modifying installed chrony configuration")
+-                try:
+-                    ntp.save_servers_to_config(pools, servers, conf_file_path=chronyd_conf_path)
+-                except ntp.NTPconfigError as ntperr:
+-                    log.warning("Failed to save NTP configuration: %s", ntperr)
+-            # use chrony conf file from installation environment when
+-            # chrony is not installed (chrony conf file is missing)
+-            else:
+-                log.debug("Creating chrony configuration based on the "
+-                          "configuration from installation environment")
+-                try:
+-                    ntp.save_servers_to_config(pools, servers,
+-                                               conf_file_path=ntp.NTP_CONFIG_FILE,
+-                                               out_file_path=chronyd_conf_path)
+-                except ntp.NTPconfigError as ntperr:
+-                    log.warning("Failed to save NTP configuration without chrony package: %s", ntperr)
++        pass
+ 
+ class User(commands.user.F19_User):
+     def execute(self, storage, ksdata, instClass, users):
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0018-invisible-help-button.patch b/meta-installer/recipes-installer/anaconda/files/0018-invisible-help-button.patch
new file mode 100644
index 0000000..6015dbf
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0018-invisible-help-button.patch
@@ -0,0 +1,32 @@
+From 2ff2e7147f3dc618c6dfda298acc0a57874fdc8a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:10:54 +0800
+Subject: [PATCH 18/65] invisible help button
+
+WRLinux do not support help button, so we should not display it.
+
+Do not display layout indicator neither.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ widgets/src/BaseWindow.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/widgets/src/BaseWindow.c b/widgets/src/BaseWindow.c
+index 6a1e372..8d86cd9 100644
+--- a/widgets/src/BaseWindow.c
++++ b/widgets/src/BaseWindow.c
+@@ -415,8 +415,6 @@ G_GNUC_END_IGNORE_DEPRECATIONS
+     gtk_grid_attach(GTK_GRID(win->priv->nav_area), win->priv->name_label, 0, 0, 1, 1);
+     gtk_grid_attach(GTK_GRID(win->priv->nav_area), win->priv->distro_label, 1, 0, 2, 1);
+     gtk_grid_attach(GTK_GRID(win->priv->nav_area), win->priv->beta_label, 1, 1, 1, 1);
+-    gtk_grid_attach(GTK_GRID(win->priv->nav_area), win->priv->layout_indicator, 1, 2, 1, 1);
+-    gtk_grid_attach(GTK_GRID(win->priv->nav_area), win->priv->help_button, 2, 1, 1, 2);
+ 
+     /* Last thing for the main_box is a revealer for the info bar */
+     win->priv->info_revealer = gtk_revealer_new();
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0019-disable-non-implemented-functions.patch b/meta-installer/recipes-installer/anaconda/files/0019-disable-non-implemented-functions.patch
new file mode 100644
index 0000000..c5bb0b2
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0019-disable-non-implemented-functions.patch
@@ -0,0 +1,41 @@
+From f1767915e3a993d2cdaa0be089bdfa93731a496a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:16:48 +0800
+Subject: [PATCH 19/65] disable non-implemented functions
+
+Only enable implemented gui pages
+- support dnf repository setting
+- support software selection setting
+- support timezone setting
+- support user creation setting
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/hubs/__init__.py | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/pyanaconda/ui/gui/hubs/__init__.py b/pyanaconda/ui/gui/hubs/__init__.py
+index 4982ae7..1822161 100644
+--- a/pyanaconda/ui/gui/hubs/__init__.py
++++ b/pyanaconda/ui/gui/hubs/__init__.py
+@@ -227,7 +227,14 @@ class Hub(GUIObject, common.Hub):
+         self._updateContinue()
+ 
+     def _updateCompleteness(self, spoke, update_continue=True):
+-        spoke.selector.set_sensitive(spoke.sensitive and spoke.ready)
++        log.info("_updateCompleteness %s" % (spoke.mainWidgetName))
++        # It is minimal installation for now, the non-implemented
++        # functions will be disabled.
++        if spoke.mainWidgetName not in ["storageWindow", "passwordWindow", "sourceWindow", "softwareWindow", "datetimeWindow", "userCreationWindow"]:
++            spoke.selector.set_sensitive(False)
++        else:
++            spoke.selector.set_sensitive(spoke.sensitive and spoke.ready)
++
+         spoke.selector.set_property("status", spoke.status)
+         spoke.selector.set_tooltip_markup(escape_markup(spoke.status))
+         spoke.selector.set_incomplete(not spoke.completed and spoke.mandatory)
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0020-disable-geoloc-by-default.patch b/meta-installer/recipes-installer/anaconda/files/0020-disable-geoloc-by-default.patch
new file mode 100644
index 0000000..6baf839
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0020-disable-geoloc-by-default.patch
@@ -0,0 +1,30 @@
+From 23bbe43b72154be12f23523258fd918704ccd570 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:19:58 +0800
+Subject: [PATCH 20/65] disable geoloc by default
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ anaconda.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/anaconda.py b/anaconda.py
+index ad7bf6b..5163fb3 100755
+--- a/anaconda.py
++++ b/anaconda.py
+@@ -695,8 +695,8 @@ if __name__ == "__main__":
+     else:
+         # flags.cmdline.getbool is used as it handles values such as
+         # 0, no, off and also nogeoloc as False
+-        # and other values or geoloc not being present as True
+-        use_geolocation = flags.cmdline.getbool('geoloc', True)
++        # and other values or geoloc not being present as False
++        use_geolocation = flags.cmdline.getbool('geoloc', False)
+ 
+     if use_geolocation:
+         startup_utils.start_geolocation(provider_id=opts.geoloc)
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0021-support-UEFI-boot.patch b/meta-installer/recipes-installer/anaconda/files/0021-support-UEFI-boot.patch
new file mode 100644
index 0000000..4324374
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0021-support-UEFI-boot.patch
@@ -0,0 +1,38 @@
+From ec8da5a284de623253687fbe3d36a8cabcf94696 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:24:37 +0800
+Subject: [PATCH 21/65] support UEFI boot
+
+- tweak grub efi package name based on oe-core
+
+- tweak efi_dir according to oe-core's EFI layout
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 2a91759..50fdac1 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -1846,12 +1846,12 @@ class EFIGRUB1(EFIBase, GRUB):
+ 
+ 
+ class EFIGRUB(EFIBase, GRUB2):
+-    packages = ["grub2-efi", "efibootmgr", "shim"]
++    packages = ["grub-efi", "efibootmgr"]
+     can_dual_boot = False
+     stage2_is_valid_stage1 = False
+     stage2_bootable = False
+ 
+-    _efi_binary = "\\shim.efi"
++    _efi_binary = "\\boot*.efi"
+ 
+     def __init__(self):
+         super(EFIGRUB, self).__init__()
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0022-do-not-verify-ssl-certification-by-default.patch b/meta-installer/recipes-installer/anaconda/files/0022-do-not-verify-ssl-certification-by-default.patch
new file mode 100644
index 0000000..d4e76eb
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0022-do-not-verify-ssl-certification-by-default.patch
@@ -0,0 +1,44 @@
+From 74c2f194cc9599a61fcda50d80b1f611ed9d335c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:28:03 +0800
+Subject: [PATCH 22/65] do not verify ssl certification by default
+
+It is helpful for development that use private certification.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/anaconda_argparse.py | 2 +-
+ pyanaconda/flags.py             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/anaconda_argparse.py b/pyanaconda/anaconda_argparse.py
+index a694021..35c4ed2 100644
+--- a/pyanaconda/anaconda_argparse.py
++++ b/pyanaconda/anaconda_argparse.py
+@@ -446,7 +446,7 @@ def getArgumentParser(version_string, boot_cmdline=None):
+                     help=help_parser.help_text("repo"))
+     ap.add_argument("--stage2", dest="stage2", default=None, metavar="STAGE2_URL",
+                     help=help_parser.help_text("stage2"))
+-    ap.add_argument("--noverifyssl", action="store_true", default=False,
++    ap.add_argument("--noverifyssl", action="store_true", default=True,
+                     help=help_parser.help_text("noverifyssl"))
+     ap.add_argument("--liveinst", action="store_true", default=False,
+                     help=help_parser.help_text("liveinst"))
+diff --git a/pyanaconda/flags.py b/pyanaconda/flags.py
+index 7374a39..37206d0 100644
+--- a/pyanaconda/flags.py
++++ b/pyanaconda/flags.py
+@@ -54,7 +54,7 @@ class Flags(object):
+         self.debug = False
+         self.armPlatform = None
+         self.preexisting_x11 = False
+-        self.noverifyssl = False
++        self.noverifyssl = True
+         self.imageInstall = False
+         self.automatedInstall = False
+         self.dirInstall = False
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0023-tweak-default-nfs-mount-point.patch b/meta-installer/recipes-installer/anaconda/files/0023-tweak-default-nfs-mount-point.patch
new file mode 100644
index 0000000..60b62b2
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0023-tweak-default-nfs-mount-point.patch
@@ -0,0 +1,30 @@
+From b9f0d13df1a467c4eedf11820ffb0e0e3f04feba Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 19 May 2016 22:28:14 -0400
+Subject: [PATCH 23/65] tweak default nfs mount point
+
+Tweak nfs mount point of base repository to "/media/source".
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/constants.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/constants.py b/pyanaconda/constants.py
+index b514bf5..d15767b 100644
+--- a/pyanaconda/constants.py
++++ b/pyanaconda/constants.py
+@@ -57,7 +57,7 @@ DRACUT_REPODIR = MOUNT_DIR + "/Packages"
+ DRACUT_ISODIR = "/run/install/source"
+ ISO_DIR = MOUNT_DIR + "/isodir"
+ IMAGE_DIR = MOUNT_DIR + "/image"
+-INSTALL_TREE = MOUNT_DIR + "/source"
++INSTALL_TREE = "/media/source"
+ BASE_REPO_NAME = "anaconda"
+ 
+ # NOTE: this should be LANG_TERRITORY.CODESET, e.g. en_US.UTF-8
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0024-fix-quoted-empty-string-failed.patch b/meta-installer/recipes-installer/anaconda/files/0024-fix-quoted-empty-string-failed.patch
new file mode 100644
index 0000000..4f48f21
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0024-fix-quoted-empty-string-failed.patch
@@ -0,0 +1,46 @@
+From 7d33e72c8b29e9faf7a3c197431e8b92219b44eb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:34:46 +0800
+Subject: [PATCH 24/65] fix quoted empty string failed
+
+While password or username is a empty string, it failed to
+invoke quote:
+...
+|  File "/usr/lib64/python2.7/site-packages/pyanaconda/iutil.py",
+line 823, in parse_components
+|    quote(self.password) or "")
+|  File "/usr/lib64/python2.7/urllib.py", line 1290, in quote
+|    raise TypeError('None object cannot be quoted')
+...
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/iutil.py | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/pyanaconda/iutil.py b/pyanaconda/iutil.py
+index beaf2b2..cb5ad27 100644
+--- a/pyanaconda/iutil.py
++++ b/pyanaconda/iutil.py
+@@ -925,9 +925,13 @@ class ProxyString(object):
+     def parse_components(self):
+         """ Parse the components of a proxy url into url and noauth_url
+         """
+-        if self.username or self.password:
+-            self.proxy_auth = "%s:%s@" % (quote(self.username or ""),
+-                                          quote(self.password or ""))
++        if self.username and self.password:
++            self.proxy_auth = "%s:%s@" % (quote(self.username) or "",
++                                          quote(self.password) or "")
++        elif self.username and not self.password:
++            self.proxy_auth = "%s:@" % (quote(self.username) or "")
++        elif not self.username and self.password:
++            self.proxy_auth = ":%s@" % (quote(self.password) or "")
+ 
+         self.url = self.protocol + self.proxy_auth + self.host + ":" + self.port
+         self.noauth_url = self.protocol + self.host + ":" + self.port
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0025-do-not-support-ISO-hold-by-hard-drive-partitions.patch b/meta-installer/recipes-installer/anaconda/files/0025-do-not-support-ISO-hold-by-hard-drive-partitions.patch
new file mode 100644
index 0000000..dbce135
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0025-do-not-support-ISO-hold-by-hard-drive-partitions.patch
@@ -0,0 +1,31 @@
+From b40eb535b039d39623b775a483df9cfa8eecdbc4 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 24 May 2016 22:40:21 -0400
+Subject: [PATCH 25/65] do not support ISO hold by hard drive partitions
+
+We do not plan to have hard drive partitions to hold an ISO.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/source.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/pyanaconda/ui/gui/spokes/source.py b/pyanaconda/ui/gui/spokes/source.py
+index 61033a3..b8bd739 100644
+--- a/pyanaconda/ui/gui/spokes/source.py
++++ b/pyanaconda/ui/gui/spokes/source.py
+@@ -810,7 +810,8 @@ class SourceSpoke(NormalSpoke, GUISpokeInputCheckHandler):
+             added = True
+             idx += 1
+ 
+-        # Again, only display these widgets if an HDISO source was found.
++        # Do not support an HDISO source.
++        added = False
+         self._isoBox.set_no_show_all(not added)
+         self._isoBox.set_visible(added)
+         self._isoButton.set_no_show_all(not added)
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0026-fix-cannot-stat-usr-share-gettext-gettext.h.patch b/meta-installer/recipes-installer/anaconda/files/0026-fix-cannot-stat-usr-share-gettext-gettext.h.patch
new file mode 100644
index 0000000..4adbff8
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0026-fix-cannot-stat-usr-share-gettext-gettext.h.patch
@@ -0,0 +1,27 @@
+From fc969fc3eec744fc9a1fbcb3c1b13d7fc1bfb410 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 Jun 2016 23:25:30 -0400
+Subject: [PATCH 26/65] fix cannot stat '/usr/share/gettext/gettext.h'
+
+Tweak location of gettext.h, use sysroots dir to replace host dir.
+
+Upstream-Status: Inappropriate <oe-core specific>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ widgets/autogen.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/widgets/autogen.sh b/widgets/autogen.sh
+index 55ed5de..eb70eb6 100755
+--- a/widgets/autogen.sh
++++ b/widgets/autogen.sh
+@@ -9,4 +9,4 @@ rm -rf autom4te.cache
+ 
+ # Remove the old symlink if present
+ if [ -h src/gettext.h ] ; then rm src/gettext.h ; fi
+-cp -f /usr/share/gettext/gettext.h src
++cp -f ${STAGING_DATADIR_NATIVE}/gettext/gettext.h src
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0027-fix-Wind-River-boot-menu-not-work.patch b/meta-installer/recipes-installer/anaconda/files/0027-fix-Wind-River-boot-menu-not-work.patch
new file mode 100644
index 0000000..0646dac
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0027-fix-Wind-River-boot-menu-not-work.patch
@@ -0,0 +1,35 @@
+From 5f37502599b7a7fdbb5d49725bd1a5da71b79298 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:48:43 +0800
+Subject: [PATCH 27/65] fix "Wind River" boot menu not work
+
+While efi installation finished, and reboot target.
+There is a "Wind River Linux" in bios boot menu
+(not grub menu), this patch to make it work.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 50fdac1..8ad2926 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -1851,7 +1851,10 @@ class EFIGRUB(EFIBase, GRUB2):
+     stage2_is_valid_stage1 = False
+     stage2_bootable = False
+ 
+-    _efi_binary = "\\boot*.efi"
++    if os.uname()[4] == "x86_64":
++        _efi_binary = "\\bootx64.efi"
++    else:
++        _efi_binary = "\\bootia32.efi"
+ 
+     def __init__(self):
+         super(EFIGRUB, self).__init__()
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0028-tweak-bootloader-fs-type.patch b/meta-installer/recipes-installer/anaconda/files/0028-tweak-bootloader-fs-type.patch
new file mode 100644
index 0000000..df77f4b
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0028-tweak-bootloader-fs-type.patch
@@ -0,0 +1,31 @@
+From dd105dcf13c6351a0a35208030ab23ecde07fa95 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:51:26 +0800
+Subject: [PATCH 28/65] tweak bootloader fs type
+
+Use ext2 as default fs of bootloader to workaround grub-probe
+failure while e2fsprogs upgraded to 1.43
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 8ad2926..2c86603 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -1429,7 +1429,7 @@ class GRUB2(GRUB):
+         if productName.startswith("Red Hat "):              # pylint: disable=no-member
+             return ["xfs", "ext4", "ext3", "ext2", "btrfs"]
+         else:
+-            return ["ext4", "ext3", "ext2", "btrfs", "xfs"]
++            return ["ext2", "ext3", "ext4", "btrfs", "xfs"]
+ 
+     #
+     # grub-related conveniences
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0029-support-timezone-setting.patch b/meta-installer/recipes-installer/anaconda/files/0029-support-timezone-setting.patch
new file mode 100644
index 0000000..ebaf8fb
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0029-support-timezone-setting.patch
@@ -0,0 +1,95 @@
+From e172d303503c66502156fcb95236d1eef637de3e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 14:55:11 +0800
+Subject: [PATCH] support timezone setting
+
+- If selected timezone does not exist in target,
+  try to make a copy from host
+
+- Drop unused /etc/adjtime (redhat specific),
+  use /etc/localtime to replace (oe-core specific).
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/kickstart.py |  9 ++++++++-
+ pyanaconda/timezone.py  | 28 ++++++----------------------
+ 2 files changed, 14 insertions(+), 23 deletions(-)
+
+diff --git a/pyanaconda/kickstart.py b/pyanaconda/kickstart.py
+index 2210845..eb150c4 100644
+--- a/pyanaconda/kickstart.py
++++ b/pyanaconda/kickstart.py
+@@ -1660,7 +1660,14 @@ class Timezone(commands.timezone.F25_Timezone):
+         pass
+ 
+     def execute(self, *args):
+-        pass
++        # write out timezone configuration
++        if not timezone.is_valid_timezone(self.timezone):
++            # this should never happen, but for pity's sake
++            log.warning("Timezone %s set in kickstart is not valid, falling "
++                        "back to default (America/New_York).", self.timezone)
++            self.timezone = "America/New_York"
++
++        timezone.write_timezone_config(self, iutil.getSysroot())
+ 
+ class User(commands.user.F19_User):
+     def execute(self, storage, ksdata, instClass, users):
+diff --git a/pyanaconda/timezone.py b/pyanaconda/timezone.py
+index c9990d2..21b1ec1 100644
+--- a/pyanaconda/timezone.py
++++ b/pyanaconda/timezone.py
+@@ -23,6 +23,7 @@ configuration, valid timezones recognition etc.
+ """
+ 
+ import os
++import shutil
+ import pytz
+ import langtable
+ from collections import OrderedDict
+@@ -101,6 +102,9 @@ def write_timezone_config(timezone, root):
+     relative_path = os.path.normpath("../" + tz_file)
+     link_path = os.path.normpath(root + "/etc/localtime")
+ 
++    if not os.access(rooted_tz_file, os.R_OK) and os.access(tz_file, os.R_OK):
++        shutil.copyfile(tz_file, rooted_tz_file)
++
+     if not os.access(rooted_tz_file, os.R_OK):
+         log.error("Timezone to be linked (%s) doesn't exist", rooted_tz_file)
+     else:
+@@ -116,28 +120,8 @@ def write_timezone_config(timezone, root):
+             log.error("Error when symlinking timezone (from %s): %s",
+                       rooted_tz_file, oserr.strerror)
+ 
+-    if arch.is_s390():
+-        # there is no HW clock on s390(x)
+-        return
+-
+-    try:
+-        fobj = open(os.path.normpath(root + "/etc/adjtime"), "r")
+-        lines = fobj.readlines()
+-        fobj.close()
+-    except IOError:
+-        lines = ["0.0 0 0.0\n", "0\n"]
+-
+-    try:
+-        with open(os.path.normpath(root + "/etc/adjtime"), "w") as fobj:
+-            fobj.write(lines[0])
+-            fobj.write(lines[1])
+-            if timezone.isUtc:
+-                fobj.write("UTC\n")
+-            else:
+-                fobj.write("LOCAL\n")
+-    except IOError as ioerr:
+-        msg = "Error while writing /etc/adjtime file: %s" % ioerr.strerror
+-        raise TimezoneConfigError(msg)
++    with open(root + "/etc/timezone", "w") as fobj:
++        fobj.write('%s\n' % timezone.timezone)
+ 
+ def save_hw_clock(timezone):
+     """
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0030-disable-ntp-support.patch b/meta-installer/recipes-installer/anaconda/files/0030-disable-ntp-support.patch
new file mode 100644
index 0000000..be476b7
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0030-disable-ntp-support.patch
@@ -0,0 +1,230 @@
+From 2b0891fd926e9284bd3fed3968ec8efbc7b36cc4 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 15:01:21 +0800
+Subject: [PATCH 30/65] disable ntp support
+
+The upstream RHEL7 use chrony.service to support ntp,
+it did not exist in oe-core, so remove it.
+
+Do not support NTP, here are the reasons:
+- For systemd based, it already had NTP supported,
+  another ntp will cause confliction.
+
+- We also need to consider the situation of sysvinit
+  based system, it requires a ntp package to be
+  installed.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/datetime_spoke.glade | 74 ------------------------
+ pyanaconda/ui/gui/spokes/datetime_spoke.py    | 82 ---------------------------
+ 2 files changed, 156 deletions(-)
+
+diff --git a/pyanaconda/ui/gui/spokes/datetime_spoke.glade b/pyanaconda/ui/gui/spokes/datetime_spoke.glade
+index 37c7c6e..875cfea 100644
+--- a/pyanaconda/ui/gui/spokes/datetime_spoke.glade
++++ b/pyanaconda/ui/gui/spokes/datetime_spoke.glade
+@@ -460,80 +460,6 @@
+                                 <property name="position">3</property>
+                               </packing>
+                             </child>
+-                            <child>
+-                              <object class="GtkAlignment" id="alignment4">
+-                                <property name="visible">True</property>
+-                                <property name="can_focus">False</property>
+-                                <property name="xalign">1</property>
+-                                <property name="xscale">0.20000000298023224</property>
+-                                <property name="right_padding">24</property>
+-                                <child>
+-                                  <object class="GtkBox" id="box6">
+-                                    <property name="visible">True</property>
+-                                    <property name="can_focus">False</property>
+-                                    <property name="halign">end</property>
+-                                    <child>
+-                                      <object class="GtkLabel" id="networkTimeLabel">
+-                                        <property name="visible">True</property>
+-                                        <property name="can_focus">False</property>
+-                                        <property name="label" translatable="yes" context="GUI|Date and Time">_Network Time</property>
+-                                        <property name="use_underline">True</property>
+-                                        <property name="mnemonic_widget">networkTimeSwitch</property>
+-                                      </object>
+-                                      <packing>
+-                                        <property name="expand">False</property>
+-                                        <property name="fill">True</property>
+-                                        <property name="padding">3</property>
+-                                        <property name="position">0</property>
+-                                      </packing>
+-                                    </child>
+-                                    <child>
+-                                      <object class="GtkSwitch" id="networkTimeSwitch">
+-                                        <property name="visible">True</property>
+-                                        <property name="can_focus">True</property>
+-                                        <signal name="notify::active" handler="on_ntp_switched" swapped="no"/>
+-                                        <child internal-child="accessible">
+-                                          <object class="AtkObject" id="networkTimeSwitch-atkobject">
+-                                            <property name="AtkObject::accessible-name" translatable="yes">Use Network Time</property>
+-                                          </object>
+-                                        </child>
+-                                      </object>
+-                                      <packing>
+-                                        <property name="expand">False</property>
+-                                        <property name="fill">True</property>
+-                                        <property name="padding">1</property>
+-                                        <property name="position">1</property>
+-                                      </packing>
+-                                    </child>
+-                                    <child>
+-                                      <object class="GtkButton" id="ntpConfigButton">
+-                                        <property name="visible">True</property>
+-                                        <property name="can_focus">True</property>
+-                                        <property name="receives_default">True</property>
+-                                        <property name="image">configImage</property>
+-                                        <signal name="clicked" handler="on_ntp_config_clicked" swapped="no"/>
+-                                        <child internal-child="accessible">
+-                                          <object class="AtkObject" id="ntpConfigButton-atkobject">
+-                                            <property name="AtkObject::accessible-name" translatable="yes">Configure NTP</property>
+-                                          </object>
+-                                        </child>
+-                                      </object>
+-                                      <packing>
+-                                        <property name="expand">False</property>
+-                                        <property name="fill">True</property>
+-                                        <property name="padding">1</property>
+-                                        <property name="position">2</property>
+-                                      </packing>
+-                                    </child>
+-                                  </object>
+-                                </child>
+-                              </object>
+-                              <packing>
+-                                <property name="expand">True</property>
+-                                <property name="fill">True</property>
+-                                <property name="position">4</property>
+-                              </packing>
+-                            </child>
+                           </object>
+                         </child>
+                       </object>
+diff --git a/pyanaconda/ui/gui/spokes/datetime_spoke.py b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+index c3eedbc..ecf32f7 100644
+--- a/pyanaconda/ui/gui/spokes/datetime_spoke.py
++++ b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+@@ -490,8 +490,6 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+         self._year_format, suffix = formats[widgets.index(year_box)]
+         year_label.set_text(suffix)
+ 
+-        self._ntpSwitch = self.builder.get_object("networkTimeSwitch")
+-
+         self._regions_zones = get_all_regions_and_timezones()
+ 
+         # Set the initial sensitivity of the AM/PM toggle based on the time-type selected
+@@ -500,9 +498,6 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+         if not flags.can_touch_runtime_system("modify system time and date"):
+             self._set_date_time_setting_sensitive(False)
+ 
+-        self._config_dialog = NTPconfigDialog(self.data)
+-        self._config_dialog.initialize()
+-
+         threadMgr.add(AnacondaThread(name=constants.THREAD_DATE_TIME,
+                                      target=self._initialize))
+ 
+@@ -587,8 +582,6 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+             self.data.timezone.seen = False
+             self._kickstarted = False
+ 
+-        self.data.timezone.nontp = not self._ntpSwitch.get_active()
+-
+     def execute(self):
+         if self._update_datetime_timer_id is not None:
+             GLib.source_remove(self._update_datetime_timer_id)
+@@ -623,20 +616,6 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+ 
+         self._update_datetime()
+ 
+-        has_active_network = nm.nm_is_connected()
+-        if not has_active_network:
+-            self._show_no_network_warning()
+-        else:
+-            self.clear_info()
+-            gtk_call_once(self._config_dialog.refresh_servers_state)
+-
+-        if flags.can_touch_runtime_system("get NTP service state"):
+-            ntp_working = has_active_network and iutil.service_running(NTP_SERVICE)
+-        else:
+-            ntp_working = not self.data.timezone.nontp
+-
+-        self._ntpSwitch.set_active(ntp_working)
+-
+     @gtk_action_wait
+     def _set_timezone(self, timezone):
+         """
+@@ -1099,64 +1078,3 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+     def _show_no_ntp_server_warning(self):
+         self.set_warning(_("You have no working NTP server configured"))
+ 
+-    def on_ntp_switched(self, switch, *args):
+-        if switch.get_active():
+-            #turned ON
+-            if not flags.can_touch_runtime_system("start NTP service"):
+-                #cannot touch runtime system, not much to do here
+-                return
+-
+-            if not nm.nm_is_connected():
+-                self._show_no_network_warning()
+-                switch.set_active(False)
+-                return
+-            else:
+-                self.clear_info()
+-
+-                working_server = self._config_dialog.working_server
+-                if working_server is None:
+-                    self._show_no_ntp_server_warning()
+-                else:
+-                    #we need a one-time sync here, because chronyd would not change
+-                    #the time as drastically as we need
+-                    ntp.one_time_sync_async(working_server)
+-
+-            ret = iutil.start_service(NTP_SERVICE)
+-            self._set_date_time_setting_sensitive(False)
+-
+-            #if starting chronyd failed and chronyd is not running,
+-            #set switch back to OFF
+-            if (ret != 0) and not iutil.service_running(NTP_SERVICE):
+-                switch.set_active(False)
+-
+-        else:
+-            #turned OFF
+-            if not flags.can_touch_runtime_system("stop NTP service"):
+-                #cannot touch runtime system, nothing to do here
+-                return
+-
+-            self._set_date_time_setting_sensitive(True)
+-            ret = iutil.stop_service(NTP_SERVICE)
+-
+-            #if stopping chronyd failed and chronyd is running,
+-            #set switch back to ON
+-            if (ret != 0) and iutil.service_running(NTP_SERVICE):
+-                switch.set_active(True)
+-
+-            self.clear_info()
+-
+-    def on_ntp_config_clicked(self, *args):
+-        self._config_dialog.refresh()
+-
+-        with self.main_window.enlightbox(self._config_dialog.window):
+-            response = self._config_dialog.run()
+-
+-        if response == 1:
+-            pools, servers = self._config_dialog.pools_servers
+-            self.data.timezone.ntpservers = ntp.pools_servers_to_internal(pools, servers)
+-
+-            if self._config_dialog.working_server is None:
+-                self._show_no_ntp_server_warning()
+-            else:
+-                self.clear_info()
+-
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0031-do-not-support-manually-set-time.patch b/meta-installer/recipes-installer/anaconda/files/0031-do-not-support-manually-set-time.patch
new file mode 100644
index 0000000..2f8a29f
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0031-do-not-support-manually-set-time.patch
@@ -0,0 +1,32 @@
+From 265adffc84235b9cbc0ea68e576e4e8afe2e3d3f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 31 Mar 2017 13:40:00 +0800
+Subject: [PATCH 31/65] do not support manually set time
+
+Since NTP setting is not supported in anaconda, it does not
+support set time manually neither.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/datetime_spoke.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/pyanaconda/ui/gui/spokes/datetime_spoke.py b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+index ecf32f7..4cc9f60 100644
+--- a/pyanaconda/ui/gui/spokes/datetime_spoke.py
++++ b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+@@ -541,6 +541,9 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+                              _("Restoring hardware time..."))
+             threadMgr.wait(constants.THREAD_TIME_INIT)
+ 
++        # Do not support manually set time
++        self._set_date_time_setting_sensitive(False)
++
+         hubQ.send_ready(self.__class__.__name__, False)
+ 
+         # report that we are done
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0032-support-user-account-creation.patch b/meta-installer/recipes-installer/anaconda/files/0032-support-user-account-creation.patch
new file mode 100644
index 0000000..af46b58
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0032-support-user-account-creation.patch
@@ -0,0 +1,73 @@
+From fdad67788ebc18fcf27e33504c4bcaa0e6cd59fc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 16:08:04 +0800
+Subject: [PATCH 32/65] support user account creation
+
+- Do not support user accout advanced setting
+
+- Add main for debugging test
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/user.py |  7 +------
+ pyanaconda/users.py              | 13 +++++++++++++
+ 2 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/pyanaconda/ui/gui/spokes/user.py b/pyanaconda/ui/gui/spokes/user.py
+index 1dae92b..85c3a16 100644
+--- a/pyanaconda/ui/gui/spokes/user.py
++++ b/pyanaconda/ui/gui/spokes/user.py
+@@ -263,6 +263,7 @@ class UserSpoke(FirstbootSpokeMixIn, NormalSpoke, GUISpokeInputCheckHandler):
+         self.admin = self.builder.get_object("c_admin")
+         self.usepassword = self.builder.get_object("c_usepassword")
+         self.b_advanced = self.builder.get_object("b_advanced")
++        self.b_advanced.set_sensitive(False)
+ 
+         # set initial state of the input field
+         self.input_enabled = self.usepassword.get_active()
+@@ -458,12 +459,6 @@ class UserSpoke(FirstbootSpokeMixIn, NormalSpoke, GUISpokeInputCheckHandler):
+     def username_changed(self, editable, data=None):
+         """Called by Gtk on all username changes."""
+ 
+-        # Disable the advanced user dialog button when no username is set
+-        if editable.get_text():
+-            self.b_advanced.set_sensitive(True)
+-        else:
+-            self.b_advanced.set_sensitive(False)
+-
+         # Re-run the password checks against the new username
+         self.pw.emit("changed")
+         self.confirm.emit("changed")
+diff --git a/pyanaconda/users.py b/pyanaconda/users.py
+index 554507e..e25536f 100644
+--- a/pyanaconda/users.py
++++ b/pyanaconda/users.py
+@@ -260,6 +260,7 @@ class Users(object):
+                           homedir will be interpreted relative to this. Defaults
+                           to iutil.getSysroot().
+         """
++        log.info("kwargs %s" % kwargs)
+         root = kwargs.get("root", iutil.getSysroot())
+ 
+         if self._getgrnam(group_name, root):
+@@ -491,3 +492,15 @@ class Users(object):
+         if not authfile_existed:
+             os.chown(authfile, int(uid), int(gid))
+             iutil.execWithRedirect("restorecon", ["-r", sshdir])
++
++# For testing
++if __name__ == "__main__":
++    import logging
++    from pyanaconda import anaconda_log
++    anaconda_log.init()
++    anaconda_log.logger.setupVirtio()
++
++    log = logging.getLogger("anaconda")
++
++    users = Users()
++    users.createUser("test", password="123456", shell="/bin/bash", groups=["wheel"])
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0033-detect-existence-of-Xorg.patch b/meta-installer/recipes-installer/anaconda/files/0033-detect-existence-of-Xorg.patch
new file mode 100644
index 0000000..88bf33b
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0033-detect-existence-of-Xorg.patch
@@ -0,0 +1,45 @@
+From 7d54039da9bb6001a1effbb5b0892448d9397949 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 16:15:02 +0800
+Subject: [PATCH 33/65] detect existence of Xorg
+
+Detect the existence of Xorg before start it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/display.py | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/pyanaconda/display.py b/pyanaconda/display.py
+index fd255a4..d3e599b 100644
+--- a/pyanaconda/display.py
++++ b/pyanaconda/display.py
+@@ -125,9 +125,23 @@ def check_vnc_can_be_started(anaconda):
+ 
+ # X11
+ 
++def has_x11():
++    exist = True
++
++    try:
++        subprocess.check_output("ps -A | grep Xorg -q", shell=True)
++    except subprocess.CalledProcessError as e:
++        exist = False
++
++    return exist
++
+ def start_x11():
+     """Start the X server for the Anaconda GUI."""
+ 
++    if has_x11():
++        log.info("Xorg already existed, no need to start another one")
++        return
++
+     # Start Xorg and wait for it become ready
+     iutil.startX(["Xorg", "-br", "-logfile", "/tmp/X.log",
+                   ":%s" % constants.X_DISPLAY_NUMBER, "vt7", "-s", "1440", "-ac",
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0034-fix-write-network-conf-failed-while-liveinst.patch b/meta-installer/recipes-installer/anaconda/files/0034-fix-write-network-conf-failed-while-liveinst.patch
new file mode 100644
index 0000000..465829a
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0034-fix-write-network-conf-failed-while-liveinst.patch
@@ -0,0 +1,40 @@
+From 16940d79490ef191cbabf0bbfc8ff7e9416e7425 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 19 Jul 2016 04:36:06 -0400
+Subject: [PATCH 34/65] fix write network conf failed while liveinst
+
+While liveinst, the network conf writing will overwrite copy
+"/etc/resolv.conf" to "/mnt/sysimage/etc/resolv.conf". But in
+wrlinux, the "/etc/resolv.conf" and "/mnt/sysimage/etc/resolv.conf"
+are the same file which is a symlink to /run/resolve.conf.
+
+Test same file before copy.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/network.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/pyanaconda/network.py b/pyanaconda/network.py
+index c3f0dd1..36676ad 100644
+--- a/pyanaconda/network.py
++++ b/pyanaconda/network.py
+@@ -1198,6 +1198,13 @@ def copyFileToPath(fileName, destPath='', overwrite=False):
+         return False
+     if not os.path.isdir(os.path.dirname(destfile)):
+         iutil.mkdirChain(os.path.dirname(destfile))
++
++    # Same file test
++    if os.path.exists(fileName) and os.path.exists(destfile) and \
++       os.stat(fileName).st_ino == os.stat(destfile).st_ino:
++        log.info("%s and %s are the same file" % (fileName, destfile))
++        return False
++
+     shutil.copy(fileName, destfile)
+     return True
+ 
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0035-revert-commits-to-support-reboot-for-live-installs.patch b/meta-installer/recipes-installer/anaconda/files/0035-revert-commits-to-support-reboot-for-live-installs.patch
new file mode 100644
index 0000000..4d34e7f
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0035-revert-commits-to-support-reboot-for-live-installs.patch
@@ -0,0 +1,72 @@
+From 8c62794da3c3703a0712676c7961ac1686253360 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 16:31:46 +0800
+Subject: [PATCH 35/65] revert commits to support reboot for live installs
+
+This reverts commit ab9d579a27cb9f102b5ea9e215c70334dc5e88fc.
+
+The upstream use a separate way to reboot for live install,
+because they need eject live CD after installation finished.
+(They add a simple wrapper around anaconda to kick off an install
+from a live CD)
+
+But wrlinux do not need it, and could not eject installation live CD
+neither. We mount rootfs to live CD (/dev/sr0), and it is hard to umount
+rootfs before eject.
+
+And we could not use upstream's wrapper, it is gnome desktop related
+and not proper for wrlinux.
+
+It also partly revert the following commit to let reboot work for live
+installs.
+-------------
+commit 346181e9f82f6efb01e545394c2850d3bb657662
+Author: Chris Lumens <clumens@redhat.com>
+Date:   Thu Sep 6 11:25:44 2012 -0400
+
+    Quitting the live installer shouldn't reboot the system (#854904).
+-------------
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ anaconda.py                        | 3 +--
+ pyanaconda/ui/gui/hubs/progress.py | 7 -------
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/anaconda.py b/anaconda.py
+index 5163fb3..91d3fc0 100755
+--- a/anaconda.py
++++ b/anaconda.py
+@@ -92,8 +92,7 @@ def exitHandler(rebootData, storage):
+     if pidfile:
+         pidfile.close()
+ 
+-    if not flags.imageInstall and not flags.livecdInstall \
+-       and not flags.dirInstall:
++    if not flags.imageInstall and not flags.dirInstall:
+         from pykickstart.constants import KS_SHUTDOWN, KS_WAIT
+ 
+         if flags.eject or rebootData.eject:
+diff --git a/pyanaconda/ui/gui/hubs/progress.py b/pyanaconda/ui/gui/hubs/progress.py
+index 34f1e53..75e8f18 100644
+--- a/pyanaconda/ui/gui/hubs/progress.py
++++ b/pyanaconda/ui/gui/hubs/progress.py
+@@ -209,13 +209,6 @@ class ProgressHub(Hub):
+     def initialize(self):
+         Hub.initialize(self)
+ 
+-        if flags.livecdInstall:
+-            continueText = self.builder.get_object("rebootLabel")
+-            continueText.set_text(_("%s is now successfully installed on your system and ready "
+-                                    "for you to use!  When you are ready, reboot your system to start using it!"))
+-            continueText.set_line_wrap(True)
+-            self.window.get_continue_button().set_label(C_("GUI|Progress", "_Quit"))
+-
+         self._progressBar = self.builder.get_object("progressBar")
+         self._progressLabel = self.builder.get_object("progressLabel")
+         self._progressNotebook = self.builder.get_object("progressNotebook")
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0036-text-repository-setting-do-not-support-local-ISO-fil.patch b/meta-installer/recipes-installer/anaconda/files/0036-text-repository-setting-do-not-support-local-ISO-fil.patch
new file mode 100644
index 0000000..34d037f
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0036-text-repository-setting-do-not-support-local-ISO-fil.patch
@@ -0,0 +1,72 @@
+From d6ecdb270fc89995fde6f0035bff0396806f6673 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 16:36:37 +0800
+Subject: [PATCH 36/65] text repository setting: do not support local ISO file
+
+WRLinux does not support repository in local ISO file
+(an ISO in HDD), so remove it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/tui/spokes/source.py | 18 +++++-------------
+ 1 file changed, 5 insertions(+), 13 deletions(-)
+
+diff --git a/pyanaconda/ui/tui/spokes/source.py b/pyanaconda/ui/tui/spokes/source.py
+index f1037f7..d794150 100644
+--- a/pyanaconda/ui/tui/spokes/source.py
++++ b/pyanaconda/ui/tui/spokes/source.py
+@@ -136,11 +136,12 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+             return not self._error and self.ready and (self.data.method.method or self.payload.baseRepo)
+ 
+     def refresh(self, args=None):
++        log.info("refresh args %s" % (args))
+         EditTUISpoke.refresh(self, args)
+ 
+         threadMgr.wait(THREAD_PAYLOAD)
+ 
+-        _methods = [_("CD/DVD"), _("local ISO file"), _("Network")]
++        _methods = [_("CD/DVD"), _("Network")]
+ 
+         if self.data.method.method == "harddrive" and \
+            get_mount_device(DRACUT_ISODIR) == get_mount_device(DRACUT_REPODIR):
+@@ -148,7 +149,7 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+             self._window += [TextWidget(message), ""]
+             return True
+ 
+-        if args == 3:
++        if args == 2:
+             text = [TextWidget(_(p)) for p in self._protocols]
+         else:
+             self._window += [TextWidget(_("Choose an installation source type."))]
+@@ -174,7 +175,8 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+         except ValueError:
+             return super(SourceSpoke, self).input(args, key)
+ 
+-        if args == 3:
++        log.info("input args %s, key %s" % (args, key))
++        if args == 2:
+             # network install
+             self._selection = num
+             if self._selection == 1:
+@@ -202,16 +204,6 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+                 self.apply()
+                 self.close()
+                 return INPUT_PROCESSED
+-        elif num == 2:
+-            # local ISO file (HDD ISO)
+-            self._selection = num
+-            newspoke = SelectDeviceSpoke(self.app, self.data,
+-                    self.storage, self.payload,
+-                    self.instclass)
+-            self.app.switch_screen_modal(newspoke)
+-            self.apply()
+-            self.close()
+-            return INPUT_PROCESSED
+         else:
+             # mounted ISO
+             if num == 1:
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0037-text-repository-setting-support-http-proxy.patch b/meta-installer/recipes-installer/anaconda/files/0037-text-repository-setting-support-http-proxy.patch
new file mode 100644
index 0000000..7efeff8
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0037-text-repository-setting-support-http-proxy.patch
@@ -0,0 +1,95 @@
+From e943c724b32390b14bd353e53a0539527180ee75 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 16:45:48 +0800
+Subject: [PATCH 37/65] text repository setting: support http proxy
+
+For text mode, it supports:
+- http repo + http proxy;
+- https repo + http proxy;
+- ftp repo + http proxy;
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/helpers.py           |  9 ++++++++-
+ pyanaconda/ui/tui/spokes/source.py | 15 +++++++++++++--
+ 2 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/pyanaconda/ui/helpers.py b/pyanaconda/ui/helpers.py
+index ee94f63..e3f5e3a 100644
+--- a/pyanaconda/ui/helpers.py
++++ b/pyanaconda/ui/helpers.py
+@@ -104,6 +104,8 @@ class SourceSwitchHandler(object, metaclass=ABCMeta):
+     and cleanup any previous method set.
+     """
+ 
++    log = logging.getLogger("anaconda")
++
+     @abstractproperty
+     def data(self):
+         pass
+@@ -171,7 +173,7 @@ class SourceSwitchHandler(object, metaclass=ABCMeta):
+         # as we already made the device protected when
+         # switching to it, we don't need to protect it here
+ 
+-    def set_source_url(self, url=None):
++    def set_source_url(self, url=None, proxy=None):
+         """ Switch to install source specified by URL """
+         # clean any old HDD ISO sources
+         self._clean_hdd_iso()
+@@ -179,6 +181,11 @@ class SourceSwitchHandler(object, metaclass=ABCMeta):
+         self.data.method.method = "url"
+         if url is not None:
+             self.data.method.url = url
++            self.log.info("url: %s" % url)
++
++        if proxy is not None:
++            self.data.method.proxy = proxy
++            self.log.info("proxy: %s" % proxy)
+ 
+     def set_source_nfs(self, opts=None):
+         """ Switch to NFS install source """
+diff --git a/pyanaconda/ui/tui/spokes/source.py b/pyanaconda/ui/tui/spokes/source.py
+index d794150..9e51147 100644
+--- a/pyanaconda/ui/tui/spokes/source.py
++++ b/pyanaconda/ui/tui/spokes/source.py
+@@ -244,7 +244,8 @@ class SpecifyRepoSpoke(EditTUISpoke, SourceSwitchHandler):
+     category = SoftwareCategory
+ 
+     edit_fields = [
+-        Entry(N_("Repo URL"), "url", re.compile(".*$"), True)
++        Entry(N_("Repo URL"), "url", re.compile(".*$"), True),
++        Entry(N_("Repo Proxy"), "proxy", re.compile(".*$"), True)
+         ]
+ 
+     def __init__(self, app, data, storage, payload, instclass, selection):
+@@ -263,6 +264,7 @@ class SpecifyRepoSpoke(EditTUISpoke, SourceSwitchHandler):
+ 
+     def apply(self):
+         """ Apply all of our changes. """
++        log.info("apply args %s" % self.args)
+         url = None
+         if self.selection == 2 and not self.args.url.startswith("http://"):
+             url = "http://" + self.args.url
+@@ -274,7 +276,16 @@ class SpecifyRepoSpoke(EditTUISpoke, SourceSwitchHandler):
+             # protocol either unknown or entry already starts with a protocol
+             # specification
+             url = self.args.url
+-        self.set_source_url(url)
++
++        # Proxy only support http protocal
++        proxy = None
++        if self.args.proxy.strip() != '':
++            if not self.args.proxy.startswith("http://"):
++                proxy = "http://" + self.args.proxy
++            else:
++                proxy = self.args.proxy
++
++        self.set_source_url(url, proxy)
+ 
+ class SpecifyNFSRepoSpoke(EditTUISpoke, SourceSwitchHandler):
+     """ Specify server and mount opts here if NFS selected. """
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0038-set-keyboard-xlayouts-with-us-by-default.patch b/meta-installer/recipes-installer/anaconda/files/0038-set-keyboard-xlayouts-with-us-by-default.patch
new file mode 100644
index 0000000..4acc174
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0038-set-keyboard-xlayouts-with-us-by-default.patch
@@ -0,0 +1,50 @@
+From 3008184173cf6fb063f4c2bee3443728477517a6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 May 2017 16:49:11 +0800
+Subject: [PATCH 38/65] set keyboard xlayouts with 'us' by default
+
+Previously only graphic set keyboard xlayouts with 'us' by default,
+and text mode did not have the setting and it caused 100% cpu when
+loadkey invoked. The hung of loadkey also caused reboot failed.
+
+The setting in default ks works on both of graphic and text.
+
+Revert the following fix:
+---------
+commit ec53ff6e4a7a06d190925a482371031a2f48509d
+Author: Martin Kolman <mkolman@redhat.com>
+Date:   Thu Jan 19 18:37:29 2017 +0100
+
+    Use correct default password quality value
+---------
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ data/interactive-defaults.ks | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/data/interactive-defaults.ks b/data/interactive-defaults.ks
+index a5f89c2..b6a5e76 100644
+--- a/data/interactive-defaults.ks
++++ b/data/interactive-defaults.ks
+@@ -2,14 +2,5 @@
+ # This is not loaded if a kickstart file is provided on the command line.
+ auth --enableshadow --passalgo=sha512
+ firstboot --enable
++keyboard --xlayouts='us'
+ 
+-%anaconda
+-# Default password policies
+-pwpolicy root --notstrict --minlen=6 --minquality=1 --nochanges --emptyok
+-pwpolicy user --notstrict --minlen=6 --minquality=1 --nochanges --emptyok
+-pwpolicy luks --notstrict --minlen=6 --minquality=1 --nochanges --emptyok
+-# NOTE: This applies only to *fully* interactive installations, partial kickstart
+-#       installations use defaults specified in pyanaconda/pwpolicy.py.
+-#       Automated kickstart installs simply ignore the password policy as the policy
+-#       only applies to the UI, not for passwords specified in kickstart.
+-%end
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0039-text-do-not-support-network-setting-for-now.patch b/meta-installer/recipes-installer/anaconda/files/0039-text-do-not-support-network-setting-for-now.patch
new file mode 100644
index 0000000..b223e1b
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0039-text-do-not-support-network-setting-for-now.patch
@@ -0,0 +1,33 @@
+From f282390815a67d876044ba6ec9803bcc4d413f22 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 13:34:20 +0800
+Subject: [PATCH 39/65] text: do not support network setting for now
+
+We have a long term plan to support it, but not now.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/tui/spokes/network.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/pyanaconda/ui/tui/spokes/network.py b/pyanaconda/ui/tui/spokes/network.py
+index 0bdee5d..7af5da3 100644
+--- a/pyanaconda/ui/tui/spokes/network.py
++++ b/pyanaconda/ui/tui/spokes/network.py
+@@ -58,6 +58,11 @@ class NetworkSpoke(FirstbootSpokeMixIn, EditTUISpoke):
+         self.errors = []
+         self._apply = False
+ 
++    @classmethod
++    def should_run(cls, environment, data):
++        # Do not support network config for now
++        return False
++
+     def initialize(self):
+         self.initialize_start()
+         self._load_new_devices()
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0040-tweak-boot-storage-sanity-check.patch b/meta-installer/recipes-installer/anaconda/files/0040-tweak-boot-storage-sanity-check.patch
new file mode 100644
index 0000000..4b6abb0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0040-tweak-boot-storage-sanity-check.patch
@@ -0,0 +1,31 @@
+From f72aa915e7a7c510587447725af40ed1050422a2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 13:48:00 +0800
+Subject: [PATCH 40/65] tweak /boot storage sanity check
+
+Since kernel-vmlinux (200MB+) was installed to /boot,
+tweak /boot storage sanity check from 200MB to 300MB.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/storage_utils.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/storage_utils.py b/pyanaconda/storage_utils.py
+index ca49f86..23160bc 100644
+--- a/pyanaconda/storage_utils.py
++++ b/pyanaconda/storage_utils.py
+@@ -642,7 +642,7 @@ class StorageChecker(object):
+             '/tmp': Size("50 MiB"),
+             '/var': Size("384 MiB"),
+             '/home': Size("100 MiB"),
+-            '/boot': Size("200 MiB")
++            '/boot': Size("300 MiB")
+         })
+ 
+         self.add_new_constraint(STORAGE_MUST_BE_ON_LINUXFS, {
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0041-kickstart-do-not-support-network-configuration.patch b/meta-installer/recipes-installer/anaconda/files/0041-kickstart-do-not-support-network-configuration.patch
new file mode 100644
index 0000000..d4c73d8
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0041-kickstart-do-not-support-network-configuration.patch
@@ -0,0 +1,29 @@
+From a3bf304f1016a39249d0882644d0365be93bd18b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 13:50:15 +0800
+Subject: [PATCH 41/65] kickstart do not support network configuration
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/install.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/pyanaconda/install.py b/pyanaconda/install.py
+index 929b89d..555d7b0 100644
+--- a/pyanaconda/install.py
++++ b/pyanaconda/install.py
+@@ -72,6 +72,9 @@ def _writeKS(ksdata):
+     if ksdata.method.method == "url" and not ksdata.method.url.startswith("https://"):
+         ksdata.method.noverifyssl = False
+ 
++    # Do not support network configuration
++    ksdata.network.network = []
++
+     # Make it so only root can read - could have passwords
+     with iutil.open_with_perm(path, "w", 0o600) as f:
+         f.write(str(ksdata))
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0042-support-to-get-kickstart-from-network.patch b/meta-installer/recipes-installer/anaconda/files/0042-support-to-get-kickstart-from-network.patch
new file mode 100644
index 0000000..bc9bca7
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0042-support-to-get-kickstart-from-network.patch
@@ -0,0 +1,48 @@
+From 17e60df24fcf518fd9701e45ad675ce915644a10 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 13:55:50 +0800
+Subject: [PATCH 42/65] support to get kickstart from network
+
+We support http/https/ftp protocol to get kickstart file
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/startup_utils.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/startup_utils.py b/pyanaconda/startup_utils.py
+index cf60aeb..a54d1e2 100644
+--- a/pyanaconda/startup_utils.py
++++ b/pyanaconda/startup_utils.py
+@@ -420,7 +420,11 @@ def parse_kickstart(options, addon_paths):
+     """
+     ksdata = None
+     if options.ksfile and not options.liveinst:
+-        if not os.path.exists(options.ksfile):
++        if not os.path.exists(options.ksfile) and \
++           not options.ksfile.startswith("http://") and \
++           not options.ksfile.startswith("https://") and \
++           not options.ksfile.startswith("ftp://"):
++
+             stdout_log.error("Kickstart file %s is missing.", options.ksfile)
+             iutil.ipmi_report(constants.IPMI_ABORTED)
+             sys.exit(1)
+@@ -438,8 +442,12 @@ def parse_kickstart(options, addon_paths):
+         ks_files = ["/tmp/updates/interactive-defaults.ks",
+                     "/usr/share/anaconda/interactive-defaults.ks"]
+ 
++    log.info("ks_files: %s" % ks_files)
+     for ks in ks_files:
+-        if not os.path.exists(ks):
++        if not os.path.exists(ks) and \
++           not ks.startswith("http://") and \
++           not ks.startswith("https://") and \
++           not ks.startswith("ftp://"):
+             continue
+ 
+         kickstart.preScriptPass(ks)
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0043-support-authentication-for-kickstart.patch b/meta-installer/recipes-installer/anaconda/files/0043-support-authentication-for-kickstart.patch
new file mode 100644
index 0000000..a300feb
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0043-support-authentication-for-kickstart.patch
@@ -0,0 +1,133 @@
+From 0a325766f56c70f7f1513b0b9f06d1faa769688d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:09:36 +0800
+Subject: [PATCH 43/65] support authentication for kickstart
+
+We add option 'ksuser' and 'kspasswd' in /proc/cmdline to support
+authentication while downloading kickstart from web server.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase from WRL8 to WRL9.
+
+Compared with old installer, we do not support to pop a prompt page
+while authentication failed, because the new installer do not support
+snack module (The python snack is used for text display).
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/flags.py     | 11 +++++++++++
+ pyanaconda/kickstart.py | 41 ++++++++++++++++++++++++++++++++++-------
+ 2 files changed, 45 insertions(+), 7 deletions(-)
+
+diff --git a/pyanaconda/flags.py b/pyanaconda/flags.py
+index 37206d0..7c5f3b4 100644
+--- a/pyanaconda/flags.py
++++ b/pyanaconda/flags.py
+@@ -71,6 +71,11 @@ class Flags(object):
+         self.rescue_mode = False
+         self.noefi = False
+         self.kexec = False
++
++        # Authentication for downloading kickstart file through http
++        self.ksuser = None
++        self.kspasswd = None
++
+         # nosave options
+         self.nosave_input_ks = False
+         self.nosave_output_ks = False
+@@ -91,6 +96,12 @@ class Flags(object):
+                   "nombr", "gpt", "noefi"):
+             self.set_cmdline_bool(f)
+ 
++        if "ksuser" in self.cmdline:
++            self.ksuser = self.cmdline['ksuser']
++
++        if "kspasswd" in self.cmdline:
++            self.kspasswd = self.cmdline['kspasswd']
++
+         if not os.path.exists("/selinux/load"):
+             self.selinux = 0
+ 
+diff --git a/pyanaconda/kickstart.py b/pyanaconda/kickstart.py
+index 2210845..d858ed1 100644
+--- a/pyanaconda/kickstart.py
++++ b/pyanaconda/kickstart.py
+@@ -76,7 +76,7 @@ from pykickstart.constants import CLEARPART_TYPE_NONE, CLEARPART_TYPE_ALL, \
+                                   SELINUX_DISABLED, SELINUX_ENFORCING, SELINUX_PERMISSIVE, \
+                                   SNAPSHOT_WHEN_POST_INSTALL, SNAPSHOT_WHEN_PRE_INSTALL
+ from pykickstart.base import BaseHandler
+-from pykickstart.errors import formatErrorMsg, KickstartError, KickstartParseError
++from pykickstart.errors import formatErrorMsg, KickstartError, KickstartParseError, KickstartAuthError
+ from pykickstart.parser import KickstartParser
+ from pykickstart.parser import Script as KSScript
+ from pykickstart.sections import Section
+@@ -2086,12 +2086,39 @@ class AnacondaKSHandler(superclass):
+     def __str__(self):
+         return superclass.__str__(self) + "\n" + str(self.addons) + str(self.anaconda)
+ 
+-class AnacondaPreParser(KickstartParser):
+-    # A subclass of KickstartParser that only looks for %pre scripts and
++class WRKickstartParser(KickstartParser):
++    # A subclass of KickstartParser that parse the authentication failure
++    # while downloading kickstart file from web server
++    def __init__(self, handler, followIncludes=True, errorsAreFatal=True,
++                  missingIncludeIsFatal=True):
++        KickstartParser.__init__(self, handler, missingIncludeIsFatal=False)
++        self.username = flags.ksuser
++        self.password = flags.kspasswd
++
++    def readKickstart(self, f, reset=True):
++        while True:
++            try:
++                KickstartParser.readKickstart(self, f, reset=reset,
++                                              username=self.username,
++                                              password=self.password)
++
++                # Make sure the following readKickstart invoking will success
++                flags.ksuser = self.username
++                flags.kspasswd = self.password
++                break
++            except KickstartAuthError as e:
++                msg = 'Append "ksuser=<username> kspasswd=<password>" to boot command'
++                raise KickstartError(msg)
++            except:
++                raise
++
++
++class AnacondaPreParser(WRKickstartParser):
++    # A subclass of WRKickstartParser that only looks for %pre scripts and
+     # sets them up to be run.  All other scripts and commands are ignored.
+     def __init__(self, handler, followIncludes=True, errorsAreFatal=True,
+                  missingIncludeIsFatal=True):
+-        KickstartParser.__init__(self, handler, missingIncludeIsFatal=False)
++        WRKickstartParser.__init__(self, handler, missingIncludeIsFatal=False)
+ 
+     def handleCommand(self, lineno, args):
+         pass
+@@ -2107,17 +2134,17 @@ class AnacondaPreParser(KickstartParser):
+         self.registerSection(NullSection(self.handler.anaconda, sectionOpen="%anaconda"))
+ 
+ 
+-class AnacondaKSParser(KickstartParser):
++class AnacondaKSParser(WRKickstartParser):
+     def __init__(self, handler, followIncludes=True, errorsAreFatal=True,
+                  missingIncludeIsFatal=True, scriptClass=AnacondaKSScript):
+         self.scriptClass = scriptClass
+-        KickstartParser.__init__(self, handler)
++        WRKickstartParser.__init__(self, handler)
+ 
+     def handleCommand(self, lineno, args):
+         if not self.handler:
+             return
+ 
+-        return KickstartParser.handleCommand(self, lineno, args)
++        return WRKickstartParser.handleCommand(self, lineno, args)
+ 
+     def setupSections(self):
+         self.registerSection(PreScriptSection(self.handler, dataObj=self.scriptClass))
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0044-support-downloading-file-from-http-ftp-server-to-tar.patch b/meta-installer/recipes-installer/anaconda/files/0044-support-downloading-file-from-http-ftp-server-to-tar.patch
new file mode 100644
index 0000000..740c2b0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0044-support-downloading-file-from-http-ftp-server-to-tar.patch
@@ -0,0 +1,175 @@
+From 97f0ca901d8d8c623c3e5397a5150a09685e8036 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:15:27 +0800
+Subject: [PATCH] support downloading file from http/ftp server to target image
+
+Add key in kickstart to support downloading file from http/ftp server to target image,
+'download --dest=[file://dir/filename|/dir/filename] --src=[http url| ftp url]'
+
+Here is the example in kickstart file:
+---start---
+download --dest=/etc/rpm/keys/0x100001 --src=http://128.224.162.159/testkey
+download --dest=file://etc/rpm/keys/0x100002 --src=http://128.224.162.159/testkey2
+---end---
+
+The file be download to target image (/mnt/image/****). For host image,
+we could make use of "%pre" section with invoking shell to do that)
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase from WRL8 to WRL9
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase from WRL9 to WRL10
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/install.py   |  2 ++
+ pyanaconda/kickstart.py | 94 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 96 insertions(+)
+
+diff --git a/pyanaconda/install.py b/pyanaconda/install.py
+index 555d7b0..0bb0722 100644
+--- a/pyanaconda/install.py
++++ b/pyanaconda/install.py
+@@ -99,6 +99,8 @@ def doConfiguration(storage, payload, ksdata, instClass):
+     os_config.append(Task("Configure firewall", ksdata.firewall.execute, (storage, ksdata, instClass)))
+     os_config.append(Task("Configure X", ksdata.xconfig.execute, (storage, ksdata, instClass)))
+     os_config.append(Task("Configure skip-X", ksdata.skipx.execute, (storage, ksdata, instClass)))
++    os_config.append(Task("Configure download", ksdata.download.execute, (storage, ksdata, instClass)))
++
+     configuration_queue.append(os_config)
+ 
+     # schedule network configuration (if required)
+diff --git a/pyanaconda/kickstart.py b/pyanaconda/kickstart.py
+index 3b877f7..af26c21 100644
+--- a/pyanaconda/kickstart.py
++++ b/pyanaconda/kickstart.py
+@@ -78,6 +78,8 @@ from pykickstart.constants import CLEARPART_TYPE_NONE, CLEARPART_TYPE_ALL, \
+ from pykickstart.base import BaseHandler
+ from pykickstart.errors import formatErrorMsg, KickstartError, KickstartParseError, KickstartAuthError
+ from pykickstart.parser import KickstartParser
++from pykickstart.base import KickstartCommand, BaseData
++from pykickstart.options import KSOptionParser
+ from pykickstart.parser import Script as KSScript
+ from pykickstart.sections import Section
+ from pykickstart.sections import NullSection, PackageSection, PostScriptSection, PreScriptSection, PreInstallScriptSection, \
+@@ -1937,6 +1939,96 @@ class Upgrade(commands.upgrade.F20_Upgrade):
+         iutil.ipmi_report(IPMI_ABORTED)
+         sys.exit(1)
+ 
++class DownloadData(BaseData):
++    removedKeywords = BaseData.removedKeywords
++    removedAttrs = BaseData.removedAttrs
++
++    def __init__(self, *args, **kwargs):
++        BaseData.__init__(self, *args, **kwargs)
++        self.dest = kwargs.get("dest", None)
++        self.src = kwargs.get("src", None)
++
++    def __eq__(self, y):
++        return self.dest == y.dest
++
++    def _getArgsAsStr(self):
++        retval = "--dest=%s --src=%s" % (self.dest, self.src)
++        return retval
++
++    def __str__(self):
++        retval = BaseData.__str__(self)
++        retval += "download %s\n" % self._getArgsAsStr()
++        return retval
++
++class Download(KickstartCommand):
++    removedKeywords = KickstartCommand.removedKeywords
++    removedAttrs = KickstartCommand.removedAttrs
++
++    def __init__(self, writePriority=0, *args, **kwargs):
++        KickstartCommand.__init__(self, writePriority, *args, **kwargs)
++        self.op = self._getParser()
++        self.downloadList = kwargs.get("downloadList", [])
++
++    def __str__(self):
++        retval = "# Download file from http/ftp server to target image\n"
++        retval += "# download --dest=[file://dir/filename|/dir/filename] --src=[http url| ftp url]\n"
++        for d in self.downloadList:
++            retval += d.__str__()
++        retval += "\n"
++        return retval
++
++    def _getParser(self):
++        op = KSOptionParser()
++        op.add_option("--dest", dest="dest", required=True)
++        op.add_option("--src", dest="src", required=True)
++        return op
++
++    def parse(self, args):
++        (opts, extra) = self.op.parse_args(args=args, lineno=self.lineno)
++        dd = self.handler.DownloadData()
++        self._setToObj(self.op, opts, dd)
++        dd.lineno = self.lineno
++
++        # Check for duplicates in the data list.
++        if dd in self.dataList():
++            log.warn(_("A source %s has already been defined.") % dd.src)
++
++        log.info("kickstart downloading %s to %s" % (opts.src, opts.dest))
++        return dd
++
++    def dataList(self):
++        return self.downloadList
++
++    def execute(self, storage, ksdata, instClass):
++        if not ksdata.download:
++            return
++
++        for dd in ksdata.download.downloadList:
++            if dd.dest.startswith("file:"):
++                dd.dest = dd.dest[len("file:"):]
++
++            if not dd.dest.startswith("/"):
++                msg = _("The dest %s is not on filesystem" % (dd.dest))
++                stderrLog.critical(msg)
++                sys.exit(1)
++
++            dest = iutil.getSysroot() + dd.dest
++            log.info("downloading %s to %s" % (dd.src, dest))
++            dest_dir = os.path.dirname(dest)
++            if not os.path.exists(dest_dir):
++                os.makedirs(dest_dir)
++
++            try:
++                request = iutil.requests_session().get(dd.src)
++            except requests.exceptions.RequestException as e:
++                msg = _("The following error was encountered while downloading %s:\n\n%s" % (dd.src, e))
++                stderrLog.critical(msg)
++                sys.exit(1)
++
++            with open(dest, "wb") as dest_f:
++                dest_f.write(request.content)
++
++
+ ###
+ ### %anaconda Section
+ ###
+@@ -2037,6 +2129,7 @@ commandMap = {
+     "volgroup": VolGroup,
+     "xconfig": XConfig,
+     "zfcp": ZFCP,
++    "download": Download,
+ }
+ 
+ dataMap = {
+@@ -2047,6 +2140,7 @@ dataMap = {
+     "RepoData": RepoData,
+     "SnapshotData": SnapshotData,
+     "VolGroupData": VolGroupData,
++    "DownloadData": DownloadData,
+ }
+ 
+ superclass = returnClassForVersion()
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0045-live-install-supports-kickstart.patch b/meta-installer/recipes-installer/anaconda/files/0045-live-install-supports-kickstart.patch
new file mode 100644
index 0000000..dd22f8b
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0045-live-install-supports-kickstart.patch
@@ -0,0 +1,47 @@
+From 7bae228f66d6598e053352a24d0f0a05242e2342 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:19:41 +0800
+Subject: [PATCH 45/65] live install supports kickstart
+
+While live install, WRLinux does not support harddrive,
+use cdrom to replace
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/install.py       | 4 ++++
+ pyanaconda/startup_utils.py | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/pyanaconda/install.py b/pyanaconda/install.py
+index 0bb0722..38e10fd 100644
+--- a/pyanaconda/install.py
++++ b/pyanaconda/install.py
+@@ -75,6 +75,10 @@ def _writeKS(ksdata):
+     # Do not support network configuration
+     ksdata.network.network = []
+ 
++    # Correct method of live install, use cdrom to replace
++    if ksdata.method.method == "harddrive":
++        ksdata.method.method = "cdrom"
++
+     # Make it so only root can read - could have passwords
+     with iutil.open_with_perm(path, "w", 0o600) as f:
+         f.write(str(ksdata))
+diff --git a/pyanaconda/startup_utils.py b/pyanaconda/startup_utils.py
+index a54d1e2..ae45c5e 100644
+--- a/pyanaconda/startup_utils.py
++++ b/pyanaconda/startup_utils.py
+@@ -419,7 +419,7 @@ def parse_kickstart(options, addon_paths):
+     :returns: kickstart parsed to a data model
+     """
+     ksdata = None
+-    if options.ksfile and not options.liveinst:
++    if options.ksfile:
+         if not os.path.exists(options.ksfile) and \
+            not options.ksfile.startswith("http://") and \
+            not options.ksfile.startswith("https://") and \
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0046-support-initramfs-boot.patch b/meta-installer/recipes-installer/anaconda/files/0046-support-initramfs-boot.patch
new file mode 100644
index 0000000..dc76245
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0046-support-initramfs-boot.patch
@@ -0,0 +1,48 @@
+From f5fa369d6ac990e54899eb1cd28488abfd5d4b2a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:27:48 +0800
+Subject: [PATCH 46/65] support initramfs boot
+
+- Create fake initramfs to cheat grub-mkconfig which
+  could generate grub.cfg that have initrd setting.
+
+- Make sure temp dir existed which required by dracut while live install.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py       | 3 +++
+ pyanaconda/payload/__init__.py | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 2c86603..7e3fce1 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -2465,6 +2465,9 @@ def writeSysconfigKernel(storage, version, instClass):
+ def writeBootLoaderFinal(storage, payload, instClass, ksdata):
+     """ Do the final write of the bootloader. """
+ 
++    for kernel in payload.kernelVersionList:
++        open(iutil.getSysroot()+"/boot/initramfs-%s.img" % kernel, "w").write("\n")
++
+     # set up dracut/fips boot args
+     # XXX FIXME: do this from elsewhere?
+     storage.bootloader.set_boot_args(storage=storage,
+diff --git a/pyanaconda/payload/__init__.py b/pyanaconda/payload/__init__.py
+index 22af097..d29fa62 100644
+--- a/pyanaconda/payload/__init__.py
++++ b/pyanaconda/payload/__init__.py
+@@ -668,6 +668,10 @@ class Payload(object):
+             log.error("new-kernel-pkg does not exist - grubby wasn't installed?  skipping")
+             return
+ 
++        # Make sure temp dir existed, dracut requires it while live install
++        for subdir in ["log", "tmp"]:
++            iutil.mkdirChain(iutil.getSysroot() + "/var/volatile/%s" % subdir)
++
+         for kernel in self.kernelVersionList:
+             log.info("recreating initrd for %s", kernel)
+             if not flags.imageInstall:
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0047-fix-hang-while-installed-system-reboot.patch b/meta-installer/recipes-installer/anaconda/files/0047-fix-hang-while-installed-system-reboot.patch
new file mode 100644
index 0000000..68171ad
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0047-fix-hang-while-installed-system-reboot.patch
@@ -0,0 +1,30 @@
+From 0a1349dc0fda0324725a996ff6e3b3470599e0e9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 31 Mar 2017 14:06:06 +0800
+Subject: [PATCH 47/65] fix hang while installed system reboot
+
+The lvm2 installed to target system, and it disabled by
+default which caused target system reboot hang.
+
+Enable service lvm2-monitor.service could fix the issue.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ data/interactive-defaults.ks | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/data/interactive-defaults.ks b/data/interactive-defaults.ks
+index b6a5e76..b9a926f 100644
+--- a/data/interactive-defaults.ks
++++ b/data/interactive-defaults.ks
+@@ -4,3 +4,5 @@ auth --enableshadow --passalgo=sha512
+ firstboot --enable
+ keyboard --xlayouts='us'
+ 
++# Fix hang while installed system reboot
++services --enabled lvm2-monitor.service
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0048-fix-installed-system-boot-from-encrypt-fs-failed.patch b/meta-installer/recipes-installer/anaconda/files/0048-fix-installed-system-boot-from-encrypt-fs-failed.patch
new file mode 100644
index 0000000..3c9d4c2
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0048-fix-installed-system-boot-from-encrypt-fs-failed.patch
@@ -0,0 +1,48 @@
+From dec014cd019ce4ccf6b1e7579ff4d58ec54e33f8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:34:10 +0800
+Subject: [PATCH 48/65] fix installed system boot from encrypt fs failed
+
+While using cryptsetup to encrypt filesystem, it failed to boot
+installed system.
+-----------------
+dracut: luksOpen /dev/sda3 luks-9cf2d2d9-849e-4ecb-a7f8-5918259306d6
+Enter passphrase for /dev/sda3: Switched to clocksource tsc
+
+device-mapper: table: 253:0: crypt: Error allocating crypto tfm
+device-mapper: ioctl: error adding target to table
+device-mapper: reload ioctl on  failed: No such file or directory
+Failed to setup dm-crypt key mapping for device /dev/sda3.
+Check that kernel supports aes-xts-plain64 cipher (check syslog for more info).
+Wrong password
+-----------------
+
+The reason is the initramfs (generated by dracut) missed kernel module.
+
+Config dracut to let initramfs has the kernel driver.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/payload/__init__.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/pyanaconda/payload/__init__.py b/pyanaconda/payload/__init__.py
+index d29fa62..00ff79f 100644
+--- a/pyanaconda/payload/__init__.py
++++ b/pyanaconda/payload/__init__.py
+@@ -672,6 +672,10 @@ class Payload(object):
+         for subdir in ["log", "tmp"]:
+             iutil.mkdirChain(iutil.getSysroot() + "/var/volatile/%s" % subdir)
+ 
++        with open(iutil.getSysroot() + "/etc/dracut.conf.d/cryptsetup.conf", "w") as f:
++            f.write('add_drivers+=" aesni_intel"\n')
++            f.write('add_drivers+=" aes_x86_64"\n')
++
+         for kernel in self.kernelVersionList:
+             log.info("recreating initrd for %s", kernel)
+             if not flags.imageInstall:
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0049-installation-destination-disable-iSCSI-network-disks.patch b/meta-installer/recipes-installer/anaconda/files/0049-installation-destination-disable-iSCSI-network-disks.patch
new file mode 100644
index 0000000..e38d37e
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0049-installation-destination-disable-iSCSI-network-disks.patch
@@ -0,0 +1,29 @@
+From bf5a4298d1f8eae33a70210808c0fd26ec056287 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:35:52 +0800
+Subject: [PATCH 49/65] installation destination: disable iSCSI network disks
+
+WRLinux does not support it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/storage.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pyanaconda/ui/gui/spokes/storage.py b/pyanaconda/ui/gui/spokes/storage.py
+index 4871667..2945c9e 100644
+--- a/pyanaconda/ui/gui/spokes/storage.py
++++ b/pyanaconda/ui/gui/spokes/storage.py
+@@ -806,6 +806,7 @@ class StorageSpoke(NormalSpoke, StorageCheckHandler):
+         self.builder.get_object("local_untouched_label_revealer").set_reveal_child(anySelected)
+         self.builder.get_object("special_untouched_label_revealer").set_reveal_child(anySelected)
+         self.builder.get_object("other_options_grid").set_sensitive(anySelected)
++        self.builder.get_object("addSpecializedButton").set_sensitive(False)
+ 
+         if len(self.disks) == 0:
+             self.set_warning(_("No disks detected.  Please shut down the computer, connect at least one disk, and restart to complete installation."))
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0050-update-region-while-city-changes.patch b/meta-installer/recipes-installer/anaconda/files/0050-update-region-while-city-changes.patch
new file mode 100644
index 0000000..e6a6622
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0050-update-region-while-city-changes.patch
@@ -0,0 +1,32 @@
+From f97cc9915bf4e2931476ddfcb50b2103768339f7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 9 Sep 2016 13:23:48 -0400
+Subject: [PATCH 50/65] update region while city changes
+
+While user select US/Alaska from combobox at first time, the libtimezonemap
+convert it to America/Anchorage, and anaconda gui page recognize it as
+America/Alaska, the fix make sure region/city could be correctly updated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/datetime_spoke.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/ui/gui/spokes/datetime_spoke.py b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+index 4cc9f60..996aed0 100644
+--- a/pyanaconda/ui/gui/spokes/datetime_spoke.py
++++ b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+@@ -926,7 +926,7 @@ class DatetimeSpoke(FirstbootSpokeMixIn, NormalSpoke):
+ 
+         region = self._get_active_region()
+ 
+-        if not region or region == self._old_region:
++        if not region:
+             # region entry being edited or old_value chosen, no action needed
+             # @see: on_city_changed
+             return
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0051-timezone-fix-set-US-Alaska-failed.patch b/meta-installer/recipes-installer/anaconda/files/0051-timezone-fix-set-US-Alaska-failed.patch
new file mode 100644
index 0000000..dc9845d
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0051-timezone-fix-set-US-Alaska-failed.patch
@@ -0,0 +1,38 @@
+From 403cc7187dfcaae7257579bdd891ba42fb3f2ab1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 11 Sep 2016 21:52:30 -0400
+Subject: [PATCH 51/65] timezone: fix set US/Alaska failed
+
+Make sure the existence of dir.
+------
+  File "/usr/lib64/python2.7/site-packages/pyanaconda/timezone.py", line 108, in write_timezone_config
+    shutil.copyfile(tz_file, rooted_tz_file)
+
+  File "/usr/lib64/python2.7/shutil.py", line 83, in copyfile
+    with open(dst, 'wb') as fdst:
+
+IOError: [Errno 2] No such file or directory: '/mnt/sysimage/usr/share/zoneinfo/US/Alaska'
+------
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/timezone.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pyanaconda/timezone.py b/pyanaconda/timezone.py
+index 21b1ec1..f84100b 100644
+--- a/pyanaconda/timezone.py
++++ b/pyanaconda/timezone.py
+@@ -103,6 +103,7 @@ def write_timezone_config(timezone, root):
+     link_path = os.path.normpath(root + "/etc/localtime")
+ 
+     if not os.access(rooted_tz_file, os.R_OK) and os.access(tz_file, os.R_OK):
++        iutil.mkdirChain(os.path.dirname(rooted_tz_file))
+         shutil.copyfile(tz_file, rooted_tz_file)
+ 
+     if not os.access(rooted_tz_file, os.R_OK):
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0052-remove-incorrect-prefix-of-addon-repo-url.patch b/meta-installer/recipes-installer/anaconda/files/0052-remove-incorrect-prefix-of-addon-repo-url.patch
new file mode 100644
index 0000000..79f6719
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0052-remove-incorrect-prefix-of-addon-repo-url.patch
@@ -0,0 +1,42 @@
+From aba7e051a98c33da3b168222a2cd9325963c5601 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 14:39:13 +0800
+Subject: [PATCH 52/65] remove incorrect prefix of addon repo url
+
+While user set addon repo url with "http://128.224.162.227/intel_x86_64/",
+it has incorrect prefix "http://http://128.224.162.227/intel_x86_64/".
+
+So remove incorrect prefix of addon repo url.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/source.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/ui/gui/spokes/source.py b/pyanaconda/ui/gui/spokes/source.py
+index b8bd739..34fa04d 100644
+--- a/pyanaconda/ui/gui/spokes/source.py
++++ b/pyanaconda/ui/gui/spokes/source.py
+@@ -1521,9 +1521,15 @@ class SourceSpoke(NormalSpoke, GUISpokeInputCheckHandler):
+         proto = REPO_PROTO[idx]
+         url = self._repoUrlEntry.get_text().strip()
+         if self._repoMirrorlistCheckbox.get_active():
+-            repo.mirorlist = proto + url
++            if not url.startswith(proto):
++                repo.mirorlist = proto + url
++            else:
++                repo.mirorlist = url
+         else:
+-            repo.baseurl = proto + url
++            if not url.startswith(proto):
++                repo.baseurl = proto + url
++            else:
++                repo.baseurl = url
+ 
+         # do not update check status if check are not yet set up
+         # (populationg/refreshing the spoke)
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0053-fix-write-sysconfig-network-failed.patch b/meta-installer/recipes-installer/anaconda/files/0053-fix-write-sysconfig-network-failed.patch
new file mode 100644
index 0000000..627dda2
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0053-fix-write-sysconfig-network-failed.patch
@@ -0,0 +1,32 @@
+From 1575c801c627ae652c159ab6c1f34f02de9acffe Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 24 Oct 2016 05:28:01 -0400
+Subject: [PATCH 53/65] fix write sysconfig network failed
+
+While target does not have sysconfig, the anaconda should not
+write sysconfig network.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/network.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/pyanaconda/network.py b/pyanaconda/network.py
+index 36676ad..953dfb3 100644
+--- a/pyanaconda/network.py
++++ b/pyanaconda/network.py
+@@ -1338,6 +1338,9 @@ def usedByFCoE(iface, storage):
+ 
+ def write_sysconfig_network(rootpath, overwrite=False):
+ 
++    if (not os.path.isdir(rootpath + sysconfigDir)):
++        return False
++
+     cfgfile = os.path.normpath(rootpath + networkConfFile)
+     if (os.path.isfile(cfgfile) and not overwrite):
+         return False
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0054-pyanaconda-ui-gui-utils.py-tweak-mouse-arrow.patch b/meta-installer/recipes-installer/anaconda/files/0054-pyanaconda-ui-gui-utils.py-tweak-mouse-arrow.patch
new file mode 100644
index 0000000..24484e5
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0054-pyanaconda-ui-gui-utils.py-tweak-mouse-arrow.patch
@@ -0,0 +1,31 @@
+From 35670268636a6dd87c74cd67dcc6fb7b10530ea0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Nov 2016 01:23:50 -0500
+Subject: [PATCH 54/65] pyanaconda/ui/gui/utils.py: tweak mouse arrow
+
+The arrow of Gdk.CursorType.ARROW points to right, use
+Gdk.CursorType.LEFT_PTR to replace.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/utils.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/ui/gui/utils.py b/pyanaconda/ui/gui/utils.py
+index 8394eac..8e4c395 100644
+--- a/pyanaconda/ui/gui/utils.py
++++ b/pyanaconda/ui/gui/utils.py
+@@ -345,7 +345,7 @@ def unbusyCursor():
+     if not window:
+         return
+ 
+-    window.set_cursor(Gdk.Cursor(Gdk.CursorType.ARROW))
++    window.set_cursor(Gdk.Cursor(Gdk.CursorType.LEFT_PTR))
+ 
+ def ignoreEscape(dlg):
+     """Prevent a dialog from accepting the escape keybinding, which emits a
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0055-tweak-search-location-of-new-kernel-pkg.patch b/meta-installer/recipes-installer/anaconda/files/0055-tweak-search-location-of-new-kernel-pkg.patch
new file mode 100644
index 0000000..6414976
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0055-tweak-search-location-of-new-kernel-pkg.patch
@@ -0,0 +1,30 @@
+From e4355aa23df3856846db139674bb8f7feeae984b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 17:01:39 +0800
+Subject: [PATCH 55/65] tweak search location of new-kernel-pkg
+
+In OE, it locates /sbin rather than /usr/sbin
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/payload/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/payload/__init__.py b/pyanaconda/payload/__init__.py
+index 00ff79f..24a234e 100644
+--- a/pyanaconda/payload/__init__.py
++++ b/pyanaconda/payload/__init__.py
+@@ -664,7 +664,7 @@ class Payload(object):
+ 
+         :returns: None
+         """
+-        if not os.path.exists(iutil.getSysroot() + "/usr/sbin/new-kernel-pkg"):
++        if not os.path.exists(iutil.getSysroot() + "/sbin/new-kernel-pkg"):
+             log.error("new-kernel-pkg does not exist - grubby wasn't installed?  skipping")
+             return
+ 
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0056-always-write-fstab-after-install.patch b/meta-installer/recipes-installer/anaconda/files/0056-always-write-fstab-after-install.patch
new file mode 100644
index 0000000..488539c
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0056-always-write-fstab-after-install.patch
@@ -0,0 +1,31 @@
+From bb47aa267bdb3accd52f5d695286980e5ddf6e9f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 2 Jun 2017 17:20:27 +0800
+Subject: [PATCH 56/65] always write fstab after install
+
+Always write fstab after instal, make sure the generated
+/etc/fstab not overwritten by the one from package install.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/payload/dnfpayload.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyanaconda/payload/dnfpayload.py b/pyanaconda/payload/dnfpayload.py
+index 8cad37b..73eaff3 100644
+--- a/pyanaconda/payload/dnfpayload.py
++++ b/pyanaconda/payload/dnfpayload.py
+@@ -1320,7 +1320,7 @@ class DNFPayload(payload.PackagePayload):
+                                           ["-a"],
+                                           root=pyanaconda.iutil.getSysroot())
+ 
+-    def writeStorageLate(self):
++    def writeStorageEarly(self):
+         pass
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0057-invoke-grub-install-to-generate-efi-filesystem.patch b/meta-installer/recipes-installer/anaconda/files/0057-invoke-grub-install-to-generate-efi-filesystem.patch
new file mode 100644
index 0000000..4b47bd4
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0057-invoke-grub-install-to-generate-efi-filesystem.patch
@@ -0,0 +1,60 @@
+From b44a5d91f984c6dbb46ace1a8c46c5b517440577 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 6 Jun 2017 15:40:55 +0800
+Subject: [PATCH 57/65] invoke grub-install to generate efi filesystem
+
+Previously, the efi filesystem was from package grub-efi
+which generated at build time.
+
+Add a wraper to generate efi filesystem with fs_uuid located.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index 7e3fce1..ace90b0 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -1711,6 +1711,11 @@ class EFIBase(object):
+             efi_dir = flags.cmdline.get("force_efi_dir")
+         return "efi/EFI/%s" % (efi_dir,)
+ 
++    @property
++    def config_file(self):
++        """ Full path to configuration file. """
++        return "%s/grub/%s" % (self.config_dir, self._config_file)
++
+     def efibootmgr(self, *args, **kwargs):
+         if flags.imageInstall or flags.dirInstall:
+             log.info("Skipping efibootmgr for image/directory install.")
+@@ -1800,6 +1805,23 @@ class EFIBase(object):
+             self.remove_efi_boot_target()
+         self.add_efi_boot_target()
+ 
++        with open(iutil.getSysroot() + "/tmp/grub-mkimage-wrapper.sh", "w") as f:
++            f.write('#!/bin/sh\n')
++            f.write('uuid=`grub-probe  --target=fs_uuid  /boot/efi/`\n')
++            f.write('echo "search.fs_uuid ${uuid} root" > /tmp/load.cfg\n')
++            f.write('echo "grub-mkimage -c /tmp/load.cfg $@ search_fs_uuid"\n')
++            f.write('grub-mkimage -c /tmp/load.cfg $@ search_fs_uuid\n')
++        os.chmod(iutil.getSysroot() + "/tmp/grub-mkimage-wrapper.sh", 0o755)
++
++        rc = iutil.execInSysroot("grub-install", ["--removable",
++                                                  "--efi-directory=/boot/efi/",
++                                                  "--boot-directory=%s" % self.config_dir,
++                                                  "--grub-mkimage=/tmp/grub-mkimage-wrapper.sh",
++                                                  "/boot/efi/"
++                                                 ])
++        if rc:
++            raise BootLoaderError("boot loader install failed")
++
+ 
+ class EFIGRUB1(EFIBase, GRUB):
+     packages = ["efibootmgr"]
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0058-do-not-support-closest-mirror.patch b/meta-installer/recipes-installer/anaconda/files/0058-do-not-support-closest-mirror.patch
new file mode 100644
index 0000000..97ee22a
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0058-do-not-support-closest-mirror.patch
@@ -0,0 +1,96 @@
+From e3c49a4ed129e6719e87f792915dc6c2d1ddc915 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 9 Jun 2017 10:58:07 +0800
+Subject: [PATCH 58/65] do not support closest mirror
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/ui/gui/spokes/source.glade |  1 -
+ pyanaconda/ui/gui/spokes/source.py    |  4 ----
+ pyanaconda/ui/tui/spokes/source.py    | 18 ++++++------------
+ 3 files changed, 6 insertions(+), 17 deletions(-)
+
+diff --git a/pyanaconda/ui/gui/spokes/source.glade b/pyanaconda/ui/gui/spokes/source.glade
+index 089838c..ba0ee10 100644
+--- a/pyanaconda/ui/gui/spokes/source.glade
++++ b/pyanaconda/ui/gui/spokes/source.glade
+@@ -755,7 +755,6 @@
+                                           <item id="https">https://</item>
+                                           <item id="ftp">ftp://</item>
+                                           <item id="nfs">nfs</item>
+-                                          <item id="Closest mirror" translatable="yes">Closest mirror</item>
+                                         </items>
+                                         <signal name="changed" handler="on_protocol_changed" swapped="no"/>
+                                       </object>
+diff --git a/pyanaconda/ui/gui/spokes/source.py b/pyanaconda/ui/gui/spokes/source.py
+index 34fa04d..86eaa9b 100644
+--- a/pyanaconda/ui/gui/spokes/source.py
++++ b/pyanaconda/ui/gui/spokes/source.py
+@@ -821,10 +821,6 @@ class SourceSpoke(NormalSpoke, GUISpokeInputCheckHandler):
+             combo = self.builder.get_object("isoPartitionCombo")
+             combo.set_active(active)
+ 
+-        # We default to the mirror list, and then if the method tells us
+-        # something different later, we can change it.
+-        self._protocolComboBox.set_active_id(PROTOCOL_MIRROR)
+-
+         if self.data.method.method == "url":
+             self._networkButton.set_active(True)
+ 
+diff --git a/pyanaconda/ui/tui/spokes/source.py b/pyanaconda/ui/tui/spokes/source.py
+index 9e51147..3b3fe71 100644
+--- a/pyanaconda/ui/tui/spokes/source.py
++++ b/pyanaconda/ui/tui/spokes/source.py
+@@ -58,7 +58,7 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+     helpFile = "SourceSpoke.txt"
+     category = SoftwareCategory
+ 
+-    _protocols = (N_("Closest mirror"), "http://", "https://", "ftp://", "nfs")
++    _protocols = ("http://", "https://", "ftp://", "nfs")
+ 
+     # default to 'closest mirror', as done in the GUI
+     _selection = 1
+@@ -179,13 +179,7 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+         if args == 2:
+             # network install
+             self._selection = num
+-            if self._selection == 1:
+-                # closest mirror
+-                self.set_source_closest_mirror()
+-                self.apply()
+-                self.close()
+-                return INPUT_PROCESSED
+-            elif self._selection in range(2, 5):
++            if self._selection in range(1, 4):
+                 # preliminary URL source switch
+                 self.set_source_url()
+                 newspoke = SpecifyRepoSpoke(self.app, self.data, self.storage,
+@@ -194,7 +188,7 @@ class SourceSpoke(EditTUISpoke, SourceSwitchHandler):
+                 self.apply()
+                 self.close()
+                 return INPUT_PROCESSED
+-            elif self._selection == 5:
++            elif self._selection == 4:
+                 # nfs
+                 # preliminary NFS source switch
+                 self.set_source_nfs()
+@@ -266,11 +260,11 @@ class SpecifyRepoSpoke(EditTUISpoke, SourceSwitchHandler):
+         """ Apply all of our changes. """
+         log.info("apply args %s" % self.args)
+         url = None
+-        if self.selection == 2 and not self.args.url.startswith("http://"):
++        if self.selection == 1 and not self.args.url.startswith("http://"):
+             url = "http://" + self.args.url
+-        elif self.selection == 3 and not self.args.url.startswith("https://"):
++        elif self.selection == 2 and not self.args.url.startswith("https://"):
+             url = "https://" + self.args.url
+-        elif self.selection == 4 and not self.args.url.startswith("ftp://"):
++        elif self.selection == 3 and not self.args.url.startswith("ftp://"):
+             url = "ftp://" + self.args.url
+         else:
+             # protocol either unknown or entry already starts with a protocol
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch b/meta-installer/recipes-installer/anaconda/files/0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch
new file mode 100644
index 0000000..60c96f1
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch
@@ -0,0 +1,42 @@
+From 35d7ac6f653b42099f4e5e6126cc44f5d918d10b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 9 Jun 2017 11:15:40 +0800
+Subject: [PATCH 59/65] tweak MAX_TREEINFO_DOWNLOAD_RETRIES
+
+Do not need to retry so many times.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/payload/__init__.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pyanaconda/payload/__init__.py b/pyanaconda/payload/__init__.py
+index 24a234e..1311a2b 100644
+--- a/pyanaconda/payload/__init__.py
++++ b/pyanaconda/payload/__init__.py
+@@ -75,7 +75,7 @@ USER_AGENT = "%s (anaconda)/%s" % (productName, productVersion)
+ from distutils.version import LooseVersion
+ 
+ REPO_NOT_SET = False
+-MAX_TREEINFO_DOWNLOAD_RETRIES = 6
++MAX_TREEINFO_DOWNLOAD_RETRIES = 1
+ 
+ 
+ def versionCmp(v1, v2):
+@@ -536,9 +536,9 @@ class Payload(object):
+                 version = "rawhide"
+             except configparser.Error:
+                 pass
+-            log.debug("using treeinfo release version of %s", version)
++            log.info("using treeinfo release version of %s", version)
+         else:
+-            log.debug("using default release version of %s", version)
++            log.info("using default release version of %s", version)
+ 
+         return version
+ 
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0060-tweak-time-setting.patch b/meta-installer/recipes-installer/anaconda/files/0060-tweak-time-setting.patch
new file mode 100644
index 0000000..031ee35
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0060-tweak-time-setting.patch
@@ -0,0 +1,106 @@
+From 5cbdfd4b80c56825716bf035041c19052777d413 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 9 Jun 2017 14:55:45 +0800
+Subject: [PATCH 60/65] tweak time setting
+
+- Unify the gui and tui with the same default timezone setting
+
+- The tui not support NTP server setting
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/constants.py                    |  2 ++
+ pyanaconda/ui/gui/spokes/datetime_spoke.py |  3 +--
+ pyanaconda/ui/tui/spokes/time_spoke.py     | 18 +++++-------------
+ 3 files changed, 8 insertions(+), 15 deletions(-)
+
+diff --git a/pyanaconda/constants.py b/pyanaconda/constants.py
+index d15767b..af421e1 100644
+--- a/pyanaconda/constants.py
++++ b/pyanaconda/constants.py
+@@ -69,6 +69,8 @@ DEFAULT_KEYBOARD = "us"
+ 
+ DRACUT_SHUTDOWN_EJECT = "/run/initramfs/usr/lib/dracut/hooks/shutdown/99anaconda-eject.sh"
+ 
++DEFAULT_TZ = "America/New_York"
++
+ # VNC questions
+ USEVNC = N_("Start VNC")
+ USETEXT = N_("Use text mode")
+diff --git a/pyanaconda/ui/gui/spokes/datetime_spoke.py b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+index 996aed0..fe12fad 100644
+--- a/pyanaconda/ui/gui/spokes/datetime_spoke.py
++++ b/pyanaconda/ui/gui/spokes/datetime_spoke.py
+@@ -48,6 +48,7 @@ from pyanaconda import nm
+ from pyanaconda import ntp
+ from pyanaconda import flags
+ from pyanaconda import constants
++from pyanaconda.constants import DEFAULT_TZ
+ from pyanaconda.threads import threadMgr, AnacondaThread
+ 
+ import datetime
+@@ -63,8 +64,6 @@ SERVER_POOL = 1
+ SERVER_WORKING = 2
+ SERVER_USE = 3
+ 
+-DEFAULT_TZ = "America/New_York"
+-
+ SPLIT_NUMBER_SUFFIX_RE = re.compile(r'([^0-9]*)([-+])([0-9]+)')
+ 
+ def _compare_regions(reg_xlated1, reg_xlated2):
+diff --git a/pyanaconda/ui/tui/spokes/time_spoke.py b/pyanaconda/ui/tui/spokes/time_spoke.py
+index f2a62ea..693283d 100644
+--- a/pyanaconda/ui/tui/spokes/time_spoke.py
++++ b/pyanaconda/ui/tui/spokes/time_spoke.py
+@@ -28,6 +28,7 @@ from pyanaconda import ntp
+ from pyanaconda import constants
+ from pyanaconda.i18n import N_, _, C_
+ from pyanaconda.constants_text import INPUT_PROCESSED
++from pyanaconda.constants_text import DEFAULT_TZ
+ from pyanaconda.threads import threadMgr, AnacondaThread
+ from pyanaconda.flags import flags
+ 
+@@ -184,11 +185,10 @@ class TimeSpoke(FirstbootSpokeMixIn, NormalTUISpoke):
+ 
+     @property
+     def status(self):
+-        if self.data.timezone.timezone:
+-            return _("%s timezone") % self.data.timezone.timezone
+-        else:
+-            return _("Timezone is not set.")
++        if not self.data.timezone.timezone:
++            self.data.timezone.timezone = DEFAULT_TZ
+ 
++        return _("%s timezone") % self.data.timezone.timezone
+     def _summary_text(self):
+         """Return summary of current timezone & NTP configuration.
+ 
+@@ -227,7 +227,7 @@ class TimeSpoke(FirstbootSpokeMixIn, NormalTUISpoke):
+         else:
+             timezone_option = _("Set timezone")
+ 
+-        _options = [timezone_option, _("Configure NTP servers")]
++        _options = [timezone_option]
+         text = [TextWidget(m) for m in _options]
+ 
+         def _prep(i, w):
+@@ -255,14 +255,6 @@ class TimeSpoke(FirstbootSpokeMixIn, NormalTUISpoke):
+             self.app.switch_screen_modal(self.timezone_spoke)
+             self.close()
+             return INPUT_PROCESSED
+-        elif num == 2:
+-            # configure NTP servers
+-            newspoke = NTPServersSpoke(self.app, self.data, self.storage,
+-                                       self.payload, self.instclass, self)
+-            self.app.switch_screen_modal(newspoke)
+-            self.apply()
+-            self.close()
+-            return INPUT_PROCESSED
+         else:
+             # the user provided an invalid option number, just stay in the spoke
+             return INPUT_PROCESSED
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0062-Add-dracut-args-for-home-to-bootloader.patch b/meta-installer/recipes-installer/anaconda/files/0062-Add-dracut-args-for-home-to-bootloader.patch
new file mode 100644
index 0000000..f65e567
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0062-Add-dracut-args-for-home-to-bootloader.patch
@@ -0,0 +1,35 @@
+From d6995821a402071cde412b563ff7ff2fcd7b26b8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 19 Jun 2017 14:55:45 +0800
+Subject: [PATCH 62/65] Add dracut args for /home to bootloader
+
+When /home is on a separate device like LVM or RAID dracut needs
+to know about this so add the needed rd.* parameters to the cmdline.
+This also works when upgrading.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/bootloader.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/pyanaconda/bootloader.py b/pyanaconda/bootloader.py
+index ace90b0..1ebc451 100644
+--- a/pyanaconda/bootloader.py
++++ b/pyanaconda/bootloader.py
+@@ -798,6 +798,11 @@ class BootLoader(object):
+         if usr_device:
+             dracut_devices.extend([usr_device])
+ 
++        # Does /home have its own device? If so, we need to tell dracut
++        home_device = storage.mountpoints.get("/home")
++        if home_device:
++            dracut_devices.extend([home_device])
++
+         netdevs = [d for d in storage.devices if (getattr(d, "complete", True) and
+                    isinstance(d, NetworkStorageDevice))]
+         rootdev = storage.root_device
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0063-do-not-customize-window-theme.patch b/meta-installer/recipes-installer/anaconda/files/0063-do-not-customize-window-theme.patch
new file mode 100644
index 0000000..d2656d0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0063-do-not-customize-window-theme.patch
@@ -0,0 +1,55 @@
+From 40530a0ca40763c92fffd0a0670bf1eb7b87e47e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 21 Jun 2017 22:42:15 +0800
+Subject: [PATCH 63/65] do not customize window theme
+
+The customized window theme may broke metacity.
+...
+|(metacity:2675): metacity-WARNING **: "(null)" found in configuration
+database is not a valid value for mouse button modifier
+...
+
+Also remove install-data-hook, which caused host contamination
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ data/window-manager/config/Makefile.am | 7 +------
+ pyanaconda/display.py                  | 2 +-
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/data/window-manager/config/Makefile.am b/data/window-manager/config/Makefile.am
+index 6d78347..f17ab6a 100644
+--- a/data/window-manager/config/Makefile.am
++++ b/data/window-manager/config/Makefile.am
+@@ -27,12 +27,7 @@ dist_schema_DATA = org.gnome.desktop.wm.keybindings.gschema.override \
+ # schemas they modify, so pretend that this is the case with symlinks and
+ # create the compiled schema.
+ install-data-hook:
+-	$(MKDIR_P) $(DESTDIR)$(schemadir)
+-	$(LN_S) -f /usr/share/glib-2.0/schemas/org.gnome.desktop.wm.keybindings.gschema.xml $(DESTDIR)$(schemadir)
+-	$(LN_S) -f /usr/share/glib-2.0/schemas/org.gnome.desktop.wm.preferences.gschema.xml $(DESTDIR)$(schemadir)
+-	$(LN_S) -f /usr/share/glib-2.0/schemas/org.gnome.metacity.gschema.xml $(DESTDIR)$(schemadir)
+-	$(LN_S) -f /usr/share/glib-2.0/schemas/org.gnome.desktop.enums.xml $(DESTDIR)$(schemadir)
+-	glib-compile-schemas --strict $(DESTDIR)$(schemadir)
++	echo "pass"
+ 
+ uninstall-local:
+ 	rm -f $(DESTDIR)$(schemadir)/*.xml
+diff --git a/pyanaconda/display.py b/pyanaconda/display.py
+index d3e599b..7f360df 100644
+--- a/pyanaconda/display.py
++++ b/pyanaconda/display.py
+@@ -164,7 +164,7 @@ def do_startup_x11_actions():
+     if 'XDG_DATA_DIRS' in os.environ:
+         xdg_data_dirs = datadir + '/window-manager:' + os.environ['XDG_DATA_DIRS']
+     else:
+-        xdg_data_dirs = datadir + '/window-manager:/usr/share'
++        xdg_data_dirs = '/usr/share'
+ 
+     childproc = iutil.startProgram(["metacity", "--display", ":1", "--sm-disable"],
+                                    env_add={'XDG_DATA_DIRS': xdg_data_dirs})
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0064-tweak-product-short-name.patch b/meta-installer/recipes-installer/anaconda/files/0064-tweak-product-short-name.patch
new file mode 100644
index 0000000..c7773c3
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0064-tweak-product-short-name.patch
@@ -0,0 +1,33 @@
+From d240618cb08b977bdadb365a61e9324804827780 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 10 Jul 2017 10:52:51 +0800
+Subject: [PATCH 64/65] tweak product short name
+
+The yocto named its production with braces which caused short name
+with illegal character that broke lvm partition.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/constants.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/pyanaconda/constants.py b/pyanaconda/constants.py
+index af421e1..af42791 100644
+--- a/pyanaconda/constants.py
++++ b/pyanaconda/constants.py
+@@ -41,7 +41,9 @@ isFinal = product.isFinal
+ 
+ # for use in device names, eg: "fedora", "rhel"
+ shortProductName = productName.lower()          # pylint: disable=no-member
+-if productName.count(" "):                      # pylint: disable=no-member
++if '(' in shortProductName and ')' in shortProductName:
++    shortProductName = shortProductName.split()[0]
++elif productName.count(" "):                      # pylint: disable=no-member
+     shortProductName = ''.join(s[0] for s in shortProductName.split())
+ 
+ # DriverDisc Paths
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0065-disable-dmraid.patch b/meta-installer/recipes-installer/anaconda/files/0065-disable-dmraid.patch
new file mode 100644
index 0000000..baa17d8
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0065-disable-dmraid.patch
@@ -0,0 +1,57 @@
+From be87c929e914a50e332cd3649159e8e504ff62f9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 19 Jul 2017 10:33:07 +0800
+Subject: [PATCH 65/65] disable dmraid
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ anaconda.py                     | 1 -
+ pyanaconda/anaconda_argparse.py | 4 ----
+ pyanaconda/flags.py             | 2 +-
+ 3 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/anaconda.py b/anaconda.py
+index 91d3fc0..3d2be2d 100755
+--- a/anaconda.py
++++ b/anaconda.py
+@@ -445,7 +445,6 @@ if __name__ == "__main__":
+     flags.mpathFriendlyNames = opts.mpathfriendlynames
+     flags.debug = opts.debug
+     flags.askmethod = opts.askmethod
+-    flags.dmraid = opts.dmraid
+     flags.mpath = opts.mpath
+     flags.ibft = opts.ibft
+     flags.selinux = opts.selinux
+diff --git a/pyanaconda/anaconda_argparse.py b/pyanaconda/anaconda_argparse.py
+index 35c4ed2..8d0c21a 100644
+--- a/pyanaconda/anaconda_argparse.py
++++ b/pyanaconda/anaconda_argparse.py
+@@ -496,10 +496,6 @@ def getArgumentParser(version_string, boot_cmdline=None):
+                     help=help_parser.help_text("nompath"))
+     ap.add_argument("--mpath", action="store_true", help=help_parser.help_text("mpath"))
+ 
+-    ap.add_argument("--nodmraid", dest="dmraid", action="store_false", default=True,
+-                    help=help_parser.help_text("nodmraid"))
+-    ap.add_argument("--dmraid", action="store_true", help=help_parser.help_text("dmraid"))
+-
+     ap.add_argument("--noibft", dest="ibft", action="store_false", default=True,
+                     help=help_parser.help_text("noibft"))
+     ap.add_argument("--ibft", action="store_true", help=help_parser.help_text("ibft"))
+diff --git a/pyanaconda/flags.py b/pyanaconda/flags.py
+index 7c5f3b4..4c5928e 100644
+--- a/pyanaconda/flags.py
++++ b/pyanaconda/flags.py
+@@ -49,7 +49,7 @@ class Flags(object):
+         self.usevnc = False
+         self.vncquestion = True
+         self.mpath = True
+-        self.dmraid = True
++        self.dmraid = False
+         self.selinux = SELINUX_DEFAULT
+         self.debug = False
+         self.armPlatform = None
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0066-tweak-shebang-of-bash.patch b/meta-installer/recipes-installer/anaconda/files/0066-tweak-shebang-of-bash.patch
new file mode 100644
index 0000000..ec1f223
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0066-tweak-shebang-of-bash.patch
@@ -0,0 +1,25 @@
+From 304202b2400fb6f4d6b507703121d31f4446e773 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 21 Aug 2017 11:29:29 +0800
+Subject: [PATCH] tweak shebang of bash
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ scripts/run-anaconda | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/run-anaconda b/scripts/run-anaconda
+index d31f70c..a774d45 100755
+--- a/scripts/run-anaconda
++++ b/scripts/run-anaconda
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ #
+ # Quick script to attach to tmux where anaconda is running
+ #
+-- 
+1.8.3.1
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0067-Tweak-label-name.patch b/meta-installer/recipes-installer/anaconda/files/0067-Tweak-label-name.patch
new file mode 100644
index 0000000..4aec96d
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0067-Tweak-label-name.patch
@@ -0,0 +1,56 @@
+From fbd17b0820e3309dd07281885fc3e9a5a2524cb5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 5 Sep 2017 14:01:20 +0800
+Subject: [PATCH] Tweak label name
+
+In yocto, the product name is too long, which enlarge
+the gui window, short them.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/product.py               | 4 ++++
+ pyanaconda/ui/gui/spokes/welcome.py | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/pyanaconda/product.py b/pyanaconda/product.py
+index b968129..b95563a 100644
+--- a/pyanaconda/product.py
++++ b/pyanaconda/product.py
+@@ -50,6 +50,10 @@ if productVersion == "development":
+     productVersion = "rawhide"
+ 
+ def distributionText():
++    if '(' in productName and ')' in productName:
++        return _("%(productName)s %(productVersion)s INSTALLATION") % \
++                 {"productName": productName.split()[0], "productVersion": productVersion}
++
+     return _("%(productName)s %(productVersion)s INSTALLATION") % \
+              {"productName": productName, "productVersion": productVersion}
+ 
+diff --git a/pyanaconda/ui/gui/spokes/welcome.py b/pyanaconda/ui/gui/spokes/welcome.py
+index d67cacd..25c3b76 100644
+--- a/pyanaconda/ui/gui/spokes/welcome.py
++++ b/pyanaconda/ui/gui/spokes/welcome.py
+@@ -37,7 +37,7 @@ from pyanaconda import flags
+ from pyanaconda import geoloc
+ from pyanaconda.i18n import _, C_
+ from pyanaconda.iutil import is_unsupported_hw, ipmi_abort
+-from pyanaconda.constants import DEFAULT_LANG, WINDOW_TITLE_TEXT
++from pyanaconda.constants import DEFAULT_LANG, WINDOW_TITLE_TEXT, shortProductName
+ 
+ import logging
+ log = logging.getLogger("anaconda")
+@@ -216,7 +216,7 @@ class WelcomeLanguageSpoke(LangLocaleHandler, StandaloneSpoke):
+         welcomeLabel = self.builder.get_object("welcomeLabel")
+ 
+         welcomeLabel.set_text(_("WELCOME TO %(name)s %(version)s.") %
+-                {"name" : productName.upper(), "version" : productVersion})         # pylint: disable=no-member
++                {"name" : shortProductName.upper(), "version" : productVersion})         # pylint: disable=no-member
+ 
+         # Retranslate the language (filtering) entry's placeholder text
+         languageEntry = self.builder.get_object("languageEntry")
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0068-livepayload.py-copy-grub-from-host-os.patch b/meta-installer/recipes-installer/anaconda/files/0068-livepayload.py-copy-grub-from-host-os.patch
new file mode 100644
index 0000000..a2f1f81
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0068-livepayload.py-copy-grub-from-host-os.patch
@@ -0,0 +1,51 @@
+From 1ae76a832f560356ce5802a16020dff432f6c128 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 15 Sep 2017 10:49:18 +0800
+Subject: [PATCH] livepayload.py: copy grub from host os
+
+The image install require both of grub and grub-efi to be
+installed, but oe-core has a file confliction error while
+install both of them (I have sent a fix to oe-core, but not reply)
+
+The temporary workaround is to copy it from host os
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyanaconda/payload/livepayload.py | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/pyanaconda/payload/livepayload.py b/pyanaconda/payload/livepayload.py
+index 1c41402..cc41d1e 100644
+--- a/pyanaconda/payload/livepayload.py
++++ b/pyanaconda/payload/livepayload.py
+@@ -36,6 +36,7 @@ from pyanaconda.iutil import ProxyString, ProxyStringError, lowerASCII
+ import hashlib
+ import glob
+ import functools
++import shutil
+ 
+ from pyanaconda.payload import ImagePayload, PayloadSetupError, PayloadInstallError
+ 
+@@ -160,6 +161,17 @@ class LiveImagePayload(ImagePayload):
+             if errorHandler.cb(exn) == ERROR_RAISE:
+                 raise exn
+ 
++        # Live needs grub-install, grub-set-default and grub-mkconf
++        # Copy it from host os
++        iutil.execWithRedirect("cp", ["-fr", "/etc/grub.d", iutil.getSysroot()+"/etc"])
++        iutil.execWithRedirect("cp", ["-fr", "/usr/share/grub", iutil.getSysroot()+"/usr/share"])
++        for pat in ["/usr/bin/grub-*", "/usr/sbin/grub-*"]:
++            for f in glob.glob(pat):
++                try:
++                    shutil.copy(f, iutil.getSysroot()+os.path.dirname(f))
++                except IOError as e:
++                    log.info("Could not copy file %s: %s", f, e.strerror)
++
+         # Wait for progress thread to finish
+         with self.pct_lock:
+             self.pct = 100
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/0069-test-existence-of-noverifyssl.patch b/meta-installer/recipes-installer/anaconda/files/0069-test-existence-of-noverifyssl.patch
new file mode 100644
index 0000000..43ac959
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/0069-test-existence-of-noverifyssl.patch
@@ -0,0 +1,31 @@
+From 277bfa0cf941ea58b9765805d88729080c2d3a70 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 27 Sep 2017 10:46:55 +0800
+Subject: [PATCH] test existence of noverifyssl
+
+While CDROM, the noverifyssl does not exist,
+the setting triger a failure.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ anaconda.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/anaconda.py b/anaconda.py
+index 3d2be2d..feb9b3b 100755
+--- a/anaconda.py
++++ b/anaconda.py
+@@ -531,7 +531,7 @@ if __name__ == "__main__":
+             iutil.setenv("ftp_proxy", proxy.url)
+             iutil.setenv("HTTPS_PROXY", proxy.url)
+ 
+-    if flags.noverifyssl:
++    if flags.noverifyssl and hasattr(ksdata.method, "noverifyssl"):
+         ksdata.method.noverifyssl = flags.noverifyssl
+     if opts.multiLib:
+         # sets dnf's multilib_policy to "all" (as opposed to "best")
+-- 
+2.7.4
+
diff --git a/meta-installer/recipes-installer/anaconda/files/81-edit-sudoers.ks b/meta-installer/recipes-installer/anaconda/files/81-edit-sudoers.ks
new file mode 100644
index 0000000..b1a7980
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/81-edit-sudoers.ks
@@ -0,0 +1,3 @@
+%post
+echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
+%end
diff --git a/meta-installer/recipes-installer/anaconda/files/wrlinux.py b/meta-installer/recipes-installer/anaconda/files/wrlinux.py
new file mode 100644
index 0000000..31abdae
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/files/wrlinux.py
@@ -0,0 +1,112 @@
+#
+# wrlinux.py
+#
+# Copyright (C) 2010  Red Hat, Inc.  All rights reserved.
+# Copyright (C) 2016  Wind River Systems,  All rights reserved.
+# Copyright (C) 2017  Wind River Systems,  All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+from pyanaconda.installclass import BaseInstallClass
+from pyanaconda.product import productName
+from pyanaconda import network
+from pyanaconda import nm
+from pyanaconda.flags import flags
+
+import configparser
+import os
+
+class WRLinuxBaseInstallClass(BaseInstallClass):
+    id = "wrlinux"
+    name = productName
+    sortPriority = 100000
+    defaultFS = "ext4"
+
+    bootloaderTimeoutDefault = 5
+
+    installUpdates = False
+
+    _l10n_domain = "comps"
+
+    efi_dir = "BOOT"
+
+    def setNetworkOnbootDefault(self, ksdata):
+        if any(nd.onboot for nd in ksdata.network.network if nd.device):
+            return
+        # choose first wired device having link
+        for dev in nm.nm_devices():
+            if nm.nm_device_type_is_wifi(dev):
+                continue
+            try:
+                link_up = nm.nm_device_carrier(dev)
+            except (nm.UnknownDeviceError, nm.PropertyNotFoundError):
+                continue
+            if link_up:
+                network.update_onboot_value(dev, True, ksdata=ksdata)
+                break
+
+    def __init__(self):
+        BaseInstallClass.__init__(self)
+
+    def read_buildstamp(self):
+        image = {}
+        tasks = {}
+
+        if not flags.livecdInstall:
+            config = configparser.ConfigParser()
+            config.read(["/tmp/product/.buildstamp", "/.buildstamp", os.environ.get("PRODBUILDPATH", "")])
+
+            image_list = (config.get("Rootfs", "LIST") or "").split()
+            for image_name in image_list:
+                image_summary = config.get(image_name, "SUMMARY")
+                image_description = config.get(image_name, "DESCRIPTION")
+                package_install = config.get(image_name, "PACKAGE_INSTALL")
+                package_install_attemptonly = config.get(image_name,
+                                                         "PACKAGE_INSTALL_ATTEMPTONLY")
+                image_linguas = config.get(image_name, "IMAGE_LINGUAS")
+                image[image_name] = (image_summary,
+                                     image_description,
+                                     package_install,
+                                     package_install_attemptonly,
+                                     image_linguas)
+
+                short_image = image_name.replace("%s-image-" % self.id, "")
+
+                taskid = short_image
+                name = image_name
+                description = "%s" % image_summary
+                group = ""
+                tasks[taskid] = (name, description, group)
+
+                taskid = "%s-dev" % short_image
+                name = "%s dev-pkgs staticdev-pkgs" % image_name
+                description = "%s with development files" % image_summary
+                group = "dev-pkgs staticdev-pkgs"
+                tasks[taskid] = (name, description, group)
+
+                taskid = "%s-dbg" % short_image
+                name = "%s dbg-pkgs" % image_name
+                description = "%s with debug symbols" % image_summary
+                group = "dbg-pkgs"
+                tasks[taskid] = (name, description, group)
+
+                taskid = "%s-dev-dbg" % short_image
+                name = "%s dev-pkgs staticdev-pkgs dbg-pkgs" % image_name
+                description = "%s with development files and debug symbols" % image_summary
+                group = "dev-pkgs staticdev-pkgs dbg-pkgs"
+                tasks[taskid] = (name, description, group)
+
+        return image, tasks
+
diff --git a/meta-installer/recipes-installer/anaconda/python3-anaconda_26.21.11.bb b/meta-installer/recipes-installer/anaconda/python3-anaconda_26.21.11.bb
new file mode 100755
index 0000000..36cbaa0
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda/python3-anaconda_26.21.11.bb
@@ -0,0 +1,161 @@
+SUMMARY = "The anaconda package"
+DESCRIPTION = "The anaconda package"
+HOMEPAGE = "http://fedoraproject.org/wiki/Anaconda"
+LICENSE = "GPLv2"
+SECTION = "devel"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "e2fsprogs gettext libarchive \
+           pango python3 rpm \
+           "
+
+DEPENDS += "libxklavier glade libxml2-native \
+            gdk-pixbuf-native \
+            "
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "e2fsprogs e2fsprogs-e2fsck e2fsprogs-mke2fs \
+                   e2fsprogs-tune2fs e2fsprogs-resize2fs \
+                   ntfsprogs xfsprogs btrfs-tools nfs-utils-client \
+                   parted dosfstools gzip libarchive lvm2 \
+                   squashfs-tools openssh python3 python3-misc \
+                   python3-modules  python3-dbus python3-pyparted \
+                   python3-pykickstart \
+                   dmidecode python3-meh python3-libreport localedef \
+                   python3-pygobject python3-rpm grub usermode tigervnc \
+                   tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
+                   tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
+                   tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific \
+                   keybinder module-init-tools dnf util-linux efibootmgr \
+                   ca-certificates isomd5sum \
+                   btrfs-tools ntfs-3g iproute2 mdadm shadow chkconfig \
+                   util-linux-swaponoff util-linux-uuidgen python3-blivet \
+                   xrandr glibc-charmaps glibc-localedatas \
+                   python3-pytz python3-langtable python3-libpwquality \
+                   python3-ntplib libgnomekbd libtimezonemap \
+                   procps python3-prctl rsync glibc-utils python3-pid \
+                   python3-ordered-set python3-wrapt python3-coverage \
+                   python3-requests-file python3-requests-ftp \
+                   python3-blivetgui librsvg librsvg-gtk bash \
+                "
+
+RDEPENDS_${PN} += "networkmanager libnmutil libnmglib libnmglib-vpn \
+                   network-manager-applet \
+"
+
+SRC_URI = "git://github.com/rhinstaller/anaconda;protocol=https;branch=f26-release \
+           file://wrlinux.py \
+           file://81-edit-sudoers.ks \
+           file://0001-do-not-support-po.patch \
+           file://0002-widgets-Makefile.am-do-not-compile-doc.patch \
+           file://0003-Revert-Use-system-Python-when-running-Anaconda.patch \
+           file://0004-pyanaconda-flags.py-drop-selinux-module.patch \
+           file://0005-add-package-site-dir-for-installclass-searching.patch \
+           file://0006-do-not-load-the-system-wide-Xresources.patch \
+           file://0007-tweak-iso-mount-dir-and-kernel-name.patch \
+           file://0008-dnfpayload.py-customize-for-WRLinux.patch \
+           file://0009-Remove-unnecessary-noverifyssl-for-http-ftp-protocol.patch \
+           file://0010-dynamic-detect-workable-locale.patch \
+           file://0011-improve-thread-monitor.patch \
+           file://0012-disable-audit.patch \
+           file://0013-bootloader.py-Change-grub2-settings-to-match-oe-core.patch \
+           file://0014-tweak-detect-kernel-version.patch \
+           file://0015-tweak-grub-config-file-for-WRLinux.patch \
+           file://0016-Revert-Use-time.tzset-to-apply-timezone-changes-when.patch \
+           file://0017-kickstart-Authconfig-Firewall-Firstboot-Timezone.patch \
+           file://0018-invisible-help-button.patch \
+           file://0019-disable-non-implemented-functions.patch \
+           file://0020-disable-geoloc-by-default.patch \
+           file://0021-support-UEFI-boot.patch \
+           file://0022-do-not-verify-ssl-certification-by-default.patch \
+           file://0023-tweak-default-nfs-mount-point.patch \
+           file://0024-fix-quoted-empty-string-failed.patch \
+           file://0025-do-not-support-ISO-hold-by-hard-drive-partitions.patch \
+           file://0026-fix-cannot-stat-usr-share-gettext-gettext.h.patch \
+           file://0027-fix-Wind-River-boot-menu-not-work.patch \
+           file://0028-tweak-bootloader-fs-type.patch \
+           file://0029-support-timezone-setting.patch \
+           file://0030-disable-ntp-support.patch \
+           file://0031-do-not-support-manually-set-time.patch \
+           file://0032-support-user-account-creation.patch \
+           file://0033-detect-existence-of-Xorg.patch \
+           file://0034-fix-write-network-conf-failed-while-liveinst.patch \
+           file://0035-revert-commits-to-support-reboot-for-live-installs.patch \
+           file://0036-text-repository-setting-do-not-support-local-ISO-fil.patch \
+           file://0037-text-repository-setting-support-http-proxy.patch \
+           file://0038-set-keyboard-xlayouts-with-us-by-default.patch \
+           file://0039-text-do-not-support-network-setting-for-now.patch \
+           file://0040-tweak-boot-storage-sanity-check.patch \
+           file://0041-kickstart-do-not-support-network-configuration.patch \
+           file://0042-support-to-get-kickstart-from-network.patch \
+           file://0043-support-authentication-for-kickstart.patch \
+           file://0044-support-downloading-file-from-http-ftp-server-to-tar.patch \
+           file://0045-live-install-supports-kickstart.patch \
+           file://0046-support-initramfs-boot.patch \
+           file://0047-fix-hang-while-installed-system-reboot.patch \
+           file://0048-fix-installed-system-boot-from-encrypt-fs-failed.patch \
+           file://0049-installation-destination-disable-iSCSI-network-disks.patch \
+           file://0050-update-region-while-city-changes.patch \
+           file://0051-timezone-fix-set-US-Alaska-failed.patch \
+           file://0052-remove-incorrect-prefix-of-addon-repo-url.patch \
+           file://0053-fix-write-sysconfig-network-failed.patch \
+           file://0054-pyanaconda-ui-gui-utils.py-tweak-mouse-arrow.patch \
+           file://0055-tweak-search-location-of-new-kernel-pkg.patch \
+           file://0056-always-write-fstab-after-install.patch \
+           file://0057-invoke-grub-install-to-generate-efi-filesystem.patch \
+           file://0058-do-not-support-closest-mirror.patch \
+           file://0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch \
+           file://0060-tweak-time-setting.patch \
+           file://0062-Add-dracut-args-for-home-to-bootloader.patch \
+           file://0063-do-not-customize-window-theme.patch \
+           file://0064-tweak-product-short-name.patch \
+           file://0065-disable-dmraid.patch \
+           file://0066-tweak-shebang-of-bash.patch \
+           file://0067-Tweak-label-name.patch \
+           file://0068-livepayload.py-copy-grub-from-host-os.patch \
+           file://0069-test-existence-of-noverifyssl.patch \
+          "
+
+SRCREV = "3007d202469f90ef9bb7580ff4068a345ba1e588"
+
+FILES_${PN}-dbg += "${libexecdir}/anaconda/.debug ${PYTHON_SITEPACKAGES_DIR}/pyanaconda/.debug"
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/pyanaconda/_isys.a"
+FILES_${PN} = "/lib ${libdir} ${sysconfdir} ${bindir} ${sbindir} ${libexecdir} \
+              ${datadir}/anaconda ${datadir}/applications ${datadir}/glade \
+              ${PYTHON_SITEPACKAGES_DIR}/pyanaconda ${PYTHON_SITEPACKAGES_DIR}/log_picker \
+              ${datadir}/themes \
+"
+FILES_${PN}-misc = "/usr/lib"
+PACKAGES += "${PN}-misc"
+RDEPENDS_${PN}-misc += "bash python3-core"
+
+EXTRA_OECONF += "--disable-selinux \
+         --with-sysroot=${PKG_CONFIG_SYSROOT_DIR} \
+"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd x11"
+
+inherit autotools-brokensep gettext python3native pkgconfig gobject-introspection
+
+do_configure_prepend() {
+    ( cd ${S}; STAGING_DATADIR_NATIVE=${STAGING_DATADIR_NATIVE} ${S}/autogen.sh --noconfigure)
+}
+
+do_install_append() {
+    install -m 644 ${WORKDIR}/81-edit-sudoers.ks ${D}${datadir}/anaconda/post-scripts
+    install -m 644 ${S}/widgets/src/resources/*.svg ${D}${datadir}/anaconda/pixmaps
+    install -m 644 ${S}/widgets/src/resources/*.png ${D}${datadir}/anaconda/pixmaps
+}
+
+addtask do_setupdistro after do_patch before do_configure
+do_setupdistro() {
+    cp ${WORKDIR}/wrlinux.py ${S}/pyanaconda/installclasses/
+}
+
+python __anonymous () {
+    if not bb.utils.contains("PACKAGE_CLASSES", "package_rpm", True, False, d):
+        raise bb.parse.SkipPackage('Anaconda requires RPM packages to be the default in PACKAGE_CLASSES.')
+}
-- 
2.8.1


