Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OmqV7-0006Ah-F1
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 18:00:58 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 95C8C23EFA; Sat, 21 Aug 2010 20:00:34 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 20:00:29 +0400
Message-Id: <1282406429-13062-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libpcre: fix QA 'non -dev package contains symlink .so' issue
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
X-List-Received-Date: Sat, 21 Aug 2010 16:00:58 -0000

Effectively reverts 402f1f697406d4d1a844a6c6b7736435053d69c6, maybe it was
useful back then, but as of today libpcre packages better without prepending
pythonic functions.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/libpcre/libpcre_7.6.bb |   15 ++++-----------
 1 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/recipes/libpcre/libpcre_7.6.bb b/recipes/libpcre/libpcre_7.6.bb
index b0eff17..aec3a5c 100644
--- a/recipes/libpcre/libpcre_7.6.bb
+++ b/recipes/libpcre/libpcre_7.6.bb
@@ -5,7 +5,7 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r7"
+PR = "r8"
 LICENSE = "BSD"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch"
@@ -43,17 +43,10 @@ do_install_append () {
     install -m 0755 ${D}${bindir}/pcre-config ${STAGING_BINDIR}/
 }
 
-python populate_packages_prepend () {
-	pcre_libdir = bb.data.expand('${libdir}', d)
-	pcre_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'libpcre %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'libpcre %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'libpcre %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.*', 'lib%s', 'libpcre %s library', extra_depends='', allow_links=True)
-}
-
-FILES_${PN} = "${libdir}/libpcre.so.*"
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-dev += "${bindir}/*"
 
+LEAD_SONAME = "libpcre.so.*"
+
 SRC_URI[md5sum] = "2af38e083fb90ef60fa9eda7cc290e86"
 SRC_URI[sha256sum] = "362e4b4473f2f7a3bfa28ea73e80ec00a2fe525a1aceb5f66e1c528a900bd735"
-- 
1.6.4.2



