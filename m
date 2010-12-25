Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PWRgA-0006U8-9p
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 11:48:51 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 9BF9520B4B; Sat, 25 Dec 2010 13:48:35 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 13:48:28 +0300
Message-Id: <1293274109-15695-4-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1293274109-15695-3-git-send-email-khimov@altell.ru>
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<1293274109-15695-2-git-send-email-khimov@altell.ru>
	<1293274109-15695-3-git-send-email-khimov@altell.ru>
Subject: [PATCH 4/5] perl-5.10.1: fix config var. 'need_va_copy'
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

From: Vladimir Sorokin <sorokin@altell.ru>

On x86_64, powerpc & s390 architectures need to copy va_list variable,
if it got from overlying function, before it passed to underlying function.

Signed-off-by: Vladimir Sorokin <sorokin@altell.ru>
Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/perl/perl_5.10.1.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index 0e6a1f9..a58b8ec 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r16"
+PR = "r17"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -149,6 +149,13 @@ do_configure() {
 	       -e 's,/usr/,${exec_prefix}/,g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
+	case "${TARGET_ARCH}" in
+		x86_64 | powerpc | s390)
+			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
+				config.sh-${TARGET_ARCH}-${TARGET_OS}
+			;;
+	esac
+
         if test "${MACHINE}" != "native"; then
             # These are strewn all over the source tree
             for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
-- 
1.6.4.2



