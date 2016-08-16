Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 86E6E73232
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id A43C41EE08AA;
	Tue, 16 Aug 2016 12:31:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mXzWK4y9j5P1; Tue, 16 Aug 2016 12:31:57 +0200 (CEST)
Received: from pcrosen.dhcp.idf.intranet (gre92-5-82-237-199-7.fbx.proxad.net
	[82.237.199.7])
	by idris.smile.fr (Postfix) with ESMTPA id 797681EE089D;
	Tue, 16 Aug 2016 12:31:57 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Aug 2016 12:31:56 +0200
Message-Id: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] [jethro] fix gcc-cross when BUILD_* are set
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2016 10:31:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with a compiler which is not gcc the gcc-croos will still
use the $CC and $CXX variables

These variables are not set properly to BUILD_CC and BUILD_CXX by the
recipe.

This is problematic now for jethro because gcc-6 is the default compiler
for some distros (debian testing) which can't build jethro anymore


Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index aa10633..9a2e06f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -36,8 +36,14 @@ EXTRA_OECONF_PATHS = "\
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+do_configure_prepend () {
+	export CC="${BUILD_CC}"
+	export CXX="${BUILD_CXX}"
+}
+
 do_compile () {
 	export CC="${BUILD_CC}"
+	export CXX="${BUILD_CXX}"
 	export AR_FOR_TARGET="${TARGET_SYS}-ar"
 	export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
 	export LD_FOR_TARGET="${TARGET_SYS}-ld"
-- 
2.8.1


