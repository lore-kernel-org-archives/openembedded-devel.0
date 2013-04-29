Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UWoKn-0006I6-TZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 15:41:38 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:23:41 +0100
Message-Id: <1367241822-9111-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
References: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH 2/3] php: remove unnecessary LIBS export
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
X-List-Received-Date: Mon, 29 Apr 2013 13:41:55 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Adding explicit LIBS additions is not required anymore

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-devtools/php/php.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 7ae5cc8..fcd3598 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -50,9 +50,6 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           , \
                           ,sqlite3"
 
-LIBS_virtclass-native = " -lxml2 "
-LIBS_pn-php =" -lpthread "
-export LIBS
 THREADS_pn-php = "pthread"
 export THREADS
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
1.8.2.2



