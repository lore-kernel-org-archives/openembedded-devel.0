Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OzA7v-00023W-8V
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 17:23:57 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OzA7m-0005W4-Rs from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 08:23:47 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 24 Sep 2010 17:23:45 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 20:24:25 +0500
Message-Id: <1285341865-29172-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Sep 2010 15:23:45.0525 (UTC)
	FILETIME=[7A7F7250:01CB5BFC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-epydoc_3.0.1.bb: merged native and non-native recipes
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
X-List-Received-Date: Fri, 24 Sep 2010 15:23:57 -0000

* removed the python-epydoc-native_3.0.1.bb file
* added DEPENDS_pn-python-epydoc-native = "python-native" and added DEPENDS_pn-python-epydoc = "python"
* added BBCLASSEXTEND = "native"
* added NATIVE_INSTALL_WORKS = "1"
* bunped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/python/python-epydoc-native_3.0.1.bb |   11 -----------
 recipes/python/python-epydoc_3.0.1.bb        |    8 +++++++-
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/recipes/python/python-epydoc-native_3.0.1.bb b/recipes/python/python-epydoc-native_3.0.1.bb
deleted file mode 100644
index c9d6813..0000000
--- a/recipes/python/python-epydoc-native_3.0.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require python-epydoc_${PV}.bb
-DEPENDS = "python-native"
-inherit native
-
-do_stage() {
-	distutils_stage_all
-}
-
-
-SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
-SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af61725b6ad1"
diff --git a/recipes/python/python-epydoc_3.0.1.bb b/recipes/python/python-epydoc_3.0.1.bb
index a2b66e3..6a2e591 100644
--- a/recipes/python/python-epydoc_3.0.1.bb
+++ b/recipes/python/python-epydoc_3.0.1.bb
@@ -4,7 +4,9 @@ PRIORITY = "optional"
 LICENSE = "MIT" 
 HOMEPAGE = "http://epydoc.sourceforge.net/" 
 SRCNAME = "epydoc" 
-DEPENDS = "python" 
+DEPENDS_pn-python-epydoc = "python"
+DEPENDS_pn-python-epydoc-native = "python-native"
+PR = "r1"
  
 SRC_URI = "http://downloads.sourceforge.net/project/${SRCNAME}/${SRCNAME}/${PV}/${SRCNAME}-${PV}.tar.gz" 
 S = "${WORKDIR}/${SRCNAME}-${PV}" 
@@ -13,3 +15,7 @@ inherit distutils
 
 SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
 SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af61725b6ad1"
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



