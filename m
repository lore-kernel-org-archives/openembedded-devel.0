Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pitri-0004A5-BD
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 20:20:14 +0100
Received: from localhost.localdomain ([134.86.97.17])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p0SIqb1n024465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:52:38 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 11:52:30 -0700
Message-Id: <1296240753-10120-3-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
Subject: [PATCH 2/5] perl-native: Switch to userelocatableinc and not shared libperl
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
X-List-Received-Date: Fri, 28 Jan 2011 19:20:14 -0000

While in here, we didn't use db nor gdbm so remove those as deps.
This recipe is safe with no other deps so add INHIBIT_DEFAULT_DEPS
and switch to patch as PATCHTOOL.  Being relocatable means we don't need
the config.sh mangling we had been doing and we want to be more clear
about our mangling of scripts to use /usr/bin/env perl

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/perl/perl-native_5.10.1.bb |   32 +++++++++++++++-----------------
 1 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_5.10.1.bb
index c523974..8916c82 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -2,9 +2,10 @@ DESCRIPTION = "Perl is a popular scripting language."
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-DEPENDS = "virtual/db-native gdbm-native"
-PR = "r8"
+PR = "r9"
 NATIVE_INSTALL_WORKS = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+PATCHTOOL = "patch"
 
 # Not tested enough
 DEFAULT_PREFERENCE = "-1"
@@ -37,19 +38,21 @@ do_configure () {
         -Dcflags="${CFLAGS}" \
         -Dldflags="${LDFLAGS}" \
         -Dcf_by="Open Embedded" \
+        \
         -Dprefix=${prefix} \
         -Dvendorprefix=${prefix} \
         -Dvendorprefix=${prefix} \
         -Dsiteprefix=${prefix} \
+         \
+        -Dprivlib=.../../lib/perl/${PV} \
+        -Darchlib=.../../lib/perl/${PV} \
+        -Dvendorlib=.../../lib/perl/${PV} \
+        -Dvendorarch=.../../lib/perl/${PV} \
+        -Dsitelib=.../../lib/perl/${PV} \
+        -Dsitearch=.../../lib/perl/${PV} \
+        -Duserelocatableinc="y" \
         \
-        -Dprivlib=${STAGING_LIBDIR}/perl/${PV} \
-        -Darchlib=${STAGING_LIBDIR}/perl/${PV} \
-        -Dvendorlib=${STAGING_LIBDIR}/perl/${PV} \
-        -Dvendorarch=${STAGING_LIBDIR}/perl/${PV} \
-        -Dsitelib=${STAGING_LIBDIR}/perl/${PV} \
-        -Dsitearch=${STAGING_LIBDIR}/perl/${PV} \
-        \
-        -Duseshrplib \
+        -Uuseshrplib \
         -Dusethreads \
         -Duseithreads \
         -Duselargefiles \
@@ -66,11 +69,6 @@ do_configure () {
         -Ud_csh \
         -Uusesfio \
         -Uusenm -des
-    sed "s!${STAGING_DIR}/bin!${STAGING_BINDIR}!;
-         s!${STAGING_DIR}/lib!${STAGING_LIBDIR}!;
-	 s!^installbin=.*!installbin=\'${STAGING_BINDIR}\'!;
-	 s!^installsitebin=.*!installsitebin=\'${STAGING_BINDIR}\'!" < config.sh > config.sh.new
-    mv config.sh.new config.sh
 }
 
 do_install() {
@@ -106,8 +104,8 @@ do_install() {
 	sed -i -r "s,^\tdie\ (\"Errno\ architecture.+)$,\twarn\ \1," ${D}${libdir}/perl/${PV}/Errno.pm
 
 	# Make sure we use /usr/bin/env perl
-	for PERLSCRIPT in `grep -rIl ${bindir}/perl ${D}${bindir}`; do
-		sed -i -e 's|^#!${bindir}/perl|#!/usr/bin/env perl|' $PERLSCRIPT
+	for PERLSCRIPT in `grep -rIEl '#!.*/perl' ${D}${bindir}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env perl|' $PERLSCRIPT
 	done
 }
 
-- 
1.7.0.4



