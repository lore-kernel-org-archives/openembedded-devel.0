Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1QOWFy-00045k-L5
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 16:37:18 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id D351849128A;
	Mon, 23 May 2011 16:07:14 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 23 May 2011 16:07:14 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id 707627208D; Mon, 23 May 2011 16:07:14 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 16:07:07 +0200
Message-Id: <1306159627-10568-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 23 May 2011 14:07:14.0853 (UTC)
	FILETIME=[B7CC3D50:01CC1952]
Subject: [PATCH] apr-util: disable odbc support to avoid QA error
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
X-List-Received-Date: Mon, 23 May 2011 14:37:18 -0000

The odbc checker part of the configure script seems to be buggy and
may add host pathes to compiler and linker options:

--------->snip<--------
 checking for odbc_config... /usr/bin/odbc_config
   adding "-I/usr/include" to CPPFLAGS
   adding "-L/usr/lib" to LDFLAGS
   setting LIBS to "-L/usr/lib -lodbc"
--------->snip<--------

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/apr/apr-util_1.3.10.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/apr/apr-util_1.3.10.bb b/recipes/apr/apr-util_1.3.10.bb
index ee32ddd..32b568e 100644
--- a/recipes/apr/apr-util_1.3.10.bb
+++ b/recipes/apr/apr-util_1.3.10.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 DEPENDS = "apr expat gdbm"
 LICENSE = "Apache License, Version 2.0"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
            file://configfix.patch \
@@ -15,6 +15,7 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-sqlite2 \
 		--without-sqlite3 \
 		--without-pgsql \
+		--without-odbc \
 		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
 
 SRC_URI[md5sum] = "82acd25cf3df8c72eba44eaee8b80c19"
-- 
1.7.1



