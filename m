Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NUjsh-00058l-2p
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 17:46:14 +0100
Received: (qmail 2664 invoked by uid 813007); 12 Jan 2010 16:44:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Jan 2010 16:44:03 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2010 17:43:49 +0100
Message-Id: <1263314629-15492-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <hrw@koansoftware.com>
Subject: [STABLE][PATCH] matchbox-session: simple provider of Matchbox session for X11 startup
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
X-List-Received-Date: Tue, 12 Jan 2010 16:46:14 -0000

From: Marcin Juszkiewicz <hrw@koansoftware.com>

In GPE images we use gpe-session-scripts to provide Xsession init
scripts for launching Matchbox components. But what if someone do not
want GPE but want Matchbox?

Poky has it cleaned in other way.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/matchbox-session/matchbox-session.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/matchbox-session/matchbox-session.bb

diff --git a/recipes/matchbox-session/matchbox-session.bb b/recipes/matchbox-session/matchbox-session.bb
new file mode 100644
index 0000000..c9014f9
--- /dev/null
+++ b/recipes/matchbox-session/matchbox-session.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Matchbox session support"
+RDEPENDS = "matchbox-common"
+# they do the same in other way
+RCONFLICTS = "gpe-session-scripts"
+
+do_install() {
+        install -d ${D}${sysconfdir}/X11/Xsession.d/
+        ln -sf ${bindir}/matchbox-session ${D}${sysconfdir}/X11/Xsession.d/90matchbox-session
+}
+
+PACKAGE_ARCH = "all"
+PACKAGES = "${PN}"
+
+FILES_${PN} = "${sysconfdir}"
-- 
1.6.6





