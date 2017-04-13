Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C61477E8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:49 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a188so12674438pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=30+rwIux9bsXPLG93cKnv87D6uMUSbknPZGZKFVVkBw=;
	b=UtrehJeVzvLaluxV6xHdJMESksF//8HETzn0QhR/VsyXbsDwe8cfdVwlZI2I5EzJmO
	3esMBKDCYeFZdp8HkfM2z/rpJeub1V21pave9gf7CdcuGt6o7VpiHuCrTeQ6cg2rQ9gX
	O5LonPIng2OFHC50pNiinR4ENTgh8wg0z4jcQZ1AL8pr4yB1o8dzrVy9CAawgqquLVgg
	1gpp91nZCmbJhS2g7iBXg+uQ778NllPW7K2lmndn9cneHhiMJ5QfL3C0qSBcG0ozPR8L
	k3ei37IlaNH+qKutih5WyNMkilEprHwE9jSEMWaltt7nRQBWa02bZwJ13YhijbiF1Wxb
	hjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=30+rwIux9bsXPLG93cKnv87D6uMUSbknPZGZKFVVkBw=;
	b=hQ7nMyaXmk7sKUz6QDxDy6DwzrQUtGmG5pU9PLQcv1haLTLgBi8pRRLgwxc6L5AmSK
	QOgH/Rf5ZHX7/s52ULP79rFoX1rR2EDG7jw2EEQ5z7ERoP6zpxq9gqBIYZLxlVR50ztW
	NnF8SQds9HTZaB4Mb6bp88H/MD1ClWgIdg/TFZ20Zt70UnLJCbfgTE/EXT664iSLLBP9
	Pa1XGh0nuCfh7dnvFSPP/8nrkozhxuuxrusucF1iUMQ4S5+E8vel9YLXvNPCe8QOKorH
	Uq8WviGqt8jJcuTftGZMyDFDBYwf1VnwrGpxHJb/JAlzefTJPkw8YvRePqdolJGcH1ne
	GaSg==
X-Gm-Message-State: AN3rC/6cU2XeOtzzayStetFRQLYL+HCUQQ+yzzDqjyKipYqUFeJzmqOg
	CpKmuTAKi6tmgw==
X-Received: by 10.99.157.6 with SMTP id i6mr4370175pgd.87.1492116111009;
	Thu, 13 Apr 2017 13:41:51 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:59 -0700
Message-Id: <20170413204106.30679-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 22/29] cdparanoia: Fix autoconf do it builds on new arches like aarch64
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:49 -0000

Also build out of tree builds while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cdparanoia/cdparanoia_10.2.bb                  |  6 +++-
 .../files/dont-use-internal-configs.patch          | 30 ++++++++++++++++
 .../cdparanoia/files/out-of-tree-build.patch       | 42 ++++++++++++++++++++++
 3 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch

diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
index ba368a27f..e846e3a97 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${PV}.sr
            file://0001-Use-DESTDIR-in-install-Makefile-rule.patch \
            file://0002-interface-remove-C-reserved-keyword.patch \
            file://0003-Fix-missing-shared-object-LDFLAGS.patch \
+           file://dont-use-internal-configs.patch \
+           file://out-of-tree-build.patch \
 "
 SRC_URI[md5sum] = "b304bbe8ab63373924a744eac9ebc652"
 SRC_URI[sha256sum] = "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df"
@@ -24,4 +26,6 @@ S = "${WORKDIR}/cdparanoia-III-${PV}"
 # between the compilation of those two targets)
 PARALLEL_MAKE = ""
 
-inherit autotools-brokensep
+EXTRA_OECONF = "CC='${CC}' CFLAGS='${CFLAGS}'"
+
+inherit autotools
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch
new file mode 100644
index 000000000..9b268b7ed
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch
@@ -0,0 +1,30 @@
+Index: cdparanoia-III-10.2/configure.in
+===================================================================
+--- cdparanoia-III-10.2.orig/configure.in
++++ cdparanoia-III-10.2/configure.in
+@@ -1,13 +1,8 @@
+ AC_INIT(interface/interface.c)
+ 
+-cp $srcdir/configure.guess $srcdir/config.guess
+-cp $srcdir/configure.sub $srcdir/config.sub
+-
+ AC_CANONICAL_HOST
+ 
+-if test -z "$CC"; then
+-	AC_PROG_CC	
+-fi
++AC_PROG_CC
+ AC_PROG_RANLIB
+ AC_CHECK_PROG(AR,ar,ar)
+ AC_CHECK_PROG(INSTALL,install,install)
+@@ -44,8 +39,8 @@ case 4 in
+ 	$ac_cv_sizeof_long) SIZE32="long";;
+ esac
+ 
+-AC_CHECK_TYPE(int16_t,SIZE16="int16_t",,)
+-AC_CHECK_TYPE(int32_t,SIZE32="size32_t",,)
++AC_CHECK_TYPES([int16_t], [SIZE16="int16_t"], [], [[#include <stdint.h>]])
++AC_CHECK_TYPES([int32_t], [SIZE32="int32_t"], [], [[#include <stdint.h>]])
+ 
+ if test -z "$SIZE16"; then
+ 	AC_MSG_ERROR(No 16 bit type found on this platform!)
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch
new file mode 100644
index 000000000..06ee82099
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch
@@ -0,0 +1,42 @@
+Index: cdparanoia-III-10.2/Makefile.in
+===================================================================
+--- cdparanoia-III-10.2.orig/Makefile.in
++++ cdparanoia-III-10.2/Makefile.in
+@@ -6,6 +6,8 @@
+ VERSION=10.2
+ VPATH=@srcdir@
+ srcdir=@srcdir@
++top_srcdir=@top_srcdir@
++top_builddir=@top_builddir@
+ 
+ @SET_MAKE@
+ FLAGS=@TYPESIZES@ @CFLAGS@
+@@ -64,19 +66,19 @@ slib:
+ 
+ install:
+ 	$(INSTALL) -d -m 0755 $(DESTDIR)$(BINDIR)
+-	$(INSTALL) -m 755 $(srcdir)/cdparanoia $(DESTDIR)$(BINDIR)
++	$(INSTALL) -m 755 $(top_builddir)/cdparanoia $(DESTDIR)$(BINDIR)
+ 	$(INSTALL) -d -m 0755 $(DESTDIR)$(MANDIR)
+ 	$(INSTALL) -d -m 0755 $(DESTDIR)$(MANDIR)/man1
+-	$(INSTALL) -m 0644 $(srcdir)/cdparanoia.1 $(DESTDIR)$(MANDIR)/man1
++	$(INSTALL) -m 0644 $(top_srcdir)/cdparanoia.1 $(DESTDIR)$(MANDIR)/man1
+ 	$(INSTALL) -d -m 0755 $(DESTDIR)$(INCLUDEDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/paranoia/cdda_paranoia.h $(DESTDIR)$(INCLUDEDIR)
++	$(INSTALL) -m 0644 $(top_srcdir)/paranoia/cdda_paranoia.h $(DESTDIR)$(INCLUDEDIR)
+ 	$(INSTALL) -d -m 0755 $(DESTDIR)$(LIBDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/paranoia/libcdda_paranoia.so.0.$(VERSION) $(DESTDIR)$(LIBDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/paranoia/libcdda_paranoia.a $(DESTDIR)$(LIBDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/interface/cdda_interface.h $(DESTDIR)$(INCLUDEDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/interface/libcdda_interface.so.0.$(VERSION) $(DESTDIR)$(LIBDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/interface/libcdda_interface.a $(DESTDIR)$(LIBDIR)
+-	$(INSTALL) -m 0644 $(srcdir)/utils.h $(DESTDIR)$(INCLUDEDIR)
++	$(INSTALL) -m 0644 $(top_builddir)/paranoia/libcdda_paranoia.so.0.$(VERSION) $(DESTDIR)$(LIBDIR)
++	$(INSTALL) -m 0644 $(top_builddir)/paranoia/libcdda_paranoia.a $(DESTDIR)$(LIBDIR)
++	$(INSTALL) -m 0644 $(top_srcdir)/interface/cdda_interface.h $(DESTDIR)$(INCLUDEDIR)
++	$(INSTALL) -m 0644 $(top_builddir)/interface/libcdda_interface.so.0.$(VERSION) $(DESTDIR)$(LIBDIR)
++	$(INSTALL) -m 0644 $(top_builddir)/interface/libcdda_interface.a $(DESTDIR)$(LIBDIR)
++	$(INSTALL) -m 0644 $(top_srcdir)/utils.h $(DESTDIR)$(INCLUDEDIR)
+ 	ln -fs libcdda_interface.so.0.$(VERSION) \
+ 		$(DESTDIR)$(LIBDIR)/libcdda_interface.so.0
+ 	ln -fs libcdda_interface.so.0.$(VERSION) \
-- 
2.12.2


