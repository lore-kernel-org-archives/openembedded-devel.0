Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3V-0006OF-LF
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:17 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0D/QvjdIQN+FmTOFf4sz0D5aRMCbG2QHlYaU4zhXKwM=;
	b=XFiFogWfp/nARVKYyB1cqPs7R+SGQEeUnDg0p0KUOY5MUBtces5U6WBMQQQZnKnZR3
	HwzIcMbU3ekYRllCsRTK8Xe7t6IjYnvBHHOmX0OTqO1uyZbJOK2T/G94EoJBCRxJyNVC
	3FOX51izOWvor3i7RjQCKaDY4oU1zRJxyH9+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BofrCTfJBendsjUkrvlHyRHD2arTFPwyD5uWYfNzI+Gm+8if9pmfMLfZFsS5rqXMVP
	tuRq521lFiu3cVEiY42swZtALG5xswdw56DzllWPVv03q6TPyZwzrAPaUxDMomohkjAQ
	VJ6E2qukd9jJ53SSxEiP9/6EVr5hQSX88LO6s=
Received: by 10.210.20.17 with SMTP id 17mr935923ebt.38.1242207635139;
	Wed, 13 May 2009 02:40:35 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2191137eyf.38.2009.05.13.02.40.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:34 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:10 +0200
Message-Id: <1242207556-15601-32-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 31/37] gpe-tetris: Fix install: don't di install -s
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
X-List-Received-Date: Wed, 13 May 2009 10:54:09 -0000

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../gpe-tetris/gpe-tetris-0.6-4/fix-install.patch  |   13 +++++++++++++
 recipes/gpe-tetris/gpe-tetris_0.6-4.bb             |    4 +++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gpe-tetris/gpe-tetris-0.6-4/fix-install.patch

diff --git a/recipes/gpe-tetris/gpe-tetris-0.6-4/fix-install.patch b/recipes/gpe-tetris/gpe-tetris-0.6-4/fix-install.patch
new file mode 100644
index 0000000..2e32aa5
--- /dev/null
+++ b/recipes/gpe-tetris/gpe-tetris-0.6-4/fix-install.patch
@@ -0,0 +1,13 @@
+diff --git gpe-tetris-0.6-4/Makefile-orig gpe-tetris-0.6-4/Makefile
+index 82c7245..27de49f 100644
+--- gpe-tetris-0.6-4/Makefile-orig
++++ gpe-tetris-0.6-4/Makefile
+@@ -46,7 +46,7 @@ install-program: all
+ 	install -m 644 pixmaps/stop.png $(DESTDIR)$(PREFIX)/share/gpe/pixmaps/default/tetris/stop.png
+ 	install -m 644 pixmaps/pause.png $(DESTDIR)$(PREFIX)/share/gpe/pixmaps/default/tetris/pause.png
+ 	install -m 644 pixmaps/highscores.png $(DESTDIR)$(PREFIX)/share/gpe/pixmaps/default/tetris/highscores.png
+-	install -s $(PACKAGE) $(BIN_PATH)/$(PACKAGE)
++	install $(PACKAGE) $(BIN_PATH)/$(PACKAGE)
+ 	install -d $(DESTDIR)$(PREFIX)/share/applications
+ 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 gpe-tetris.desktop $(DESTDIR)$(PREFIX)/share/applications/
diff --git a/recipes/gpe-tetris/gpe-tetris_0.6-4.bb b/recipes/gpe-tetris/gpe-tetris_0.6-4.bb
index 4a13d24..aa33b1f 100644
--- a/recipes/gpe-tetris/gpe-tetris_0.6-4.bb
+++ b/recipes/gpe-tetris/gpe-tetris_0.6-4.bb
@@ -1,9 +1,11 @@
 LICENSE = "GPL"
 inherit gpe
+PR = "r1"
+
 
 DESCRIPTION = "GTK+2 port of the well known game, Tetris."
 DEPENDS = "gtk+ libgpewidget gpe-icons"
 SECTION = "gpe"
 PRIORITY = "optional"
 
-
+SRC_URI += "file://fix-install.patch;patch=1"
-- 
1.6.1



