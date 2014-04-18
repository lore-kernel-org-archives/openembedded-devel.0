Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9492B65DF0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 10:16:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3IAGaAd016826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 03:16:36 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 18 Apr 2014 03:16:35 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Apr 2014 18:16:30 +0800
Message-ID: <deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397816030.git.Chong.Lu@windriver.com>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] vim: add dependency and selinux and acl support control
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
X-List-Received-Date: Fri, 18 Apr 2014 10:16:35 -0000
Content-Type: text/plain

1. Add explicit selinux and acl support control.
2. Vim depends on gettext-native, add to the dependency list.
3. Split binary file into vim package and put others in vim-common.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/vim/vim_7.4.258.bb | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 878c79e..023e8fc 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Vi IMproved - enhanced vi editor"
 SECTION = "console/utils"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
@@ -28,11 +28,14 @@ do_configure () {
 
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??= ""
+PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 
 PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 
 EXTRA_OECONF = " \
     --disable-gpm \
@@ -68,6 +71,21 @@ FILES_${PN}-help = "${datadir}/${PN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${PN}/${VIMDIR}/tutor ${bindir}/${PN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${PN}/vimrc"
 FILES_${PN}-data = "${datadir}/${PN}"
+FILES_${PN}-common = " \
+    ${datadir}/${PN}/${VIMDIR}/*.vim \
+    ${datadir}/${PN}/${VIMDIR}/autoload \
+    ${datadir}/${PN}/${VIMDIR}/colors \
+    ${datadir}/${PN}/${VIMDIR}/compiler \
+    ${datadir}/${PN}/${VIMDIR}/ftplugin \
+    ${datadir}/${PN}/${VIMDIR}/indent \
+    ${datadir}/${PN}/${VIMDIR}/keymap \
+    ${datadir}/${PN}/${VIMDIR}/lang \
+    ${datadir}/${PN}/${VIMDIR}/macros \
+    ${datadir}/${PN}/${VIMDIR}/plugin \
+    ${datadir}/${PN}/${VIMDIR}/print \
+    ${datadir}/${PN}/${VIMDIR}/spell \
+    ${datadir}/${PN}/${VIMDIR}/tools \
+"
 
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
-- 
1.8.1.2


