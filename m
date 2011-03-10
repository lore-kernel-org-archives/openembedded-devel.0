Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1PxffS-0001gj-E7
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 14:12:38 +0100
Received: from localhost.localdomain (79.25.134.226) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F02395BAD; Thu, 10 Mar 2011 14:11:03 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 14:10:56 +0100
Message-Id: <1299762656-4872-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] autoconf.inc: check if files exist before using sed on them
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
X-List-Received-Date: Thu, 10 Mar 2011 13:12:38 -0000

Without the that fix we have
  | + sed -i '-es,^SUBDIRS = .*,SUBDIRS = bin . lib,' .../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/Makefile.am
  | sed: can't read .../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/Makefile.am: No such file or directory
and:
  | + sed -i -e '1s:#!.*:#! /usr/bin/env perl:' '.../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/bin/*.in'
  | sed: can't read .../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/bin/*.in: No such file or directory
  NOTE: package autoconf213-native-2.13-r14.0: task do_configure: Failed

Thanks a lot for all help in #oe on Freenode on irc for telling me
  which command to use for the *.in at the end pb__ found the best command:
<pb__> or ls ${S} | grep -q '\.in$'

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/autoconf/autoconf.inc |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
index 7f22c2b..e0eecd3 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "m4 perl gnu-config"
 DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native perl-native"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2;name=autoconf \
 	   file://program_prefix.patch"
@@ -25,13 +25,19 @@ do_configure_prepend () {
 		export ac_cv_path_M4="${ac_cv_path_M4=${bindir}/m4}"
 		export ac_cv_prog_gnu_m4="${ac_cv_prog_gnu_m4=yes}"
 	fi
-
-	sed -i -e's,^SUBDIRS = .*,SUBDIRS = ${SUBDIRS},' ${S}/Makefile.am
+	if [ -e ${S}/Makefile.am ]
+	then
+		sed -i -e's,^SUBDIRS = .*,SUBDIRS = ${SUBDIRS},' ${S}/Makefile.am
+	fi
 }
 
 do_configure_append() {
 	# replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
-	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/bin/*.in
+	ls ${S} | grep -q '\.in$'
+	if [ $? -eq 0 ]
+	then
+		sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/bin/*.in
+	fi
 }
 
 PARALLEL_MAKE = ""
-- 
1.7.0.4



