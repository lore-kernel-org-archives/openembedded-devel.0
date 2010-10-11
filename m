Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1P5Oau-0000VD-Rf
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 22:03:37 +0200
Received: (qmail invoked by alias); 11 Oct 2010 20:03:10 -0000
Received: from p50882CE6.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [80.136.44.230]
	by mail.gmx.net (mp012) with SMTP; 11 Oct 2010 22:03:10 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/PNGwT9RnPHIjHZ9DlN8t9gWjK2TYblFKLkvDlNo
	/ZV70u20hGJsOJ
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 22:01:58 +0200
Message-Id: <1286827318-30576-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gedit: add dependencies enchant & gnome-doc-utils-native
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
X-List-Received-Date: Mon, 11 Oct 2010 20:03:38 -0000

* 'bitbake gedit' on clean system failed during
* configure: missing enchant
* compile: gedit.xml unknown "element article"

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/gnome/gedit_2.30.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.bb
index 83dffcf..4ab204c 100644
--- a/recipes/gnome/gedit_2.30.0.bb
+++ b/recipes/gnome/gedit_2.30.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME editor"
 SECTION = "x11/gnome"
 LICENSE = "GPL"
 
-DEPENDS = "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2"
+DEPENDS = "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2 enchant gnome-doc-utils-native"
 RDEPENDS_${PN} += " gtksourceview2"
 PR = "r2"
 
-- 
1.7.2.3



