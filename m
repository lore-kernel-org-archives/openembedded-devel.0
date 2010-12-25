Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PWRg7-0006Tv-FP
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 11:48:47 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 87767205D3; Sat, 25 Dec 2010 13:48:34 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 13:48:27 +0300
Message-Id: <1293274109-15695-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1293274109-15695-2-git-send-email-khimov@altell.ru>
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<1293274109-15695-2-git-send-email-khimov@altell.ru>
Subject: [PATCH 3/5] perl-native: fix ExtUtils::Liblist::Kid library check for cross-build
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
X-List-Received-Date: Sat, 25 Dec 2010 10:48:47 -0000

MakeMaker uses it to check for libraries presence and if the library is not
found in host dirs (/lib, /usr/lib, etc) it fails with messages like:

Note (probably harmless): No library found for -lpcap

Unfortunately it's not harmless, since MakeMaker removes such libs from flags
passed to link target modules which obviously breaks them.

As I don't know exact semantic and all use-cases of libpth config variable
I've workarounded this issue by prepending ldflags (and this does contain the
right path) to lib flags.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 .../perl-5.10.1/perl-fix-cross-library-check.patch |   19 +++++++++++++++++++
 recipes/perl/perl-native_5.10.1.bb                 |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch

diff --git a/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch b/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch
new file mode 100644
index 0000000..1c51609
--- /dev/null
+++ b/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch
@@ -0,0 +1,19 @@
+Index: perl-5.10.1/lib/ExtUtils/Liblist/Kid.pm
+===================================================================
+--- perl-5.10.1.orig/lib/ExtUtils/Liblist/Kid.pm	2010-11-23 13:54:41.000000000 +0300
++++ perl-5.10.1/lib/ExtUtils/Liblist/Kid.pm	2010-11-23 14:18:13.000000000 +0300
+@@ -33,6 +33,14 @@
+ 	$potential_libs .= " " if $potential_libs;
+ 	$potential_libs .= $Config{perllibs};
+     }
++
++    if ($Config{ldflags}) { 
++	# Dynamic libraries are not transitive, so we may need including
++	# the libraries linked against perl.dll again.
++
++	$potential_libs = $Config{ldflags} . " " . $potential_libs;
++    }
++
+     return ("", "", "", "", ($give_libs ? [] : ())) unless $potential_libs;
+     warn "Potential libraries are '$potential_libs':\n" if $verbose;
+ 
diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_5.10.1.bb
index 8b275a2..c523974 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "virtual/db-native gdbm-native"
-PR = "r7"
+PR = "r8"
 NATIVE_INSTALL_WORKS = "1"
 
 # Not tested enough
@@ -21,6 +21,7 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
            file://perl-configpm-switch.patch \
            file://native-nopacklist.patch \
            file://native-perlinc.patch \
+	   file://perl-fix-cross-library-check.patch \
 	   "
 
 SRC_URI[perl-5.10.1.md5sum] = "b9b2fdb957f50ada62d73f43ee75d044"
-- 
1.6.4.2



