Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnQ-0007dV-M6
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:17 +0200
Received: by mail-gy0-f175.google.com with SMTP id 13so1138049gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:40 -0700 (PDT)
Received: by 10.100.33.14 with SMTP id g14mr2696677ang.247.1287793000193;
	Fri, 22 Oct 2010 17:16:40 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:39 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:48 -0200
Message-Id: <4cc22967.0311650a.0c4d.ffffaf62@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/17] Expedite_svn: Depend on Evas GL engine
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:17 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/e17/expedite_svn.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/e17/expedite_svn.bb b/recipes/e17/expedite_svn.bb
index b88ca4a..efb1145 100644
--- a/recipes/e17/expedite_svn.bb
+++ b/recipes/e17/expedite_svn.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas"
-RDEPENDS_${PN} = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-loader-png"
+RDEPENDS_${PN} = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
 LICENSE = "MIT BSD"
 PV = "0.6.0+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
@@ -17,6 +17,7 @@ EXTRA_OECONF = "\
   --enable-software-x11 \
   --enable-xrender-x11 \
   --enable-software-16-x11 \
+  --enable-opengl-x11 \
   --enable-fb \
   --disable-software-ddraw \
   --disable-software-16-ddraw \
-- 
1.7.3.1



