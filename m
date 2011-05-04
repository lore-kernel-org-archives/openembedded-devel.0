Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QHeXO-0000SS-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:02:54 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id D193C79900F; Wed,  4 May 2011 17:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-071-187-171.pools.arcor-ip.net
	[88.71.187.171]) by gravedo.de (Postfix) with ESMTPSA id 2DBB079900D;
	Wed,  4 May 2011 17:50:32 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2011 17:50:28 +0200
Message-Id: <1304524228-25642-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] cmake.bbclass: set the rpath for binaries build with cmake to ${libdir}
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
X-List-Received-Date: Wed, 04 May 2011 16:02:54 -0000

In the default configuration cmake does not set a rpath for its builded binaries. This
leads to errors at runtime when the binaries not find their needed runtime libraries.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 classes/cmake.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 40fadea..5f7066b 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -44,6 +44,10 @@ cmake_do_generate_toolchain_file() {
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
 # Use qt.conf settings
   echo "set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )" >> ${WORKDIR}/toolchain.cmake
+
+# We need to set the rpath to the correct directory as cmake does not provide any
+# directory as rpath by default
+  echo "set( CMAKE_INSTALL_RPATH ${libdir} )" >> ${WORKDIR}/toolchain.cmake
 }
 
 addtask generate_toolchain_file after do_patch before do_configure
-- 
1.7.4.1



