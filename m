Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2v-0006OE-W8
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:42 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=T9GqfgvQiHSv4YuoSlVhfYwQQrJ9Y6WVPFlfY2EBTBg=;
	b=BVSKDvnl/3LdyBRzO2WuFaUoBL8C34XyvhElB2xb4JndQBV3tifgfD71/YJL1nhgPW
	UsavrwGNAp5wja/CnRZ+a43Kr6QJpbbBehruXM3FrBtSDphG3KecXrYhqQK11gWCv9tD
	J+azZowm++KSKLMxF16LbMcYwykW0PfytIZ4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c5/gecAGQIXPyhEQUbZbBkZGu5BToyg6KCkpAbEvMu9y00PT8mPwO+nP5/LkPMa8jd
	EtfL7w8CjkaewFdV/F/UTDqxwVaATHUngmqbkIBKD4UknQtFfwt9HvftJOMeqCaWTiYh
	rY7m4PjFLRV5//No1ouvVO0ybQugXWUL6+yEo=
Received: by 10.211.195.13 with SMTP id x13mr904918ebp.75.1242207599512;
	Wed, 13 May 2009 02:39:59 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2193160eyg.17.2009.05.13.02.39.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:59 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:55 +0200
Message-Id: <1242207556-15601-17-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 16/37] teleport: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:42 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/teleport/files/makefile-fix.patch |   13 +++++++++++++
 recipes/teleport/teleport_0.33.bb         |    2 ++
 recipes/teleport/teleport_0.34.bb         |    2 ++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/teleport/files/makefile-fix.patch

diff --git a/recipes/teleport/files/makefile-fix.patch b/recipes/teleport/files/makefile-fix.patch
new file mode 100644
index 0000000..9dc232d
--- /dev/null
+++ b/recipes/teleport/files/makefile-fix.patch
@@ -0,0 +1,13 @@
+--- /tmp/Makefile.old	2005-03-04 20:19:01.000000000 +0100
++++ teleport-0.34/Makefile	2009-05-01 22:19:16.000000000 +0200
+@@ -37,8 +37,8 @@
+ 
+ install-program: all
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s teleport $(DESTDIR)$(PREFIX)/bin/
+-	install -s tp-keygen $(DESTDIR)$(PREFIX)/bin/
++	install teleport $(DESTDIR)$(PREFIX)/bin/
++	install tp-keygen $(DESTDIR)$(PREFIX)/bin/
+ 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 teleport.png $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -d $(DESTDIR)$(PREFIX)/share/applications
diff --git a/recipes/teleport/teleport_0.33.bb b/recipes/teleport/teleport_0.33.bb
index 8ebb780..918902e 100644
--- a/recipes/teleport/teleport_0.33.bb
+++ b/recipes/teleport/teleport_0.33.bb
@@ -10,3 +10,5 @@ PR = "r2"
 SRC_URI =+ "file://crypt.c \
 		file://fix-desktop.patch;patch=1 \
 		file://remove-tododb.patch;pnum=1;patch=1"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
diff --git a/recipes/teleport/teleport_0.34.bb b/recipes/teleport/teleport_0.34.bb
index ce982c9..3732254 100644
--- a/recipes/teleport/teleport_0.34.bb
+++ b/recipes/teleport/teleport_0.34.bb
@@ -3,3 +3,5 @@ LICENSE = "GPL"
 DESCRIPTION = "Teleport app"
 DEPENDS = "gtk+ libgpewidget libdisplaymigration libgcrypt sqlite"
 PRIORITY = "optional"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
-- 
1.6.1



