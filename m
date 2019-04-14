Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id BB0B47DA76
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 18:09:16 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id ADCC23A511A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 16:17:50 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BA42C20004;
	Sun, 14 Apr 2019 16:17:48 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2019 09:17:24 -0700
Message-Id: <20190414161725.21617-4-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] gpm: Remove duplicate definition of _GNU_SOURCE
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
X-List-Received-Date: Sun, 14 Apr 2019 18:09:17 -0000
Content-Transfer-Encoding: 8bit

The Makefile already sets -D_GNU_SOURCE in CPPFLAGS, no need to patch it
in again.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-support/gpm/gpm/processcreds.patch | 12 ------------
 meta-oe/recipes-support/gpm/gpm_git.bb             |  1 -
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gpm/gpm/processcreds.patch

diff --git a/meta-oe/recipes-support/gpm/gpm/processcreds.patch b/meta-oe/recipes-support/gpm/gpm/processcreds.patch
deleted file mode 100644
index d647eca0a..000000000
--- a/meta-oe/recipes-support/gpm/gpm/processcreds.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: gpm-1.99.7/src/daemon/processconn.c
-===================================================================
---- gpm-1.99.7.orig/src/daemon/processconn.c	2010-09-29 17:36:18.571782951 +0400
-+++ gpm-1.99.7/src/daemon/processconn.c	2010-09-29 17:42:44.659991758 +0400
-@@ -20,6 +20,7 @@
-  *
-  ********/
- 
-+#define _GNU_SOURCE
- #include <sys/socket.h>         /* accept */
- #include <stdlib.h>             /* malloc */
- #include <unistd.h>             /* close */
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 012dceb23..b64f05c57 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -13,7 +13,6 @@ DEPENDS = "ncurses bison-native"
 
 SRC_URI = "git://github.com/telmich/gpm;protocol=git \
            file://init \
-           file://processcreds.patch \
            file://gpm.service.in \
            file://0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch \
            "
-- 
2.21.0


