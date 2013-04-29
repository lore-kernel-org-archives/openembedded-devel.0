Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UWoKn-0006I4-Vr
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 15:41:38 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:23:40 +0100
Message-Id: <1367241822-9111-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
References: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH 1/3] php: remove obsolete CFLAGS
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

PTYS_ARE_GETPT and PTYS_ARE_SEARCHED don't appear anywhere in the
source code anymore, remove them.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 749f51c..7ae5cc8 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -57,7 +57,7 @@ THREADS_pn-php = "pthread"
 export THREADS
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-CFLAGS += " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -D_GNU_SOURCE"
+CFLAGS += " -D_GNU_SOURCE"
 
 acpaths = ""
 
-- 
1.8.2.2



