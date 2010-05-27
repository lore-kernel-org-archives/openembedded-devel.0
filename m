Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OHear-0001Yq-H9
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 17:01:58 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4REveqL026876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 27 May 2010 16:57:40 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OHeWi-0005Ax-8X; Thu, 27 May 2010 16:57:40 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 16:57:22 +0200
Message-Id: <03de886667347afcc8921203ce7b5e6d41377de4.1274971894.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <921f797080989dbf4ebe79bbfeb5f1ef3c608748.1274971894.git.enrico.scholz@sigma-chemnitz.de>
References: <921f797080989dbf4ebe79bbfeb5f1ef3c608748.1274971894.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
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
Subject: [PATCH (rebase) 3/3] freetype: enable bytecode interpreter
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
X-List-Received-Date: Thu, 27 May 2010 15:01:58 -0000

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
index 6e0641e..04e445c 100644
--- a/recipes/freetype/freetype_2.3.12.bb
+++ b/recipes/freetype/freetype_2.3.12.bb
@@ -9,6 +9,7 @@ SRC_URI = "\
   file://no-hardcode.patch \
   file://fix-configure.patch \
   file://libtool-tag.patch \
+  ${@base_conditional('ENTERPRISE_DISTRO','1','','file://bytecode-interpreter.patch',d)} \
 "
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.0.1



