Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id B7E096093D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 09:55:45 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id DD64D3CF6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 11:46:22 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2016 11:46:14 +0200
Message-Id: <1474364775-21738-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-multimedia][PATCH] cdparanoia: fix QA warning for GNU_HASH
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
X-List-Received-Date: Tue, 20 Sep 2016 09:55:48 -0000

Patch Makefile.in files to use LDFLAGS when linking the shared objects

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../cdparanoia/cdparanoia_10.2.bb                  |  1 +
 .../0003-Fix-missing-shared-object-LDFLAGS.patch   | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch

diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
index 86ba527..ba368a2 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=d370feaa1c9edcdbd29ca27ea3d2304d"
 SRC_URI = "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${PV}.src.tgz \
            file://0001-Use-DESTDIR-in-install-Makefile-rule.patch \
            file://0002-interface-remove-C-reserved-keyword.patch \
+           file://0003-Fix-missing-shared-object-LDFLAGS.patch \
 "
 SRC_URI[md5sum] = "b304bbe8ab63373924a744eac9ebc652"
 SRC_URI[sha256sum] = "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df"
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch
new file mode 100644
index 0000000..5298a3d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0003-Fix-missing-shared-object-LDFLAGS.patch
@@ -0,0 +1,42 @@
+From c0b77aeb2127da821ae1c03c2f98aaf4db65277d Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sat, 10 Sep 2016 21:15:18 +0200
+Subject: [PATCH] Fix missing shared object LDFLAGS
+
+Upstream-Status: Inappropriate (the upstream project is dead)
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ interface/Makefile.in | 2 +-
+ paranoia/Makefile.in  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/interface/Makefile.in b/interface/Makefile.in
+index 40c6098..020bf2a 100644
+--- a/interface/Makefile.in
++++ b/interface/Makefile.in
+@@ -46,7 +46,7 @@ libcdda_interface.a: 	$(OFILES)
+ 	$(RANLIB) libcdda_interface.a
+ 
+ libcdda_interface.so: 	$(OFILES)	
+-	$(CC) -fpic -shared -o libcdda_interface.so.0.$(VERSION) -Wl,-soname -Wl,libcdda_interface.so.0 $(OFILES) $(LIBS)
++	$(CC) -fpic -shared -o libcdda_interface.so.0.$(VERSION) -Wl,-soname -Wl,libcdda_interface.so.0 $(LDFLAGS) $(OFILES) $(LIBS)
+ 	[ -e libcdda_interface.so.0 ] || ln -s libcdda_interface.so.0.$(VERSION) libcdda_interface.so.0
+ 	[ -e libcdda_interface.so ] || ln -s libcdda_interface.so.0.$(VERSION) libcdda_interface.so
+ 
+diff --git a/paranoia/Makefile.in b/paranoia/Makefile.in
+index 89d0328..ffb4e70 100644
+--- a/paranoia/Makefile.in
++++ b/paranoia/Makefile.in
+@@ -44,7 +44,7 @@ libcdda_paranoia.a: 	$(OFILES)
+ 	$(RANLIB) libcdda_paranoia.a
+ 
+ libcdda_paranoia.so: 	$(OFILES)	
+-	$(CC) -fpic -shared -o libcdda_paranoia.so.0.$(VERSION) -Wl,-soname -Wl,libcdda_paranoia.so.0 $(OFILES) -L ../interface -lcdda_interface
++	$(CC) -fpic -shared -o libcdda_paranoia.so.0.$(VERSION) -Wl,-soname -Wl,libcdda_paranoia.so.0 $(LDFLAGS) $(OFILES) -L ../interface -lcdda_interface
+ 	[ -e libcdda_paranoia.so.0 ] || ln -s libcdda_paranoia.so.0.$(VERSION) libcdda_paranoia.so.0
+ 	[ -e libcdda_paranoia.so ] || ln -s libcdda_paranoia.so.0.$(VERSION) libcdda_paranoia.so
+ 
+-- 
+2.7.4
+
-- 
2.7.4


