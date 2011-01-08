Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PbfTX-0003Kf-N8
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Jan 2011 21:33:24 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id A50F520648; Sat,  8 Jan 2011 23:32:54 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jan 2011 23:32:52 +0300
Message-Id: <1294518772-24804-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
Subject: [PATCH] perl: blacklist perl-module-cpanplus-internals-source-sqlite for perl-modules
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
X-List-Received-Date: Sat, 08 Jan 2011 20:33:24 -0000

It has runtime dependencies on libdbd-sqlite-perl and libdbix-simple-perl
which doesn't get built automatically if not required as build time dependency
for something.

It's not possible to add them as build time dependencies for
perl itself since they're in turn depend on perl making a circular dependency
(and they _really_ depend on perl because they build binaries, so no way to
cheat by making this recipes not to depend on perl).

It's also not correct to downgrade this runtime dependency to recommendation,
since the module is really unusable without its dependencies.

The most annoying thing about all this is that this dependency situation renders
perl-modules package uninstallable by itself, failing with something like:

 Collected errors:
  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
 task-sdk-native:
  *    libdbd-sqlite-perl *    libdbix-simple-perl *

So the best way to solve it IMO is to just blacklist it from perl-modules
since the value of this module is questionable. It's experimental CPANPLUS
backend that's not used by default, you have to specifically configure your
perl to use it. And if you _really_ want to use it - the module package itself
will still contain proper dependencies, you just need to get them built and
installed.

The problem only exists in perl 5.10.1, but 5.8.8 doesn't have this module, so
blacklisting in common .inc doesn't hurt.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/perl/perl.inc       |    2 +-
 recipes/perl/perl_5.10.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/perl/perl.inc b/recipes/perl/perl.inc
index ddde0b8..3d8b9bb 100644
--- a/recipes/perl/perl.inc
+++ b/recipes/perl/perl.inc
@@ -1,7 +1,7 @@
 # helper functions for perl
 def all_perl_packages(d):
     depchains = (d.getVar("DEPCHAIN_POST", True) or "").split()
-    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc"]
+    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc", "perl-module-cpanplus-internals-source-sqlite", "perl-module-cpanplus-internals-source-sqlite-tie"]
     for pkg in d.getVar("PACKAGES", True).split():
         if not pkg in blacklist and not any(pkg.endswith(post) for post in depchains):
             yield pkg
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 4e6bc33..33ddffe 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r19"
+PR = "r20"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
-- 
1.6.4.2



