Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCdQv-0001Qg-4m
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 19:14:44 +0100
Received: by ywh26 with SMTP id 26so4993071ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 10:13:12 -0800 (PST)
Received: by 10.101.179.24 with SMTP id g24mr3933196anp.62.1258999989135;
	Mon, 23 Nov 2009 10:13:09 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 9sm1559186ywf.5.2009.11.23.10.12.59
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 10:13:02 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 15:06:24 -0300
Message-Id: <1258999585-10614-2-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
References: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] mamonaim-e-applet-git: bumping rev, fixing PV and using oe-stylize
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
X-List-Received-Date: Mon, 23 Nov 2009 18:14:44 -0000

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 conf/distro/include/sane-srcrevs.inc    |    2 +-
 recipes/mamona/mamonaim-e-applet_git.bb |   17 ++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 7b11e1d..42598c1 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -172,7 +172,7 @@ SRCREV_pn-llvm-gcc4-cross ?= "374"
 SRCREV_pn-madbutterfly ?= "ecd1842714b5e982f3138cbdd358517d57be6aa3"
 SRCREV_pn-maemo-mapper ?= "118"
 SRCREV_pn-mamona_input_methods ?= "7e6a8cc947689a045d0fba90015da599275347d9"
-SRCREV_pn-mamonaim_e_applet ?= "51c747849f71981bd1dc9eb1807df4993ad97d04"
+SRCREV_pn-mamonaim-e-applet ?= "a1ba7e8a388ffce3cca92bad059cd801e7733a7a"
 SRCREV_pn-matchbox-config-gtk ?= "1614"
 SRCREV_pn-matchbox-desktop-2 ?= "2096"
 SRCREV_pn-matchbox-keyboard ?= "1910"
diff --git a/recipes/mamona/mamonaim-e-applet_git.bb b/recipes/mamona/mamonaim-e-applet_git.bb
index 6f45a45..c858dfc 100644
--- a/recipes/mamona/mamonaim-e-applet_git.bb
+++ b/recipes/mamona/mamonaim-e-applet_git.bb
@@ -5,15 +5,18 @@ DESCRIPTION = "Mamona-IM Enlightenment Applet"
 HOMEPAGE = "http://dev.openbossa.org/trac/mamona/wiki"
 LICENSE = "MIT BSD"
 DEPENDS = "mamona-input-methods e-wm"
-PR = "r0"
+PV = "0.1-${PR}+gitr${SRCREV}"
+PR = "r1"
+PE = "1"
 
-PV = "0.1+git"
+SRC_URI = "git://dev.openbossa.org/mamona/projects/mamonaim_e_applet.git;protocol=http"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://dev.openbossa.org/mamona/projects/mamonaim_e_applet.git;protocol=http"
-
-S = "${WORKDIR}/git"
+do_configure_prepend() {
+        ./autogen.sh
+}
 
 # E Applet
 FILES_${PN} = "\
@@ -30,7 +33,3 @@ FILES_${PN}-dev = "\
 FILES_${PN}-dbg = "\
             ${libdir}/enlightenment/modules/mamonaim/*/.debug \
         "
-
-do_configure_prepend() {
-    ./autogen.sh
-}
-- 
1.6.5



