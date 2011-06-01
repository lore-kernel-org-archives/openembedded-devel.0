Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1QRldb-0007ip-Rn
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 15:39:07 +0200
X-Virus-Scanned: amavisd-new at gattei.com
Received: from localhost.localdomain (78-134-90-180.dynamic.eolo.it
	[78.134.90.180])
	by ns1.gatteins.it (Postfix) with ESMTPA id 951E6DEFEE;
	Wed,  1 Jun 2011 15:30:11 +0200 (MEST)
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 15:29:40 +0200
Message-Id: <1306934980-19272-1-git-send-email-matteo.facchinetti@sirius-es.it>
X-Mailer: git-send-email 1.7.0.4
Cc: Matteo Facchinetti <engineering@sirius-es.it>
Subject: [PATCH] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Wed, 01 Jun 2011 13:39:07 -0000

From: Matteo Facchinetti <engineering@sirius-es.it>

Compile task fail with error:
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
| cc1plus: internal compiler error: in add_path, at c-incpath.c:425

Fix it forcing right path in configuration.


Signed-off-by: Matteo Facchinetti <engineering@sirius-es.it>
---
 recipes/wxwidgets/wxbase_2.8.9.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/wxwidgets/wxbase_2.8.9.bb b/recipes/wxwidgets/wxbase_2.8.9.bb
index fb18710..7d593ad 100644
--- a/recipes/wxwidgets/wxbase_2.8.9.bb
+++ b/recipes/wxwidgets/wxbase_2.8.9.bb
@@ -9,7 +9,8 @@ SRC_URI += "file://Makefile.in.patch"
 EXTRA_OECONF = " --disable-gui \
                  --enable-largefile \
                  --enable-gpe \
-                 --without-subdirs"
+                 --without-subdirs \
+                 --with-sdl-prefix=${D}"
 
 LEAD_SONAME = "libwx_base-2.8.so"
 
-- 
1.7.0.4



