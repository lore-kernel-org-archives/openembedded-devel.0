Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SFfdF-0007Oe-1v
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 07:53:17 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.245.1; Thu, 5 Apr 2012
	07:43:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Apr 2012 07:42:43 +0200
Message-ID: <b2c8f6c6ee91d09594c19275e8f1bdba12e2690a.1333604512.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333604512.git.anders@chargestorm.se>
References: <cover.1333604512.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 1/1] sqlite: cp instead of mv in do_configure
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
X-List-Received-Date: Thu, 05 Apr 2012 05:53:17 -0000
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



