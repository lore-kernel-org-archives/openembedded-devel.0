Received: from gate.tarent.de
	([212.79.178.249] helo=ugs.tarent.de ident=daemon)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <henning@tarent.de>) id 1PzoPH-0002vn-VE
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:56:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 483704004CD15;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 407AE4005161C;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bch0ZD+tKTId; Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 1CDD24004CD15;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1PzoNe-0006KL-ND; Wed, 16 Mar 2011 11:55:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:54:41 +0100
Message-Id: <1300272884-24220-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 1/4] openjdk: use qemu now for the awt sizer binary too
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
X-List-Received-Date: Wed, 16 Mar 2011 10:56:48 -0000

From: Henning Heinold <h.heinold@tarent.de>

* bump INC_PR
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
1.7.0.4



