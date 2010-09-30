Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1P1DvO-0008Kt-S7
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 09:51:33 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1P1Duz-0006dh-Q0 from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 00:51:05 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 30 Sep 2010 09:44:20 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 12:45:57 +0500
Message-Id: <1285832757-18773-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 30 Sep 2010 07:44:20.0831 (UTC)
	FILETIME=[4B236EF0:01CB6073]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-setuptools: mergerd natinve and target
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
X-List-Received-Date: Thu, 30 Sep 2010 07:51:35 -0000

* merged native and target recipes and converted to new style staging
* bumped PR
* added BBCLASSEXTEND = "native" and NATIVE_INSTALL_WORKS = "1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/python/python-setuptools-native_0.6c9.bb |   11 -----------
 recipes/python/python-setuptools_0.6c9.bb        |    7 ++++++-
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/recipes/python/python-setuptools-native_0.6c9.bb b/recipes/python/python-setuptools-native_0.6c9.bb
deleted file mode 100644
index 3a39701..0000000
--- a/recipes/python/python-setuptools-native_0.6c9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require python-setuptools_${PV}.bb
-inherit native
-
-DEPENDS = "python-native"
-
-do_stage() {
-	distutils_stage_all
-}
-
-SRC_URI[md5sum] = "3864c01d9c719c8924c455714492295e"
-SRC_URI[sha256sum] = "e6190497301b6cb1484b9e6173723452c8df1b4cd9ea97af75c9589b1c34b3d8"
diff --git a/recipes/python/python-setuptools_0.6c9.bb b/recipes/python/python-setuptools_0.6c9.bb
index d2682bb..069437a 100644
--- a/recipes/python/python-setuptools_0.6c9.bb
+++ b/recipes/python/python-setuptools_0.6c9.bb
@@ -4,7 +4,8 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "MIT"
 SRCNAME = "setuptools"
-PR = "ml1"
+PR = "ml2"
+DEPENDS_pn-python-setuptools-native = "python-native"
 
 SRC_URI = "\
   http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz\
@@ -25,3 +26,7 @@ RDEPENDS_${PN} = "\
 
 SRC_URI[md5sum] = "3864c01d9c719c8924c455714492295e"
 SRC_URI[sha256sum] = "e6190497301b6cb1484b9e6173723452c8df1b4cd9ea97af75c9589b1c34b3d8"
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



