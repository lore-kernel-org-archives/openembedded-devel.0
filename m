Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnU-0007j7-7R
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:21 +0200
Received: by gwaa11 with SMTP id a11so1560540gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:36 -0700 (PDT)
Received: by 10.100.135.14 with SMTP id i14mr2693230and.202.1287792996341;
	Fri, 22 Oct 2010 17:16:36 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:35 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:46 -0200
Message-Id: <4cc22963.0311650a.0c4d.ffffaf60@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/17] evas.inc: Require virtual/gles2 and enable gl engine
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:23 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/evas.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
index e7ba309..964f5c9 100644
--- a/recipes/efl1/evas.inc
+++ b/recipes/efl1/evas.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Evas is the Enlightenment canvas API"
 LICENSE = "MIT BSD"
 # can also depend on valgrind, libsdl-x11, directfb
-DEPENDS = "librsvg eina eet freetype jpeg libpng virtual/libx11 libxext libxrender fontconfig libfribidi"
+DEPENDS = "librsvg eina eet freetype jpeg libpng virtual/gles2 virtual/libx11 libxext libxrender fontconfig libfribidi"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.9.9.060+svnr${SRCPV}"
 PR = "r1"
@@ -43,7 +43,7 @@ RRECOMMENDS_${PN} = "\
   evas-engine-software-16 \
   evas-engine-software-16-x11 \
   evas-engine-xrender-x11 \
-  \
+  evas-engine-gl-x11 \
   evas-loader-png \
   evas-loader-jpeg \
   evas-loader-eet \
-- 
1.7.3.1



