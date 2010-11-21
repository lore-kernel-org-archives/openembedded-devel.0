Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKJpf-0005lS-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:00:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 33269314AE9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id wGJXldFEG3a3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:14 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 177B1314AE9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:13 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 21 Nov 2010 23:59:13 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Nov 2010 23:59:10 +0000
Message-Id: <1290383951-6683-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] swfdec-gnome: use the pkg-config file installed by swfdec
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
X-List-Received-Date: Mon, 22 Nov 2010 00:00:33 -0000

* swfdec installs swfdec-0.9.pc, not swfdec.pc

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/swfdec/swfdec-gnome_2.26.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/swfdec/swfdec-gnome_2.26.0.bb b/recipes/swfdec/swfdec-gnome_2.26.0.bb
index 55a49f5..1a7567c 100644
--- a/recipes/swfdec/swfdec-gnome_2.26.0.bb
+++ b/recipes/swfdec/swfdec-gnome_2.26.0.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "flash plugin"
 LICENSE = "GPL"
 
 DEPENDS = "gtk+ gconf swfdec"
+PR = "r1"
 
 inherit gnome pkgconfig
 
 do_configure_prepend() {
-	sed -i -e 's/swfdec-$SWFDEC_MAJORMINOR/swfdec/g' configure.ac
-	sed -i -e 's/swfdec-gtk-$SWFDEC_MAJORMINOR/swfdec-gtk/g' configure.ac
+	sed -i -e 's/^SWFDEC_MAJORMINOR=0\.8/SWFDEC_MAJORMINOR=0.9/' configure.ac
 }
 
 
-- 
1.7.1



