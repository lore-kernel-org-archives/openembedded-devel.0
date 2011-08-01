Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf5-0006wd-OT
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:31 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:09 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:09 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX199114FTIx9lwnliNZwetjEiZDwkvGBV+LDmYIIGW
	+BYry6uzcq6xz9
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:44 +0200
Message-Id: <1312232577-7948-7-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe 06/19] exo: Add initial recipe with version 0.6.2
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* python bindings removed here (will be moved to pyxfce mainline [1])
* TBD: gnomemount replacement on postinst [2]

[1] http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
[2] http://wiki.xfce.org/gnomemount-replacement

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/exo/exo/configure.patch     |   43 ++
 .../recipes-xfce/exo/exo/exo-no-tests-0.6.patch    |   12 +
 .../exo/exo/fix-qa-desktop-type-error.patch        |  531 ++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo/gnome-mount         |   64 +++
 meta-xfce/recipes-xfce/exo/exo_0.6.2.bb            |   36 ++
 5 files changed, 686 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/gnome-mount
 create mode 100644 meta-xfce/recipes-xfce/exo/exo_0.6.2.bb

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/recipes-xfce/exo/exo/configure.patch
new file mode 100644
index 0000000..2ccfcfc
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
@@ -0,0 +1,43 @@
+--- exo-0.3.4/configure.in~	2007-12-02 10:37:06.000000000 -0200
++++ exo-0.3.4/configure.in	2008-06-05 17:21:42.000000000 -0300
+@@ -127,22 +127,24 @@
+ dnl ***************************************
+ dnl *** Check for strftime() extensions ***
+ dnl ***************************************
+-AC_TRY_RUN([
+-  #include <string.h>
+-  #include <time.h>
+-  int
+-  main (int argc, char **argv)
+-  {
+-    struct tm tm;
+-    char      buffer[16];
+-    tm.tm_year = 81;
+-    if (strftime (buffer, 16, "%EY", &tm) == 4 && strcmp (buffer, "1981") == 0)
+-      return 0;
+-    return 1;
+-  }
+-], [
+-  AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E and %O modifiers.])
+-])
++dnl grrrr...  this doesn't work for cross compiling, define it for OE
++AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E and %O modifiers.])
++dnl AC_TRY_RUN([
++dnl   #include <string.h>
++dnl   #include <time.h>
++dnl   int
++dnl   main (int argc, char **argv)
++dnl   {
++dnl     struct tm tm;
++dnl     char      buffer[16];
++dnl     tm.tm_year = 81;
++dnl     if (strftime (buffer, 16, "%EY", &tm) == 4 && strcmp (buffer, "1981") == 0)
++dnl       return 0;
++dnl     return 1;
++dnl   }
++dnl ], [
++dnl   AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E and %O modifiers.])
++dnl ])
+ 
+ dnl ******************************
+ dnl *** Check for i18n support ***
diff --git a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
new file mode 100644
index 0000000..cab41a8
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
@@ -0,0 +1,12 @@
+--- a/Makefile.am.old	2011-01-16 16:38:21.000000000 +0100
++++ b/Makefile.am	2011-03-24 22:14:26.000000000 +0100
+@@ -15,8 +15,7 @@
+ 	icons								\
+ 	pixmaps								\
+ 	po								\
+-	$(PYTHON_SUBDIR)						\
+-	tests
++	$(PYTHON_SUBDIR)
+ 
+ AUTOMAKE_OPTIONS =							\
+ 	1.8								\
diff --git a/meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch b/meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
new file mode 100644
index 0000000..e4ba75e
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
@@ -0,0 +1,531 @@
+--- a/exo-helper/exo-helper.c.old	2011-01-16 16:38:21.000000000 +0100
++++ b/exo-helper/exo-helper.c	2011-03-07 12:31:49.000000000 +0100
+@@ -172,7 +172,7 @@
+   helper->startup_notify = xfce_rc_read_bool_entry (rc, "StartupNotify", FALSE);
+ 
+   /* verify the type of the desktop file */
+-  str = xfce_rc_read_entry_untranslated (rc, "Type", NULL);
++  str = xfce_rc_read_entry_untranslated (rc, "X-XFCE-Type", NULL);
+   if (G_UNLIKELY (!exo_str_is_equal (str, "X-XFCE-Helper")))
+     goto failed;
+ 
+@@ -897,7 +897,8 @@
+       xfce_rc_write_bool_entry (rc, "NoDisplay", TRUE);
+       xfce_rc_write_entry (rc, "Version", "1.0");
+       xfce_rc_write_entry (rc, "Encoding", "UTF-8");
+-      xfce_rc_write_entry (rc, "Type", "X-XFCE-Helper");
++      xfce_rc_write_entry (rc, "Type", "Application");
++      xfce_rc_write_entry (rc, "X-XFCE-Type", "X-XFCE-Helper");
+       xfce_rc_write_entry (rc, "X-XFCE-Category", category_string);
+ 
+       /* check if the command includes a parameter */
+--- a/exo-helper/helpers/aterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/aterm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=aterm
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=aterm
+ StartupNotify=false
+ X-XFCE-Binaries=aterm;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -e %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/balsa.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/balsa.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=gnome-balsa2
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Balsa
+ StartupNotify=false
+ X-XFCE-Binaries=balsa;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 balsa %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/debian-sensible-browser.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/debian-sensible-browser.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=debian
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Debian Sensible Browser
+ StartupNotify=false
+ X-XFCE-Binaries=sensible-browser;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/debian-x-terminal-emulator.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/debian-x-terminal-emulator.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=debian
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Debian X Terminal Emulator
+ StartupNotify=false
+ X-XFCE-Binaries=x-terminal-emulator;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -e %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/encompass.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/encompass.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=encompass
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Encompass
+ StartupNotify=true
+ X-XFCE-Binaries=encompass;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/epiphany.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/epiphany.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=web-browser
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Epiphany Web Browser
+ StartupNotify=true
+ X-XFCE-Binaries=epiphany;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/eterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/eterm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=Eterm
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Enlightened Terminal Emulator
+ StartupNotify=false
+ X-XFCE-Binaries=Eterm;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B --exec "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/evolution.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/evolution.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=evolution
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Novell Evolution
+ StartupNotify=false
+ X-XFCE-Binaries=evolution-2.4;evolution-2.3;evolution-2.2;evolution-2.0;evolution-1.6;evolution-1.5;evolution-1.4;evolution;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 evolution %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/firefox.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/firefox.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=firefox
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Mozilla Firefox
+ StartupNotify=false
+ X-XFCE-Binaries=firefox;firefox-gtk2;firefox-gtk;mozilla-firefox;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B -remote "openURL(about:blank,new-window)";%B;
+ X-XFCE-CommandsWithParameter=%B -remote "openURL(%s)";%B %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/galeon.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/galeon.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=galeon
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Galeon Web Browser
+ StartupNotify=true
+ X-XFCE-Binaries=galeon;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/gnome-terminal.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/gnome-terminal.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=gnome-terminal
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=GNOME Terminal
+ StartupNotify=true
+ X-XFCE-Binaries=gnome-terminal;gnometerminal;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -x %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/icedove.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/icedove.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=icedove
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Icedove
+ StartupNotify=false
+ X-XFCE-Binaries=icedove;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 mozilla-remote %B "mailto:%s";@HELPERDIR@/exo-compose-mail-1 mozilla %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/kmail.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/kmail.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=kmail
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=KMail
+ StartupNotify=true
+ X-XFCE-Binaries=kmail;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParamter=@HELPERDIR@/exo-compose-mail-1 kmail %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/konqueror.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/konqueror.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=konqueror
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Konqueror Web Browser
+ StartupNotify=true
+ X-XFCE-Binaries=konqueror;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/links.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/links.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=links
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Links Text Browser
+ StartupNotify=false
+ X-XFCE-Binaries=links;links-current;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
+ X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator %B %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/lynx.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/lynx.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=aterm
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Lynx Text Browser
+ StartupNotify=false
+ X-XFCE-Binaries=lynx;lynx-current;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
+ X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator %B %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/midori.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/midori.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -2,10 +2,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=midori
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Midori
+ StartupNotify=true
+ X-XFCE-Binaries=midori;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/mozilla-browser.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/mozilla-browser.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=mozilla
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Mozilla Browser
+ StartupNotify=false
+ X-XFCE-Binaries=mozilla;mozilla-gtk2;mozilla-gtk;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B -remote "openURL(about:blank,new-window)";%B;
+ X-XFCE-CommandsWithParameter=%B -remote "openURL(%s,new-window)";%B %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/mozilla-mailer.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/mozilla-mailer.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=mozilla
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Mozilla Mail
+ StartupNotify=false
+ X-XFCE-Binaries=mozilla;mozilla-gtk2;mozilla-gtk;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B -mail;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 mozilla-remote %B "mailto:%s";@HELPERDIR@/exo-compose-mail-1 mozilla %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/mutt.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/mutt.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=mutt
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Mutt
+ StartupNotify=false
+ X-XFCE-Binaries=mutt;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
+ X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator @HELPERDIR@/exo-compose-mail-1 mutt %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/nautilus.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/nautilus.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -2,10 +2,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=nautilus
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Nautilus
+ StartupNotify=true
+ X-XFCE-Binaries=nautilus;
+ X-XFCE-Category=FileManager
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/netscape-navigator.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/netscape-navigator.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=mozilla
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Netscape Navigator
+ StartupNotify=false
+ X-XFCE-Binaries=netscape;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B -remote "openURL(about:blank,new-window)";%B;
+ X-XFCE-CommandsWithParameter=%B -remote "openURL(%s,new-window)";%B %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/nxterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/nxterm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=nxterm
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=NXterm
+ StartupNotify=false
+ X-XFCE-Binaries=nxterm;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -e %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/opera-browser.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/opera-browser.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=opera
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Opera Browser
+ StartupNotify=false
+ X-XFCE-Binaries=opera;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/opera-mailer.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/opera-mailer.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=opera
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Opera Mail
+ StartupNotify=false
+ X-XFCE-Binaries=opera;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -remote "openURL(mailto:%s)";%B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/pcmanfm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/pcmanfm.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -2,10 +2,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=pcmanfm
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=PCMan File Manager
+ StartupNotify=true
+ X-XFCE-Binaries=pcmanfm;
+ X-XFCE-Category=FileManager
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/sylpheed-claws.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/sylpheed-claws.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=claws-mail
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Claws Mail
+ StartupNotify=true
+ X-XFCE-Binaries=claws-mail;sylpheed-claws-gtk2;sylpheed-claws
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 sylpheed %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/sylpheed.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/sylpheed.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=sylpheed
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Sylpheed
+ StartupNotify=true
+ X-XFCE-Binaries=sylpheed;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 sylpheed %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/Terminal.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/Terminal.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=Terminal
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Xfce Terminal
+ StartupNotify=true
+ X-XFCE-Binaries=Terminal;xterminal;xfce4-terminal;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -x %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/Thunar.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/Thunar.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -2,10 +2,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=Thunar
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Thunar
+ StartupNotify=true
+ X-XFCE-Binaries=Thunar;
+ X-XFCE-Category=FileManager
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B "%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/thunderbird.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/thunderbird.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=thunderbird
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=Mozilla Thunderbird
+ StartupNotify=false
+ X-XFCE-Binaries=thunderbird;thunderbird-gtk2;thunderbird-gtk;mozilla-thunderbird;
+ X-XFCE-Category=MailReader
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=@HELPERDIR@/exo-compose-mail-1 mozilla-remote %B "mailto:%s";@HELPERDIR@/exo-compose-mail-1 mozilla %B "mailto:%s";
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/urxvt.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/urxvt.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=rxvt
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=RXVT Unicode
+ StartupNotify=false
+ X-XFCE-Binaries=urxvt;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -e %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/w3m.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/w3m.desktop.in.in	2011-03-07 12:08:30.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=w3m
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=W3M Text Browser
+ StartupNotify=false
+ X-XFCE-Binaries=w3m;
+ X-XFCE-Category=WebBrowser
+ X-XFCE-Commands=exo-open --launch TerminalEmulator %B;
+ X-XFCE-CommandsWithParameter=exo-open --launch TerminalEmulator %B %s;
++X-XFCE-Type=X-XFCE-Helper
+--- a/exo-helper/helpers/xterm.desktop.in.in.old	2011-03-07 12:08:30.000000000 +0100
++++ b/exo-helper/helpers/xterm.desktop.in.in	2011-03-07 12:08:31.000000000 +0100
+@@ -1,10 +1,11 @@
+ [Desktop Entry]
+ Version=1.0
+ Icon=xterm
+-Type=X-XFCE-Helper
++Type=Application
+ _Name=X Terminal
+ StartupNotify=false
+ X-XFCE-Binaries=xterm;
+ X-XFCE-Category=TerminalEmulator
+ X-XFCE-Commands=%B;
+ X-XFCE-CommandsWithParameter=%B -e %s;
++X-XFCE-Type=X-XFCE-Helper
diff --git a/meta-xfce/recipes-xfce/exo/exo/gnome-mount b/meta-xfce/recipes-xfce/exo/exo/gnome-mount
new file mode 100644
index 0000000..85fdb25
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/gnome-mount
@@ -0,0 +1,64 @@
+#!/bin/sh
+#
+# gnome-mount - wrapper script for use with exo-mount
+#
+# Copyright 2009 Enrico Tröger <enrico(at)xfce(dot)org>
+# Licence: GPLv2
+#
+#
+# This script aims to be a wrapper script to provide the
+# gnome-mount utility on envrionments which only have
+# exo-mount (e.g. Xfce). It accepts all command line arguments
+# which are passed but ignores all which are not supported by
+# exo-mount.
+#
+# (This script was tested with Bash and Dash.)
+#
+# Possible use case is as a drop-in replacement to get mounting
+# local resources with GVfs working, e.g. mounting disks in CD drives.
+#
+# Usage:
+# Save this script as 'gnome-mount' in a directory in your path,
+# e.g. /usr/local/bin or ~/bin and make it executable.
+#
+
+
+
+OPTS=""
+
+# first catch all passed arguments and keep those exo-mount supports,
+# ignore all other arguments
+while [ -n "$*" ]
+do
+	case $1 in
+		-\?|--help)
+		OPTS="$OPTS --help"
+		;;
+		-e|--eject)
+		OPTS="$OPTS --eject"
+		;;
+		-u|--unmount)
+		OPTS="$OPTS --unmount"
+		;;
+		-h|--hal-udi)
+		OPTS="$OPTS --hal-udi"
+		shift
+		OPTS="$OPTS $1"
+		;;
+		-d|--device)
+		OPTS="$OPTS --device"
+		shift
+		OPTS="$OPTS $1"
+		;;
+		-n|--no-ui)
+		OPTS="$OPTS --no-ui"
+		;;
+		-V|--version)
+		OPTS="$OPTS --version"
+		;;
+	esac
+	shift
+done
+
+# now run exo-mount and hope things go well
+exo-mount $OPTS
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
new file mode 100644
index 0000000..b9fc687
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
@@ -0,0 +1,36 @@
+DESCRIPTION="Application library for the Xfce desktop environment"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ libxfce4util virtual/libx11 perl-native cairo"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI += " \
+    file://exo-no-tests-0.6.patch \
+    file://configure.patch \
+    file://gnome-mount \
+    file://fix-qa-desktop-type-error.patch \
+"
+
+
+# see http://wiki.xfce.org/gnomemount-replacement
+do_install_append () {
+	install -m 755 -d ${D}${bindir}/exo-mount-wrapper
+	install -m 755 ${WORKDIR}//gnome-mount ${D}${bindir}/exo-mount-wrapper
+}
+
+# Note: python bindings did not work in oe-dev and are about to be moved to
+# pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
+FILES_${PN} += "${datadir}/xfce4/ \
+                ${libdir}/xfce4/exo-1 \
+               "
+
+FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
+                   "
+
+SRC_URI[md5sum] = "e25333df350abc30999cd16fe96ab690"
+SRC_URI[sha256sum] = "f49cf6a85546f47a1dddb58ce9a5f9364384a6f173cba99deb879e027c811f39"
-- 
1.7.4.4



