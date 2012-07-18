Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrbqZ-0000fg-0l
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:31:51 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1625270wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uN9e117786nU4JNIvy3ap5mao2Q14ACJ0380uq0uivA=;
	b=WgaANH0ZRGZDY7FhbKsJnvOGn5o0SGTK2/k7mzSXtJxPKGjYxIoX1PCr/RlHGosBnN
	so1K+6Cbb5H4PgZ70ed91WLt8Qqe6FKCpIzLqgXNNyBp+MDd/j+VHmt0dmscVOLF0AmS
	QLVt8MOQI4AcErK3c2SFcz3qHk5ymxPynAuO488GLDiWw3q8OoIVcixgv/Rsregu+jbh
	vtdWd4/3BIqtQsRx3M0pgAuu1KSOElKgT3GbhbYZooHrWID7cBOrA2W5j75XptIIlDIb
	b+w6raGGIw66zn64DXXviQihEoCqdA39vWdqssvazHMcjnjNK18l634Y15VxWrgFWPDX
	Pt/Q==
Received: by 10.180.103.136 with SMTP id fw8mr9843991wib.20.1342646432218;
	Wed, 18 Jul 2012 14:20:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm344395wiz.11.2012.07.18.14.20.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:20 +0200
Message-Id: <741190332fa5e385ced5795af94cac65f145a3fe.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 10/14] e-wm: packaging: include flags in PN-images, add catch-all PN-backgrounds package
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
X-List-Received-Date: Wed, 18 Jul 2012 21:31:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 3e1a660..6b6dd96 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -71,6 +72,7 @@ PACKAGES =+ "\
   ${PN}-theme-default \
   ${PN}-background-dark-gradient \
   ${PN}-background-light-gradient \
+  ${PN}-backgrounds \
   ${PN}-images \
   ${PN}-icons \
   ${PN}-other \
@@ -122,7 +124,8 @@ FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
 FILES_${PN}-background-light-gradient = "${datadir}/enlightenment/data/backgrounds/Light_Gradient.edj"
-FILES_${PN}-images = "${datadir}/enlightenment/data/images"
+FILES_${PN}-backgrounds = "${datadir}/enlightenment/data/backgrounds/*.edj"
+FILES_${PN}-images = "${datadir}/enlightenment/data/images ${datadir}/enlightenment/data/flags"
 FILES_${PN}-icons = "${datadir}/enlightenment/data/icons"
 FILES_${PN}-other = "${datadir}/enlightenment/data/other"
 FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
@@ -132,6 +135,7 @@ FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
 
 FILES_efm-desktop-icon = "\
   ${datadir}/applications/efm.desktop \
+  ${datadir}/applications/enlightenment_filemanager.desktop \
   ${datadir}/icons/e-module-fileman.png \
 "
 
-- 
1.7.8.6



