Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B20117207F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 08:22:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA68MTh1005192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 00:22:30 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 6 Nov 2014 00:22:29 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Martin.Jansa@gmail.com>,
	<paul@paulbarker.me.uk>, <raj.khem@gmail.com>
Date: Thu, 6 Nov 2014 03:22:27 -0500
Message-ID: <1415262147-15816-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] vim: add recipe for vim-tiny
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
X-List-Received-Date: Thu, 06 Nov 2014 08:22:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- Add bb for vim-tiny based on vim.bb
- Change PACKAGECONFIG and do_install for vim-tiny
- Change BPN to vim in vim.bb so it works fine when required by vim-tiny
- Add proper alternative links for vim and vim-tiny to avoid conflicts
- Don't use do_install_append in vim.bb so it works fine when required by vim-tiny

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb | 13 +++++++++++++
 meta-oe/recipes-support/vim/vim_7.4.481.bb      | 20 +++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb

diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb b/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
new file mode 100644
index 0000000..bb8f2b7
--- /dev/null
+++ b/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
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
diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index b85ff63..7490229 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -12,9 +12,9 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
 "
 SRCREV = "v7-4-481"
 
-S = "${WORKDIR}/${BPN}/src"
+S = "${WORKDIR}/vim/src"
 
-VIMDIR = "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
+VIMDIR = "vim${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
 inherit autotools update-alternatives
 inherit autotools-brokensep
@@ -59,7 +59,9 @@ EXTRA_OECONF = " \
     STRIP=/bin/true \
 "
 
-do_install_append() {
+do_install() {
+    autotools_do_install
+
     # Work around rpm picking up csh or awk or perl as a dep
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
@@ -67,6 +69,9 @@ do_install_append() {
 
     # Install example vimrc from runtime files
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
+
+    # we use --with-features=big as default
+    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
 }
 
 PARALLEL_MAKEINST = ""
@@ -97,7 +102,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
-ALTERNATIVE_${PN} = "vi"
-ALTERNATIVE_TARGET[vi] = "${bindir}/${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
-ALTERNATIVE_PRIORITY[vi] = "100"
+ALTERNATIVE_${PN} = "vi vim"
+ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
+ALTERNATIVE_LINK_NAME[vi] = "${bindir}/vi"
+ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
+ALTERNATIVE_PRIORITY = "100"
-- 
2.0.0


