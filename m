Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Mbc3a-0001KA-O9
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:17:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8FAF253A938;
	Thu, 13 Aug 2009 11:01:02 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13434-07-4; Thu, 13 Aug 2009 11:01:02 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 05E1A526A79; Thu, 13 Aug 2009 11:00:52 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 5DF6753A8DF;
	Thu, 13 Aug 2009 11:00:46 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 58C5B41A97; Thu, 13 Aug 2009 11:00:46 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 11:00:39 -0400
Message-Id: <1250175641-4869-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/4] gcc: fix libstdc/libgcc packaging on x86_64
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
X-List-Received-Date: Thu, 13 Aug 2009 15:17:35 -0000

do_install was looking under ${D}/some long cross path/*/lib;
needs to be lib64 on x86_64. On x86_64 base_libdir would be set to
/lib64, so we can go by that.

Bump INC_PR for recent gccs (4.3.3, 4.4.1). Hopefully no one is using
older gcc for x86_64.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/gcc/gcc-4.3.3.inc         |    2 +-
 recipes/gcc/gcc-4.4.1.inc         |    2 +-
 recipes/gcc/gcc-package-cross.inc |   13 ++++++++-----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 5802492..4a3cb49 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index a5b9d91..2759ab9 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 FILESPATHPKG .= ":gcc-$PV"
 
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index fa1f47f..6c4f9bb 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -29,7 +29,9 @@ do_install () {
         elif [  -f ${D}${prefix}/*/lib/nof/libgcc_s.so.? ]; then
                 mv -f ${D}${prefix}/*/lib/nof/libgcc_s.so* ${D}${target_base_libdir}
         else
-                mv -f ${D}${prefix}/*/lib/libgcc_s.so* ${D}${target_base_libdir} || true 
+                # Look for .../${TARGET_SYS}/lib/libgcc_s*
+                # (or /lib64/, on x86_64)
+                mv -f ${D}${prefix}/*/${target_base_libdir}/libgcc_s.so* ${D}${target_base_libdir} || true 
         fi
 
 
@@ -45,10 +47,11 @@ do_install () {
            mv -f ${D}${prefix}/*/lib/nof/libssp*.so* ${D}${target_libdir} || true 	
 
         else
-           mv -f ${D}${prefix}/*/lib/libstdc++.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/libg2c.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/libgfortran*.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/libssp*.so* ${D}${target_libdir} || true
+           # Look for .../${TARGET_SYS}/lib/lib* (or /lib64/ on x86_64)
+           mv -f ${D}${prefix}/*/${target_base_libdir}/libstdc++.so* ${D}${target_libdir} || true
+           mv -f ${D}${prefix}/*/${target_base_libdir}/libg2c.so* ${D}${target_libdir} || true
+           mv -f ${D}${prefix}/*/${target_base_libdir}/libgfortran*.so* ${D}${target_libdir} || true
+           mv -f ${D}${prefix}/*/${target_base_libdir}/libssp*.so* ${D}${target_libdir} || true
         fi
 
 
-- 
1.6.3



