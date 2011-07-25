Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlQyg-00025Y-48
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 21:38:11 +0200
Received: by wwi18 with SMTP id 18so3680841wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:33:57 -0700 (PDT)
Received: by 10.216.182.72 with SMTP id n50mr819476wem.57.1311622436941;
	Mon, 25 Jul 2011 12:33:56 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b13sm4580746wbh.7.2011.07.25.12.33.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 12:33:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 21:33:42 +0200
Message-Id: <1311622422-22620-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-efl] places: fix build e-module: inherit gettext
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
X-List-Received-Date: Mon, 25 Jul 2011 19:38:11 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/e17/e-module.inc  |    2 +-
 meta-efl/recipes-efl/e17/places_svn.bb |    5 -----
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl/e17/e-module.inc
index 3834a2e..97081aa 100644
--- a/meta-efl/recipes-efl/e17/e-module.inc
+++ b/meta-efl/recipes-efl/e17/e-module.inc
@@ -7,7 +7,7 @@ INC_PR = "r5"
 
 SRCNAME = "E-MODULES-EXTRA/${PN}"
 
-inherit e
+inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index f447745..0abe138 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -6,10 +6,5 @@ PR = "${INC_PR}.0"
 
 require e-module.inc
 
-do_configure_prepend() {
-       sed -i -e /po/d -e /AM_GNU_GETTEXT/d configure.ac
-       sed -i -e s:\ po::g Makefile.am
-}
-
 # Calls /usr/bin/eject for media
 RRECOMMENDS_${PN} += "eject"
-- 
1.6.6.1



