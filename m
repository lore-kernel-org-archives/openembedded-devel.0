Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH7D-0006ag-MZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:47 +0200
Received: by mail-ww0-f43.google.com with SMTP id 10so7127460wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:49 -0700 (PDT)
Received: by 10.227.38.99 with SMTP id a35mr3487837wbe.96.1319449248034;
	Mon, 24 Oct 2011 02:40:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a27sm7412261wbp.16.2011.10.24.02.40.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:30 +0200
Message-Id: <1319449234-12080-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1319449234-12080-3-git-send-email-koen@dominion.thruhere.net>
References: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-3-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 4/8] subsurface: update to 1.1 release, start using gitpkgv
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:47 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-extended/subsurface/subsurface_git.bb  |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index b1a7e3e..d401c4e 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -6,8 +6,11 @@ DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0"
 
 inherit gtk-icon-cache
 
-PV = "1.0"
-SRCREV = "f2c61aefa762ce2ef7dea61886afeb23b0fe5eff"
+inherit gitpkgv
+PKGV = "${GITPKGVTAG}"
+PV = "1.1"
+
+SRCREV = "bd275d73ac06823619230915a3aa29deddc996fb"
 SRC_URI = "git://subsurface.hohndel.org/subsurface.git"
 S = "${WORKDIR}/git"
 
@@ -18,8 +21,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                "
 
 do_install() {
-	install -d ${D}${datadir}/man/man1
-	oe_runmake install prefix=${D}${prefix}
+	oe_runmake install DESTDIR=${D}
 	rm ${D}${datadir}/icons/hicolor/icon-theme.cache
 }
 
-- 
1.6.6.1



