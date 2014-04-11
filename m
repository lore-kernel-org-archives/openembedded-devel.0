Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6BBE65EAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 07:37:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3B7b7hT010808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 00:37:07 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Apr 2014 00:37:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Apr 2014 15:37:57 +0800
Message-ID: <1397201877-5932-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] liblockfile: set default mailgroup and install libnfslock
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
X-List-Received-Date: Fri, 11 Apr 2014 07:37:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Set the default mailgroup to 'mail' or it will use 'root'.
* Set --with-libnfslock so it builds and install libnfslock.
* The patch is to fix nfslib build failure and add missing soname lib.
* No need to override the do_install, set EXTRA_OEMAKE instead.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../liblockfile-fix-nfslib-and-soname.patch        |   54 ++++++++++++++++++++
 .../liblockfile/liblockfile_1.09.bb                |   15 ++++--
 2 files changed, 65 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch
new file mode 100644
index 0000000..ffd7a40
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Inappropriate [no upstream]
+
+* nfslib should use NVER instead of VER
+* install the missing soname library
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.in         |    9 ++++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 836ca9b..a589fb8 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -27,7 +27,7 @@ install:	@INSTALL_TARGETS@
+ 
+ static:		liblockfile.a dotlockfile
+ shared:		liblockfile.so dotlockfile
+-nfslib:		nfslock.so.$(VER)
++nfslib:		nfslock.so.$(NVER)
+ 
+ liblockfile.a:	lockfile.o
+ 		$(AR) rv liblockfile.a lockfile.o
+@@ -36,7 +36,7 @@ liblockfile.so: liblockfile.a
+ 		$(CC) -fPIC -shared -Wl,-soname,liblockfile.so.1 \
+ 			-o liblockfile.so lockfile.o $(LDFLAGS) -lc
+ 
+-nfslock.so.$(VER):	nfslock.o
++nfslock.so.$(NVER):	nfslock.o
+ 		$(CC) -fPIC -shared -Wl,-soname,nfslock.so.0 \
+ 			-o nfslock.so.$(NVER) nfslock.o $(LDFLAGS)
+ 
+@@ -59,6 +59,7 @@ install_shared:	shared install_common
+ 		install -m 755 liblockfile.so \
+ 			$(ROOT)$(libdir)/liblockfile.so.$(VER)
+ 		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so
++		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so.1
+ 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
+ 
+ install_common:
+@@ -72,7 +73,9 @@ install_common:
+ 
+ install_nfslib:	nfslib
+ 		install -d $(ROOT)$(nfslockdir)
+-		install -m 755 nfslock.so.$(VER) $(ROOT)$(nfslockdir)
++		install -m 755 nfslock.so.$(NVER) $(ROOT)$(nfslockdir)
++		ln -sf nfslock.so.$(NVER) $(ROOT)$(libdir)/nfslock.so
++		ln -sf nfslock.so.$(NVER) $(ROOT)$(libdir)/nfslock.so.0
+ 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
+ 
+ clean:
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index 3ef52cf..fa68fd0 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -7,6 +7,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \
     file://install.patch \
     file://configure.patch \
     file://ldflags.patch \
+    file://liblockfile-fix-nfslib-and-soname.patch \
 "
 
 SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8"
@@ -14,9 +15,15 @@ SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a069
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-shared --enable-static"
+# set default mailgroup to mail
+# --with-libnfslock specify where to install nfslock.so.NVER
+EXTRA_OECONF = "--enable-shared --enable-static \
+                --with-mailgroup=mail \
+                --with-libnfslock=${libdir} \
+"
 
-do_install () {
-    oe_runmake 'ROOT=${D}' INSTGRP='' install
-}
+# Makefile using ROOT not DESTDIR
+EXTRA_OEMAKE += "ROOT=${D}"
 
+FILES_${PN} += "${libdir}/nfslock.so.*"
+FILES_${PN}-dev += "${libdir}/nfslock.so"
-- 
1.7.9.5


