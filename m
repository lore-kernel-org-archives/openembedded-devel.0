Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMys-0007Pa-3M
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 15:29:23 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id A18D11893A8; Thu,  2 Apr 2009 15:29:22 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 15:29:22 +0200
Message-Id: <1238678962-13718-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] gnome-keyring: add missing dependency on gconf-dbus
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
X-List-Received-Date: Thu, 02 Apr 2009 13:29:29 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gnome/gnome-keyring_2.26.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gnome-keyring_2.26.0.bb b/recipes/gnome/gnome-keyring_2.26.0.bb
index 0bf7c7c..fc756fe 100644
--- a/recipes/gnome/gnome-keyring_2.26.0.bb
+++ b/recipes/gnome/gnome-keyring_2.26.0.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 
 inherit autotools gnome pkgconfig
 
-DEPENDS = "gtk+ libtasn1 libtasn1-native libgcrypt"
+DEPENDS = "gconf-dbus gtk+ libtasn1 libtasn1-native libgcrypt"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
1.5.6.5



