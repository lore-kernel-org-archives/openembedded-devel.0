Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QHfOj-0001OQ-Lt
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:58:01 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 4D6F779900F; Wed,  4 May 2011 18:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-071-187-171.pools.arcor-ip.net
	[88.71.187.171]) by gravedo.de (Postfix) with ESMTPSA id F0CD879900D;
	Wed,  4 May 2011 18:55:19 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2011 18:55:08 +0200
Message-Id: <1304528108-5217-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4DC17C80.3060001@gravedo.de>
References: <4DC17C80.3060001@gravedo.de>
Subject: [PATCH] cmake.bbclass: set the rpath for native binaries build with cmake
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
X-List-Received-Date: Wed, 04 May 2011 16:58:01 -0000

In the default configuration cmake does not set a rpath for its builded binaries. This
leads to errors at runtime when the binaries not find their needed runtime libraries.
Please note that this is only done for recipes inheriting the native class!

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 classes/cmake.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 40fadea..e8e485a 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -24,6 +24,13 @@ OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS} -f
 OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
 
+OECMAKE_RPATH ?= ""
+python __anonymous() {
+    # Only set OECMAKE_RPATH if we build a native recipe
+    if bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        bb.data.setVar('OECMAKE_RPATH', '${libdir}', d)
+}
+
 cmake_do_generate_toolchain_file() {
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
@@ -44,6 +51,10 @@ cmake_do_generate_toolchain_file() {
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
 # Use qt.conf settings
   echo "set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )" >> ${WORKDIR}/toolchain.cmake
+
+# We need to set the rpath to the correct directory as cmake does not provide any
+# directory as rpath by default
+  echo "set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )" >> ${WORKDIR}/toolchain.cmake
 }
 
 addtask generate_toolchain_file after do_patch before do_configure
-- 
1.7.4.1



