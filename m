Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SxLfH-0003Mb-HX
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 19:27:55 +0200
Received: by ggmq1 with SMTP id q1so1015778ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=eW6sHqHU5v3z9QK0RE17HsgSgqbvMQAzIcteTyfxc6k=;
	b=PBESU25OoYXp62rNmy4KP7flbQVSUJ1J139h9PNEpBx7YTVIvc8PK7t52f9ncFhF2f
	vrTVeNmEdRYferJTb8A1NCtheCEuphd7SCbQvxY16WmGuDVSBHYMWu/is3FvoQmFPSnd
	1NsgbvsMpDnsSS+TD7r0gWJI1izdHOeeB3pXSZ90AfMdExoRZ+lmB+Mhd/Hm3RD/ITKd
	3So4XzDFz+RdvZCPOvRf4rqiZ178HFglGLgpAHwWhdi75qQ7zCsnLfI5d7oNqt0ssRMK
	mwK/pmphekwr8oOfWItFDoA1/8R3+5X7IG+15wcceSIYD/Tej1uUpOsIRsSql5O/H5zE
	lP0g==
Received: by 10.101.103.16 with SMTP id f16mr850643anm.25.1344014174199;
	Fri, 03 Aug 2012 10:16:14 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id s12sm2250534anh.2.2012.08.03.10.16.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 10:16:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2012 14:15:57 -0300
Message-Id: <1344014157-26570-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1344014157-26570-1-git-send-email-otavio@ossystems.com.br>
References: <1344014157-26570-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] postgresql: Fix packaging of static libraries
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
X-List-Received-Date: Fri, 03 Aug 2012 17:27:55 -0000

This patch fixes the following QA issue:

,----[ Fragment of build error log ]
| ...
| ERROR: QA Issue: non -staticdev package contains static .a library:
|   libecpg-dev path '/work/.../packages-split/libecpg-dev/usr/lib/libpgtypes.a'
| ...
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/postgresql/postgresql.inc |   22 +++++++++++++-------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 01c41c1..eeda729 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "PostgreSQL is a powerful, open source relational database system.
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
-INC_PR = "r7"
+INC_PR = "r8"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -52,20 +52,26 @@ FILES_${PN}-doc += "${prefix}/doc/"
 FILES_${PN}-timezone = "${datadir}/${PN}/timezone"
 FILES_${PN}-server-dev = "${includedir}/${PN}/server"
 
-FILES_libecpg = "${libdir}/libecpg*.so.*"
+FILES_libecpg = "${libdir}/libecpg*${SOLIBS}"
 FILES_libecpg-dbg = "${libdir}/.debug/libecpg*"
-FILES_libecpg-dev = "${libdir}/libecpg*.a ${libdir}/libecpg*.so \
-                     ${libdir}/libpgtypes*.a ${libdir}/libpgtypes*.so \
+FILES_libecpg-dev = "${libdir}/libecpg*${SOLIBSDEV} \
+                     ${libdir}/libpgtypes*${SOLIBSDEV} \
                      ${includedir}/ecpg*.h ${includedir}/${PN}/ecpg*.h \
                      ${includedir}/pgtypes*.h ${includedir}/${PN}/informix \
                      ${includedir}/sql3types.h ${includedir}/sqlca.h"
+FILES_libecpg-staticdev = "${libdir}/libecpg*.a"
+SECTION_libecpg-staticdev = "devel"
+RDEPENDS_libecpg-staticdev = "libecpg-dev (= ${EXTENDPKGV})"
 
-FILES_libpq = "${libdir}/libpq*.so.*"
+FILES_libpq = "${libdir}/libpq*${SOLIBS}"
 FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${PN}/pgxs/src/test/regress/.debug/*"
-FILES_libpq-dev = "${libdir}/libpq*.a ${libdir}/libpq*.so ${libdir}/libpgport.a \
+FILES_libpq-dev = "${libdir}/libpq*${SOLIBSDEV} \
                    ${includedir}"
+FILES_libpq-staticdev = "${libdir}/libpq*.a"
+SECTION_libpq-staticdev = "devel"
+RDEPENDS_libpq-staticdev = "libpq-dev (= ${EXTENDPKGV})"
 
-FILES_libecpg-compat = "${libdir}/libecpg_compat*.so.*"
+FILES_libecpg-compat = "${libdir}/libecpg_compat*${SOLIBS}"
 FILES_libecpg-compat-dbg = "${libdir}/.debug/libecpg_compat*"
-FILES_libpgtypes = "${libdir}/libpgtypes*.so.*"
+FILES_libpgtypes = "${libdir}/libpgtypes*${SOLIBS}"
 FILES_libpgtypes-dbg = "${libdir}/.debug/libpgtypes*"
-- 
1.7.2.5



