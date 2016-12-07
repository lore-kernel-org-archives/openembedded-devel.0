Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AB2C360806
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 12:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB7C7bbh006704; Wed, 7 Dec 2016 12:07:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qtAO4pEJjmvd; Wed,  7 Dec 2016 12:07:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB7C7ZkL006699
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Dec 2016 12:07:36 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cEb0Y-0008Q7-W4; Wed, 07 Dec 2016 12:07:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2016 12:07:31 +0000
Message-Id: <1481112451-32329-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] attr: Convert SSTATEPOSTINSTFUNCS to a do_install_append
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
X-List-Received-Date: Wed, 07 Dec 2016 12:07:37 -0000

A SSTATEPOSTINSTFUNCS function here is overkill, just do this in a
do_install_append_class-native and create relative symlinks rather
than absolute ones which would then have to be relocated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/attr/ea-acl.inc | 47 +++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 370e16f..583ca1f 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -17,36 +17,33 @@ do_install () {
 	oe_runmake install install-lib install-dev DIST_ROOT="${D}"
 }
 
-PACKAGES =+ "lib${BPN}"
-
-FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
-
-BBCLASSEXTEND = "native"
-# Only append ldflags for target recipe and if USE_NLS is enabled
-LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
-EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-
-fix_symlink () {
-	if [ "${BB_CURRENTTASK}" != "populate_sysroot" -a "${BB_CURRENTTASK}" != "populate_sysroot_setscene" ]
-	then
-		return
-	fi
-
+do_install_append_class-native () {
 	if test "${libdir}" = "${base_libdir}" ; then
 		return
 	fi
+	librelpath=${@os.path.relpath(d.getVar('libdir',True), d.getVar('base_libdir', True))}
+	baselibrelpath=${@os.path.relpath(d.getVar('base_libdir',True), d.getVar('libdir', True))}
+
 	# Remove bad symlinks & create the correct symlinks
-	if test -L ${libdir}/lib${BPN}.so ; then
-		rm -rf ${libdir}/lib${BPN}.so
-		ln -sf ${base_libdir}/lib${BPN}.so ${libdir}/lib${BPN}.so
+	if test -L ${D}${libdir}/lib${BPN}.so ; then
+		rm -rf ${D}${libdir}/lib${BPN}.so
+		ln -sf $baselibrelpath/lib${BPN}.so ${D}${libdir}/lib${BPN}.so
 	fi
-	if test -L ${base_libdir}/lib${BPN}.a ; then
-		rm -rf ${base_libdir}/lib${BPN}.a
-		ln -sf ${libdir}/lib${BPN}.a ${base_libdir}/lib${BPN}.a
+	if test -L ${D}${base_libdir}/lib${BPN}.a ; then
+		rm -rf ${D}${base_libdir}/lib${BPN}.a
+		ln -sf $librelpath/lib${BPN}.a ${D}${base_libdir}/lib${BPN}.a
 	fi
-	if test -L  ${base_libdir}/lib${BPN}.la ; then
-		rm -rf ${base_libdir}/lib${BPN}.la
-		ln -sf ${libdir}/lib${BPN}.la ${base_libdir}/lib${BPN}.la
+	if test -L  ${D}${base_libdir}/lib${BPN}.la ; then
+		rm -rf ${D}${base_libdir}/lib${BPN}.la
+		ln -sf $librelpath/lib${BPN}.la ${D}${base_libdir}/lib${BPN}.la
 	fi
 }
-SSTATEPOSTINSTFUNCS_class-native += "fix_symlink"
+
+PACKAGES =+ "lib${BPN}"
+
+FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
+
+BBCLASSEXTEND = "native"
+# Only append ldflags for target recipe and if USE_NLS is enabled
+LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
+EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-- 
2.7.4


