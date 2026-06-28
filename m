Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E12BC44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:33 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14708.1782634290552706456
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sm6SF/vZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778348eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634290; x=1783239090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5oX1LH3Kdy+FFVTDFLgxrO6mqP19tAukL1CiMF+/Us=;
        b=Sm6SF/vZhkCq4yGf4x6b+acpc0HfjoqeBVT5GQEZ44FJIHoH/Caby87weU+bwo02Fq
         gTKO0Ce8OoD+CgFtY/taorSmjGQw5CDeJLE6Cexz6BTW2Sg+q5bCyMRtNibYjQDUwF20
         1WWcW1IuAu+dEDOCWQDnfOVe65B/gBNO7t4jHCtgL1dl12v3QqpmonG55mVcOSDfR3gc
         tt+KPqlyCxoh7KV+GlKMi/SO3jU60aStMXaTMWIqd9KbXSDP9SPMtjFPDZVBGCGu+N2j
         F3NQguAOumGgDzKZBL+CPJIXw8T8mZwu4YuMDsxXSoKEumF+XyqWc5X7TD1y2YmGPVuT
         VS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634290; x=1783239090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5oX1LH3Kdy+FFVTDFLgxrO6mqP19tAukL1CiMF+/Us=;
        b=BMgnHP7wXgDORX7A4IsmnA0Y317Hptl48IDIzSBMO4oHOAWJ8yl3OEtZzeajZWbPDR
         UOtzfBSsm+kL7vZj2J2S2vxZqO5nK4rFMEf2vFMIyhBjiaT+nhk9qzJSg1BXNQwoztY5
         JxsAuEhNvFxMAq8MX+yQo11YYY7H8JP8WbTcANUuR68lFGIVDxCuLkIqESeT4GujIGo7
         FhvAm7xg5ULUFTbRjLxVzGVXdwSYu6z/FN25c9ZH04BoVOcqJdI+jZN/HCsQ1BLvfg4k
         HrCrkXr85MSZv16stfwflVzh7i8akDlBX/sHCJEduUNGDKDGM2yw+oMa7XX1tl4AKRND
         5lvw==
X-Gm-Message-State: AOJu0Yy/xHLMcpaZcMGROpdQYpit1xfZrFogl7pZixytFsU2pHrEPjcV
	qwkCIwYmlzJfw01ve3AE3Z4gW/7a6CagFIG52R1/KjOm+tiVxHd5Y8g6KPqOamJijH4/uA==
X-Gm-Gg: AfdE7cmPfr6PCyOoVDZt7NAMXedJeP4WcBxjmrkGMQoiRT9XSHypCLUU6zv2NzZTjPE
	MsUWpT9mOZYsvkTZbyzFpf9aXtdWMVVUKGtoczPeci/K7vwhREnKaOoWV+VhpFD5Th4EYQ2NewW
	Q3/8/FEDEqfJ8OeR8m7SP6aYuEveNLfblm7CeVF6DFBBtsS8mnbsOoTTMT/BGR5Lvss2jOlfDqt
	KYDO48tZL+z4s5dd4YepUfj4xel/ICtYzoLGgVmiLH+UTaIJzhEtYXtOQ5/2L/8Y62NNL7Sm5fS
	z/pfuG+wiMkmQ2uN50/b5tlLfvwx35vn9e9B2Ciog8FimmyQd6FW6zLfRJ9HgEJdkjKoO5F0PaY
	ceVN0LoFEQarXTBuyHEuzzWGFE+vDYREB5P0+JXTdIxrHSYI+V43u5pq/SFdsuZB4JDwRpIttgm
	VweA/dCCMhThYQaQ4KlUudtCeAuRd4kgYAFVGgaZvCYPf8dHrJQftfLUyEbytB2IV6/rEdVg4Ky
	/DuvHa4H62rVbMCm9WlU091aEF8Tei1760dDtdmC0a644hqKWL2w6S9/wsWoiVrLeULXobbhnOD
	KAYlLk2CrqfWcdA5ZcAD2v512WW+sA==
X-Received: by 2002:a05:693c:3b05:b0:30c:ab4d:da44 with SMTP id 5a478bee46e88-30cab4ddb4fmr6829778eec.40.1782634289671;
        Sun, 28 Jun 2026 01:11:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 005/128] libxml-libxml-perl: upgrade 2.0134 -> 2.0213
Date: Sun, 28 Jun 2026 01:09:16 -0700
Message-ID: <20260628081122.178348-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127815

XML::LibXML 2.0200+ switched its build system to use Alien::Libxml2
(via Alien::Base::Wrapper) to locate libxml2. That module is not
packaged in OpenEmbedded and pulls in the whole Alien::Build stack,
which is why the recipe was previously skipped.

Add a patch that bypasses Alien and queries the target libxml2 through
pkg-config, which is already wired up to the recipe sysroot, and:

 - inherit pkgconfig and drop the now-unneeded EXTRA_CPANFLAGS.
 - drop the obsolete pre-Alien patches (the libxml2/clang compat fixes
   are upstreamed in this release and no longer apply).
 - remove SKIP_RECIPE so the recipe builds again.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...against-system-libxml2-without-Alien.patch | 42 +++++++++
 ...nction-prototypes-in-function-pointe.patch | 51 -----------
 .../disable-libxml2-check.patch               | 79 ----------------
 .../fix-CATALOG-conditional-compile.patch     | 31 -------
 .../using-DOCB-conditional.patch              | 91 -------------------
 ...2.0134.bb => libxml-libxml-perl_2.0213.bb} | 19 +---
 6 files changed, 46 insertions(+), 267 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-Makefile.PL-link-against-system-libxml2-without-Alien.patch
 delete mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch
 delete mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/disable-libxml2-check.patch
 delete mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch
 delete mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0134.bb => libxml-libxml-perl_2.0213.bb} (67%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-Makefile.PL-link-against-system-libxml2-without-Alien.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-Makefile.PL-link-against-system-libxml2-without-Alien.patch
new file mode 100644
index 0000000000..1e830d8801
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-Makefile.PL-link-against-system-libxml2-without-Alien.patch
@@ -0,0 +1,42 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 22 Jun 2026 22:00:00 -0700
+Subject: [PATCH] Makefile.PL: link against system libxml2 without Alien::Libxml2
+
+XML::LibXML 2.0200+ switched its build system to use Alien::Libxml2 (via
+Alien::Base::Wrapper) to locate libxml2. That Perl module is not packaged
+in OpenEmbedded and pulls in the whole Alien::Build stack, so instead query
+the target libxml2 directly through pkg-config, which is already wired up to
+the recipe sysroot. libxml2 is listed in DEPENDS, so it is guaranteed to be
+present at build time.
+
+Upstream-Status: Inappropriate [oe-specific cross-compile]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -17,7 +17,7 @@
+ 
+ require 5.008001;
+ 
+-use Alien::Base::Wrapper qw( Alien::Libxml2 );
++# OE: avoid Alien::Libxml2; flags for target libxml2 come from pkg-config below
+ use ExtUtils::MakeMaker;
+ use Config;
+ 
+@@ -71,7 +71,14 @@
+   DEFINE  => '-DHAVE_UTF8',
+   OBJECT  => '$(O_FILES)',
+ );
+-my %xsbuild = Alien::Base::Wrapper->mm_args;  # Might contain a definition of DEFINE, must thus concatenate.
++my %xsbuild;
++{
++  # OE cross build: locate the target libxml2 via pkg-config instead of Alien.
++  chomp(my $cflags = `pkg-config --cflags libxml-2.0`);
++  chomp(my $libs   = `pkg-config --libs libxml-2.0`);
++  die "pkg-config failed for libxml-2.0\n" if $? != 0;
++  %xsbuild = ( INC => $cflags, LIBS => "$libs -lz -lm" );
++}
+ while (my ($k, $v) = each %xsbuild_concat) {
+   my $base_val = $xsbuild{$k};
+   $xsbuild{$k} = (defined($base_val) ? ($base_val . ' ' . $v) : $v);
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch
deleted file mode 100644
index 7ff61c5709..0000000000
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 25451c0a56ef8d3b32fd23847bef516486bd8ed4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Jan 2023 18:50:10 -0800
-Subject: [PATCH] libxml-mm: Fix function prototypes in function pointers
-
-This is now detected with latest clang16+
-
-Fixes
-error: incompatible function pointer types passing 'void (void *, void *, xmlChar *)' (aka 'void (void *, void *, unsigned char *)') to parameter of type 'xmlHashScanner' (aka 'void (*)(void *, void *, const unsigned char *)') [-Wincompatible-function-pointer-types]
-                xmlHashScan(r, PmmRegistryDumpHashScanner, NULL);
-
-Upstream-Status: Submitted [https://github.com/shlomif/perl-XML-LibXML/pull/75]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- perl-libxml-mm.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/perl-libxml-mm.c b/perl-libxml-mm.c
-index a3e78a2..ec2b5ea 100644
---- a/perl-libxml-mm.c
-+++ b/perl-libxml-mm.c
-@@ -121,7 +121,7 @@ PmmFreeHashTable(xmlHashTablePtr table)
- extern SV* PROXY_NODE_REGISTRY_MUTEX;
- 
- /* Utility method used by PmmDumpRegistry */
--void PmmRegistryDumpHashScanner(void * payload, void * data, xmlChar * name)
-+void PmmRegistryDumpHashScanner(void * payload, void * data, const xmlChar * name)
- {
- 	LocalProxyNodePtr lp = (LocalProxyNodePtr) payload;
- 	ProxyNodePtr node = (ProxyNodePtr) lp->proxy;
-@@ -215,7 +215,7 @@ PmmRegisterProxyNode(ProxyNodePtr proxy)
- /* PP: originally this was static inline void, but on AIX the compiler
-    did not chew it, so I'm removing the inline */
- static void
--PmmRegistryHashDeallocator(void *payload, xmlChar *name)
-+PmmRegistryHashDeallocator(void *payload, const xmlChar *name)
- {
- 	Safefree((LocalProxyNodePtr) payload);
- }
-@@ -279,7 +279,7 @@ PmmRegistryREFCNT_dec(ProxyNodePtr proxy)
-  * internal, used by PmmCloneProxyNodes
-  */
- void *
--PmmRegistryHashCopier(void *payload, xmlChar *name)
-+PmmRegistryHashCopier(void *payload, const xmlChar *name)
- {
- 	ProxyNodePtr proxy = ((LocalProxyNodePtr) payload)->proxy;
- 	LocalProxyNodePtr lp;
--- 
-2.39.0
-
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/disable-libxml2-check.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/disable-libxml2-check.patch
deleted file mode 100644
index a8e7cc1bbc..0000000000
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/disable-libxml2-check.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Do not use the _libxml_check_lib() on cross-compile
-
-Upstream-Status: Inappropriate [configuration] 
-
-xml2 have been added into package's DEPENDS, so not need to use the
-_libxml_check_lib() to check it again, and _libxml_check_lib() always
-return false on cross-compile environment
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- Makefile.PL |   52 ++++++++++++++++++++++++++--------------------------
- 1 file changed, 26 insertions(+), 26 deletions(-)
-
-diff --git a/Makefile.PL b/Makefile.PL
-index c0485f1..09c676b 100644
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -411,32 +411,32 @@ sub _libxml_check_lib {
-     }
- }
- 
--print "Checking for ability to link against xml2...";
--if ( _libxml_check_lib('xml2') ) {
--    print "yes\n";
--}
--else {
--    print "no\n";
--    print "Checking for ability to link against libxml2...";
--    if ( _libxml_check_lib('libxml2')) {
--        print "yes\n";
--    }
--    else {
--        print STDERR <<"DEATH";
--libxml2, zlib, and/or the Math library (-lm) have not been found.
--Try setting LIBS and INC values on the command line
--Or get libxml2 from
--  http://xmlsoft.org/
--If you install via RPMs, make sure you also install the -devel
--RPMs, as this is where the headers (.h files) are.
--
--Also, you may try to run perl Makefile.PL with the DEBUG=1 parameter
--to see the exact reason why the detection of libxml2 installation
--failed or why Makefile.PL was not able to compile a test program.
--DEATH
--        exit 0; # 0 recommended by http://cpantest.grango.org (Notes for CPAN Authors)
--    }
--}
-+#print "Checking for ability to link against xml2...";
-+#if ( _libxml_check_lib('xml2') ) {
-+#    print "yes\n";
-+#}
-+#else {
-+#    print "no\n";
-+#    print "Checking for ability to link against libxml2...";
-+#    if ( _libxml_check_lib('libxml2')) {
-+#        print "yes\n";
-+#    }
-+#    else {
-+#        print STDERR <<"DEATH";
-+#libxml2, zlib, and/or the Math library (-lm) have not been found.
-+#Try setting LIBS and INC values on the command line
-+#Or get libxml2 from
-+#  http://xmlsoft.org/
-+#If you install via RPMs, make sure you also install the -devel
-+#RPMs, as this is where the headers (.h files) are.
-+#
-+#Also, you may try to run perl Makefile.PL with the DEBUG=1 parameter
-+#to see the exact reason why the detection of libxml2 installation
-+#failed or why Makefile.PL was not able to compile a test program.
-+#DEATH
-+#        exit 0; # 0 recommended by http://cpantest.grango.org (Notes for CPAN Authors)
-+#    }
-+#}
- 
- # -------------------------------------------------------------------------- #
- # _NOW_ write the Makefile
--- 
-1.7.10.4
-
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch
deleted file mode 100644
index 1dd9fb3757..0000000000
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/fix-CATALOG-conditional-compile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-[PATCH] Fix a compile error 
-
-Upstream-Status: Pending
-
-Fix a compile error by conditional using 'catal' since catal
-is only defined when LIBXML_CATALOG_ENABLED is enabled.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- LibXML.xs |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/LibXML.xs b/LibXML.xs
-index 66da04b..45da681 100644
---- a/LibXML.xs
-+++ b/LibXML.xs
-@@ -2777,9 +2777,11 @@ _default_catalog( self, catalog )
-         xmlCatalogPtr catal = INT2PTR(xmlCatalogPtr,SvIV(SvRV(catalog)));
- #endif
-     INIT:
-+#ifdef LIBXML_CATALOG_ENABLED
-         if ( catal == NULL ) {
-             croak( "empty catalog\n" );
-         }
-+#endif
-     CODE:
-         warn( "this feature is not implemented" );
-         RETVAL = 0;
--- 
-1.7.10.4
-
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch b/meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch
deleted file mode 100644
index d255ec7533..0000000000
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl/using-DOCB-conditional.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-[PATCH] Fix a compile error 
-
-Upstream-Status: Pending
-
-by conditional using 'XML_DOCB_DOCUMENT_NODE' since it is only
-defined when LIBXML_DOCB_ENABLED is enabled in xmlversion.h.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- LibXML.xs        |    9 +-
- dom.c            |    2 +
- perl-libxml-mm.c |    4 +
- 4 files changed, 678 insertions(+), 658 deletions(-)
-
-diff --git a/LibXML.xs b/LibXML.xs
-index b299ba4..66da04b 100644
---- a/LibXML.xs
-+++ b/LibXML.xs
-@@ -5026,7 +5026,9 @@ addChild( self, nNode )
-             XSRETURN_UNDEF;
-         case XML_DOCUMENT_NODE :
-         case XML_HTML_DOCUMENT_NODE :
-+#ifdef LIBXML_DOCB_ENABLED
-         case XML_DOCB_DOCUMENT_NODE :
-+#endif
-             croak("addChild: HIERARCHY_REQUEST_ERR\n");
-             XSRETURN_UNDEF;
-         case XML_NOTATION_NODE :
-@@ -5286,7 +5288,9 @@ _toStringC14N(self, comments=0, xpath=&PL_sv_undef, exclusive=0, inc_prefix_list
-         if ( nodepath == NULL
-              && self->type != XML_DOCUMENT_NODE
-              && self->type != XML_HTML_DOCUMENT_NODE
-+#ifdef LIBXML_DOCB_ENABLED
-              && self->type != XML_DOCB_DOCUMENT_NODE
-+#endif
-            ) {
-             if (comments)
- 	      nodepath = xmlStrdup( (const xmlChar *) "(. | .//node() | .//@* | .//namespace::*)" );
-@@ -5297,7 +5301,10 @@ _toStringC14N(self, comments=0, xpath=&PL_sv_undef, exclusive=0, inc_prefix_list
-         if ( nodepath != NULL ) {
-             if ( self->type == XML_DOCUMENT_NODE
-                  || self->type == XML_HTML_DOCUMENT_NODE
--                 || self->type == XML_DOCB_DOCUMENT_NODE ) {
-+#ifdef LIBXML_DOCB_ENABLED
-+                 || self->type == XML_DOCB_DOCUMENT_NODE
-+#endif
-+	    ) {
-                 refNode = xmlDocGetRootElement( self->doc );
-             }
- 	    if (SvOK(xpath_context)) {
-diff --git a/dom.c b/dom.c
-index 87eb61d..cbd391b 100644
---- a/dom.c
-+++ b/dom.c
-@@ -654,7 +654,9 @@ domName(xmlNodePtr node) {
- 
-     case XML_DOCUMENT_NODE :
-     case XML_HTML_DOCUMENT_NODE :
-+#ifdef LIBXML_DOCB_ENABLED
-     case XML_DOCB_DOCUMENT_NODE :
-+#endif
-         name = (const xmlChar *) "#document";
-         break;
- 
-diff --git a/perl-libxml-mm.c b/perl-libxml-mm.c
-index d162b06..7ac5436 100644
---- a/perl-libxml-mm.c
-+++ b/perl-libxml-mm.c
-@@ -331,7 +331,9 @@ PmmNewNode(xmlNodePtr node)
-         switch ( node->type ) {
-         case XML_DOCUMENT_NODE:
-         case XML_HTML_DOCUMENT_NODE:
-+#ifdef LIBXML_DOCB_ENABLED
-         case XML_DOCB_DOCUMENT_NODE:
-+#endif
-             proxy = (ProxyNodePtr)xmlMalloc(sizeof(struct _DocProxyNode));
-             if (proxy != NULL) {
-                 ((DocProxyNodePtr)proxy)->psvi_status = Pmm_NO_PSVI;
-@@ -550,7 +552,9 @@ PmmNodeToSv( xmlNodePtr node, ProxyNodePtr owner )
-         switch ( node->type ) {
-         case XML_DOCUMENT_NODE:
-         case XML_HTML_DOCUMENT_NODE:
-+#ifdef LIBXML_DOCB_ENABLED
-         case XML_DOCB_DOCUMENT_NODE:
-+#endif
-             if ( ((xmlDocPtr)node)->encoding != NULL ) {
-                 SetPmmENCODING(dfProxy, (int)xmlParseCharEncoding( (const char*)((xmlDocPtr)node)->encoding ));
-             }
--- 
-1.7.10.4
-
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
similarity index 67%
rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
index 935601fe84..07f589706a 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
@@ -22,23 +22,17 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
-    file://disable-libxml2-check.patch \
-    file://fix-CATALOG-conditional-compile.patch \
-    file://using-DOCB-conditional.patch \
-    file://0001-libxml-mm-Fix-function-prototypes-in-function-pointe.patch \
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-LibXML-${PV}.tar.gz;name=libxml \
+    file://0001-Makefile.PL-link-against-system-libxml2-without-Alien.patch \
 "
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1 \
     file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
 "
-SRC_URI[libxml.md5sum] = "dce687dd8b7e82d1c359fd74b1852f64"
-SRC_URI[libxml.sha256sum] = "f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f39b5d7d4f46cf"
+SRC_URI[libxml.sha256sum] = "2af21c5d61ac34ea26a5fabf15ba5a5841e648f7189db3e33b6f28b5489802ab"
 
 S = "${UNPACKDIR}/XML-LibXML-${PV}"
 
-inherit cpan ptest-perl
-
-EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2 LIBS=-L${STAGING_LIBDIR}"
+inherit cpan ptest-perl pkgconfig
 
 BBCLASSEXTEND = "native"
 
@@ -70,8 +64,3 @@ do_install_ptest() {
 	cp -r ${B}/test ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
 }
-
-# See issues:
-# https://github.com/shlomif/perl-XML-LibXML/issues/84 - libxml incompatibility
-# https://github.com/shlomif/perl-XML-LibXML/issues/91 - looking for new maintainer
-SKIP_RECIPE[libxml-libxml-perl] ?= "Not compatible with latest libxml"

