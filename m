Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OvzPA-0003WW-LP
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 23:20:37 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id AA3CBD480EE;
	Wed, 15 Sep 2010 23:19:45 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OvzWG-0007yz-3p; Wed, 15 Sep 2010 23:27:56 +0200
From: Yann Dirson <ydirson@altern.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Sep 2010 23:27:46 +0200
Message-Id: <1284586068-30655-1-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <20100803225018.GG4752@home.lan>
References: <20100803225018.GG4752@home.lan>
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Yann Dirson <ydirson@altern.org>
Subject: [PATCH v2 1/3] git: replace remaining broken hardlinks with symlinks.
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
X-List-Received-Date: Wed, 15 Sep 2010 21:20:37 -0000

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/git/git_1.7.0.2.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes/git/git_1.7.0.2.bb b/recipes/git/git_1.7.0.2.bb
index be7a526..0ca44b5 100644
--- a/recipes/git/git_1.7.0.2.bb
+++ b/recipes/git/git_1.7.0.2.bb
@@ -14,14 +14,18 @@ RDEPENDS_${PN} = "perl perl-module-file-path cpio findutils sed"
 # Dropbear ssh needs a wrapper script, so install openssh-ssh to make it work out of the box
 RRECOMMENDS_${PN} = "openssh-ssh"
 
-PR = "r7"
+PR = "r8"
 
 do_install_append() {
 	# Fix broken hardlinks
 	for gitprog in git-receive-pack git-upload-archive ; do
-		rm ${D}${bindir}/$gitprog 
+		rm ${D}${bindir}/$gitprog
 		ln -sf ${bindir}/git ${D}${bindir}/$gitprog
 	done
+	for gitprog in git-cvsserver git-shell git-upload-pack ; do
+		rm ${D}${libexecdir}/git-core/$gitprog
+		ln -sf ${bindir}/$gitprog ${D}${libexecdir}/git-core/$gitprog
+	done
 	rm ${D}${libexecdir}/git-core/git && ln -sf ${bindir}/git ${D}${libexecdir}/git-core/git
 }
 
-- 
1.7.2.3



