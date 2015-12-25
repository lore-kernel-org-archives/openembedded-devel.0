Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D122731A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uh2E005320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:43 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:43 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:34 +0800
Message-ID: <c2b664e7ef7d1fd0758098a645848adfbcecf99f.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 14/15] icedtea7-native/openjdk-7: fails on hosts with no unzip
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Dec 2015 07:56:42 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Fails with an error message /usr/bin/unzip not found.
Additionally, icedtea7 enables you to specify an unzip to use by setting
the variable UNZIP, this results in an error because unzip uses UNZIP
to specify options, hence you'll end up with unzip trying to unzip unzip.

Note: Same issue applies to  openjdk

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/icedtea/icedtea7-native.inc           |   2 +
 .../openjdk-7-03b147/icedtea-jdk-unzip.patch       | 130 +++++++++++++++
 .../openjdk-7-03b147/icedtea-makefile-unzip.patch  | 167 +++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |   3 +
 recipes-core/openjdk/openjdk-7-common.inc          |   2 +
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      |   3 +
 .../patches-openjdk-7/icedtea-jdk-unzip.patch      | 130 +++++++++++++++
 .../patches-openjdk-7/icedtea-makefile-unzip.patch | 176 +++++++++++++++++++++
 8 files changed, 613 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-unzip.patch
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-makefile-unzip.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-unzip.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-makefile-unzip.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index b38f3cb..cb6b5d3 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -85,6 +85,7 @@ EXTRA_OECONF = "\
         --with-jaxws-src-zip=${DL_DIR}/${JAXWS_FILE} \
         --with-jdk-src-zip=${DL_DIR}/${JDK_FILE} \
         --with-langtools-src-zip=${DL_DIR}/${LANGTOOLS_FILE} \
+        ac_cv_path_UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
   "
 
 JDK_DIR = "icedtea7-native"
@@ -163,6 +164,7 @@ EXTRA_OEMAKE = ' \
                 ZIPEXE="${STAGING_BINDIR_NATIVE}/zip" \
 		${OEMAKE_BUILD_HEADLESS_ONLY} \
 		DISABLE_HOTSPOT_OS_VERSION_CHECK=ok \
+                UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
                '
 
 do_compile() {
diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-unzip.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-unzip.patch
new file mode 100644
index 0000000..8c29730
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-unzip.patch
@@ -0,0 +1,130 @@
+Use UNZIP_BIN instead of UNZIP.
+
+Fails with an error message /usr/bin/unzip not found.
+Additionally, icedtea7 enables you to specify an unzip to use by setting
+the variable UNZIP, this results in an error because unzip uses UNZIP
+to specify options, hence you'll end up with unzip trying to unzip unzip.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ openjdk/corba/make/common/shared/Defs-utils.gmk       |    6 +++---
+ openjdk/jdk/make/common/Demo.gmk                      |    2 +-
+ openjdk/jdk/make/common/Release.gmk                   |    2 +-
+ openjdk/jdk/make/common/internal/ImportComponents.gmk |    4 ++--
+ openjdk/jdk/make/common/shared/Defs-utils.gmk         |    6 +++---
+ openjdk/jdk/make/common/shared/Sanity.gmk             |    2 +-
+ openjdk/jdk/make/java/redist/Makefile                 |    4 ++--
+ 7 files changed, 13 insertions(+), 13 deletions(-)
+
+--- openjdk/corba/make/common/shared/Defs-utils.gmk
++++ openjdk/corba/make/common/shared/Defs-utils.gmk
+@@ -129,7 +129,7 @@
+ TRUE           = $(UTILS_COMMAND_PATH)true
+ UNAME          = $(UTILS_COMMAND_PATH)uname
+ UNIQ           = $(UTILS_USR_BIN_PATH)uniq
+-UNZIP          = $(UTILS_USR_BIN_PATH)unzip
++# UNZIP      = $(UTILS_USR_BIN_PATH)unzip
+ UNZIPSFX       = $(UTILS_DEVTOOL_PATH)unzipsfx
+ WC             = $(UTILS_USR_BIN_PATH)wc
+ WHICH          = $(UTILS_USR_BIN_PATH)which
+@@ -146,10 +146,10 @@
+     # Intrinsic unix command, with backslash-escaped character interpretation
+     ECHO = $(UNIXCOMMAND_PATH)echo -e
+     ZIPEXE = $(UNIXCOMMAND_PATH)zip
+-    UNZIP  = $(UNIXCOMMAND_PATH)unzip
++    # UNZIP  = $(UNIXCOMMAND_PATH)unzip
+   else
+     ZIPEXE = $(UTILS_DEVTOOL_PATH)zip
+-    UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
++    # UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
+   endif
+   # Re-define some utilities
+   LEX            =# override GNU Make intrinsic: no lex on windows
+--- openjdk/jdk/make/common/Demo.gmk
++++ openjdk/jdk/make/common/Demo.gmk
+@@ -348,7 +348,7 @@
+ 	  $(java-vm-cleanup) )
+ 	@( $(CD) $(DEMO_DESTDIR) && $(java-vm-cleanup) )
+ 	@$(ECHO) "Expanding source into demos area at $(DEMO_DESTDIR)"
+-	( $(CD) $(DEMO_DESTDIR) && $(UNZIP) -o src.zip && $(RM) src.zip )
++	( $(CD) $(DEMO_DESTDIR) && $(UNZIP_BIN) -o src.zip && $(RM) src.zip )
+ endif
+ 
+ build: sources bundles
+--- openjdk/jdk/make/common/Release.gmk
++++ openjdk/jdk/make/common/Release.gmk
+@@ -909,7 +909,7 @@
+ initial-image-jdk-db: $(DB_ZIP_LIST)
+ 	$(MKDIR) -p $(JDK_IMAGE_DIR)/db
+ 	for d in $(DB_ZIP_LIST); do \
+-          ($(CD) $(JDK_IMAGE_DIR)/db && $(UNZIP) -o $$d); \
++          ($(CD) $(JDK_IMAGE_DIR)/db && $(UNZIP_BIN) -o $$d); \
+ 	done
+ 	$(CP) $(ABS_DB_PATH)/README-JDK.html $(JDK_IMAGE_DIR)/db
+ 	$(RM) -rf $(DEMODIR)/db
+--- openjdk/jdk/make/common/internal/ImportComponents.gmk
++++ openjdk/jdk/make/common/internal/ImportComponents.gmk
+@@ -97,8 +97,8 @@
+ define Unzipper
+ ( \
+   $(MKDIR) -p $1; \
+-  $(ECHO) "( $(CD) $1 && $(UNZIP) -o $2 )"; \
+-  ( $(CD) $1 && $(UNZIP) -o $2 ) \
++  $(ECHO) "( $(CD) $1 && $(UNZIP_BIN) -o $2 )"; \
++  ( $(CD) $1 && $(UNZIP_BIN) -o $2 ) \
+ )
+ endef
+ 
+--- openjdk/jdk/make/common/shared/Defs-utils.gmk
++++ openjdk/jdk/make/common/shared/Defs-utils.gmk
+@@ -145,7 +145,7 @@
+ TRUE           = $(UTILS_COMMAND_PATH)true
+ UNAME          = $(UTILS_COMMAND_PATH)uname
+ UNIQ           = $(UTILS_USR_BIN_PATH)uniq
+-UNZIP          = $(UTILS_USR_BIN_PATH)unzip
++# UNZIP      = $(UTILS_USR_BIN_PATH)unzip
+ UNZIPSFX       = $(UTILS_DEVTOOL_PATH)unzipsfx
+ XARGS          = $(UTILS_USR_BIN_PATH)xargs
+ WC             = $(UTILS_USR_BIN_PATH)wc
+@@ -163,12 +163,12 @@
+     # Intrinsic unix command, with backslash-escaped character interpretation
+     ECHO = $(UNIXCOMMAND_PATH)echo -e
+     ZIPEXE = $(UNIXCOMMAND_PATH)zip
+-    UNZIP  = $(UNIXCOMMAND_PATH)unzip
++    # UNZIP  = $(UNIXCOMMAND_PATH)unzip
+     # Some CYGWIN nawk versions require BINMODE=w for proper '\r' interpretation
+     NAWK   = $(UNIXCOMMAND_PATH)awk -v BINMODE=w
+   else
+     ZIPEXE = $(UTILS_DEVTOOL_PATH)zip
+-    UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
++    # UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
+     NAWK   = $(UNIXCOMMAND_PATH)awk
+   endif
+   # Re-define some utilities
+--- openjdk/jdk/make/common/shared/Sanity.gmk
++++ openjdk/jdk/make/common/shared/Sanity.gmk
+@@ -151,7 +151,7 @@
+ # Get the version numbers of what we are using
+ _MAKE_VER  :=$(shell $(MAKE) --version 2>&1 | $(HEAD) -n 1)
+ _ZIP_VER   :=$(shell $(ZIPEXE) -help 2>&1 | $(HEAD) -n 4 | $(EGREP) '^Zip')
+-_UNZIP_VER :=$(shell $(UNZIP)  -help 2>&1 | $(HEAD) -n 4 | $(EGREP) '^UnZip')
++_UNZIP_VER :=$(shell $(UNZIP_BIN)  -help 2>&1 | $(HEAD) -n 4 | $(EGREP) '^UnZip')
+ _BOOT_VER  :=$(shell $(BOOTDIR)/bin/java -version 2>&1 | $(HEAD) -n 1)
+ MAKE_VER   :=$(call GetVersion,"$(_MAKE_VER)")
+ ZIP_VER    :=$(call GetVersion,"$(_ZIP_VER)")
+--- openjdk/jdk/make/java/redist/Makefile
++++ openjdk/jdk/make/java/redist/Makefile
+@@ -482,8 +482,8 @@
+ define SecUnzipper
+ if [ -f $2 ] ; then \
+   $(MKDIR) -p $1; \
+-  $(ECHO) "( $(CD) $1 && $(UNZIP) -o $2 )"; \
+-  ( $(CD) $1 && $(UNZIP) -o $2 ); \
++  $(ECHO) "( $(CD) $1 && $(UNZIP_BIN) -o $2 )"; \
++  ( $(CD) $1 && $(UNZIP_BIN) -o $2 ); \
+ fi
+ endef
+ 
diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-makefile-unzip.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-makefile-unzip.patch
new file mode 100644
index 0000000..9b69a42
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-makefile-unzip.patch
@@ -0,0 +1,167 @@
+Use UNZIP_BIN instead of UNZIP.
+    
+Fails with an error message /usr/bin/unzip not found.
+Additionally, icedtea7 enables you to specify an unzip to use by setting
+the variable UNZIP, this results in an error because unzip uses UNZIP
+to specify options, hence you'll end up with unzip trying to unzip unzip.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.am  |   14 +++++++-------
+ Makefile.in  |   16 ++++++++--------
+ configure.ac |    2 +-
+ 3 files changed, 16 insertions(+), 16 deletions(-)
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1056,7 +1056,7 @@
+ 	if ! test -d openjdk ; then \
+ 	  if [ ! -z $(OPENJDK_SRC_ZIP) ] ; then \
+ 	    case "$(OPENJDK_SRC_ZIP)" in \
+-	      *.zip) $(UNZIP) -q $(OPENJDK_SRC_ZIP) ;; \
++	      *.zip) $(UNZIP_BIN) -q $(OPENJDK_SRC_ZIP) ;; \
+ 	      *.tar.*) $(TAR) xf $(OPENJDK_SRC_ZIP) ;; \
+ 	    esac; \
+ 	    mv `echo $(ICEDTEA_PREFIX)|sed 's#\.#-#'`-$(OPENJDK_CHANGESET) openjdk ; \
+@@ -1072,7 +1072,7 @@
+ 	    if ! test -d openjdk/corba ; \
+ 	    then \
+ 	      case "$(CORBA_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(CORBA_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(CORBA_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(CORBA_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv corba-$(CORBA_CHANGESET) openjdk/corba ; \
+@@ -1086,7 +1086,7 @@
+ 	    if ! test -d openjdk/jaxp ; \
+ 	    then \
+ 	      case "$(JAXP_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(JAXP_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(JAXP_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(JAXP_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv jaxp-$(JAXP_CHANGESET) openjdk/jaxp ; \
+@@ -1100,7 +1100,7 @@
+ 	    if ! test -d openjdk/jaxws ; \
+ 	    then \
+ 	      case "$(JAXWS_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(JAXWS_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(JAXWS_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(JAXWS_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv jaxws-$(JAXWS_CHANGESET) openjdk/jaxws ; \
+@@ -1114,7 +1114,7 @@
+ 	    if ! test -d openjdk/jdk ; \
+ 	    then \
+ 	      case "$(JDK_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(JDK_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(JDK_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(JDK_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv jdk-$(JDK_CHANGESET) openjdk/jdk ; \
+@@ -1128,7 +1128,7 @@
+ 	    if ! test -d openjdk/langtools ; \
+ 	    then \
+ 	      case "$(LANGTOOLS_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(LANGTOOLS_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(LANGTOOLS_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(LANGTOOLS_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv langtools-$(LANGTOOLS_CHANGESET) openjdk/langtools ; \
+@@ -1150,7 +1150,7 @@
+ 	  if test -e ${HOTSPOT_SRC_ZIP} ; \
+ 	  then \
+ 	    case "$(HOTSPOT_SRC_ZIP)" in \
+-	      *.zip) $(UNZIP) -q $(HOTSPOT_SRC_ZIP) ;; \
++	      *.zip) $(UNZIP_BIN) -q $(HOTSPOT_SRC_ZIP) ;; \
+ 	      *.tar.*) $(TAR) xf $(HOTSPOT_SRC_ZIP) ;; \
+ 	    esac; \
+ 	    if test "x${HSBUILD}" != "xdefault"; then \
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -404,7 +404,7 @@
+ SYSTEM_JDK_DIR = @SYSTEM_JDK_DIR@
+ TAR = @TAR@
+ TZDATA_DIR = @TZDATA_DIR@
+-UNZIP = @UNZIP@
++UNZIP_BIN = @UNZIP_BIN@
+ USING_ECJ = @USING_ECJ@
+ VERSION = @VERSION@
+ VERSION_SUFFIX = @VERSION_SUFFIX@
+@@ -1581,7 +1581,7 @@
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	if ! test -d openjdk ; then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	  if [ ! -z $(OPENJDK_SRC_ZIP) ] ; then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    case "$(OPENJDK_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@	      *.zip) $(UNZIP) -q $(OPENJDK_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@	      *.zip) $(UNZIP_BIN) -q $(OPENJDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      *.tar.*) $(TAR) xf $(OPENJDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    mv `echo $(ICEDTEA_PREFIX)|sed 's#\.#-#'`-$(OPENJDK_CHANGESET) openjdk ; \
+@@ -1597,7 +1597,7 @@
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    if ! test -d openjdk/corba ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      case "$(CORBA_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP) -q $(CORBA_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP_BIN) -q $(CORBA_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	        *.tar.*) $(TAR) xf $(CORBA_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      mv corba-$(CORBA_CHANGESET) openjdk/corba ; \
+@@ -1611,7 +1611,7 @@
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    if ! test -d openjdk/jaxp ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      case "$(JAXP_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP) -q $(JAXP_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP_BIN) -q $(JAXP_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	        *.tar.*) $(TAR) xf $(JAXP_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      mv jaxp-$(JAXP_CHANGESET) openjdk/jaxp ; \
+@@ -1625,7 +1625,7 @@
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    if ! test -d openjdk/jaxws ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      case "$(JAXWS_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP) -q $(JAXWS_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP_BIN) -q $(JAXWS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	        *.tar.*) $(TAR) xf $(JAXWS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      mv jaxws-$(JAXWS_CHANGESET) openjdk/jaxws ; \
+@@ -1639,7 +1639,7 @@
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    if ! test -d openjdk/jdk ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      case "$(JDK_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP) -q $(JDK_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP_BIN) -q $(JDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	        *.tar.*) $(TAR) xf $(JDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      mv jdk-$(JDK_CHANGESET) openjdk/jdk ; \
+@@ -1653,7 +1653,7 @@
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    if ! test -d openjdk/langtools ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      case "$(LANGTOOLS_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP) -q $(LANGTOOLS_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@	        *.zip) $(UNZIP_BIN) -q $(LANGTOOLS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	        *.tar.*) $(TAR) xf $(LANGTOOLS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@	      mv langtools-$(LANGTOOLS_CHANGESET) openjdk/langtools ; \
+@@ -1674,7 +1674,7 @@
+ 	  if test -e ${HOTSPOT_SRC_ZIP} ; \
+ 	  then \
+ 	    case "$(HOTSPOT_SRC_ZIP)" in \
+-	      *.zip) $(UNZIP) -q $(HOTSPOT_SRC_ZIP) ;; \
++	      *.zip) $(UNZIP_BIN) -q $(HOTSPOT_SRC_ZIP) ;; \
+ 	      *.tar.*) $(TAR) xf $(HOTSPOT_SRC_ZIP) ;; \
+ 	    esac; \
+ 	    if test "x${HSBUILD}" != "xdefault"; then \
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,7 @@
+ IT_FIND_TOOL([SHA256SUM], [sha256sum])
+ IT_FIND_TOOL([WGET], [wget])
+ IT_FIND_TOOL([ZIP], [zip])
+-IT_FIND_TOOL([UNZIP], [unzip])
++IT_FIND_TOOL([UNZIP_BIN], [unzip])
+ IT_FIND_TOOL([CPIO], [cpio])
+ IT_FIND_TOOL([FILE], [file])
+ AC_CHECK_TOOLS([FASTJAR], [fastjar jar])
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 83b087c..fdf3a89 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -71,6 +71,7 @@ ICEDTEA_PATCHES = " \
         file://build-hacks-native.patch \
         file://icedtea-sane-x86-arch-name.patch \
 	file://fix-checksums.patch \
+	file://icedtea-makefile-unzip.patch \
         "
 
 OPENJDK_PATCHES = " \
@@ -87,6 +88,7 @@ OPENJDK_PATCHES = " \
 	file://icedtea-hotspot-fix-undefined-behaviour.patch;apply=no \
 	file://icedtea-x11_extension_cleanup.patch;apply=no \
 	file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
+	file://icedtea-jdk-unzip.patch;apply=no \
         "
 
 OPENJDK_HEADLESS_PATCHES = " \
@@ -108,5 +110,6 @@ export DISTRIBUTION_PATCHES = " \
 	patches/icedtea-hotspot-fix-undefined-behaviour.patch \
 	patches/icedtea-x11_extension_cleanup.patch \
 	patches/icedtea-CVE-2014-1876-unpack.patch \
+	patches/icedtea-jdk-unzip.patch \
 	${CLEAN_X11_DISTRIBUTION_PATCH} \
         "
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index a928103..718fc1a 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -109,6 +109,7 @@ EXTRA_OECONF = " \
     \
     --with-pkgversion=${PV} \
     --with-cc-for-build=${BUILD_CC} \
+    ac_cv_path_UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
 "
 
 # PCSC default value was changed to true and SCTP was added during the 2.6.0
@@ -149,6 +150,7 @@ EXTRA_OEMAKE += ' \
     CROSS_COMPILE_ARCH="${JDK_ARCH}" \
     REQUIRED_ALSA_VERSION="" \
     DISABLE_HOTSPOT_OS_VERSION_CHECK=ok \
+    UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
 '
 
 # Provides the target architecture to the configure script.
diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
index 854d179..1431301 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -47,6 +47,7 @@ SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055
 OEPATCHES = "\
     file://build-hacks.patch \
     file://fix_hotspot_crosscompile.patch \
+    file://icedtea-makefile-unzip.patch \
 "
 
 ICEDTEAPATCHES = "\
@@ -55,6 +56,7 @@ ICEDTEAPATCHES = "\
     file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
     file://icedtea-crosscompile-fix.patch;apply=no \
     file://icedtea-xawt-crosscompile-fix.patch;apply=no \
+    file://icedtea-jdk-unzip.patch;apply=no \
 "
 
 DISTRIBUTION_PATCHES = "\
@@ -63,6 +65,7 @@ DISTRIBUTION_PATCHES = "\
     patches/icedtea-jdk-rmi-crosscompile.patch \
     patches/icedtea-crosscompile-fix.patch \
     patches/icedtea-xawt-crosscompile-fix.patch \
+    patches/icedtea-jdk-unzip.patch \
 "
 
 export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-unzip.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-unzip.patch
new file mode 100644
index 0000000..8c29730
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-unzip.patch
@@ -0,0 +1,130 @@
+Use UNZIP_BIN instead of UNZIP.
+
+Fails with an error message /usr/bin/unzip not found.
+Additionally, icedtea7 enables you to specify an unzip to use by setting
+the variable UNZIP, this results in an error because unzip uses UNZIP
+to specify options, hence you'll end up with unzip trying to unzip unzip.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ openjdk/corba/make/common/shared/Defs-utils.gmk       |    6 +++---
+ openjdk/jdk/make/common/Demo.gmk                      |    2 +-
+ openjdk/jdk/make/common/Release.gmk                   |    2 +-
+ openjdk/jdk/make/common/internal/ImportComponents.gmk |    4 ++--
+ openjdk/jdk/make/common/shared/Defs-utils.gmk         |    6 +++---
+ openjdk/jdk/make/common/shared/Sanity.gmk             |    2 +-
+ openjdk/jdk/make/java/redist/Makefile                 |    4 ++--
+ 7 files changed, 13 insertions(+), 13 deletions(-)
+
+--- openjdk/corba/make/common/shared/Defs-utils.gmk
++++ openjdk/corba/make/common/shared/Defs-utils.gmk
+@@ -129,7 +129,7 @@
+ TRUE           = $(UTILS_COMMAND_PATH)true
+ UNAME          = $(UTILS_COMMAND_PATH)uname
+ UNIQ           = $(UTILS_USR_BIN_PATH)uniq
+-UNZIP          = $(UTILS_USR_BIN_PATH)unzip
++# UNZIP      = $(UTILS_USR_BIN_PATH)unzip
+ UNZIPSFX       = $(UTILS_DEVTOOL_PATH)unzipsfx
+ WC             = $(UTILS_USR_BIN_PATH)wc
+ WHICH          = $(UTILS_USR_BIN_PATH)which
+@@ -146,10 +146,10 @@
+     # Intrinsic unix command, with backslash-escaped character interpretation
+     ECHO = $(UNIXCOMMAND_PATH)echo -e
+     ZIPEXE = $(UNIXCOMMAND_PATH)zip
+-    UNZIP  = $(UNIXCOMMAND_PATH)unzip
++    # UNZIP  = $(UNIXCOMMAND_PATH)unzip
+   else
+     ZIPEXE = $(UTILS_DEVTOOL_PATH)zip
+-    UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
++    # UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
+   endif
+   # Re-define some utilities
+   LEX            =# override GNU Make intrinsic: no lex on windows
+--- openjdk/jdk/make/common/Demo.gmk
++++ openjdk/jdk/make/common/Demo.gmk
+@@ -348,7 +348,7 @@
+ 	  $(java-vm-cleanup) )
+ 	@( $(CD) $(DEMO_DESTDIR) && $(java-vm-cleanup) )
+ 	@$(ECHO) "Expanding source into demos area at $(DEMO_DESTDIR)"
+-	( $(CD) $(DEMO_DESTDIR) && $(UNZIP) -o src.zip && $(RM) src.zip )
++	( $(CD) $(DEMO_DESTDIR) && $(UNZIP_BIN) -o src.zip && $(RM) src.zip )
+ endif
+ 
+ build: sources bundles
+--- openjdk/jdk/make/common/Release.gmk
++++ openjdk/jdk/make/common/Release.gmk
+@@ -909,7 +909,7 @@
+ initial-image-jdk-db: $(DB_ZIP_LIST)
+ 	$(MKDIR) -p $(JDK_IMAGE_DIR)/db
+ 	for d in $(DB_ZIP_LIST); do \
+-          ($(CD) $(JDK_IMAGE_DIR)/db && $(UNZIP) -o $$d); \
++          ($(CD) $(JDK_IMAGE_DIR)/db && $(UNZIP_BIN) -o $$d); \
+ 	done
+ 	$(CP) $(ABS_DB_PATH)/README-JDK.html $(JDK_IMAGE_DIR)/db
+ 	$(RM) -rf $(DEMODIR)/db
+--- openjdk/jdk/make/common/internal/ImportComponents.gmk
++++ openjdk/jdk/make/common/internal/ImportComponents.gmk
+@@ -97,8 +97,8 @@
+ define Unzipper
+ ( \
+   $(MKDIR) -p $1; \
+-  $(ECHO) "( $(CD) $1 && $(UNZIP) -o $2 )"; \
+-  ( $(CD) $1 && $(UNZIP) -o $2 ) \
++  $(ECHO) "( $(CD) $1 && $(UNZIP_BIN) -o $2 )"; \
++  ( $(CD) $1 && $(UNZIP_BIN) -o $2 ) \
+ )
+ endef
+ 
+--- openjdk/jdk/make/common/shared/Defs-utils.gmk
++++ openjdk/jdk/make/common/shared/Defs-utils.gmk
+@@ -145,7 +145,7 @@
+ TRUE           = $(UTILS_COMMAND_PATH)true
+ UNAME          = $(UTILS_COMMAND_PATH)uname
+ UNIQ           = $(UTILS_USR_BIN_PATH)uniq
+-UNZIP          = $(UTILS_USR_BIN_PATH)unzip
++# UNZIP      = $(UTILS_USR_BIN_PATH)unzip
+ UNZIPSFX       = $(UTILS_DEVTOOL_PATH)unzipsfx
+ XARGS          = $(UTILS_USR_BIN_PATH)xargs
+ WC             = $(UTILS_USR_BIN_PATH)wc
+@@ -163,12 +163,12 @@
+     # Intrinsic unix command, with backslash-escaped character interpretation
+     ECHO = $(UNIXCOMMAND_PATH)echo -e
+     ZIPEXE = $(UNIXCOMMAND_PATH)zip
+-    UNZIP  = $(UNIXCOMMAND_PATH)unzip
++    # UNZIP  = $(UNIXCOMMAND_PATH)unzip
+     # Some CYGWIN nawk versions require BINMODE=w for proper '\r' interpretation
+     NAWK   = $(UNIXCOMMAND_PATH)awk -v BINMODE=w
+   else
+     ZIPEXE = $(UTILS_DEVTOOL_PATH)zip
+-    UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
++    # UNZIP  = $(UTILS_DEVTOOL_PATH)unzip
+     NAWK   = $(UNIXCOMMAND_PATH)awk
+   endif
+   # Re-define some utilities
+--- openjdk/jdk/make/common/shared/Sanity.gmk
++++ openjdk/jdk/make/common/shared/Sanity.gmk
+@@ -151,7 +151,7 @@
+ # Get the version numbers of what we are using
+ _MAKE_VER  :=$(shell $(MAKE) --version 2>&1 | $(HEAD) -n 1)
+ _ZIP_VER   :=$(shell $(ZIPEXE) -help 2>&1 | $(HEAD) -n 4 | $(EGREP) '^Zip')
+-_UNZIP_VER :=$(shell $(UNZIP)  -help 2>&1 | $(HEAD) -n 4 | $(EGREP) '^UnZip')
++_UNZIP_VER :=$(shell $(UNZIP_BIN)  -help 2>&1 | $(HEAD) -n 4 | $(EGREP) '^UnZip')
+ _BOOT_VER  :=$(shell $(BOOTDIR)/bin/java -version 2>&1 | $(HEAD) -n 1)
+ MAKE_VER   :=$(call GetVersion,"$(_MAKE_VER)")
+ ZIP_VER    :=$(call GetVersion,"$(_ZIP_VER)")
+--- openjdk/jdk/make/java/redist/Makefile
++++ openjdk/jdk/make/java/redist/Makefile
+@@ -482,8 +482,8 @@
+ define SecUnzipper
+ if [ -f $2 ] ; then \
+   $(MKDIR) -p $1; \
+-  $(ECHO) "( $(CD) $1 && $(UNZIP) -o $2 )"; \
+-  ( $(CD) $1 && $(UNZIP) -o $2 ); \
++  $(ECHO) "( $(CD) $1 && $(UNZIP_BIN) -o $2 )"; \
++  ( $(CD) $1 && $(UNZIP_BIN) -o $2 ); \
+ fi
+ endef
+ 
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-makefile-unzip.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-makefile-unzip.patch
new file mode 100644
index 0000000..be29bc0
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-makefile-unzip.patch
@@ -0,0 +1,176 @@
+Use UNZIP_BIN instead of UNZIP.
+
+Fails with an error message /usr/bin/unzip not found.
+Additionally, icedtea7 enables you to specify an unzip to use by setting
+the variable UNZIP, this results in an error because unzip uses UNZIP
+to specify options, hence you'll end up with unzip trying to unzip unzip.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.am  | 14 +++++++-------
+ Makefile.in  | 16 ++++++++--------
+ configure.ac |  2 +-
+ 3 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ebb79cd..c109c7a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1369,7 +1369,7 @@ else
+ 	if ! test -d openjdk ; then \
+ 	  if [ ! -z $(OPENJDK_SRC_ZIP) ] ; then \
+ 	    case "$(OPENJDK_SRC_ZIP)" in \
+-	      *.zip) $(UNZIP) -q $(OPENJDK_SRC_ZIP) ;; \
++	      *.zip) $(UNZIP_BIN) -q $(OPENJDK_SRC_ZIP) ;; \
+ 	      *.tar.*) $(TAR) xf $(OPENJDK_SRC_ZIP) ;; \
+ 	    esac; \
+ 	    mv `echo $(ICEDTEA_PREFIX)|$(SED) 's#\.#-#'`-$(OPENJDK_CHANGESET) openjdk ; \
+@@ -1403,7 +1403,7 @@ else
+ 	    if ! test -d openjdk/corba ; \
+ 	    then \
+ 	      case "$(CORBA_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(CORBA_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(CORBA_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(CORBA_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv corba-$(CORBA_CHANGESET) openjdk/corba ; \
+@@ -1431,7 +1431,7 @@ else
+ 	    if ! test -d openjdk/jaxp ; \
+ 	    then \
+ 	      case "$(JAXP_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(JAXP_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(JAXP_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(JAXP_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv jaxp-$(JAXP_CHANGESET) openjdk/jaxp ; \
+@@ -1459,7 +1459,7 @@ else
+ 	    if ! test -d openjdk/jaxws ; \
+ 	    then \
+ 	      case "$(JAXWS_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(JAXWS_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(JAXWS_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(JAXWS_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv jaxws-$(JAXWS_CHANGESET) openjdk/jaxws ; \
+@@ -1487,7 +1487,7 @@ else
+ 	    if ! test -d openjdk/jdk ; \
+ 	    then \
+ 	      case "$(JDK_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(JDK_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(JDK_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(JDK_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv jdk-$(JDK_CHANGESET) openjdk/jdk ; \
+@@ -1515,7 +1515,7 @@ else
+ 	    if ! test -d openjdk/langtools ; \
+ 	    then \
+ 	      case "$(LANGTOOLS_SRC_ZIP)" in \
+-	        *.zip) $(UNZIP) -q $(LANGTOOLS_SRC_ZIP) ;; \
++	        *.zip) $(UNZIP_BIN) -q $(LANGTOOLS_SRC_ZIP) ;; \
+ 	        *.tar.*) $(TAR) xf $(LANGTOOLS_SRC_ZIP) ;; \
+ 	      esac; \
+ 	      mv langtools-$(LANGTOOLS_CHANGESET) openjdk/langtools ; \
+@@ -1541,7 +1541,7 @@ else
+ 	  if test -e ${HOTSPOT_SRC_ZIP} ; \
+ 	  then \
+ 	    case "$(HOTSPOT_SRC_ZIP)" in \
+-	      *.zip) $(UNZIP) -q $(HOTSPOT_SRC_ZIP) ;; \
++	      *.zip) $(UNZIP_BIN) -q $(HOTSPOT_SRC_ZIP) ;; \
+ 	      *.tar.*) $(TAR) xf $(HOTSPOT_SRC_ZIP) ;; \
+ 	    esac; \
+ 	    if test "x${HSBUILD}" != "xdefault"; then \
+diff --git a/Makefile.in b/Makefile.in
+index f890991..fd09bda 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -495,7 +495,7 @@ SYSTEM_JDK_DIR = @SYSTEM_JDK_DIR@
+ TAR = @TAR@
+ TOOLS_JAR = @TOOLS_JAR@
+ TZDATA_DIR = @TZDATA_DIR@
+-UNZIP = @UNZIP@
++UNZIP_BIN = @UNZIP@
+ USING_CACAO = @USING_CACAO@
+ USING_ECJ = @USING_ECJ@
+ VERSION = @VERSION@
+@@ -1845,7 +1845,7 @@ stamps/extract-openjdk.stamp: stamps/download-openjdk.stamp
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	if ! test -d openjdk ; then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	  if [ ! -z $(OPENJDK_SRC_ZIP) ] ; then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    case "$(OPENJDK_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      *.zip) $(UNZIP) -q $(OPENJDK_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      *.zip) $(UNZIP_BIN) -q $(OPENJDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      *.tar.*) $(TAR) xf $(OPENJDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    mv `echo $(ICEDTEA_PREFIX)|$(SED) 's#\.#-#'`-$(OPENJDK_CHANGESET) openjdk ; \
+@@ -1873,7 +1873,7 @@ stamps/extract-corba.stamp: stamps/extract-openjdk.stamp stamps/download-corba.s
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    if ! test -d openjdk/corba ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      case "$(CORBA_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP) -q $(CORBA_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP_BIN) -q $(CORBA_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.tar.*) $(TAR) xf $(CORBA_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      mv corba-$(CORBA_CHANGESET) openjdk/corba ; \
+@@ -1895,7 +1895,7 @@ stamps/extract-jaxp.stamp: stamps/extract-openjdk.stamp stamps/download-jaxp.sta
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    if ! test -d openjdk/jaxp ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      case "$(JAXP_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP) -q $(JAXP_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP_BIN) -q $(JAXP_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.tar.*) $(TAR) xf $(JAXP_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      mv jaxp-$(JAXP_CHANGESET) openjdk/jaxp ; \
+@@ -1917,7 +1917,7 @@ stamps/extract-jaxws.stamp: stamps/extract-openjdk.stamp stamps/download-jaxws.s
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    if ! test -d openjdk/jaxws ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      case "$(JAXWS_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP) -q $(JAXWS_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP_BIN) -q $(JAXWS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.tar.*) $(TAR) xf $(JAXWS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      mv jaxws-$(JAXWS_CHANGESET) openjdk/jaxws ; \
+@@ -1939,7 +1939,7 @@ stamps/extract-jdk.stamp: stamps/extract-openjdk.stamp stamps/download-jdk.stamp
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    if ! test -d openjdk/jdk ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      case "$(JDK_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP) -q $(JDK_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP_BIN) -q $(JDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.tar.*) $(TAR) xf $(JDK_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      mv jdk-$(JDK_CHANGESET) openjdk/jdk ; \
+@@ -1961,7 +1961,7 @@ stamps/extract-langtools.stamp: stamps/extract-openjdk.stamp stamps/download-lan
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    if ! test -d openjdk/langtools ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      case "$(LANGTOOLS_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP) -q $(LANGTOOLS_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.zip) $(UNZIP_BIN) -q $(LANGTOOLS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	        *.tar.*) $(TAR) xf $(LANGTOOLS_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      mv langtools-$(LANGTOOLS_CHANGESET) openjdk/langtools ; \
+@@ -1981,7 +1981,7 @@ stamps/extract-hotspot.stamp: stamps/extract-openjdk.stamp stamps/download-hotsp
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	  if test -e ${HOTSPOT_SRC_ZIP} ; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	  then \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    case "$(HOTSPOT_SRC_ZIP)" in \
+-@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      *.zip) $(UNZIP) -q $(HOTSPOT_SRC_ZIP) ;; \
++@OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      *.zip) $(UNZIP_BIN) -q $(HOTSPOT_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	      *.tar.*) $(TAR) xf $(HOTSPOT_SRC_ZIP) ;; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    esac; \
+ @OPENJDK_SRC_DIR_FOUND_FALSE@@USE_HG_FALSE@	    if test "x${HSBUILD}" != "xdefault"; then \
+diff --git a/configure.ac b/configure.ac
+index 5291130..8fbccad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ IT_FIND_TOOL([CHMOD], [chmod])
+ IT_FIND_TOOLS([SHA256SUM], [gsha256sum sha256sum])
+ IT_FIND_TOOL([WGET], [wget])
+ IT_FIND_TOOL([ZIP], [zip])
+-IT_FIND_TOOL([UNZIP], [unzip])
++IT_FIND_TOOL([UNZIP_BIN], [unzip])
+ IT_FIND_TOOL([CPIO], [cpio])
+ IT_FIND_TOOL([FILE], [file])
+ IT_FIND_TOOL([READLINK], [readlink])
+-- 
+2.3.5
+
-- 
1.9.1


