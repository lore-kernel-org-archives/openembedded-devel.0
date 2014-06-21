Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 10403660F6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:21 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so4813065wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yH+ATfaTvxhpg1PDJIXGKlTg5Vqc6PMUmuiPnsaKi+g=;
	b=ppRj5wS3AfONvf3xQGYJ8tHHvx4nykuE4Gd4U3Pcwpj4oDXx2PFUVKYCF4STF0ZY4w
	rOi9RTTiIBSQicpZ4gPrEDyt/5wQ9XT3RrgFdB7xBTJph9hE3jXksTDg8URZQmLpGrvk
	jjqVnGsFMDi7K9Sh8xP0oP1rrr3ar74no9dR6sDoSSdVhMWbQ2xc2H9PaXfpHqolSCDK
	5vUMir32BwsweQEiP6V8Vl6m7NntakPvGENTFZPue0//PlIrsIH3zG6ekw8QRBcS87do
	Mcg8Uu841pXUsSpzpwmg/j2thBSleme5rflO879ZIrD1IR3PtMlHFXFNSs6/el15sSGF
	vSKQ==
X-Received: by 10.180.103.228 with SMTP id fz4mr10091513wib.4.1403342362255;
	Sat, 21 Jun 2014 02:19:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hs8sm12436552wib.10.2014.06.21.02.19.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:09 +0200
Message-Id: <1403342349-11180-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 12/12] talloc: fix build with B!=S
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/talloc/talloc/sepbuild.patch   | 27 ++++++++++++++++++++++
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |  7 ++----
 2 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/talloc/talloc/sepbuild.patch

diff --git a/meta-oe/recipes-support/talloc/talloc/sepbuild.patch b/meta-oe/recipes-support/talloc/talloc/sepbuild.patch
new file mode 100644
index 0000000..05506c3
--- /dev/null
+++ b/meta-oe/recipes-support/talloc/talloc/sepbuild.patch
@@ -0,0 +1,27 @@
+Index: talloc-2.0.1/Makefile.in
+===================================================================
+--- talloc-2.0.1.orig/Makefile.in
++++ talloc-2.0.1/Makefile.in
+@@ -33,8 +33,8 @@ EXPORTSFILE = @EXPORTSFILE@
+ 
+ all:: showflags $(EXTRA_TARGETS)
+ 
+-include $(tallocdir)/rules.mk
+-include $(tallocdir)/talloc.mk
++include $(srcdir)/$(tallocdir)/rules.mk
++include $(srcdir)/$(tallocdir)/talloc.mk
+ 
+ @TALLOC_COMPAT1_MK@
+ 
+Index: talloc-2.0.1/libtalloc.m4
+===================================================================
+--- talloc-2.0.1.orig/libtalloc.m4
++++ talloc-2.0.1/libtalloc.m4
+@@ -33,6 +33,6 @@ if test $ac_cv_sizeof_size_t -lt $ac_cv_
+ fi
+ 
+ if test x"$VERSIONSCRIPT" != "x"; then
+-    EXPORTSFILE=talloc.exports
++    EXPORTSFILE=$srcdir/$tallocdir/talloc.exports
+     AC_SUBST(EXPORTSFILE)
+ fi
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 6b7e4f1..62bda71 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -7,6 +7,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
            file://install-swig-interface-in-SWINGLIBDIR.patch \
+           file://sepbuild.patch \
 "
 SRC_URI[md5sum] = "c6e736540145ca58cb3dcb42f91cf57b"
 SRC_URI[sha256sum] = "5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd27c9b4"
@@ -15,11 +16,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 PR = "r2"
 
-# autoreconf doesn't work well while reconfiguring included libreplace
-do_configure () {
-    gnu-configize
-    oe_runconf
-}
+EXTRA_AUTORECONF = "--exclude=autopoint --exclude=aclocal"
 
 do_install_prepend() {
     # Hack the way swig interface for talloc is installed
-- 
2.0.0


