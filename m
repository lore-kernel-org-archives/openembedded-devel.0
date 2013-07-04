Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 333086AFF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 21:45:52 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id AC0D5A6246
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 23:45:49 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jul 2013 23:47:29 +0200
Message-Id: <1372974449-19858-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1776530.dBKCTHnX8Z@helios>
References: <1776530.dBKCTHnX8Z@helios>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] hexedit: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2013 21:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../hexedit/0001-don-t-strip-when-installing.patch |   30 ++++++++++++++++++++
 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |   17 +++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch
 create mode 100644 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb

diff --git a/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch
new file mode 100644
index 0000000..a384b05
--- /dev/null
+++ b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch
@@ -0,0 +1,30 @@
+From cc67246ca6839e5b3f6a286f10ed24c225b77a5e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Thu, 4 Jul 2013 12:34:32 +0200
+Subject: [PATCH] don't strip when installing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 159463e..735cc72 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -42,6 +42,6 @@ distclean: clean
+ 
+ install: $(PRODUCT)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
+-	$(INSTALL) -s -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
++	$(INSTALL) -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
+ 	$(INSTALL) -m 644 $(PRODUCT).1 $(DESTDIR)$(mandir)/man1
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
new file mode 100644
index 0000000..d0658db
--- /dev/null
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
@@ -0,0 +1,17 @@
+SUMMARY = "view and edit files in hexadecimal or in ASCII"
+HOMEPAGE = "http://rigaux.org/hexedit.html"
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+DEPENDS = "ncurses"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://rigaux.org/${PN}-${PV}.src.tgz \
+    file://0001-don-t-strip-when-installing.patch "
+
+SRC_URI[md5sum] = "a5af1378d028512a9cad27a5ba3e15f9"
+SRC_URI[sha256sum] = "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54c58c983963b88dd7"
+
+inherit autotools
+
+S = "${WORKDIR}/${PN}"
-- 
1.7.10.4


