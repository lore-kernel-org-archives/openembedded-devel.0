Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58s-0003At-AG
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:50 +0200
Received: (qmail 31168 invoked by uid 813007); 1 Jul 2009 18:54:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:52 +0200
Message-Id: <1246474496-16704-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011818.18407.marcin@juszkiewicz.com.pl>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 037/125] Replace obsolete base_set_filespath() with FILESPATHPKG in some recipes.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:50 -0000

From: Michael Smith <msmith@cbnco.com>

Signed-off-by: Michael Smith <msmith@cbnco.com>
Acked-by: Tom Rini <trini@embeddedalley.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/cherokee/cherokee-nossl_0.5.3.bb           |    2 +-
 recipes/freesmartphone/frameworkd-devel_git.bb     |    2 +-
 recipes/initscripts/initscripts-openprotium_1.0.bb |    2 +-
 .../squashfs-lzma-tools-native_3.1r2.bb            |    2 +-
 recipes/vim/gvim_7.0.bb                            |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/cherokee/cherokee-nossl_0.5.3.bb b/recipes/cherokee/cherokee-nossl_0.5.3.bb
index 4093660..3ea9068 100644
--- a/recipes/cherokee/cherokee-nossl_0.5.3.bb
+++ b/recipes/cherokee/cherokee-nossl_0.5.3.bb
@@ -2,7 +2,7 @@ require cherokee_${PV}.bb
 
 DEPENDS = "libpcre"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/cherokee-${PV}', '${FILE_DIRNAME}/cherokee', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "cherokee-${PV}:cherokee:"
 
 S = "${WORKDIR}/cherokee-${PV}"
 
diff --git a/recipes/freesmartphone/frameworkd-devel_git.bb b/recipes/freesmartphone/frameworkd-devel_git.bb
index f5f6c0b..a6439ee 100644
--- a/recipes/freesmartphone/frameworkd-devel_git.bb
+++ b/recipes/freesmartphone/frameworkd-devel_git.bb
@@ -1,5 +1,5 @@
 require frameworkd_git.bb
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/frameworkd', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "frameworkd:"
 PROVIDES = "frameworkd"
 RPROVIDES = "frameworkd"
 PV = "0.8.5.x+gitr${SRCREV}"
diff --git a/recipes/initscripts/initscripts-openprotium_1.0.bb b/recipes/initscripts/initscripts-openprotium_1.0.bb
index e787eed..aa20e29 100644
--- a/recipes/initscripts/initscripts-openprotium_1.0.bb
+++ b/recipes/initscripts/initscripts-openprotium_1.0.bb
@@ -13,7 +13,7 @@ RCONFLICTS = "initscripts"
 # a suffix
 PR := "${PR}.11"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/${P}', '${FILE_DIRNAME}/initscripts-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "${P}:initscripts-${PV}:"
 
 PACKAGES = "${PN}-dbg ${PN}"
 
diff --git a/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb b/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb
index 5520896..8261ef5 100644
--- a/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb
+++ b/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb
@@ -4,7 +4,7 @@ DEPENDS = "lzma-native"
 
 inherit native
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/squashfs-tools-${PV}', '${FILE_DIRNAME}/squashfs-tools', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "squashfs-tools-${PV}:squashfs-tools:"
 PACKAGES = ""
 
 do_stage () {
diff --git a/recipes/vim/gvim_7.0.bb b/recipes/vim/gvim_7.0.bb
index 78a0c54..a073e65 100644
--- a/recipes/vim/gvim_7.0.bb
+++ b/recipes/vim/gvim_7.0.bb
@@ -4,7 +4,7 @@ require vim.inc
 
 DEPENDS += "gtk+ xt"
 PR = "r1"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/vim-7.0', '${FILE_DIRNAME}/vim', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "vim-${PV}:vim:"
 
 EXTRA_OECONF = "--enable-gui=gtk2 --enable-gtk2-test --disable-gtktest \
 		--disable-xim --with-features=big \
-- 
1.6.3.1





