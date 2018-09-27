Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id ED91A7987A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:55:24 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id BF62922004B;
	Thu, 27 Sep 2018 14:55:25 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Sep 2018 14:55:18 +0200
Message-Id: <20180927125519.2567-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/2] php: add "--without-sqlite3 --without-pdo-sqlite"
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
X-List-Received-Date: Thu, 27 Sep 2018 12:55:25 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Removing "sqlite3" from `PACKAGECONFIG` doesn't actually disable
SQLite, because those options default to "yes".  It just switches from
the system SQLite to PHP's internal SQLite copy.
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 9eacabe03..99a25b94b 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -79,7 +79,7 @@ PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
 
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
-                          , \
+                          ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
 PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
-- 
2.19.0


