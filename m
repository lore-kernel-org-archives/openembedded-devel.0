Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 59980731EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 10:12:58 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 27CEE42A98B;
	Thu, 11 Feb 2016 11:12:57 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	Li xin <lixin.fnst@cn.fujitsu.com>, Kang Kai <kai.kang@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 11 Feb 2016 11:12:51 +0100
Message-Id: <1455185571-22165-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455185571-22165-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455185571-22165-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] lua: update Libs in lua.pc
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
X-List-Received-Date: Thu, 11 Feb 2016 10:12:59 -0000

Update Libs in lua.pc so that pkg-config --libs gives the correct list
of libraries for linking. This makes us effectively list the same
libraries as Fedora does.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta-oe/recipes-devtools/lua/lua/lua.pc.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc.in b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
index fe220160374a2a7261ed9ada91d0c8f9969bf3b6..c27e86e85dbe2f68f8c5240d0f6d4f4eb9c33383 100644
--- a/meta-oe/recipes-devtools/lua/lua/lua.pc.in
+++ b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
@@ -6,6 +6,5 @@ Name: Lua
 Description: Lua language engine
 Version: @VERSION@
 Requires:
-Libs: -L${libdir} -llua
-Libs.private: -lm
+Libs: -L${libdir} -llua -lm -ldl
 Cflags: -I${includedir}
-- 
2.5.0


