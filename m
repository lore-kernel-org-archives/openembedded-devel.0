Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MHLDP-00074m-BF
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 19:15:56 +0200
Received: (qmail 12706 invoked by uid 107); 18 Jun 2009 17:05:20 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 18 Jun 2009 19:05:20 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 19:05:15 +0200
Message-Id: <1245344715-22415-1-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH] render cmake search path stricter
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
X-List-Received-Date: Thu, 18 Jun 2009 17:15:57 -0000

The search is only done in the STAGING directy: all the needed tools
should be there (already built) and all the libs and header are there
too. With this, we are sure that we do not mix with the host libs,
headers or tools.

Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
---
 classes/cmake.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index b5b7b86..af8f3a9 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -21,6 +21,9 @@ cmake_do_configure() {
   cmake ${OECMAKE_SOURCEPATH} \
     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
     -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY \
+    -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
+    -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
     ${EXTRA_OECMAKE} \
     -Wno-dev
 }
-- 
1.6.0.4



