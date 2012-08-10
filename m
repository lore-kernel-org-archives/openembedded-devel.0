Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szphp-00027D-LF
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:49 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so927334wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GVEZmSzE8nF/Jd5QtNhNOhMkb1bwvdwI9oAKmCn+Gk8=;
	b=F4+xfji5LjsFQPgE36Zau9mgiJsGb8tWAh0jWfS4B7twTFG82EoxpVmD4gpW/E0nJn
	1ZaAP5CwO/etuhcl014LAS6EqMDuXmBDRzcTtkCjBrcsZrr6deUgTfLtHgyqHr8ufndm
	nzxnasR6cUySlWCTiNxhfrf/bRVp852I+m9urbVnRkV+xZkoufgqF4NHeQUuv+ZOhjvY
	6LhugFgoK0AiIzL0001ePejH9uwfwygfPTY5JXkSjFALsYPj3cFPyW6NumE/Dx5zqvPI
	ATE5IRRCjxfNOv0PdVBQUFEyDgleTib5743T+jJsmVceJDrd/OALi/BHf0Y5y01RBxRV
	010Q==
Received: by 10.216.198.10 with SMTP id u10mr1630221wen.80.1344606302252;
	Fri, 10 Aug 2012 06:45:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm7824495wib.10.2012.08.10.06.45.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:05 +0200
Message-Id: <d1d47564dbdd2fda529eb8adb64e367224d225bf.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 10/46] e-wm: packaging: include flags in PN-images, add catch-all PN-backgrounds package
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 7cc072e..c2bb1e7 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -72,6 +72,7 @@ PACKAGES =+ "\
   ${PN}-theme-default \
   ${PN}-background-dark-gradient \
   ${PN}-background-light-gradient \
+  ${PN}-backgrounds \
   ${PN}-images \
   ${PN}-icons \
   ${PN}-other \
@@ -123,7 +124,8 @@ FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
 FILES_${PN}-background-light-gradient = "${datadir}/enlightenment/data/backgrounds/Light_Gradient.edj"
-FILES_${PN}-images = "${datadir}/enlightenment/data/images"
+FILES_${PN}-backgrounds = "${datadir}/enlightenment/data/backgrounds/*.edj"
+FILES_${PN}-images = "${datadir}/enlightenment/data/images ${datadir}/enlightenment/data/flags"
 FILES_${PN}-icons = "${datadir}/enlightenment/data/icons"
 FILES_${PN}-other = "${datadir}/enlightenment/data/other"
 FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
@@ -133,6 +135,7 @@ FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
 
 FILES_efm-desktop-icon = "\
   ${datadir}/applications/efm.desktop \
+  ${datadir}/applications/enlightenment_filemanager.desktop \
   ${datadir}/icons/e-module-fileman.png \
 "
 
-- 
1.7.8.6



