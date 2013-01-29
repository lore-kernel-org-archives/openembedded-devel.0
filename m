Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0AZd-00061d-Fb
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 13:46:03 +0100
Received: by mail-pb0-f43.google.com with SMTP id jt11so256765pbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=al5lVL3TtqH2Jiz1hMpRImFsLZ5qd96GqV5dHsUHYg0=;
	b=T6/wG1NdHUA7iT91FYi+Eofx9FXRjP70M5FoRlH6zDN41pH6JoX+XI6gWpGdENCrfF
	Gt8VsfvRJxO5Tsadc0ftHBbm8SLc2XjOzx2FCX47E1KSyjaq4dzCXNf1v+hH9qe4QBqi
	47wArU43ZcQPgpV1XPk2qOY3wiCyYrfH+uRPkPOuyQS0hz/wMxUGIAaPgUQgL49pSWxt
	Yv5Dis+r8ugwF+GENYLxL1YYoeuTSxa+o/k6mWkNZSt6/2dfeXqZSsAm3pMA4pJkHc6/
	jiFP7gaRlJEkIIRGY2abdfZo5OLMq39TIOpX/LGqKoRqKxY4W87c9VI3VTu7p765ZdMR
	Ccqw==
X-Received: by 10.66.76.130 with SMTP id k2mr2127731paw.76.1359462621084;
	Tue, 29 Jan 2013 04:30:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ob9sm4649112pbb.73.2013.01.29.04.30.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:30:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:29:51 +0100
Message-Id: <8a28d343965dd467ccf72709642e2fc065d9b992.1359462547.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] vim: implement gvim, vim-tiny as PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 12:46:05 -0000

* only one of those should be built in sysroot, otherwise they were
  overwritting files provided by other alternatives
* define PACKAGECONFIG options
* there are no RCONFLICTS/RREPLACES/RPROVIDES, because it depends on
  selected PACKAGECONFIGs
* add PN to VIMDIR and use VIMDIR where undefined VIMVER was
  (e.g. "${PN}${VIMVER}")
* move checksums from .inc to recipe
* vim/gvim/vim-tiny conflict is now fatal, with
  http://patches.openembedded.org/patch/43105/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/gvim_7.2.446.bb     | 14 --------
 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb | 11 ------
 meta-oe/recipes-support/vim/vim.inc             | 47 +++++++++++--------------
 meta-oe/recipes-support/vim/vim_7.2.446.bb      | 31 +++++-----------
 4 files changed, 30 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/gvim_7.2.446.bb
 delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb

diff --git a/meta-oe/recipes-support/vim/gvim_7.2.446.bb b/meta-oe/recipes-support/vim/gvim_7.2.446.bb
deleted file mode 100644
index fbc763a..0000000
--- a/meta-oe/recipes-support/vim/gvim_7.2.446.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-VIMGUI = "gtk2"
-VIMX = "--with-x"
-
-require vim_${PV}.bb
-
-PR = "${INC_PR}.4"
-
-DEPENDS += "gtk+ xt"
-
-FILES_${PN} += "${datadir}/vim"
-
-EXTRA_OECONF += "--enable-gtk2-test"
-
-RREPLACES_${PN} = "vim vim-tiny"
diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb b/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
deleted file mode 100644
index d29b801..0000000
--- a/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-VIMFEATURES = "tiny"
-
-require vim_${PV}.bb
-
-PR = "${INC_PR}.4"
-
-RCONFLICTS_${PN} = "gvim vim"
-
-PACKAGES =+ "${PN}-data"
-
-FILES_${PN}-data = "${datadir}/vim"
diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index 16ca58d..ca36bf1 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -7,17 +7,18 @@ LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://README.txt;md5=72c4840d07b65659b60b3fa405c7da36"
 
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-VIMDIR = "${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
+VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = " \
-  ftp://ftp.vim.org/pub/vim/unix/vim-${PV_MAJOR}.tar.bz2;name=vim${PV_MAJOR}tarbz2 \
-  ftp://ftp.vim.org/pub/vim/extra/vim-${PV_MAJOR}-extra.tar.gz;name=vim${PV_MAJOR}extratargz \
-  ftp://ftp.vim.org/pub/vim/extra/vim-${PV_MAJOR}-lang.tar.gz;name=vim${PV_MAJOR}langtargz \
+  ftp://ftp.${PN}.org/pub/${PN}/unix/${PN}-${PV_MAJOR}.tar.bz2;name=${VIMDIR} \
+  ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-extra.tar.gz;name=${VIMDIR}-extra \
+  ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-lang.tar.gz;name=${VIMDIR}-lang \
+  file://vimrc \
 "
 
-S = "${WORKDIR}/vim${VIMDIR}/src"
+S = "${WORKDIR}/${VIMDIR}/src"
 
 inherit autotools update-alternatives
 
@@ -32,16 +33,14 @@ do_configure () {
   touch auto/config.mk auto/config.h
 }
 
+#Available PACKAGECONFIG options are gtkgui, x11, tiny
+PACKAGECONFIG ??= ""
 
-
-VIMFEATURES ?= "big"
-VIMX ?= "--without-x"
-VIMGUI ?= "no"
+PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
+PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 
 EXTRA_OECONF = " \
-  --enable-gui=${VIMGUI} \
-  --with-features=${VIMFEATURES} \
-  ${VIMX} \
   --disable-gpm \
   --disable-gtktest \
   --disable-xim \
@@ -59,24 +58,20 @@ EXTRA_OECONF = " \
 
 # Work around rpm picking up csh as a dep
 do_install_append() {
-	chmod -x ${D}${datadir}/vim/vim72/tools/vim132
+	chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132
+	install -m 0644 ${WORKDIR}/vimrc ${D}/${datadir}/${PN}
 }
 
-PACKAGES =+ "vim-common vim-syntax vim-help vim-tutor"
-FILES_vim-syntax = "${datadir}/vim/vim${VIMVER}/syntax"
-FILES_vim-help = "${datadir}/vim/vim${VIMVER}/doc"
-FILES_vim-tutor = "${datadir}/vim/vim${VIMVER}/tutor ${bindir}/vimtutor"
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
+FILES_${PN}-syntax = "${datadir}/${PN}/${VIMDIR}/syntax"
+FILES_${PN}-help = "${datadir}/${PN}/${VIMDIR}/doc"
+FILES_${PN}-tutor = "${datadir}/${PN}/${VIMDIR}/tutor ${bindir}/${PN}tutor"
+FILES_${PN}-vimrc = "${datadir}/${PN}/vimrc"
+FILES_${PN}-data = "${datadir}/${PN}"
 
 ALTERNATIVE_NAME = "vi"
-ALTERNATIVE_PATH = "${bindir}/vim"
+ALTERNATIVE_PATH = "${bindir}/${PN}"
 ALTERNATIVE_LINK = "${base_bindir}/vi"
 ALTERNATIVE_PRIORITY = "100"
 
-SRC_URI[vim7.2tarbz2.md5sum] = "f0901284b338e448bfd79ccca0041254"
-SRC_URI[vim7.2tarbz2.sha256sum] = "914db0f2205ebd6f02878295ec2506036ea7500399db112c61a01491cd9a1d86"
-SRC_URI[vim7.2langtargz.md5sum] = "d8884786979e0e520c112faf2e176f05"
-SRC_URI[vim7.2langtargz.sha256sum] = "11607f539a4518b550bf1606b7d3a6f36c1ffdf566c058e7d94bced78034cd5b"
-SRC_URI[vim7.2extratargz.md5sum] = "35e04482f07c57221c9a751aaa3b8dac"
-SRC_URI[vim7.2extratargz.sha256sum] = "20894ac79672160bfc4f1d2f9f9775b34d944762d655307a91ca96d358faa04d"
-
 PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-support/vim/vim_7.2.446.bb b/meta-oe/recipes-support/vim/vim_7.2.446.bb
index 62d76d7..ef9f3c9 100644
--- a/meta-oe/recipes-support/vim/vim_7.2.446.bb
+++ b/meta-oe/recipes-support/vim/vim_7.2.446.bb
@@ -1,15 +1,6 @@
-# vim-tiny sets that too
-VIMFEATURES ?= "big"
+require ${PN}.inc
 
-# GUI type - gvim recipe sets "gtk2"
-VIMGUI ?= "no"
-
-# gvim recipes uses "--with-x"
-VIMX ?= "--without-x"
-
-require vim.inc
-
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
 
 # 001-446; 401-446 are not yet available online
 SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=p001-100;apply=yes;patchdir=..;pnum=0"
@@ -18,6 +9,13 @@ SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=p201-300;
 SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=p301-400;apply=yes;patchdir=..;pnum=0"
 SRC_URI += "file://401-446.diff;patchdir=..;pnum=0"
 
+SRC_URI[vim72.md5sum] = "f0901284b338e448bfd79ccca0041254"
+SRC_URI[vim72.sha256sum] = "914db0f2205ebd6f02878295ec2506036ea7500399db112c61a01491cd9a1d86"
+SRC_URI[vim72-lang.md5sum] = "d8884786979e0e520c112faf2e176f05"
+SRC_URI[vim72-lang.sha256sum] = "11607f539a4518b550bf1606b7d3a6f36c1ffdf566c058e7d94bced78034cd5b"
+SRC_URI[vim72-extra.md5sum] = "35e04482f07c57221c9a751aaa3b8dac"
+SRC_URI[vim72-extra.sha256sum] = "20894ac79672160bfc4f1d2f9f9775b34d944762d655307a91ca96d358faa04d"
+
 SRC_URI[p001-100.md5sum] = "ba91b19374cee90f71b8f4ab1d92dc0f"
 SRC_URI[p001-100.sha256sum] = "519f4fea460e4f7a737ea8006c0dc1684982f8372d1581fb963a5d58f8007f67"
 SRC_URI[p101-200.md5sum] = "b485233d360041d043c56cd99057dbff"
@@ -28,14 +26,3 @@ SRC_URI[p301-400.md5sum] = "137b5821ff4a2266796d14d867be5f9f"
 SRC_URI[p301-400.sha256sum] = "41f022ec829786a008685c0b00acf8be09525755a94a06236a4b879b1f84b5f4"
 
 SRC_URI += "file://configure.in_remove_CC_quotes.patch;patchdir=.."
-SRC_URI += "file://vimrc"
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/vimrc ${D}/${datadir}/vim
-}
-
-RCONFLICTS_${PN} = "gvim"
-RREPLACES_${PN} = "vim-tiny"
-PACKAGES =+ "${PN}-vimrc"
-
-FILES_${PN}-vimrc = "${datadir}/vim/vimrc"
-- 
1.8.1.2



