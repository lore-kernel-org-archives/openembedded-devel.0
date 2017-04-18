Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 98C8271C84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a188so134685pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=30+rwIux9bsXPLG93cKnv87D6uMUSbknPZGZKFVVkBw=;
	b=XEte8HyluhrMFFmkC2lm5teyKx5S0fQvCL2Ln9zfhwumO3MleEd7QaPKn8o07bsAZh
	7S8aBMQTEfk1w773FzMcl/mNZ5yzWgYrL7Ul6BXJ0OlcO7oEHIHVZOaQEwYzd4mGJ66E
	f0BxaHad4yUdbFymjqYTk6VJvXHssPKQxhYQxeaT6vYVp01eWVlQzna6D3MAFW33O61F
	OyzCMkkp5WReD3CPvl2axHblBHZitc95VqhoH573Yga/8kvxpWYg7f6NQR2ctpKPo3Kh
	VArFNwboaODvA8HupoSASzj0KlA8RPfZeJT0MiwySkrpl7obBiFBaxa+lWXZDp3dm1re
	PZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=30+rwIux9bsXPLG93cKnv87D6uMUSbknPZGZKFVVkBw=;
	b=aG+3SPA2YH7KK7dsTmGyR4EquKu7juxHka2HTIuuLxMig2vNw0GWbM49hJcBt3lJJ7
	LIj92lgLFhKZkBvoDP70O9ZGE8Z4+OjqOeJ3Qg99aZO3EE6giYgmwI5j2ajrWee8RytP
	GfvQEj0JJpkTSajEDJQLO2GWbV4FuWzZZtUzrzYYVWS+/lIHFqP2AceJ4ns2YQ1LcgmT
	6hJBmiQvYByUKKc3N13b3HiUavd8bO1qcoPgy9K021hFFTm+Q7VGoYhA5dmNs3MI+0xm
	hVfF/qVL0I+Td8rs6O1jV9CZpD/CLGklzVhs8iJ/3eqDK70SQ0TxNrdw5XNvRs903/nq
	8VCg==
X-Gm-Message-State: AN3rC/4hfwtiOPl0sP9fTqZeRwR3iAB6XFIzEDRqbpoyHHYEEloV6Dag
	COzLyXBhQpf8B7PE
X-Received: by 10.84.222.129 with SMTP id x1mr25319686pls.44.1492539748774;
	Tue, 18 Apr 2017 11:22:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:33 -0700
Message-Id: <20170418182142.27253-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-multimedia][ 23/32] cdparanoia: Fix autoconf do it builds on new arches like aarch64
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:27 -0000

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


