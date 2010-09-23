Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1Oylyh-0007OK-7F
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 15:36:49 +0200
Received: (qmail invoked by alias); 23 Sep 2010 13:36:40 -0000
Received: from p50882BA8.dip.t-dialin.net (EHLO localhost.localdomain)
	[80.136.43.168]
	by mail.gmx.net (mp064) with SMTP; 23 Sep 2010 15:36:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+vEd0F566v0ZGO2TNLCbnmC7FbhP0WZT80SNvtGl
	fYkKo0Phi/E/0V
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 15:34:57 +0200
Message-Id: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.0.2
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Thu, 23 Sep 2010 13:36:49 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter-gtk_0.10.6.bb |   10 ----------
 recipes/clutter/clutter-gtk_0.10.8.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/clutter/clutter-gtk_0.10.6.bb
 create mode 100644 recipes/clutter/clutter-gtk_0.10.8.bb

diff --git a/recipes/clutter/clutter-gtk_0.10.6.bb b/recipes/clutter/clutter-gtk_0.10.6.bb
deleted file mode 100644
index ab66c77..0000000
--- a/recipes/clutter/clutter-gtk_0.10.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter-gtk.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter-gtk/0.10/clutter-gtk-${PV}.tar.bz2 \
-          "
-
-SRC_URI[md5sum] = "e7407392b14d6cddd9d4f86feaa9bd3f"
-SRC_URI[sha256sum] = "c65ec1e6b2932ed23b3db145357a96ae5ec7cb0666139468eba781d6c56a5371"
-
diff --git a/recipes/clutter/clutter-gtk_0.10.8.bb b/recipes/clutter/clutter-gtk_0.10.8.bb
new file mode 100644
index 0000000..4f2cdae
--- /dev/null
+++ b/recipes/clutter/clutter-gtk_0.10.8.bb
@@ -0,0 +1,10 @@
+require clutter-gtk.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter-gtk/0.10/clutter-gtk-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "22b4ebddc795e40d83622d7d23669eff"
+SRC_URI[sha256sum] = "7867f951568871d9f68cbe8a3644fd53d2138f725b7ba61ffc0053eb64e80814"
+
-- 
1.7.0.2



