Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OvzPA-0003WX-Oh
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 23:20:38 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id AA310D480ED;
	Wed, 15 Sep 2010 23:19:45 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OvzWG-0007z1-6M; Wed, 15 Sep 2010 23:27:56 +0200
From: Yann Dirson <ydirson@altern.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Sep 2010 23:27:47 +0200
Message-Id: <1284586068-30655-2-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1284586068-30655-1-git-send-email-ydirson@altern.org>
References: <20100803225018.GG4752@home.lan>
	<1284586068-30655-1-git-send-email-ydirson@altern.org>
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Yann Dirson <ydirson@altern.org>
Subject: [PATCH v2 2/3] git: split space-hungry rarely-used commands into -perltools and -large packages.
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
X-List-Received-Date: Wed, 15 Sep 2010 21:20:38 -0000

This trims the main package by ~75%, and split of all perl scripts allows
to spare the installation of perl, which is no small bargain either.

Note that git-remote-http triggers a strange bug (OE#5465), so it is not
split out for now.

Also drop cpio dependency, which has been unneeded since a number of git
revisions.

Tested rapidly on shr/testing: seen no problem doing clone/commit/amend/reset/
revert/log/status/diff/rebase -i/conflict resolution.

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/git/git_1.7.0.2.bb |   46 ++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/recipes/git/git_1.7.0.2.bb b/recipes/git/git_1.7.0.2.bb
index 0ca44b5..b1ccd6c 100644
--- a/recipes/git/git_1.7.0.2.bb
+++ b/recipes/git/git_1.7.0.2.bb
@@ -9,12 +9,12 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes"
 
 
 DEPENDS = "openssl curl zlib expat"
-RDEPENDS_${PN} = "perl perl-module-file-path cpio findutils sed"
+RDEPENDS_${PN} = "findutils sed"
 
 # Dropbear ssh needs a wrapper script, so install openssh-ssh to make it work out of the box
 RRECOMMENDS_${PN} = "openssh-ssh"
 
-PR = "r8"
+PR = "r9"
 
 do_install_append() {
 	# Fix broken hardlinks
@@ -30,3 +30,45 @@ do_install_append() {
 }
 
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
+
+PACKAGES =+ "${PN}-perltools"
+FILES_${PN}-perltools += " \
+	${libexecdir}/git-core/git-add--interactive \
+	${libexecdir}/git-core/git-archimport \
+	${libexecdir}/git-core/git-cvsexportcommit \
+	${libexecdir}/git-core/git-cvsimport \
+	${libexecdir}/git-core/git-cvsserver \
+	${bindir}/git-cvsserver \
+	${libexecdir}/git-core/git-difftool \
+	${libexecdir}/git-core/git-relink \
+	${libexecdir}/git-core/git-send-email \
+	${libexecdir}/git-core/git-svn \
+	${datadir}/perl \
+"
+RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
+
+PACKAGES =+ "${PN}-large"
+FILES_${PN}-large += " \
+	${libexecdir}/git-core/git-http-backend \
+	${libexecdir}/git-core/git-daemon \
+	${libexecdir}/git-core/git-http-push \
+	${libexecdir}/git-core/git-quiltimport \
+	${libexecdir}/git-core/git-request-pull \
+	${libexecdir}/git-core/git-shell \
+	${bindir}/git-shell \
+	${libexecdir}/git-core/git-instaweb \
+	${libexecdir}/git-core/git-fast-import \
+	${libexecdir}/git-core/git-imap-send \
+"
+# those might be useful in a less-than-large package ?
+FILES_${PN}-large += " \
+	${libexecdir}/git-core/git-http-fetch \
+	${libexecdir}/git-core/git-upload-pack \
+	${bindir}/git-upload-pack \
+"
+# same here, but adding it causes git to depend on git-large(!)
+# see http://bugs.openembedded.net/show_bug.cgi?id=5465
+#FILES_${PN}-large += " \
+#	${libexecdir}/git-core/git-remote-http \
+#"
+RDEPENDS_${PN}-large = "${PN}"
-- 
1.7.2.3



