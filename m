Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Oz33c-0007eN-KY
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:51:02 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Oz33U-0001Sf-M3 from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 00:50:52 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 24 Sep 2010 09:50:50 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 12:51:26 +0500
Message-Id: <1285314686-12472-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Sep 2010 07:50:51.0247 (UTC)
	FILETIME=[355DAFF0:01CB5BBD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-pyrex_0.9.8.5.bb: merged native and non-native recipes
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
X-List-Received-Date: Fri, 24 Sep 2010 07:51:02 -0000

* removed the python-pyrex-native_0.9.8.5.bb file
* added DEPENDS_pn-python-pyrex-native = "python-native"
* added BBCLASSEXTEND = "native"
* added NATIVE_INSTALL_WORKS = "1"
* bunped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/python/python-pyrex-native_0.9.8.5.bb |   13 -------------
 recipes/python/python-pyrex_0.9.8.5.bb        |    7 ++++++-
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/recipes/python/python-pyrex-native_0.9.8.5.bb b/recipes/python/python-pyrex-native_0.9.8.5.bb
deleted file mode 100644
index 109b49e..0000000
--- a/recipes/python/python-pyrex-native_0.9.8.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require python-pyrex_${PV}.bb
-inherit native
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
-
-do_stage() {
-	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-	STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
-        ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
-}
-
-SRC_URI[md5sum] = "3b3d8397c2c9a58fc59a90e2b49c651a"
-SRC_URI[sha256sum] = "dd60bc66b1627d3cbd0950499017dfd57a0705bb12493bb0de2a7b9b5c0873bc"
diff --git a/recipes/python/python-pyrex_0.9.8.5.bb b/recipes/python/python-pyrex_0.9.8.5.bb
index c354b11..34af4f8 100644
--- a/recipes/python/python-pyrex_0.9.8.5.bb
+++ b/recipes/python/python-pyrex_0.9.8.5.bb
@@ -5,7 +5,8 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
 SRCNAME = "Pyrex"
-PR = "ml1"
+DEPENDS_pn-python-pyrex-native = "python-native"
+PR = "ml2"
 
 SRC_URI = "\
   http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
@@ -17,3 +18,7 @@ inherit distutils
 
 SRC_URI[md5sum] = "3b3d8397c2c9a58fc59a90e2b49c651a"
 SRC_URI[sha256sum] = "dd60bc66b1627d3cbd0950499017dfd57a0705bb12493bb0de2a7b9b5c0873bc"
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



