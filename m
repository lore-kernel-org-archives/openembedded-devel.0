Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PY4Bs-0006uH-R6
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 23:08:16 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 4669720B4B; Thu, 30 Dec 2010 01:07:59 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Dec 2010 01:07:57 +0300
Message-Id: <1293660478-3080-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <201012292340.40618.roman@khimov.ru>
References: <201012292340.40618.roman@khimov.ru>
Subject: [PATCH 1/2] perl 5.10.1: fix archlib(exp) and privlib(exp) vars in target configs
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
X-List-Received-Date: Wed, 29 Dec 2010 22:08:17 -0000

These vars can be used to derive build flags for perl modules and thus should
point to build-time directories in staged configs.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/perl/perl_5.10.1.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index d8c374b..4e6bc33 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r18"
+PR = "r19"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -224,6 +224,13 @@ do_stage() {
         install config.sh ${STAGING_LIBDIR}/perl/
         # target configuration, used by native perl when cross-compiling
         install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/perl/${PV}/Config_heavy-${TARGET_SYS}.pl
+	sed -r -i \
+		-e "s,^(archlib=).*$,\1'${STAGING_LIBDIR}/perl/${PV}'," \
+		-e "s,^(archlibexp=).*$,\1'${STAGING_LIBDIR}/perl/${PV}'," \
+		-e "s,^(privlib=).*$,\1'${STAGING_DATADIR}/perl/${PV}'," \
+		-e "s,^(privlibexp=).*$,\1'${STAGING_DATADIR}/perl/${PV}'," \
+		${STAGING_LIBDIR_NATIVE}/perl/${PV}/Config_heavy-${TARGET_SYS}.pl \
+		${STAGING_LIBDIR}/perl/config.sh
 	# target configuration
         install lib/Config.pm       ${STAGING_LIBDIR}/perl/${PV}/
 	install lib/ExtUtils/typemap ${STAGING_DATADIR}/perl/${PV}/ExtUtils/
-- 
1.6.4.2



