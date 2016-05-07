Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC4A8738AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 07:01:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4771bRK027105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sat, 7 May 2016 00:01:37 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 May 2016 00:01:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 May 2016 03:01:27 -0400
Message-ID: <79de0c3fdc14f4f5e4a275dc9d69144ba336d720.1462603608.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1462603608.git.hongxu.jia@windriver.com>
References: <cover.1462603608.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: koen.kooi@linaro.org
Subject: [PATCH 3/3] efivar: fix do_install failed
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
X-List-Received-Date: Sat, 07 May 2016 07:01:40 -0000
Content-Type: text/plain

It fixes efivar.pc not found:
...
| install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
| install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
;
| install: cannot stat 'efivar.pc': No such file or directory
| install: cannot stat 'efiboot.pc': No such file or directory
| make[1]: *** [install] Error 1
| make[1]: Leaving directory `efivar/0.23-r0/git/src'
| make: *** [install] Error 2
| ERROR: oe_runmake failed
...

Also sync with latest upstream

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../efivar/0003-efivar-fix-for-cross-compile.patch | 44 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.23.bb     |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
new file mode 100644
index 0000000..3f43f2a
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
@@ -0,0 +1,44 @@
+From 7ead29ca6bb5e280ae07551cc3521281ecf73682 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 7 May 2016 02:06:47 -0400
+Subject: [PATCH] Makefile: fix efivar.pc not found
+
+It fixes efivar.pc not found:
+...
+| install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
+| install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
+;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
+;
+| install: cannot stat 'efivar.pc': No such file or directory
+| install: cannot stat 'efiboot.pc': No such file or directory
+| make[1]: *** [install] Error 1
+| make[1]: Leaving directory `efivar/0.23-r0/git/src'
+| make: *** [install] Error 2
+| ERROR: oe_runmake failed
+...
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index c7a0ca3..ad9c427 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -78,7 +78,9 @@ install : all
+ 		ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x).$(MAJOR_VERSION);\
+ 		ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); )
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(PCDIR)
+-	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(x) $(DESTDIR)$(PCDIR) ;)
++	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\
++		sed -i -e "s:@@LIBDIR@@:$(libdir):g" -e "s:@@VERSION@@:$(VERSION):g" \
++			$(DESTDIR)$(PCDIR)/$(x); )
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)/efivar
+ 	$(foreach x, $(wildcard $(TOPDIR)/src/include/efivar/*.h), $(INSTALL) -m 644 $(x) $(DESTDIR)$(includedir)/efivar/$(notdir $(x));)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
index b41be03..9c47461 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.23.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 DEPENDS_class-target = "popt efivar-native"
 
-SRCREV = "01abee43d6d6e755f56a4135ab5aa0bfad609ce2"
+SRCREV = "7367d78281fa3ce390e10c7c9f4608c58e7a6d3d"
 SRC_URI = "git://github.com/rhinstaller/efivar.git"
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0002-disable-static-build.patch \
+                                file://0003-efivar-fix-for-cross-compile.patch \
                               "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


