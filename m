Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PWRgE-0006UB-Uj
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 11:48:55 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 2FE642101B; Sat, 25 Dec 2010 13:48:34 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 13:48:25 +0300
Message-Id: <1293274109-15695-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
Subject: [PATCH 1/5] perl: fix PERLCONFIGTARGET for multimach builds, move cpan vars
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
X-List-Received-Date: Sat, 25 Dec 2010 10:48:55 -0000

Multimachine builds race staging Config_heavy-target.pl to native directory.
Solve that by changing PERLCONFIGTARGET variable semantics, now it will
contain $TARGET_SYS. Change perl patch and stage functions accordingly.

Also, move PERLCONFIGTARGET and other target-specific variable settings from
cpan to cpan-base as I think they're also useful for cpan_build and anywhere
else cpan-base is needed.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/cpan-base.bbclass                          |   14 ++++++++++++--
 classes/cpan.bbclass                               |   10 ----------
 classes/cpan_build.bbclass                         |    4 ++--
 .../perl/perl-5.10.1/perl-configpm-switch.patch    |    6 +++---
 recipes/perl/perl-5.8.8/perl-configpm-switch.patch |    6 +++---
 recipes/perl/perl-native_5.10.1.bb                 |    2 +-
 recipes/perl/perl-native_5.8.8.bb                  |    2 +-
 recipes/perl/perl_5.10.1.bb                        |    4 ++--
 recipes/perl/perl_5.8.8.bb                         |    2 +-
 9 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
index a04f61c..53621ed 100644
--- a/classes/cpan-base.bbclass
+++ b/classes/cpan-base.bbclass
@@ -32,11 +32,21 @@ def perl_get_libdirs(d):
 
 def is_target(d):
     if not bb.data.inherits_class('native', d):
-        return "yes"
-    return "no"
+        return bb.data.expand('${TARGET_SYS}', d)
+    return ""
 
 PERLLIBDIRS = "${@perl_get_libdirs(d)}"
 
 FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/*/.debug"
+
+# Env var which tells perl if it should use host ('') or target ('$TARGET_SYS') settings
+export PERLCONFIGTARGET = "${@is_target(d)}"
+
+EXTRA_CPANFLAGS ?= ""
+
+# Env var which tells perl where the perl include files are
+export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_LIB = "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
\ No newline at end of file
diff --git a/classes/cpan.bbclass b/classes/cpan.bbclass
index 24e0c6e..b81ae9a 100644
--- a/classes/cpan.bbclass
+++ b/classes/cpan.bbclass
@@ -3,16 +3,6 @@
 #
 inherit cpan-base
 
-EXTRA_CPANFLAGS ?= ""
-
-# Env var which tells perl if it should use host (no) or target (yes) settings
-export PERLCONFIGTARGET = "${@is_target(d)}"
-
-# Env var which tells perl where the perl include files are
-export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
-export PERL_LIB = "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
-
 NATIVE_INSTALL_WORKS = "1"
 
 cpan_do_configure () {
diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
index d1bbc4f..3f52cc2 100644
--- a/classes/cpan_build.bbclass
+++ b/classes/cpan_build.bbclass
@@ -22,7 +22,7 @@ def cpan_build_deps(d):
 DEPENDS_prepend = "${@cpan_build_deps(d)}"
 
 cpan_build_do_configure () {
-	if [ ${@is_target(d)} = "yes" ]; then
+	if [ ${@is_target(d)} != "" ]; then
 		# build for target
 		. ${STAGING_LIBDIR}/perl/config.sh
 		perl Build.PL --installdirs vendor \
@@ -44,7 +44,7 @@ cpan_build_do_compile () {
 }
 
 cpan_build_do_install () {
-	if [ ${@is_target(d)} = "yes" ]; then
+	if [ ${@is_target(d)} != "" ]; then
 		perl Build install
 	else
 		perl Build install destdir="${WORKDIR}/image"
diff --git a/recipes/perl/perl-5.10.1/perl-configpm-switch.patch b/recipes/perl/perl-5.10.1/perl-configpm-switch.patch
index 1aacd35..8becb8e 100644
--- a/recipes/perl/perl-5.10.1/perl-configpm-switch.patch
+++ b/recipes/perl/perl-5.10.1/perl-configpm-switch.patch
@@ -1,6 +1,6 @@
 This patch is used for perl-native only. It enables the switching of
 configuration files between Config_heavy.pl and
-Config_heavy-target.pl by setting the environment variables
+Config_heavy-$TARGET_SYS.pl by setting the environment variables
 PERLCONFIGTARGET - the later containing settings for the target while
 the former contains those for the host. This will allow cpan.bbclass
 to use the settings appropriate for the native and/or target builds
@@ -24,9 +24,9 @@ values would be valid for the host only.
  sub AUTOLOAD {
 -    require 'Config_heavy.pl';
 +    my $cfgfile = 'Config_heavy.pl';
-+    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} eq "yes")
++    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} ne "")
 +    {
-+        $cfgfile = 'Config_heavy-target.pl';
++        $cfgfile = "Config_heavy-$ENV{PERLCONFIGTARGET}.pl";
 +    }
 +    require $cfgfile;
      goto \&launcher unless $Config::AUTOLOAD =~ /launcher$/;
diff --git a/recipes/perl/perl-5.8.8/perl-configpm-switch.patch b/recipes/perl/perl-5.8.8/perl-configpm-switch.patch
index 1aacd35..8becb8e 100644
--- a/recipes/perl/perl-5.8.8/perl-configpm-switch.patch
+++ b/recipes/perl/perl-5.8.8/perl-configpm-switch.patch
@@ -1,6 +1,6 @@
 This patch is used for perl-native only. It enables the switching of
 configuration files between Config_heavy.pl and
-Config_heavy-target.pl by setting the environment variables
+Config_heavy-$TARGET_SYS.pl by setting the environment variables
 PERLCONFIGTARGET - the later containing settings for the target while
 the former contains those for the host. This will allow cpan.bbclass
 to use the settings appropriate for the native and/or target builds
@@ -24,9 +24,9 @@ values would be valid for the host only.
  sub AUTOLOAD {
 -    require 'Config_heavy.pl';
 +    my $cfgfile = 'Config_heavy.pl';
-+    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} eq "yes")
++    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} ne "")
 +    {
-+        $cfgfile = 'Config_heavy-target.pl';
++        $cfgfile = "Config_heavy-$ENV{PERLCONFIGTARGET}.pl";
 +    }
 +    require $cfgfile;
      goto \&launcher unless $Config::AUTOLOAD =~ /launcher$/;
diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_5.10.1.bb
index 61d57f4..8b275a2 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "virtual/db-native gdbm-native"
-PR = "r6"
+PR = "r7"
 NATIVE_INSTALL_WORKS = "1"
 
 # Not tested enough
diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native_5.8.8.bb
index dbff4c5..a7f85a3 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "virtual/db-native gdbm-native"
-PR = "r21"
+PR = "r22"
 NATIVE_INSTALL_WORKS = "1"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 91434e2..387755e 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r14"
+PR = "r15"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -211,7 +211,7 @@ do_stage() {
         # target config, used by cpan.bbclass to extract version information
         install config.sh ${STAGING_LIBDIR}/perl/
         # target configuration, used by native perl when cross-compiling
-        install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/perl/${PV}/Config_heavy-target.pl
+        install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/perl/${PV}/Config_heavy-${TARGET_SYS}.pl
 	# target configuration
         install lib/Config.pm       ${STAGING_LIBDIR}/perl/${PV}/
 	install lib/ExtUtils/typemap ${STAGING_DATADIR}/perl/${PV}/ExtUtils/
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 69078e8..3e14bc3 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r36"
+PR = "r37"
 
 # Major part of version
 PVM = "5.8"
-- 
1.6.4.2



