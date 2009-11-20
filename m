Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NBc0r-0002zV-Ro
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 23:31:36 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id ACC861C160AC;
	Fri, 20 Nov 2009 23:21:41 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id A3E5C912F2;
	Fri, 20 Nov 2009 23:21:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id 7k+HQQ4nEcHA; Fri, 20 Nov 2009 23:21:40 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP;
	Fri, 20 Nov 2009 23:21:40 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Fri, 20 Nov 2009 23:21:40 +0100
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 23:21:33 +0100
Message-Id: <1258755695-24978-2-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.5.2
In-Reply-To: <1258755695-24978-1-git-send-email-mok@mnet-online.de>
References: <1258755695-24978-1-git-send-email-mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH 1/3] illume-keboard-*: move from efl1 to e17 where they belong to
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
X-List-Received-Date: Fri, 20 Nov 2009 22:31:37 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 recipes/e17/illume-keyboard-arabic_git.bb          |   12 ++++++++++
 recipes/e17/illume-keyboard-browse_git.bb          |   20 ++++++++++++++++++
 recipes/e17/illume-keyboard-danish_git.bb          |   12 ++++++++++
 recipes/e17/illume-keyboard-default-alt_git.bb     |   12 ++++++++++
 recipes/e17/illume-keyboard-dutch_git.bb           |   22 ++++++++++++++++++++
 recipes/e17/illume-keyboard-dvorak_git.bb          |   12 ++++++++++
 recipes/e17/illume-keyboard-french_git.bb          |   11 ++++++++++
 recipes/e17/illume-keyboard-german_git.bb          |   12 ++++++++++
 recipes/e17/illume-keyboard-hebrew_git.bb          |   12 ++++++++++
 recipes/e17/illume-keyboard-numeric-alt_git.bb     |   19 +++++++++++++++++
 .../e17/illume-keyboard-russian-terminal_git.bb    |   10 +++++++++
 recipes/e17/illume-keyboard-russian_git.bb         |   12 ++++++++++
 recipes/e17/illume-keyboard.inc                    |   14 ++++++++++++
 recipes/efl1/illume-keyboard-arabic_git.bb         |   12 ----------
 recipes/efl1/illume-keyboard-browse_git.bb         |   20 ------------------
 recipes/efl1/illume-keyboard-danish_git.bb         |   12 ----------
 recipes/efl1/illume-keyboard-default-alt_git.bb    |   12 ----------
 recipes/efl1/illume-keyboard-dutch_git.bb          |   22 --------------------
 recipes/efl1/illume-keyboard-dvorak_git.bb         |   12 ----------
 recipes/efl1/illume-keyboard-french_git.bb         |   11 ----------
 recipes/efl1/illume-keyboard-german_git.bb         |   12 ----------
 recipes/efl1/illume-keyboard-hebrew_git.bb         |   12 ----------
 recipes/efl1/illume-keyboard-numeric-alt_git.bb    |   19 -----------------
 .../efl1/illume-keyboard-russian-terminal_git.bb   |   10 ---------
 recipes/efl1/illume-keyboard-russian_git.bb        |   12 ----------
 recipes/efl1/illume-keyboard.inc                   |   14 ------------
 26 files changed, 180 insertions(+), 180 deletions(-)
 create mode 100644 recipes/e17/illume-keyboard-arabic_git.bb
 create mode 100644 recipes/e17/illume-keyboard-browse_git.bb
 create mode 100644 recipes/e17/illume-keyboard-danish_git.bb
 create mode 100644 recipes/e17/illume-keyboard-default-alt_git.bb
 create mode 100644 recipes/e17/illume-keyboard-dutch_git.bb
 create mode 100644 recipes/e17/illume-keyboard-dvorak_git.bb
 create mode 100644 recipes/e17/illume-keyboard-french_git.bb
 create mode 100644 recipes/e17/illume-keyboard-german_git.bb
 create mode 100644 recipes/e17/illume-keyboard-hebrew_git.bb
 create mode 100644 recipes/e17/illume-keyboard-numeric-alt_git.bb
 create mode 100644 recipes/e17/illume-keyboard-russian-terminal_git.bb
 create mode 100644 recipes/e17/illume-keyboard-russian_git.bb
 create mode 100644 recipes/e17/illume-keyboard.inc
 delete mode 100644 recipes/efl1/illume-keyboard-arabic_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-browse_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-danish_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-default-alt_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-dutch_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-dvorak_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-french_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-german_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-hebrew_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-numeric-alt_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-russian-terminal_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard-russian_git.bb
 delete mode 100644 recipes/efl1/illume-keyboard.inc

diff --git a/recipes/e17/illume-keyboard-arabic_git.bb b/recipes/e17/illume-keyboard-arabic_git.bb
new file mode 100644
index 0000000..fcc01c9
--- /dev/null
+++ b/recipes/e17/illume-keyboard-arabic_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "Mohammad Fahmi / Tom Hacohen"
+DESCRIPTION = "Illume keyboard with arabic layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "arabic"
+INSTFILES = "Arabic.kbd Arabic.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-browse_git.bb b/recipes/e17/illume-keyboard-browse_git.bb
new file mode 100644
index 0000000..b9f5e75
--- /dev/null
+++ b/recipes/e17/illume-keyboard-browse_git.bb
@@ -0,0 +1,20 @@
+AUTHOR = "Pander"
+DESCRIPTION = "Illume keyboard with a layout optimized for browsing"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "browse"
+INSTFILES = "\
+Browse.kbd \
+end-browse.png \
+pagedown-browse.png \
+browse.png \
+home-browse.png \
+pageup-browse.png \
+space-browse.png \
+"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-danish_git.bb b/recipes/e17/illume-keyboard-danish_git.bb
new file mode 100644
index 0000000..b824a9e
--- /dev/null
+++ b/recipes/e17/illume-keyboard-danish_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "Esben Damgaard"
+DESCRIPTION = "Illume keyboard with danish layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "danish"
+INSTFILES = "Danish.kbd danish.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-default-alt_git.bb b/recipes/e17/illume-keyboard-default-alt_git.bb
new file mode 100644
index 0000000..4ceca53
--- /dev/null
+++ b/recipes/e17/illume-keyboard-default-alt_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "Pander"
+DESCRIPTION = "Illume keyboard with an alternative default layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "default-alt"
+INSTFILES = "Default-alt.kbd"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-dutch_git.bb b/recipes/e17/illume-keyboard-dutch_git.bb
new file mode 100644
index 0000000..15d0022
--- /dev/null
+++ b/recipes/e17/illume-keyboard-dutch_git.bb
@@ -0,0 +1,22 @@
+AUTHOR = "Pander"
+DESCRIPTION = "Illume keyboard with dutch layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "dutch"
+INSTFILES = "\
+capslock-negative.png \
+end.png \
+pagedown.png \
+qwerty-dutch-nl.png \
+Terminal-dutch-nl.kbd \
+capslock.png \
+home.png \
+pageup.png \
+space.png \
+"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-dvorak_git.bb b/recipes/e17/illume-keyboard-dvorak_git.bb
new file mode 100644
index 0000000..61c58b4
--- /dev/null
+++ b/recipes/e17/illume-keyboard-dvorak_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "Gabor Adam TOTH"
+DESCRIPTION = "Illume keyboard with dvorak layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "dvorak"
+INSTFILES = "Dvorak.kbd dvorak.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-french_git.bb b/recipes/e17/illume-keyboard-french_git.bb
new file mode 100644
index 0000000..5e957e9
--- /dev/null
+++ b/recipes/e17/illume-keyboard-french_git.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Illume keyboard with french layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "french"
+INSTFILES = "Azerty.kbd Azerty.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-german_git.bb b/recipes/e17/illume-keyboard-german_git.bb
new file mode 100644
index 0000000..7120dea
--- /dev/null
+++ b/recipes/e17/illume-keyboard-german_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "Florian Hackenberger"
+DESCRIPTION = "Illume keyboard with german layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "german"
+INSTFILES = "German.kbd German.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-hebrew_git.bb b/recipes/e17/illume-keyboard-hebrew_git.bb
new file mode 100644
index 0000000..cbd47ea
--- /dev/null
+++ b/recipes/e17/illume-keyboard-hebrew_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "Tom Hacohen"
+DESCRIPTION = "Illume keyboard with hebrew layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "hebrew"
+INSTFILES = "Hebrew.kbd Alpha-hebrew-il.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-numeric-alt_git.bb b/recipes/e17/illume-keyboard-numeric-alt_git.bb
new file mode 100644
index 0000000..8abfb8f
--- /dev/null
+++ b/recipes/e17/illume-keyboard-numeric-alt_git.bb
@@ -0,0 +1,19 @@
+AUTHOR = "Pander"
+DESCRIPTION = "Illume keyboard with an alternative numeric layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "numeric-alt"
+INSTFILES = "\
+end-alt.png \
+home-alt.png \
+Numbers-alt.kbd \
+numeric-alt.png \
+pagedown-alt.png \
+pageup-alt.png \
+"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard-russian-terminal_git.bb b/recipes/e17/illume-keyboard-russian-terminal_git.bb
new file mode 100644
index 0000000..b625e93
--- /dev/null
+++ b/recipes/e17/illume-keyboard-russian-terminal_git.bb
@@ -0,0 +1,10 @@
+AUTHOR = "lucky"
+DESCRIPTION = "Illume keyboard with russian layout for the Terminal"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "russian-terminal"
+INSTFILES = "Terminal_Russian.kbd Terminal-russian-ru.png"
+
+require illume-keyboard.inc
diff --git a/recipes/e17/illume-keyboard-russian_git.bb b/recipes/e17/illume-keyboard-russian_git.bb
new file mode 100644
index 0000000..ed0644e
--- /dev/null
+++ b/recipes/e17/illume-keyboard-russian_git.bb
@@ -0,0 +1,12 @@
+AUTHOR = "lucky"
+DESCRIPTION = "Illume keyboard with russian layout"
+PV = "0.0+gitr${SRCREV}"
+PE = "1"
+PR = "r0"
+
+BASEDIR = "russian"
+INSTFILES = "X8_Russian.kbd X8-russian-ru.png"
+
+require illume-keyboard.inc
+
+
diff --git a/recipes/e17/illume-keyboard.inc b/recipes/e17/illume-keyboard.inc
new file mode 100644
index 0000000..4003352
--- /dev/null
+++ b/recipes/e17/illume-keyboard.inc
@@ -0,0 +1,14 @@
+SECTION = "x11/data"
+
+SRC_URI = "git://git.shr-project.org/repo/illume-keyboards.git;protocol=http;branch=master"
+S = "${WORKDIR}/git"
+
+FILES_${PN} = "${libdir}/enlightenment/modules/illume/keyboards/*"
+PACKAGE_ARCH = "all"
+
+do_install() {
+	install -d ${D}${libdir}/enlightenment/modules/illume/keyboards
+	for f in ${INSTFILES}; do
+		install -m 0644 ${S}/${BASEDIR}/${f} ${D}${libdir}/enlightenment/modules/illume/keyboards/
+	done
+}
diff --git a/recipes/efl1/illume-keyboard-arabic_git.bb b/recipes/efl1/illume-keyboard-arabic_git.bb
deleted file mode 100644
index fcc01c9..0000000
--- a/recipes/efl1/illume-keyboard-arabic_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "Mohammad Fahmi / Tom Hacohen"
-DESCRIPTION = "Illume keyboard with arabic layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "arabic"
-INSTFILES = "Arabic.kbd Arabic.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-browse_git.bb b/recipes/efl1/illume-keyboard-browse_git.bb
deleted file mode 100644
index b9f5e75..0000000
--- a/recipes/efl1/illume-keyboard-browse_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-AUTHOR = "Pander"
-DESCRIPTION = "Illume keyboard with a layout optimized for browsing"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "browse"
-INSTFILES = "\
-Browse.kbd \
-end-browse.png \
-pagedown-browse.png \
-browse.png \
-home-browse.png \
-pageup-browse.png \
-space-browse.png \
-"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-danish_git.bb b/recipes/efl1/illume-keyboard-danish_git.bb
deleted file mode 100644
index b824a9e..0000000
--- a/recipes/efl1/illume-keyboard-danish_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "Esben Damgaard"
-DESCRIPTION = "Illume keyboard with danish layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "danish"
-INSTFILES = "Danish.kbd danish.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-default-alt_git.bb b/recipes/efl1/illume-keyboard-default-alt_git.bb
deleted file mode 100644
index 4ceca53..0000000
--- a/recipes/efl1/illume-keyboard-default-alt_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "Pander"
-DESCRIPTION = "Illume keyboard with an alternative default layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "default-alt"
-INSTFILES = "Default-alt.kbd"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-dutch_git.bb b/recipes/efl1/illume-keyboard-dutch_git.bb
deleted file mode 100644
index 15d0022..0000000
--- a/recipes/efl1/illume-keyboard-dutch_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-AUTHOR = "Pander"
-DESCRIPTION = "Illume keyboard with dutch layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "dutch"
-INSTFILES = "\
-capslock-negative.png \
-end.png \
-pagedown.png \
-qwerty-dutch-nl.png \
-Terminal-dutch-nl.kbd \
-capslock.png \
-home.png \
-pageup.png \
-space.png \
-"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-dvorak_git.bb b/recipes/efl1/illume-keyboard-dvorak_git.bb
deleted file mode 100644
index 61c58b4..0000000
--- a/recipes/efl1/illume-keyboard-dvorak_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "Gabor Adam TOTH"
-DESCRIPTION = "Illume keyboard with dvorak layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "dvorak"
-INSTFILES = "Dvorak.kbd dvorak.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-french_git.bb b/recipes/efl1/illume-keyboard-french_git.bb
deleted file mode 100644
index 5e957e9..0000000
--- a/recipes/efl1/illume-keyboard-french_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Illume keyboard with french layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "french"
-INSTFILES = "Azerty.kbd Azerty.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-german_git.bb b/recipes/efl1/illume-keyboard-german_git.bb
deleted file mode 100644
index 7120dea..0000000
--- a/recipes/efl1/illume-keyboard-german_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "Florian Hackenberger"
-DESCRIPTION = "Illume keyboard with german layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "german"
-INSTFILES = "German.kbd German.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-hebrew_git.bb b/recipes/efl1/illume-keyboard-hebrew_git.bb
deleted file mode 100644
index cbd47ea..0000000
--- a/recipes/efl1/illume-keyboard-hebrew_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "Tom Hacohen"
-DESCRIPTION = "Illume keyboard with hebrew layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "hebrew"
-INSTFILES = "Hebrew.kbd Alpha-hebrew-il.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-numeric-alt_git.bb b/recipes/efl1/illume-keyboard-numeric-alt_git.bb
deleted file mode 100644
index 8abfb8f..0000000
--- a/recipes/efl1/illume-keyboard-numeric-alt_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-AUTHOR = "Pander"
-DESCRIPTION = "Illume keyboard with an alternative numeric layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "numeric-alt"
-INSTFILES = "\
-end-alt.png \
-home-alt.png \
-Numbers-alt.kbd \
-numeric-alt.png \
-pagedown-alt.png \
-pageup-alt.png \
-"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard-russian-terminal_git.bb b/recipes/efl1/illume-keyboard-russian-terminal_git.bb
deleted file mode 100644
index b625e93..0000000
--- a/recipes/efl1/illume-keyboard-russian-terminal_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-AUTHOR = "lucky"
-DESCRIPTION = "Illume keyboard with russian layout for the Terminal"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "russian-terminal"
-INSTFILES = "Terminal_Russian.kbd Terminal-russian-ru.png"
-
-require illume-keyboard.inc
diff --git a/recipes/efl1/illume-keyboard-russian_git.bb b/recipes/efl1/illume-keyboard-russian_git.bb
deleted file mode 100644
index ed0644e..0000000
--- a/recipes/efl1/illume-keyboard-russian_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-AUTHOR = "lucky"
-DESCRIPTION = "Illume keyboard with russian layout"
-PV = "0.0+gitr${SRCREV}"
-PE = "1"
-PR = "r0"
-
-BASEDIR = "russian"
-INSTFILES = "X8_Russian.kbd X8-russian-ru.png"
-
-require illume-keyboard.inc
-
-
diff --git a/recipes/efl1/illume-keyboard.inc b/recipes/efl1/illume-keyboard.inc
deleted file mode 100644
index 4003352..0000000
--- a/recipes/efl1/illume-keyboard.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SECTION = "x11/data"
-
-SRC_URI = "git://git.shr-project.org/repo/illume-keyboards.git;protocol=http;branch=master"
-S = "${WORKDIR}/git"
-
-FILES_${PN} = "${libdir}/enlightenment/modules/illume/keyboards/*"
-PACKAGE_ARCH = "all"
-
-do_install() {
-	install -d ${D}${libdir}/enlightenment/modules/illume/keyboards
-	for f in ${INSTFILES}; do
-		install -m 0644 ${S}/${BASEDIR}/${f} ${D}${libdir}/enlightenment/modules/illume/keyboards/
-	done
-}
-- 
1.6.5.2



