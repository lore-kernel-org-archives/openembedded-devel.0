Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20C3165D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 09:53:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9F9rVvv004445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 02:53:34 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 02:53:32 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Oct 2014 05:53:31 -0400
Message-ID: <1413366811-1259-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: add recipe for vim-tiny
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
X-List-Received-Date: Wed, 15 Oct 2014 09:53:35 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- split the vim recipe to two files
- add bb for vim-tiny based on PACKAGECONFIG defined in .inc file
- use trim_version to get VIMDIR

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb | 15 ++++++
 meta-oe/recipes-support/vim/vim.inc             | 65 ++++++++++++++++++++++
 meta-oe/recipes-support/vim/vim_7.4.373.bb      | 71 ++-----------------------
 3 files changed, 85 insertions(+), 66 deletions(-)
 create mode 100644 meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb
 create mode 100644 meta-oe/recipes-support/vim/vim.inc

diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb b/meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb
new file mode 100644
index 0000000..f77a717
--- /dev/null
+++ b/meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb
@@ -0,0 +1,15 @@
+require vim.inc
+
+PACKAGECONFIG += "tiny"
+
+do_install() {
+    install -d ${D}/${base_bindir}
+    install -m 0755 ${S}/vim ${D}/${base_bindir}/${BPN}
+    install -d ${D}/${datadir}/vim
+    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/vim/virc
+}
+
+FILES_${PN} += "${datadir}/vim/virc"
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_TARGET = "${base_bindir}/${BPN}"
diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
new file mode 100644
index 0000000..8729ee1
--- /dev/null
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -0,0 +1,65 @@
+SUMMARY = "Vi IMproved - enhanced vi editor"
+SECTION = "console/utils"
+DEPENDS = "ncurses gettext-native"
+# vimdiff doesn't like busybox diff
+RSUGGESTS_${PN} = "diffutils"
+LICENSE = "vim"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
+
+SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
+           file://disable_acl_header_check.patch;patchdir=.. \
+           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
+"
+SRCREV = "v${@d.getVar('PV', True).replace('.', '-')}"
+
+S = "${WORKDIR}/vim/src"
+
+VIMDIR = "vim${@oe.utils.trim_version('${PV}', 2).replace('.', '')}"
+
+inherit autotools update-alternatives
+inherit autotools-brokensep
+
+# vim configure.in contains functions which got 'dropped' by autotools.bbclass
+do_configure () {
+    rm -f auto/*
+    touch auto/config.mk
+    aclocal
+    autoconf
+    oe_runconf
+    touch auto/configure
+    touch auto/config.mk auto/config.h
+}
+
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
+PACKAGECONFIG ??= ""
+PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+
+PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
+PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
+PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
+
+EXTRA_OECONF = " \
+    --disable-gpm \
+    --disable-gtktest \
+    --disable-xim \
+    --disable-netbeans \
+    --with-tlib=ncurses \
+    ac_cv_small_wchar_t=no \
+    vim_cv_getcwd_broken=no \
+    vim_cv_memmove_handles_overlap=yes \
+    vim_cv_stat_ignores_slash=no \
+    vim_cv_terminfo=yes \
+    vim_cv_tgent=non-zero \
+    vim_cv_toupper_broken=no \
+    vim_cv_tty_group=world \
+    STRIP=/bin/true \
+"
+
+PARALLEL_MAKEINST = ""
+
+ALTERNATIVE_${PN} = "vi"
+ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
diff --git a/meta-oe/recipes-support/vim/vim_7.4.373.bb b/meta-oe/recipes-support/vim/vim_7.4.373.bb
index 81c0ddf..28e46c5 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.373.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.373.bb
@@ -1,63 +1,4 @@
-SUMMARY = "Vi IMproved - enhanced vi editor"
-SECTION = "console/utils"
-DEPENDS = "ncurses gettext-native"
-# vimdiff doesn't like busybox diff
-RSUGGESTS_${PN} = "diffutils"
-LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
-
-SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
-           file://disable_acl_header_check.patch;patchdir=.. \
-           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-"
-SRCREV = "v7-4-373"
-
-S = "${WORKDIR}/${BPN}/src"
-
-VIMDIR = "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
-
-inherit autotools update-alternatives
-inherit autotools-brokensep
-
-# vim configure.in contains functions which got 'dropped' by autotools.bbclass
-do_configure () {
-    rm -f auto/*
-    touch auto/config.mk
-    aclocal
-    autoconf
-    oe_runconf
-    touch auto/configure
-    touch auto/config.mk auto/config.h
-}
-
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
-PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
-PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
-
-PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
-PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
-PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
-
-EXTRA_OECONF = " \
-    --disable-gpm \
-    --disable-gtktest \
-    --disable-xim \
-    --disable-netbeans \
-    --with-tlib=ncurses \
-    ac_cv_small_wchar_t=no \
-    vim_cv_getcwd_broken=no \
-    vim_cv_memmove_handles_overlap=yes \
-    vim_cv_stat_ignores_slash=no \
-    vim_cv_terminfo=yes \
-    vim_cv_tgent=non-zero \
-    vim_cv_toupper_broken=no \
-    vim_cv_tty_group=world \
-    STRIP=/bin/true \
-"
+require vim.inc
 
 do_install_append() {
     # Work around rpm picking up csh or awk or perl as a dep
@@ -69,8 +10,6 @@ do_install_append() {
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 }
 
-PARALLEL_MAKEINST = ""
-
 PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc"
 FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
 FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
@@ -96,7 +35,7 @@ FILES_${PN}-common = " \
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
-ALTERNATIVE_${PN} = "vi"
-ALTERNATIVE_TARGET[vi] = "${bindir}/${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
-ALTERNATIVE_PRIORITY[vi] = "100"
+RREPLACES_${PN} = "vim-tiny"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_TARGET = "${bindir}/${BPN}"
-- 
2.0.0


