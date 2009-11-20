Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NBc0m-0002z7-N1
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 23:31:31 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 2F3591C160B3;
	Fri, 20 Nov 2009 23:21:43 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 282B9912F2;
	Fri, 20 Nov 2009 23:21:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id oNYk2Fz3kHgs; Fri, 20 Nov 2009 23:21:42 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP;
	Fri, 20 Nov 2009 23:21:41 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Fri, 20 Nov 2009 23:21:41 +0100
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 23:21:34 +0100
Message-Id: <1258755695-24978-3-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.5.2
In-Reply-To: <1258755695-24978-2-git-send-email-mok@mnet-online.de>
References: <1258755695-24978-1-git-send-email-mok@mnet-online.de>
	<1258755695-24978-2-git-send-email-mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH 2/3] e-wm_svn: add patch to not install the default keyboards
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
X-List-Received-Date: Fri, 20 Nov 2009 22:31:31 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 recipes/e17/e-wm/drop-ilume-keyboards.patch |   17 +++++++++++++++++
 recipes/e17/e-wm_svn.bb                     |    3 ++-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 recipes/e17/e-wm/drop-ilume-keyboards.patch

diff --git a/recipes/e17/e-wm/drop-ilume-keyboards.patch b/recipes/e17/e-wm/drop-ilume-keyboards.patch
new file mode 100644
index 0000000..0abe6f2
--- /dev/null
+++ b/recipes/e17/e-wm/drop-ilume-keyboards.patch
@@ -0,0 +1,17 @@
+Index: e/src/modules/illume/keyboards/Makefile.am
+===================================================================
+--- e/src/modules/illume/keyboards/Makefile.am	(revision 43437)
++++ e/src/modules/illume/keyboards/Makefile.am	(working copy)
+@@ -4,12 +4,6 @@
+ filesdir = $(libdir)/enlightenment/modules/$(MODULE)/keyboards
+ files_DATA = \
+             ignore_built_in_keyboards \
+-            Default.kbd \
+-            alpha.png \
+-	    Numbers.kbd \
+-            numeric.png \
+-            Terminal.kbd \
+-	    qwerty.png \
+ 	    up.png \
+ 	    down.png \
+ 	    left.png \
diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
index de0f48f..ea15e6f 100644
--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "eet evas ecore edje efreet edbus"
 LICENSE = "MIT BSD"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 inherit e update-alternatives
 
@@ -12,6 +12,7 @@ SRC_URI += "\
   file://applications.menu \
   file://gsm-segfault-fix.patch;patch=1;maxrev=37617 \
   file://fix-profiles.diff;patch=1;maxrev=39889 \
+  file://drop-illume-keyboards.patch;patch=1 \
 "
 
 SRC_URI_append_openmoko = " file://illume-disable-screensaver.patch;patch=1"
-- 
1.6.5.2



