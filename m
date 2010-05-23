Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGGn7-00007n-DY
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 21:24:54 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NJK759006981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 21:20:08 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGGiV-0002To-P9; Sun, 23 May 2010 21:20:07 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 21:20:03 +0200
Message-Id: <712988cd3a458edd17b46a35ae1a82969c45e4dc.1274642314.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <13ca048a9b8e288c16467f1f833aeee6654d9981.1274642314.git.enrico.scholz@sigma-chemnitz.de>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
	<13ca048a9b8e288c16467f1f833aeee6654d9981.1274642314.git.enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH 3/3] freetype: enable bytecode interpreter
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
X-List-Received-Date: Sun, 23 May 2010 19:24:54 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

Bytecode stuff is patent encumbered so it can be enabled for
non-enterprise distributions only.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../freetype-2.3.12/bytecode-interpreter.patch     |   22 ++++++++++++++++++++
 recipes/freetype/freetype_2.3.12.bb                |    1 +
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/freetype/freetype-2.3.12/bytecode-interpreter.patch

diff --git a/recipes/freetype/freetype-2.3.12/bytecode-interpreter.patch b/recipes/freetype/freetype-2.3.12/bytecode-interpreter.patch
new file mode 100644
index 0000000..599e67d
--- /dev/null
+++ b/recipes/freetype/freetype-2.3.12/bytecode-interpreter.patch
@@ -0,0 +1,22 @@
+Index: freetype-2.3.12/include/freetype/config/ftoption.h
+===================================================================
+--- freetype-2.3.12.orig/include/freetype/config/ftoption.h
++++ freetype-2.3.12/include/freetype/config/ftoption.h
+@@ -93,7 +93,7 @@ FT_BEGIN_HEADER
+   /* This is done to allow FreeType clients to run unmodified, forcing     */
+   /* them to display normal gray-level anti-aliased glyphs.                */
+   /*                                                                       */
+-/* #define FT_CONFIG_OPTION_SUBPIXEL_RENDERING */
++#define FT_CONFIG_OPTION_SUBPIXEL_RENDERING
+ 
+ 
+   /*************************************************************************/
+@@ -497,7 +497,7 @@ FT_BEGIN_HEADER
+   /*   Do not #undef this macro here, since the build system might         */
+   /*   define it for certain configurations only.                          */
+   /*                                                                       */
+-/* #define TT_CONFIG_OPTION_BYTECODE_INTERPRETER */
++#define TT_CONFIG_OPTION_BYTECODE_INTERPRETER
+ 
+ 
+   /*************************************************************************/
diff --git a/recipes/freetype/freetype_2.3.12.bb b/recipes/freetype/freetype_2.3.12.bb
index b1f8d6f..53372fc 100644
--- a/recipes/freetype/freetype_2.3.12.bb
+++ b/recipes/freetype/freetype_2.3.12.bb
@@ -9,6 +9,7 @@ SRC_URI = "\
   file://no-hardcode.patch;patch=1 \
   file://fix-configure.patch;patch=1 \
   file://libtool-tag.patch;patch=1 \
+  ${@base_conditional('ENTERPRISE_DISTRO','1','','file://bytecode-interpreter.patch;patch=1',d)} \
 "
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.0.1



