Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2mC8-0007Lw-P2
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:11:52 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2mAK-0002QD-Fk by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:09:38 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2mAJ-0008Jt-G4
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:09:35 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 16:09:34 +0100
Message-Id: <4a698de742e902a9c76bbefa59bf01ae6a48b113.1300979039.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300979039.git.stefan@buglabs.net>
References: <cover.1300979039.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 1/7] openjdk: use qemu now for the awt sizer binary too
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
X-List-Received-Date: Thu, 24 Mar 2011 15:11:56 -0000

From: Henning Heinold <h.heinold@tarent.de>

* bump INC_PR

Signed-off-by: Henning Heinold <h.heinold@tarent.de>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 .../icedtea-crosscompile-fix.patch                 |   24 ++++++++++---------
 recipes/openjdk/openjdk-6-common.inc               |    8 +-----
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
index ec0f259..652f7ac 100644
--- a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
@@ -73,17 +73,6 @@ Index: openjdk/jdk/make/sun/xawt/Makefile
  endif
  
  ifeq ($(PLATFORM), solaris)
-@@ -237,7 +238,9 @@
- 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) WrapperGenerator \
- 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
- 
--$(SIZES): $(SIZERS)
-+#$(SIZES): $(SIZERS)
-+# Prevent binaries being created. Instead take what is available.
-+$(SIZES):
- 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
- 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
- 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
 Index: openjdk/hotspot/make/linux/makefiles/vm.make
 ===================================================================
 --- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-01-24 17:54:57.000000000 +0100
@@ -212,3 +201,16 @@ Index: openjdk/hotspot/make/linux/makefiles/launcher.make
    LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
  endif
  
+Index: icedtea6-1.8.5/build/openjdk/jdk/make/sun/xawt/Makefile
+===================================================================
+--- openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:17:03.926207269 +0100
++++ openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:30:11.956186631 +0100
+@@ -245,7 +245,7 @@
+ 	    $(CHMOD) +w $@;\
+ 	else	\
+ 	    $(ECHO) GENERATING $@; \
+-	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+ 	fi
+ 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+ 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
index f04800b..54c45f8 100644
--- a/recipes/openjdk/openjdk-6-common.inc
+++ b/recipes/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -288,12 +288,6 @@ addtask compilestepone after do_configure before do_compilesteptwo
 do_compilesteptwo() {
 	echo "2/3 Building bootstrap JDK"
 
-	# Take pre-generated binaries from -native build
-	install -d generated/sun/awt/X11/generator
-	ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/generated/sizer.32 generated/sun/awt/X11/generator/sizer.32
-	install -d openjdk/${BUILD_DIR}/gensrc/sun/awt/X11/generator
-	ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/generated/sizer.32 openjdk/${BUILD_DIR}/gensrc/sun/awt/X11/generator/sizer.32
-
 	# Now cross-compile bootstrap JDK
 	rm stamps/icedtea-against-ecj.stamp stamps/icedtea-ecj.stamp || true
 	oe_runmake icedtea-against-ecj
-- 
1.7.4.1



