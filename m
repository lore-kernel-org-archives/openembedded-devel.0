Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NCKuL-0002hI-G7
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 23:27:52 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 6987A1C15570;
	Sun, 22 Nov 2009 23:26:22 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 50DAA91D6F;
	Sun, 22 Nov 2009 23:26:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id ymlUimHnilAQ; Sun, 22 Nov 2009 23:26:20 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP;
	Sun, 22 Nov 2009 23:26:19 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Sun, 22 Nov 2009 23:26:19 +0100
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 23:26:10 +0100
Message-Id: <1258928770-18179-1-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH] e-wm_svn.bb: split ${sysconfdir}/xdg/menus/applications.menu into it's own package
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
X-List-Received-Date: Sun, 22 Nov 2009 22:27:52 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 recipes/e17/e-wm_svn.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
index 83dbd81..a935728 100644
--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -80,6 +80,7 @@ PACKAGES =+ "\
   ${PN}-input-methods \
   ${PN}-sysactions \
   ${PN}-utils \
+  ${PN}-menu \
 "
 
 RRECOMMENDS_${PN} = "\
@@ -89,6 +90,7 @@ RRECOMMENDS_${PN} = "\
   ${PN}-other \
   ${PN}-input-methods \
   ${PN}-sysactions \
+  ${PN}-menu \
 "
 
 PACKAGE_ARCH_${PN}-config-default = "all"
@@ -106,6 +108,7 @@ PACKAGE_ARCH_${PN}-icons = "all"
 PACKAGE_ARCH_${PN}-other = "all"
 PACKAGE_ARCH_${PN}-input-methods = "all"
 PACKAGE_ARCH_${PN}-sysactions = "all"
+PACKAGE_ARCH_${PN}-menu = "all"
 
 FILES_${PN} = "\
   ${bindir}/* \
@@ -140,6 +143,7 @@ FILES_${PN}-other = "${datadir}/enlightenment/data/other"
 FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
 FILES_${PN}-sysactions = "${sysconfdir}/enlightenment/sysactions.conf"
 FILES_${PN}-utils = "${libdir}/enlightenment/utils/*"
+FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
 
 RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
 RRECOMMENDS_${PN}-config-illume = "${PN}-theme-illume"
@@ -165,7 +169,8 @@ FILES_${PN}-doc += "\
   ${datadir}/enlightenment/doc \
 "
 
-CONFFILES_${PN} = "${sysconfdir}/xdg/menus/applications.menu"
+CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
+CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
 
 ALTERNATIVE_PATH = "${bindir}/enlightenment_start.oe"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
1.6.5.2



