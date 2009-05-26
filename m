Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M8qNM-0001qz-GN
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 08:43:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id EE44C4C0123;
	Tue, 26 May 2009 02:34:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08298-09; Tue, 26 May 2009 02:34:59 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 4507A4C012B; Tue, 26 May 2009 02:34:58 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id ADAB84C00E9;
	Tue, 26 May 2009 02:34:56 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id BC9694156F; Tue, 26 May 2009 02:34:56 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2009 02:34:54 -0400
Message-Id: <1243319696-16223-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1243319696-16223-1-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/4] Replace obsolete base_set_filespath() with FILESPATHPKG in some recipes.
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
X-List-Received-Date: Tue, 26 May 2009 06:43:05 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

Of these, the following were build tested:

 recipes/cherokee/cherokee-nossl_0.5.3.bb           |    2 +-
 .../squashfs-lzma-tools-native_3.1r2.bb            |    2 +-


The rest were not:

 recipes/freesmartphone/frameworkd-devel_git.bb     |    2 +-
 recipes/initscripts/initscripts-openprotium_1.0.bb |    2 +-
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
1.5.6.5



