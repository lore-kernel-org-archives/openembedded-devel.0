Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PWRgA-0006U9-9u
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 11:48:51 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 0DB2A214B4; Sat, 25 Dec 2010 13:48:34 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 13:48:26 +0300
Message-Id: <1293274109-15695-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1293274109-15695-1-git-send-email-khimov@altell.ru>
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
Subject: [PATCH 2/5] perl 5.10.1: fix Time::HiRes cross-compilation
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

We can't do 'run' check, so let's hope compile check is enough.
Fixes

Time::HiRes::nanosleep(): unimplemented in this platform

error.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 .../perl-time-hires-fix-cross-compilation.patch    |   29 ++++++++++++++++++++
 recipes/perl/perl_5.10.1.bb                        |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch

diff --git a/recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch b/recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch
new file mode 100644
index 0000000..7c8b47e
--- /dev/null
+++ b/recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch
@@ -0,0 +1,29 @@
+Index: perl-5.10.1/ext/Time-HiRes/Makefile.PL
+===================================================================
+--- perl-5.10.1.orig/ext/Time-HiRes/Makefile.PL	2010-11-23 12:05:59.000000000 +0300
++++ perl-5.10.1/ext/Time-HiRes/Makefile.PL	2010-11-23 12:06:42.000000000 +0300
+@@ -157,24 +157,6 @@
+ 	    my $res = system($cccmd);
+ 	    $ok = defined($res) && $res == 0 && -s $tmp_exe && -x _;
+ 
+-	    if ( $ok && exists $args{run} && $args{run}) {
+-		my $tmp_exe =
+-		    File::Spec->catfile(File::Spec->curdir, $tmp_exe);
+-		printf "Running $tmp_exe..." if $VERBOSE;
+-		if (system($tmp_exe) == 0) {
+-		    $ok = 1;
+-		} else {
+-		    $ok = 0;
+-		    my $errno = $? >> 8;
+-		    local $! = $errno;
+-		    printf <<EOF;
+-
+-*** The test run of '$tmp_exe' failed: status $?
+-*** (the status means: errno = $errno or '$!')
+-*** DO NOT PANIC: this just means that *some* functionality will be missing.
+-EOF
+-		}
+-	    }
+ 	    unlink("$tmp.c", $tmp_exe);
+         }
+     }
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 387755e..0e6a1f9 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r15"
+PR = "r16"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -62,6 +62,7 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
 	file://arm-alignment.diff \
 	file://fcgi-test.diff \
 	file://hurd-ccflags.diff \
+	file://perl-time-hires-fix-cross-compilation.patch \
 	\
         file://Makefile.patch \
         file://Makefile.SH.patch \
-- 
1.6.4.2



