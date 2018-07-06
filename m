Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (unknown [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 614B0746E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org; 
	s=default;
	h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kZ6TgNMtIM5rynyggBIHOGbIFjT1KI9YHqJBOPh1QUM=;
	b=RRlMDb3oYIR12W2oyDJ20k+LEv
	DyBbWqUcBlpV+WBp3kQ/0guj9Q64LJVBEUkAhUHYRuW7HxjhOjAGAQ+4qoF49np8Is+6gFMEO4+B9
	VUKw/4+f0UPSKyIs3wjgEn9M99gPCPxSIe4Mp79f6aH7O0IwrAImUfYoShhCYzIjztLE=; 
Received: from [78.130.197.177] (port=58058 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.91)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1fbMoa-0001nj-J0; Fri, 06 Jul 2018 12:14:08 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2018 12:14:02 +0300
Message-Id: <1530868443-19241-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] vim: update to 8.1.0155
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
X-List-Received-Date: Fri, 06 Jul 2018 09:14:09 -0000

Update vim to the latest version 8.1.0155.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb |  13 ---
 meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb  |  13 +++
 meta-oe/recipes-support/vim/vim_8.1.0.116.bb      | 113 ----------------------
 meta-oe/recipes-support/vim/vim_8.1.0155.bb       | 113 ++++++++++++++++++++++
 4 files changed, 126 insertions(+), 126 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
 create mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
 delete mode 100644 meta-oe/recipes-support/vim/vim_8.1.0.116.bb
 create mode 100644 meta-oe/recipes-support/vim/vim_8.1.0155.bb

diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
deleted file mode 100644
index bb8f2b7..0000000
--- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require vim_${PV}.bb
-
-SUMMARY += " (with tiny features)"
-
-PACKAGECONFIG += "tiny"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
-}
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
new file mode 100644
index 0000000..bb8f2b7
--- /dev/null
+++ b/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
@@ -0,0 +1,13 @@
+require vim_${PV}.bb
+
+SUMMARY += " (with tiny features)"
+
+PACKAGECONFIG += "tiny"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
+}
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
deleted file mode 100644
index f669dfe..0000000
--- a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
+++ /dev/null
@@ -1,113 +0,0 @@
-SUMMARY = "Vi IMproved - enhanced vi editor"
-SECTION = "console/utils"
-DEPENDS = "ncurses gettext-native"
-# vimdiff doesn't like busybox diff
-RSUGGESTS_${PN} = "diffutils"
-LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
-
-SRC_URI = "git://github.com/vim/vim.git \
-           file://disable_acl_header_check.patch;patchdir=.. \
-           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-"
-SRCREV = "a87b72cc316e065d66dcbcf7ec1cde330adef3a3"
-
-S = "${WORKDIR}/git/src"
-
-VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-
-inherit autotools-brokensep update-alternatives
-
-CLEANBROKEN = "1"
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
-PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
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
-    vim_cv_tgetent=non-zero \
-    vim_cv_toupper_broken=no \
-    vim_cv_tty_group=world \
-    STRIP=/bin/true \
-"
-
-do_install() {
-    autotools_do_install
-
-    # Work around file-rdeps picking up csh, awk, perl or python as a dep
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-
-    # Install example vimrc from runtime files
-    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
-
-    # we use --with-features=big as default
-    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
-}
-
-PARALLEL_MAKEINST = ""
-
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
-FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
-FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
-FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
-FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
-FILES_${PN}-data = "${datadir}/${BPN}"
-FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
-FILES_${PN}-common = " \
-    ${datadir}/${BPN}/${VIMDIR}/*.vim \
-    ${datadir}/${BPN}/${VIMDIR}/autoload \
-    ${datadir}/${BPN}/${VIMDIR}/colors \
-    ${datadir}/${BPN}/${VIMDIR}/compiler \
-    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
-    ${datadir}/${BPN}/${VIMDIR}/indent \
-    ${datadir}/${BPN}/${VIMDIR}/keymap \
-    ${datadir}/${BPN}/${VIMDIR}/lang \
-    ${datadir}/${BPN}/${VIMDIR}/macros \
-    ${datadir}/${BPN}/${VIMDIR}/plugin \
-    ${datadir}/${BPN}/${VIMDIR}/print \
-    ${datadir}/${BPN}/${VIMDIR}/spell \
-    ${datadir}/icons \
-"
-
-RDEPENDS_${BPN} = "ncurses-terminfo-base"
-# Recommend that runtime data is installed along with vim
-RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
-
-ALTERNATIVE_${PN} = "vi vim"
-ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
-ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
-ALTERNATIVE_PRIORITY = "100"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0155.bb b/meta-oe/recipes-support/vim/vim_8.1.0155.bb
new file mode 100644
index 0000000..532b50c
--- /dev/null
+++ b/meta-oe/recipes-support/vim/vim_8.1.0155.bb
@@ -0,0 +1,113 @@
+SUMMARY = "Vi IMproved - enhanced vi editor"
+SECTION = "console/utils"
+DEPENDS = "ncurses gettext-native"
+# vimdiff doesn't like busybox diff
+RSUGGESTS_${PN} = "diffutils"
+LICENSE = "vim"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
+
+SRC_URI = "git://github.com/vim/vim.git \
+           file://disable_acl_header_check.patch;patchdir=.. \
+           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
+"
+SRCREV = "ae728edc93fe5a2f8c39fa75b1ae9ed71526858c"
+
+S = "${WORKDIR}/git/src"
+
+VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
+
+inherit autotools-brokensep update-alternatives
+
+CLEANBROKEN = "1"
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
+PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
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
+    vim_cv_tgetent=non-zero \
+    vim_cv_toupper_broken=no \
+    vim_cv_tty_group=world \
+    STRIP=/bin/true \
+"
+
+do_install() {
+    autotools_do_install
+
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
+
+    # Install example vimrc from runtime files
+    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
+
+    # we use --with-features=big as default
+    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
+}
+
+PARALLEL_MAKEINST = ""
+
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
+FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
+FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
+FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
+FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
+FILES_${PN}-data = "${datadir}/${BPN}"
+FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
+FILES_${PN}-common = " \
+    ${datadir}/${BPN}/${VIMDIR}/*.vim \
+    ${datadir}/${BPN}/${VIMDIR}/autoload \
+    ${datadir}/${BPN}/${VIMDIR}/colors \
+    ${datadir}/${BPN}/${VIMDIR}/compiler \
+    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
+    ${datadir}/${BPN}/${VIMDIR}/indent \
+    ${datadir}/${BPN}/${VIMDIR}/keymap \
+    ${datadir}/${BPN}/${VIMDIR}/lang \
+    ${datadir}/${BPN}/${VIMDIR}/macros \
+    ${datadir}/${BPN}/${VIMDIR}/plugin \
+    ${datadir}/${BPN}/${VIMDIR}/print \
+    ${datadir}/${BPN}/${VIMDIR}/spell \
+    ${datadir}/icons \
+"
+
+RDEPENDS_${BPN} = "ncurses-terminfo-base"
+# Recommend that runtime data is installed along with vim
+RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
+
+ALTERNATIVE_${PN} = "vi vim"
+ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
+ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
+ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
+ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


