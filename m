Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 902256FAB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:28:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s568Sn2l023236
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:28:49 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 01:28:49 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jun 2014 04:28:45 -0400
Message-ID: <1402043327-31663-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/3] vim: use BPN instead of PN to fix multilib build
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
X-List-Received-Date: Fri, 06 Jun 2014 08:28:49 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/vim/vim_7.4.258.bb |   48 ++++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 2d3b0c2..036e43c 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -12,9 +12,9 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
 "
 SRCREV = "v7-4-258"
 
-S = "${WORKDIR}/${PN}/src"
+S = "${WORKDIR}/${BPN}/src"
 
-VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
+VIMDIR = "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
 inherit autotools update-alternatives
 inherit autotools-brokensep
@@ -61,41 +61,41 @@ EXTRA_OECONF = " \
 
 do_install_append() {
     # Work around rpm picking up csh or awk as a dep
-    chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
 
     # Install example vimrc from runtime files
-    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${PN}/vimrc
+    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 }
 
 PARALLEL_MAKEINST = ""
 
 PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
-FILES_${PN}-syntax = "${datadir}/${PN}/${VIMDIR}/syntax"
-FILES_${PN}-help = "${datadir}/${PN}/${VIMDIR}/doc"
-FILES_${PN}-tutor = "${datadir}/${PN}/${VIMDIR}/tutor ${bindir}/${PN}tutor"
-FILES_${PN}-vimrc = "${datadir}/${PN}/vimrc"
-FILES_${PN}-data = "${datadir}/${PN}"
+FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
+FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
+FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${PN}tutor"
+FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
+FILES_${PN}-data = "${datadir}/${BPN}"
 FILES_${PN}-common = " \
-    ${datadir}/${PN}/${VIMDIR}/*.vim \
-    ${datadir}/${PN}/${VIMDIR}/autoload \
-    ${datadir}/${PN}/${VIMDIR}/colors \
-    ${datadir}/${PN}/${VIMDIR}/compiler \
-    ${datadir}/${PN}/${VIMDIR}/ftplugin \
-    ${datadir}/${PN}/${VIMDIR}/indent \
-    ${datadir}/${PN}/${VIMDIR}/keymap \
-    ${datadir}/${PN}/${VIMDIR}/lang \
-    ${datadir}/${PN}/${VIMDIR}/macros \
-    ${datadir}/${PN}/${VIMDIR}/plugin \
-    ${datadir}/${PN}/${VIMDIR}/print \
-    ${datadir}/${PN}/${VIMDIR}/spell \
-    ${datadir}/${PN}/${VIMDIR}/tools \
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
+    ${datadir}/${BPN}/${VIMDIR}/tools \
 "
 
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
 
 ALTERNATIVE_${PN} = "vi"
-ALTERNATIVE_TARGET[vi] = "${bindir}/${PN}"
+ALTERNATIVE_TARGET[vi] = "${bindir}/${BPN}"
 ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
 ALTERNATIVE_PRIORITY[vi] = "100"
-- 
1.7.9.5


