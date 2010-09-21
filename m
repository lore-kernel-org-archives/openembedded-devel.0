Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oxyed-0001tu-Ps
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:56:55 +0200
Received: (qmail 19690 invoked by uid 503); 21 Sep 2010 09:10:03 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 09:10:02 -0000
Received: (qmail 5599 invoked by uid 503); 21 Sep 2010 08:39:31 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 08:39:31 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 10:56:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 10:56:38 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 10:55:56 +0200
Message-Id: <1285059363-2190-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285059363-2190-1-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8306326562956553546
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gs: unbreak recipe
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
X-List-Received-Date: Tue, 21 Sep 2010 08:56:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* this recipe is actually broken as tools used during compilation on the host
are compiled for the target and thus can't be executed.
* tested on armv5te

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gs/gs/unix-aux.mak |  101 ++++++++++++++++++++++++++++++++++++++++++++
 recipes/gs/gs_8.64.bb      |   41 ++++++++++++++++-
 2 files changed, 139 insertions(+), 3 deletions(-)
 create mode 100644 recipes/gs/gs/unix-aux.mak

diff --git a/recipes/gs/gs/unix-aux.mak b/recipes/gs/gs/unix-aux.mak
new file mode 100644
index 0000000..6d6440a
--- /dev/null
+++ b/recipes/gs/gs/unix-aux.mak
@@ -0,0 +1,101 @@
+#  Copyright (C) 2001-2006 Artifex Software, Inc.
+#  All Rights Reserved.
+#
+#  This software is provided AS-IS with no warranty, either express or
+#  implied.
+#
+#  This software is distributed under license and may not be copied, modified
+#  or distributed except as expressly authorized under the terms of that
+#  license.  Refer to licensing information at http://www.artifex.com/
+#  or contact Artifex Software, Inc.,  7 Mt. Lassen Drive - Suite A-134,
+#  San Rafael, CA  94903, U.S.A., +1(415)492-9861, for further information.
+#
+# $Id: unix-aux.mak 9334 2009-01-08 09:17:18Z ghostgum $
+# Partial makefile common to all Unix configurations.
+# This makefile contains the build rules for the auxiliary programs such as
+# echogs, and the 'platform' modules.
+
+# Define the name of this makefile.
+UNIX_AUX_MAK=$(GLSRC)unix-aux.mak
+
+# -------------------------------- Library -------------------------------- #
+
+## The Unix platforms
+
+# We have to include a test for the existence of sys/time.h,
+# because some System V platforms don't have it.
+
+# Unix platforms other than System V, and also System V Release 4
+# (SVR4) platforms.
+unix__=$(GLOBJ)gp_getnv.$(OBJ) $(GLOBJ)gp_upapr.$(OBJ) $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gp_unix_cache.$(OBJ)
+$(GLGEN)unix_.dev: $(unix__) $(GLD)nosync.dev $(GLD)smd5.dev
+	$(SETMOD) $(GLGEN)unix_ $(unix__) -include $(GLD)nosync
+	$(ADDMOD) $(GLGEN)unix_ -include $(GLD)smd5
+
+$(GLOBJ)gp_unix.$(OBJ): $(GLSRC)gp_unix.c $(AK)\
+ $(pipe__h) $(string__h) $(time__h)\
+ $(gx_h) $(gsexit_h) $(gp_h)
+	$(GLCC) $(FONTCONFIG_CFLAGS) $(GLO_)gp_unix.$(OBJ) $(C_) $(GLSRC)gp_unix.c
+
+$(GLOBJ)gp_unix_cache.$(OBJ): $(GLSRC)gp_unix_cache.c $(AK)\
+ $(stdio__h) $(string__h) $(time__h) $(gconfigd_h) $(gp_h) $(md5_h)
+	$(GLCC) $(GLO_)gp_unix_cache.$(OBJ) $(C_) $(GLSRC)gp_unix_cache.c
+
+# assume all Unix platforms support unbuffered read
+$(GLOBJ)gp_stdia.$(OBJ): $(GLSRC)gp_stdia.c $(AK)\
+  $(stdio__h) $(time__h) $(unistd__h) $(gx_h) $(gp_h)
+	$(GLCC) $(GLO_)gp_stdia.$(OBJ) $(C_) $(GLSRC)gp_stdia.c
+
+# System V platforms other than SVR4, which lack some system calls,
+# but have pipes.
+sysv__=$(GLOBJ)gp_getnv.$(OBJ) $(GLOBJ)gp_upapr.$(OBJ) $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) $(GLOBJ)gp_sysv.$(OBJ)
+$(GLGEN)sysv_.dev: $(sysv__) $(GLD)nosync.dev
+	$(SETMOD) $(GLGEN)sysv_ $(sysv__) -include $(GLD)nosync
+
+$(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)
+	$(GLCC) $(GLO_)gp_sysv.$(OBJ) $(C_) $(GLSRC)gp_sysv.c
+
+# -------------------------- Auxiliary programs --------------------------- #
+
+#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h)
+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
+
+# On the RS/6000 (at least), compiling genarch.c with gcc with -O
+# produces a buggy executable.
+#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS)
+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
+
+#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS)
+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
+
+#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS)
+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
+
+#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS)
+#	$(CCAUX) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
+
+#$(GENINIT_XE): $(GLSRC)geninit.c $(AK) $(GENINIT_DEPS)
+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENINIT_XE) $(GLSRC)geninit.c
+
+MKROMFS_OBJS=$(MKROMFS_ZLIB_OBJS) $(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
+ $(GLOBJ)gpmisc.$(OBJ) $(GLOBJ)gslibctx.$(OBJ) $(GLOBJ)gp_getnv.$(OBJ) \
+ $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) \
+ $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
+
+#$(MKROMFS_XE): $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS)
+#	$(CCAUX) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE) $(MKROMFS_OBJS) -lm $(EXTRALIBS)
+
+# Query the environment to construct gconfig_.h.
+# The "else true;" is required because Ultrix's implementation of sh -e
+# terminates execution of a command if any error occurs, even if the command
+# traps the error with ||.
+INCLUDE=/usr/include
+$(gconfig__h): $(UNIX_AUX_MAK) $(ECHOGS_XE)
+	$(ECHOGS_XE) -w $(gconfig__h) -x 2f2a -s This file was generated automatically by unix-aux.mak. -s -x 2a2f
+	if ( test -f $(INCLUDE)/dirent.h ); then $(ECHOGS_XE) -a $(gconfig__h) -x 23 define HAVE_DIRENT_H; else true; fi
+	if ( test -f $(INCLUDE)/ndir.h ); then $(ECHOGS_XE) -a $(gconfig__h) -x 23 define HAVE_NDIR_H; else true; fi
+	if ( test -f $(INCLUDE)/sys/dir.h ); then $(ECHOGS_XE) -a $(gconfig__h) -x 23 define HAVE_SYS_DIR_H; else true; fi
+	if ( test -f $(INCLUDE)/sys/ndir.h ); then $(ECHOGS_XE) -a $(gconfig__h) -x 23 define HAVE_SYS_NDIR_H; else true; fi
+	if ( test -f $(INCLUDE)/sys/time.h ); then $(ECHOGS_XE) -a $(gconfig__h) -x 23 define HAVE_SYS_TIME_H; else true; fi
+	if ( test -f $(INCLUDE)/sys/times.h ); then $(ECHOGS_XE) -a $(gconfig__h) -x 23 define HAVE_SYS_TIMES_H; else true; fi
+	if ( test -f $(JSRCDIR)/jmemsys.h); then true; else $(ECHOGS_XE) -a $(gconfig__h) -x 23 define DONT_HAVE_JMEMSYS_H; fi
diff --git a/recipes/gs/gs_8.64.bb b/recipes/gs/gs_8.64.bb
index 9aac182..74cdcbf 100644
--- a/recipes/gs/gs_8.64.bb
+++ b/recipes/gs/gs_8.64.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.gnu.org/software/ghostscript/ghostscript.html"
 DEPENDS = "jpeg zlib fontconfig cups"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/g/ghostscript/ghostscript_${PV}~dfsg.orig.tar.gz;name=tarball \
            file://0001_svn_snapshot.patch \
@@ -16,6 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/g/ghostscript/ghostscript_${PV}~dfsg.orig.tar.g
            file://1007_fix_pphs_script_not_lib.patch \
            file://2001_docdir_fix_for_debian.patch \
            file://2002_gs_man_fix_debian.patch \
+           file://unix-aux.mak \
            "
 
 SRC_URI[tarball.md5sum] = "e42706c2409815df5c959484080fd4a3"
@@ -26,12 +27,22 @@ S = "${WORKDIR}/ghostscript-${PV}~dfsg"
 
 inherit autotools
 
-EXTRA_OECONF = "--without-x --with-jasper --with-zlib=${STAGING_DIR_HOST}${layout_prefix}"
+EXTRA_OECONF = "--without-x --with-jasper --with-zlib=${STAGING_DIR_HOST}${layout_prefix} --with-fontpath=${datadir}/fonts"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 PACKAGES += "cups-gs"
 
+do_configure_prepend() {
+        CC="${BUILD_CC}" LD="${BUILD_LD}" ./configure
+        mkdir obj
+        for i in genarch genconf mkromfs echogs gendev genht; do
+                make obj/$i
+        done
+        mv obj obj_host
+        make clean
+}
+
 do_configure() {
 	# hack script to allow for cross compiling
 	sed 's,&& ./configure$,& --host=\$host --build=\$build --target=\$target,g' -i configure
@@ -40,6 +51,21 @@ do_configure() {
 	oe_runconf
 }
 
+do_configure_append() {
+        if [ ! -d obj ]; then
+                mkdir obj
+        fi
+        if [ ! -d soobj ]; then
+                mkdir soobj
+        fi
+        for i in genarch genconf mkromfs echogs gendev genht; do
+                cp obj_host/$i obj/$i
+                cp obj_host/$i soobj/$i
+        done
+        # Prevent mkromfs from being recompiled for the target
+        cp ${WORKDIR}/unix-aux.mak base/
+}
+
 do_stage () {
 	install -d ${STAGING_INCDIR}/ghostscript
 	install -m 755 ${S}/psi/*.h ${STAGING_INCDIR}/ghostscript/
@@ -50,11 +76,20 @@ do_compile_append () {
         oe_runmake so
 }
 
+do_install_prepend () {
+        sed -e 's#CUPSSERVERBIN=${STAGING_LIBDIR}/cups#CUPSSERVERBIN=${libdir}/cups#g' -i ${S}/Makefile
+        sed -e 's#CUPSDATA=${STAGING_DATADIR}/cups#CUPSDATA=${datadir}/cups#g' -i ${S}/Makefile
+}
+
 do_install_append () {
         oe_runmake 'DESTDIR=${D}' soinstall
+	# recent cups expects this file in /usr/share/cups/mime
+	# so duplicate it for compatibility
+	mkdir -p ${D}/${datadir}/cups/mime/
+        cp ${D}/etc/cups/pstoraster.convs ${D}/${datadir}/cups/mime/
 }
 
 FILES_${PN} += "${datadir}/ghostscript"
-FILES_cups-gs = "${libdir}/cups/filter/* ${datadir}/cups ${sysconfdir}/cups"
+FILES_cups-gs = "${libdir}/cups/filter/ ${datadir}/cups ${sysconfdir}/cups"
 
 RDEPENDS_cups-gs += "gs"
-- 
1.6.3.3



