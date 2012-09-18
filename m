Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylR-0001l8-Ch
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:01 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=DJs5biEel+lA5hiKPxVuAqS1SGRbqz2KZd3wL8S5ASc=;
	b=ijmuXXNCFlLwyVrt1xx7ugH6z3cXez1A2+fByvoCbO2mG+yyQCWwqzVEZlWqX22dAG
	7sRQdpH7aZBX2w/R95QxaKT6r5ll8egmrfYLLlN8mR8B4hG/tRML2JELIC73e08xH+me
	ru1byDnRDvg6assLbDtM5YYmjSRNtllBDnNqL7iXBmMnCmFVLwnnoaJoiM9gs4My7Iwg
	7nNf+SDd7fdq7aLFBHoiKoHdFaBrwtwCzHFmXJGjDkoiUsqDeCXDzCIJmrllCw8ZJkEy
	J3szup7CUVtya8vbofnelcec3tNjyvVv+XFhQBj2gLdSgfs+1+eawqDjFoQLDQW2sT1H
	fMXw==
Received: by 10.204.152.211 with SMTP id h19mr189673bkw.45.1347977663606;
	Tue, 18 Sep 2012 07:14:23 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:48 +0200
Message-Id: <1347977601-28665-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 07/40] exo: update to 0.8.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-xfce/exo/exo/exo-no-tests-0.6.patch    |   12 -
 .../recipes-xfce/exo/exo/exo-no-tests-0.8.patch    |   31 ++
 .../exo/exo/fix-qa-desktop-type-error.patch        |  531 --------------------
 .../exo/{exo_0.6.2.bb => exo_0.8.0.bb}             |   15 +-
 4 files changed, 37 insertions(+), 552 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
 rename meta-xfce/recipes-xfce/exo/{exo_0.6.2.bb => exo_0.8.0.bb} (67%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
deleted file mode 100644
index cab41a8..0000000
--- a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/Makefile.am.old	2011-01-16 16:38:21.000000000 +0100
-+++ b/Makefile.am	2011-03-24 22:14:26.000000000 +0100
-@@ -15,8 +15,7 @@
- 	icons								\
- 	pixmaps								\
- 	po								\
--	$(PYTHON_SUBDIR)						\
--	tests
-+	$(PYTHON_SUBDIR)
- 
- AUTOMAKE_OPTIONS =							\
- 	1.8								\
diff --git a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
new file mode 100644
index 0000000..ac8bca5
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
@@ -0,0 +1,31 @@
+From 5f1e19860d89647488bdd32a02fb332f69434405 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 18 May 2012 21:13:00 +0200
+Subject: [PATCH] Do not run tests at build time
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstream-Status: Not-Applicable
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0ab3853..3e72391 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -8,8 +8,7 @@ SUBDIRS =								\
+ 	docs								\
+ 	icons								\
+ 	pixmaps								\
+-	po								\
+-	tests
++	po
+ 
+ AUTOMAKE_OPTIONS =							\
+ 	1.9								\
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch b/meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
deleted file mode 100644
index e4ba75e..0000000
--- a/meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
+++ /dev/null
@@ -1,531 +0,0 @@
---- a/exo-helper/exo-helper.c.old	2011-01-16 16:38:21.000000000 +0100
-+++ b/exo-helper/exo-helper.c	2011-03-07 12:31:49.000000000 +0100
-@@ -172,7 +172,7 @@
-   helper->startup_notify = xfce_rc_read_bool_entry (rc, "StartupNotify", FALSE);
- 
-   /* verify the type of the desktop file */
--  str = xfce_rc_read_entry_untranslated (rc, "Type", NULL);
-+  str = xfce_rc_read_entry_untranslated (rc, "X-XFCE-Type", NULL);
-   if (G_UNLIKELY (!exo_str_is_equal (str, "X-XFCE-Helper")))
-     goto failed;
- 
-@@ -897,7 +897,8 @@
-       xfce_rc_write_bool_entry (rc, "NoDisplay", TRUE);
-       xfce_rc_write_entry (rc, "Version", "1.0");
-       xfce_rc_write_entry (rc, "Encoding", "UTF-8");
--      xfce_rc_write_entry (rc, "Type", "X-XFCE-Helper");
-+      xfce_rc_write_entry (rc, "Type", "Application");
-+      xfce_rc_write_entry (rc, "X-XFCE-Type", "X-XFCE-Helper");
-       xfce_rc_write_entry (rc, "X-XFCE-Category", category_string);
- 
-       /* check if the command includes a parameter */
---- a/exo-helper/helpers/aterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/aterm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=aterm
--Type=X-XFCE-Helper
-+Type=Application
- _Name=aterm
- StartupNotify=false
- X-XFCE-Binaries=aterm;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -e %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/balsa.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/balsa.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=gnome-balsa2
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Balsa
- StartupNotify=false
- X-XFCE-Binaries=balsa;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 balsa %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/debian-sensible-browser.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/debian-sensible-browser.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=debian
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Debian Sensible Browser
- StartupNotify=false
- X-XFCE-Binaries=sensible-browser;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/debian-x-terminal-emulator.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/debian-x-terminal-emulator.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=debian
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Debian X Terminal Emulator
- StartupNotify=false
- X-XFCE-Binaries=x-terminal-emulator;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -e %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/encompass.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/encompass.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=encompass
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Encompass
- StartupNotify=true
- X-XFCE-Binaries=encompass;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/epiphany.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/epiphany.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=web-browser
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Epiphany Web Browser
- StartupNotify=true
- X-XFCE-Binaries=epiphany;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/eterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/eterm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=Eterm
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Enlightened Terminal Emulator
- StartupNotify=false
- X-XFCE-Binaries=Eterm;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B --exec "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/evolution.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/evolution.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=evolution
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Novell Evolution
- StartupNotify=false
- X-XFCE-Binaries=evolution-2.4;evolution-2.3;evolution-2.2;evolution-2.0;evolution-1.6;evolution-1.5;evolution-1.4;evolution;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 evolution %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/firefox.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/firefox.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=firefox
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Mozilla Firefox
- StartupNotify=false
- X-XFCE-Binaries=firefox;firefox-gtk2;firefox-gtk;mozilla-firefox;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B -remote "openURL(about:blank,new-window)";%B;
- X-XFCE-CommandsWithParameter=%B -remote "openURL(%s)";%B %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/galeon.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/galeon.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=galeon
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Galeon Web Browser
- StartupNotify=true
- X-XFCE-Binaries=galeon;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/gnome-terminal.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/gnome-terminal.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=gnome-terminal
--Type=X-XFCE-Helper
-+Type=Application
- _Name=GNOME Terminal
- StartupNotify=true
- X-XFCE-Binaries=gnome-terminal;gnometerminal;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -x %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/icedove.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/icedove.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=icedove
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Icedove
- StartupNotify=false
- X-XFCE-Binaries=icedove;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 mozilla-remote %B "mailto:%s";@HELPERDIR@/exo-compose-mail-1 mozilla %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/kmail.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/kmail.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=kmail
--Type=X-XFCE-Helper
-+Type=Application
- _Name=KMail
- StartupNotify=true
- X-XFCE-Binaries=kmail;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParamter=@HELPERDIR@/exo-compose-mail-1 kmail %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/konqueror.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/konqueror.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=konqueror
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Konqueror Web Browser
- StartupNotify=true
- X-XFCE-Binaries=konqueror;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/links.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/links.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=links
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Links Text Browser
- StartupNotify=false
- X-XFCE-Binaries=links;links-current;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
- X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator %B %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/lynx.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/lynx.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=aterm
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Lynx Text Browser
- StartupNotify=false
- X-XFCE-Binaries=lynx;lynx-current;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
- X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator %B %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/midori.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/midori.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -2,10 +2,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=midori
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Midori
- StartupNotify=true
- X-XFCE-Binaries=midori;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/mozilla-browser.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/mozilla-browser.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=mozilla
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Mozilla Browser
- StartupNotify=false
- X-XFCE-Binaries=mozilla;mozilla-gtk2;mozilla-gtk;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B -remote "openURL(about:blank,new-window)";%B;
- X-XFCE-CommandsWithParameter=%B -remote "openURL(%s,new-window)";%B %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/mozilla-mailer.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/mozilla-mailer.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=mozilla
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Mozilla Mail
- StartupNotify=false
- X-XFCE-Binaries=mozilla;mozilla-gtk2;mozilla-gtk;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B -mail;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 mozilla-remote %B "mailto:%s";@HELPERDIR@/exo-compose-mail-1 mozilla %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/mutt.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/mutt.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=mutt
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Mutt
- StartupNotify=false
- X-XFCE-Binaries=mutt;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
- X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator @HELPERDIR@/exo-compose-mail-1 mutt %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/nautilus.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/nautilus.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -2,10 +2,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=nautilus
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Nautilus
- StartupNotify=true
- X-XFCE-Binaries=nautilus;
- X-XFCE-Category=FileManager
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/netscape-navigator.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/netscape-navigator.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=mozilla
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Netscape Navigator
- StartupNotify=false
- X-XFCE-Binaries=netscape;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B -remote "openURL(about:blank,new-window)";%B;
- X-XFCE-CommandsWithParameter=%B -remote "openURL(%s,new-window)";%B %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/nxterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/nxterm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=nxterm
--Type=X-XFCE-Helper
-+Type=Application
- _Name=NXterm
- StartupNotify=false
- X-XFCE-Binaries=nxterm;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -e %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/opera-browser.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/opera-browser.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=opera
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Opera Browser
- StartupNotify=false
- X-XFCE-Binaries=opera;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/opera-mailer.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/opera-mailer.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=opera
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Opera Mail
- StartupNotify=false
- X-XFCE-Binaries=opera;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -remote "openURL(mailto:%s)";%B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/pcmanfm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/pcmanfm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -2,10 +2,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=pcmanfm
--Type=X-XFCE-Helper
-+Type=Application
- _Name=PCMan File Manager
- StartupNotify=true
- X-XFCE-Binaries=pcmanfm;
- X-XFCE-Category=FileManager
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/sylpheed-claws.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/sylpheed-claws.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=claws-mail
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Claws Mail
- StartupNotify=true
- X-XFCE-Binaries=claws-mail;sylpheed-claws-gtk2;sylpheed-claws
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 sylpheed %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/sylpheed.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/sylpheed.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=sylpheed
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Sylpheed
- StartupNotify=true
- X-XFCE-Binaries=sylpheed;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 sylpheed %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/Terminal.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/Terminal.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=Terminal
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Xfce Terminal
- StartupNotify=true
- X-XFCE-Binaries=Terminal;xterminal;xfce4-terminal;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -x %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/Thunar.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/Thunar.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -2,10 +2,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=Thunar
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Thunar
- StartupNotify=true
- X-XFCE-Binaries=Thunar;
- X-XFCE-Category=FileManager
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B "%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/thunderbird.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/thunderbird.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=thunderbird
--Type=X-XFCE-Helper
-+Type=Application
- _Name=Mozilla Thunderbird
- StartupNotify=false
- X-XFCE-Binaries=thunderbird;thunderbird-gtk2;thunderbird-gtk;mozilla-thunderbird;
- X-XFCE-Category=MailReader
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 mozilla-remote %B "mailto:%s";@HELPERDIR@/exo-compose-mail-1 mozilla %B "mailto:%s";
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/urxvt.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/urxvt.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=rxvt
--Type=X-XFCE-Helper
-+Type=Application
- _Name=RXVT Unicode
- StartupNotify=false
- X-XFCE-Binaries=urxvt;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -e %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/w3m.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/w3m.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=w3m
--Type=X-XFCE-Helper
-+Type=Application
- _Name=W3M Text Browser
- StartupNotify=false
- X-XFCE-Binaries=w3m;
- X-XFCE-Category=WebBrowser
- X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
- X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator %B %s;
-+X-XFCE-Type=X-XFCE-Helper
---- a/exo-helper/helpers/xterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
-+++ b/exo-helper/helpers/xterm.desktop.in.in	2011-03-07 12:08:31.000000000 +0100
-@@ -1,10 +1,11 @@
- [Desktop Entry]
- Version=1.0
- Icon=xterm
--Type=X-XFCE-Helper
-+Type=Application
- _Name=X Terminal
- StartupNotify=false
- X-XFCE-Binaries=xterm;
- X-XFCE-Category=TerminalEmulator
- X-XFCE-Commands=%B;
- X-XFCE-CommandsWithParameter=%B -e %s;
-+X-XFCE-Type=X-XFCE-Helper
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
similarity index 67%
rename from meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
index ad8dc59..af9103f 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
@@ -1,21 +1,21 @@
 DESCRIPTION="Application library for the Xfce desktop environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ libxfce4util virtual/libx11 perl-native cairo"
-
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 perl-native cairo"
 
 inherit xfce pythonnative
 
 # SRC_URI must follow inherited one
 SRC_URI += " \
-    file://exo-no-tests-0.6.patch \
+    file://exo-no-tests-0.8.patch \
     file://configure.patch \
     file://gnome-mount \
-    file://fix-qa-desktop-type-error.patch \
 "
 
+SRC_URI[md5sum] = "189bd19210e1d7d8601be1cdf27bf259"
+SRC_URI[sha256sum] = "6e21aa30692affcb45fc8283d034da4a02221d26e3e1facb968d04fed4ba05b0"
+
 # see http://wiki.xfce.org/gnomemount-replacement
 do_install_append () {
 	install -m 755 -d ${D}${bindir}/exo-mount-wrapper
@@ -30,6 +30,3 @@ FILES_${PN} += "${datadir}/xfce4/ \
 
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
-
-SRC_URI[md5sum] = "e25333df350abc30999cd16fe96ab690"
-SRC_URI[sha256sum] = "f49cf6a85546f47a1dddb58ce9a5f9364384a6f173cba99deb879e027c811f39"
-- 
1.7.6.5



