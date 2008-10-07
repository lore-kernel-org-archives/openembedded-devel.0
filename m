Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC6y-0007G4-VU
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:25 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97Cpk6l021256;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00014y-As; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:35 +0200
Message-Id: <b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 02/13] gcc-package.inc: add ${HOST_EXEEXT} support (for canadian sdk support)
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:25 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 packages/gcc/gcc-package-sdk.inc |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/packages/gcc/gcc-package-sdk.inc b/packages/gcc/gcc-package-sdk.inc
index a36e632..6a494c7 100644
--- a/packages/gcc/gcc-package-sdk.inc
+++ b/packages/gcc/gcc-package-sdk.inc
@@ -9,10 +9,10 @@ PACKAGES = "${PN} ${PN}-doc"
 
 FILES_${PN} = "\
     ${bindir}/* \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1${HOST_EXEEXT} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2${HOST_EXEEXT} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771${HOST_EXEEXT} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus${HOST_EXEEXT} \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
@@ -35,10 +35,10 @@ do_install () {
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 
 	# We care about g++ not c++
-	rm -f ${D}${bindir}/*c++
+	rm -f ${D}${bindir}/*c++${HOST_EXEEXT}
 
 	# We don't care about the gcc-<version> copies
-	rm -f ${D}${bindir}/*gcc-?.?*
+	rm -f ${D}${bindir}/*gcc-?.?*${HOST_EXEEXT}
 
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
@@ -49,7 +49,7 @@ do_install () {
 	for l in ${D}${bindir}/*; do
 		ln -sf "${bindir}/`basename $l`" "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e 's,${TARGET_PREFIX},,'`"
 	done
-	ln -sf "${bindir}/${TARGET_PREFIX}gcc" "${D}${prefix}/${TARGET_SYS}/bin/cc"
+	ln -sf "${bindir}/${TARGET_PREFIX}gcc${HOST_EXEEXT}" "${D}${prefix}/${TARGET_SYS}/bin/cc${HOST_EXEEXT}"
 
 	# Manually run the target stripper since we won't get it run by
 	# the packaging.
-- 
1.5.4.3



