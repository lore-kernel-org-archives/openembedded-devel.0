Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMNWO-0007Dc-Un
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 17:21:09 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 24D971B421;
	Sat, 27 Nov 2010 17:21:11 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 17:19:53 +0100
Message-Id: <1290874793-20632-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gnome-games_2.30.2: add checksums
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
X-List-Received-Date: Sat, 27 Nov 2010 16:21:09 -0000

---
 recipes/gnome/gnome-games_2.30.2.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/gnome/gnome-games_2.30.2.bb b/recipes/gnome/gnome-games_2.30.2.bb
index 2c8d873..9081d76 100644
--- a/recipes/gnome/gnome-games_2.30.2.bb
+++ b/recipes/gnome/gnome-games_2.30.2.bb
@@ -1,6 +1,10 @@
 LICENSE = "GPL"
 DEPENDS = "guile libggz ggz-client-libs python-pygtk gtk+ libgnome libgnomeui librsvg gnome-vfs gconf libglade gnome-common gnome-python-desktop gnome-python gstreamer"
 
+SRC_URI[archive.md5sum] = "1fc03fe2209aa8a70da8f25d6eae1735"
+SRC_URI[archive.sha256sum] = "57c3f3685cdd49016dfbf236f4a1d98c9d669d456fabe0aeb6f5a4128dba3586"
+
+
 inherit gnome distutils-base gconf
 
 EXTRA_OECONF = " \
-- 
1.7.0.4



