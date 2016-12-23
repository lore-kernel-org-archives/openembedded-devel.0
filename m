Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 88E087771F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 00:04:37 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 5E3EEAD003E6; Fri, 23 Dec 2016 01:04:36 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2016 01:04:35 +0100
Message-Id: <1482451476-17405-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 1/2] waf-samba.bbclass: fix build error with PARALLEL_MAKE="-j X -l Y"
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
X-List-Received-Date: Fri, 23 Dec 2016 00:04:39 -0000

Waf doesn't handle -l. Use a function already provided by waf.bbclass
in OE-Core. Inheriting waf.bbclass also makes overriding DISABLE_STATIC
redundant, so drop it from recipes inheriting waf-samba.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/classes/waf-samba.bbclass                     | 4 ++--
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb     | 1 -
 meta-networking/recipes-support/libldb/libldb_1.1.29.bb       | 1 -
 meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb  | 1 -
 meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb       | 1 -
 meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb | 1 -
 6 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index af4c7d0..b94ed48 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,7 +1,7 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
 # 
-inherit qemu pythonnative
+inherit qemu pythonnative waf
 
 DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
 
@@ -86,7 +86,7 @@ do_configure() {
 }
 
 do_compile () {
-    python ./buildtools/bin/waf ${PARALLEL_MAKE}
+    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
 }
 
 do_install() {
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index ee08ccb..2acdbec 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -94,7 +94,6 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
                  --with-pam --with-pammodulesdir=${base_libdir}/security \
                 "
-DISABLE_STATIC = ""
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
index 378bb89..2269a57 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
@@ -44,7 +44,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-privatelibdir=${libdir}/ldb \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
-DISABLE_STATIC = ""
 
 PACKAGES += "pyldb pyldb-dbg pyldb-dev"
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
index 97a9a75..04e2f36 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
@@ -37,7 +37,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --disable-silent-rules \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
-DISABLE_STATIC = ""
 
 PACKAGES += "pytalloc pytalloc-dbg pytalloc-dev"
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
index 86f931c..3296bee 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
@@ -33,7 +33,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
-DISABLE_STATIC = ""
 
 PACKAGES += "tdb-tools python-tdb python-tdb-dbg"
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
index 975f8f6..7939e03 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
@@ -37,7 +37,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                  --without-gettext \
                 "
-DISABLE_STATIC = ""
 
 PACKAGES += "python-tevent python-tevent-dbg"
 
-- 
2.7.4


