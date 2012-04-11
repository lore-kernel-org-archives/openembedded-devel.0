Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SHr1p-0001bk-Ey
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 08:27:43 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.245.1; Wed, 11 Apr 2012
	08:17:18 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Apr 2012 08:17:01 +0200
Message-ID: <73d31a874262a0853376d76dd925b5f2fb025d8b.1334124991.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334124991.git.anders@chargestorm.se>
References: <cover.1334124991.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH v2 1/1] sqlite: cp instead of mv in do_configure
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
X-List-Received-Date: Wed, 11 Apr 2012 06:27:43 -0000
Content-Type: text/plain

The use of mv in do_configure() made bitbake error out if a second run
of do_configure was requested. Copy the file instead.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
index b8e03c4..733bb9e 100644
--- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
+++ b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 do_configure() {
     echo "main.mk is patched, no need to configure"
     # make pkgconfig.bbclass pick this up
-    mv ${WORKDIR}/sqlite.pc ${S}
+    cp ${WORKDIR}/sqlite.pc ${S}
 }
 
 do_compile() {
-- 
1.7.5.4



