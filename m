Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1P73QV-0001sY-NS
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 11:51:45 +0200
Received: (qmail invoked by alias); 16 Oct 2010 09:51:08 -0000
Received: from p50883302.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [80.136.51.2]
	by mail.gmx.net (mp006) with SMTP; 16 Oct 2010 11:51:08 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/T7fww2xPTfcQd9QpRJc4MAlbEXCd+7t4n9BhpFx
	6DIbEb8kcW5l6K
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 11:50:23 +0200
Message-Id: <1287222623-2287-1-git-send-email-schnitzeltony@gmx.de>
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
Subject: [PATCH] libchamplain: DEPENDS: add clutter-gtk & sort entries alphabetical
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
X-List-Received-Date: Sat, 16 Oct 2010 09:51:45 -0000

* configure on clean environment failed with

checking for GTK... configure: error: Package requirements (   gtk+-2.0 >= 2.12
        clutter-gtk-0.10 >= 0.10

  ) were not met:

No package 'clutter-gtk-0.10' found

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/gnome/libchamplain_0.7.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/libchamplain_0.7.1.bb b/recipes/gnome/libchamplain_0.7.1.bb
index da67636..f0f0550 100644
--- a/recipes/gnome/libchamplain_0.7.1.bb
+++ b/recipes/gnome/libchamplain_0.7.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
 LICENSE = "LGPLv2.1"
-DEPENDS = "cairo libsoup-2.4 clutter gtk+"
+DEPENDS = "cairo clutter clutter-gtk gtk+ libsoup-2.4"
 PR = "r1"
 
 inherit gnome autotools
-- 
1.7.2.3



