Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M9kP4-0000Ac-Vz
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 20:32:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C1D054C67DA;
	Thu, 28 May 2009 14:24:14 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11137-03; Thu, 28 May 2009 14:24:14 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 9F2D73F38FD; Thu, 28 May 2009 14:24:14 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id ED6E64C67CE;
	Thu, 28 May 2009 14:24:11 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id E20971B48AE; Thu, 28 May 2009 14:24:11 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2009 14:24:11 -0400
Message-Id: <1243535051-10168-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
References: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] vim: be an alternative to /bin/vi; switch to INC_PR
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
X-List-Received-Date: Thu, 28 May 2009 18:32:38 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/vim/gvim_7.0.bb |    2 +-
 recipes/vim/vim.inc     |    9 ++++++++-
 recipes/vim/vim_6.4.bb  |    2 ++
 recipes/vim/vim_7.0.bb  |    2 +-
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/recipes/vim/gvim_7.0.bb b/recipes/vim/gvim_7.0.bb
index a073e65..60aa041 100644
--- a/recipes/vim/gvim_7.0.bb
+++ b/recipes/vim/gvim_7.0.bb
@@ -3,7 +3,7 @@ VIMVER = "70"
 require vim.inc
 
 DEPENDS += "gtk+ xt"
-PR = "r1"
+PR = "${INC_PR}.1"
 FILESPATHPKG =. "vim-${PV}:vim:"
 
 EXTRA_OECONF = "--enable-gui=gtk2 --enable-gtk2-test --disable-gtktest \
diff --git a/recipes/vim/vim.inc b/recipes/vim/vim.inc
index f675ce8..a766acc 100644
--- a/recipes/vim/vim.inc
+++ b/recipes/vim/vim.inc
@@ -3,12 +3,14 @@ SECTION = "console/utils"
 DEPENDS = "ncurses"
 LICENSE = "vim"
 
+INC_PR = "r2"
+
 SRC_URI = "ftp://ftp.vim.org/pub/vim/unix/vim-${PV}.tar.bz2 \
 	   file://configure.patch;patch=1"
 
 S = "${WORKDIR}/vim${VIMVER}/src"
 
-inherit autotools
+inherit autotools update-alternatives
 
 do_configure () {
 	rm -f auto/*
@@ -28,3 +30,8 @@ FILES_vim-tutor = "${datadir}/vim/vim${VIMVER}/tutor ${bindir}/vimtutor"
 #FILES_${PN} = "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* \
 #	       ${libdir}/*/ ${sysconfdir} ${sharedstatedir} ${localstatedir} \
 #	       /bin /sbin /lib/*/ /lib/*.so* ${datadir}/vim"
+
+ALTERNATIVE_NAME = "vi"
+ALTERNATIVE_PATH = "vim"
+ALTERNATIVE_LINK = "${base_bindir}/vi"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/recipes/vim/vim_6.4.bb b/recipes/vim/vim_6.4.bb
index 4cf6591..d062bc5 100644
--- a/recipes/vim/vim_6.4.bb
+++ b/recipes/vim/vim_6.4.bb
@@ -2,6 +2,8 @@ VIMVER = "64"
 
 require vim.inc
 
+PR = "${INC_PR}.1"
+
 EXTRA_OECONF = "--enable-gui=none --disable-gtktest \
 		--disable-xim --with-features=normal \
 		--disable-gpm --without-x --disable-netbeans \
diff --git a/recipes/vim/vim_7.0.bb b/recipes/vim/vim_7.0.bb
index c821f6e..e3fa7ab 100644
--- a/recipes/vim/vim_7.0.bb
+++ b/recipes/vim/vim_7.0.bb
@@ -2,7 +2,7 @@ VIMVER = "70"
 
 require vim.inc
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 EXTRA_OECONF = "--enable-gui=none --disable-gtktest \
 		--disable-xim --with-features=big \
-- 
1.5.6.5



