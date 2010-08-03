Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQDg-0002PB-4H
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:44:26 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 5D399D4801F;
	Wed,  4 Aug 2010 00:44:18 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OgQJO-0006P6-Tx; Wed, 04 Aug 2010 00:50:18 +0200
Date: Wed, 4 Aug 2010 00:50:18 +0200
From: Yann Dirson <ydirson@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803225018.GG4752@home.lan>
MIME-Version: 1.0
In-Reply-To: <1280792514-24843-1-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.1
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] git: replace remaining broken hardlinks with symlinks.
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
X-List-Received-Date: Tue, 03 Aug 2010 22:44:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/git/git_1.7.0.2.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes/git/git_1.7.0.2.bb b/recipes/git/git_1.7.0.2.bb
index a3a73f0..917b609 100644
--- a/recipes/git/git_1.7.0.2.bb
+++ b/recipes/git/git_1.7.0.2.bb
@@ -14,14 +14,18 @@ RDEPENDS_${PN} = "perl perl-module-file-path cpio findutils sed"
 # Dropbear ssh needs a wrapper script, so install openssh-ssh to make it work out of the box
 RRECOMMENDS_${PN} = "openssh-ssh"
 
-PR = "r6"
+PR = "r6.1"
 
 do_install_append() {
 	# Fix broken hardlinks
 	for gitprog in git-receive-pack git-upload-archive ; do
-		rm ${D}${bindir}/$gitprog 
+		rm ${D}${bindir}/$gitprog
 		ln -sf ${bindir}/git ${D}${bindir}/$gitprog
 	done
+	for gitprog in git-cvsserver git-shell git-upload-pack ; do
+		rm ${D}/usr/libexec/git-core/$gitprog
+		ln -sf ${bindir}/$gitprog ${D}/usr/libexec/git-core/$gitprog
+	done
 	rm ${D}${libexecdir}/git-core/git && ln -sf ${bindir}/git ${D}${libexecdir}/git-core/git
 }
 
-- 
1.7.1




