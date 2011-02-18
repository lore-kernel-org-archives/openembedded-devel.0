Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUO6-0007Dd-UE
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:03 +0100
Received: by yxa15 with SMTP id 15so353130yxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=dyHDOXbyToNSXkcfwPBoHeZwXtGomTueAvYkUwKo39s=;
	b=b1/WPG7kRKgm05iE8VA8a2Zz6hK9gjmXYjBvQ4+Mo34gXOA3rU2zhSI27qbdAkLl2Z
	IZfDPgcDqZTWZGLZiNBuaAIjf+Iq2emPsXMeLfvYWq4zzfn4anALTggxCffuducDs0yQ
	yyAXUBV0NoKF/Rf2D2XpMLUaYJAefxyF5SFcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=nHzu1L8ft2a5BF9THHrPZaYOuArmYk5mZ2Zpx6RKYtC0vJLiPrvwnto+iCfaT2OCiV
	kNhcZkXILA757N4/5Og/HBzIxx4NuI75Ys5YzP1ODzCwHaoggRGzjk2iQ3kSSHLlszIO
	YwMGDqhYTkuNMTUPC6Loevt/8haIuIEofsqIE=
Received: by 10.150.72.9 with SMTP id u9mr1395503yba.413.1298051028695;
	Fri, 18 Feb 2011 09:43:48 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.43.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:43:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:16 +0000
Message-Id: <1298051011-10445-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 01/16] xkeyboard-config: avoid recipe code duplication and depends on intltool-native
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:03 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/xkeyboard-config/xkeyboard-config.inc    |   18 ++++++++++++++++++
 recipes/xkeyboard-config/xkeyboard-config_1.4.bb |   18 +++---------------
 recipes/xkeyboard-config/xkeyboard-config_1.8.bb |   18 +++---------------
 recipes/xkeyboard-config/xkeyboard-config_git.bb |   17 +++--------------
 4 files changed, 27 insertions(+), 44 deletions(-)
 create mode 100644 recipes/xkeyboard-config/xkeyboard-config.inc

diff --git a/recipes/xkeyboard-config/xkeyboard-config.inc b/recipes/xkeyboard-config/xkeyboard-config.inc
new file mode 100644
index 0000000..b8aab8c
--- /dev/null
+++ b/recipes/xkeyboard-config/xkeyboard-config.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "Common X11 Keyboard layouts"
+LICENSE = "MIT"
+DEPENDS = "intltool-native xkbcomp-native"
+RDEPENDS_${PN} = "xkbcomp"
+INC_PR = "r6"
+
+SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+do_install_append () {
+    install -d ${D}${datadir}/X11/xkb/compiled
+    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
+}
+
+FILES_${PN} += "${datadir}/X11/xkb"
diff --git a/recipes/xkeyboard-config/xkeyboard-config_1.4.bb b/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
index 3bca763..d8b9e3f 100644
--- a/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
+++ b/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
@@ -1,20 +1,8 @@
-DESCRIPTION = "Common X11 Keyboard layouts"
-LICENSE = "MIT"
-DEPENDS = "intltool xkbcomp-native"
-RDEPENDS_${PN} = "xkbcomp"
-PR = "r5"
+require xkeyboard-config.inc
 
-SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2 \
-           file://abnt2-fixes.patch"
+PR = "${INC_PR}.0"
 
-inherit autotools
-
-do_install_append () {
-    install -d ${D}/usr/share/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
-
-FILES_${PN} += "${datadir}/X11/xkb"
+SRC_URI += "file://abnt2-fixes.patch"
 
 SRC_URI[md5sum] = "a9fe7efbc67a6966c4d4501f0cf88073"
 SRC_URI[sha256sum] = "921a857dcf90a59df7feb26da5aabcf0bbfb749c46e2a46c3bc7a0280b83b0e1"
diff --git a/recipes/xkeyboard-config/xkeyboard-config_1.8.bb b/recipes/xkeyboard-config/xkeyboard-config_1.8.bb
index fbf4f1d..fdeb667 100644
--- a/recipes/xkeyboard-config/xkeyboard-config_1.8.bb
+++ b/recipes/xkeyboard-config/xkeyboard-config_1.8.bb
@@ -1,20 +1,8 @@
-DESCRIPTION = "Common X11 Keyboard layouts"
-LICENSE = "MIT"
-DEPENDS = "intltool xkbcomp-native"
-RDEPENDS_${PN} = "xkbcomp"
-PR = "r0"
+require xkeyboard-config.inc
 
-SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2 \
-           file://abnt2-fixes.patch"
+PR = "${INC_PR}.0"
 
-inherit autotools
-
-do_install_append () {
-    install -d ${D}/usr/share/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
-
-FILES_${PN} += "${datadir}/X11/xkb"
+SRC_URI += "file://abnt2-fixes.patch"
 
 SRC_URI[md5sum] = "37ae41628cd2ce35d202d30b1820c8ba"
 SRC_URI[sha256sum] = "7dc3e6ca00adb105f46e40f8382e83d50b3fcd626bc8654293dae8b1e80506ce"
diff --git a/recipes/xkeyboard-config/xkeyboard-config_git.bb b/recipes/xkeyboard-config/xkeyboard-config_git.bb
index b92bdc1..ac8d03f 100644
--- a/recipes/xkeyboard-config/xkeyboard-config_git.bb
+++ b/recipes/xkeyboard-config/xkeyboard-config_git.bb
@@ -1,20 +1,9 @@
-DESCRIPTION = "Common X11 Keyboard layouts"
-LICENSE = "MIT"
-DEPENDS = "intltool xkbcomp-native"
-RDEPENDS_${PN} = "xkbcomp"
+require xkeyboard-config.inc
+
 SRCREV = "547ae8589afb208d7b44ffe1e0ff7aba466c2ee3"
 PV = "2.0+gitr${SRCPV}"
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI = "git://anongit.freedesktop.org/xkeyboard-config;protocol=git;branch=master"
 
 S = "${WORKDIR}/git"
-
-inherit autotools
-
-do_install_append () {
-    install -d ${D}/usr/share/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
-
-FILES_${PN} += "${datadir}/X11/xkb"
-- 
1.7.2.3



