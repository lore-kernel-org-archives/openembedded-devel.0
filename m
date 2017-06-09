Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 627267827F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:40:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v596ec2Y017993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:40:38 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:40:37 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:40:31 +0800
Message-ID: <c60989ac852737f86aa0ad3230496cd4384e86f4.1496990155.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496990155.git.jackie.huang@windriver.com>
References: <cover.1496990155.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] enscript: add new recipe
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
X-List-Received-Date: Fri, 09 Jun 2017 06:40:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

enscript is a plain ASCII to PostScript converter.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../enscript/enscript/enscript-autoconf.patch      | 118 +++++++++++++++++++++
 .../recipes-extended/enscript/enscript_1.6.6.bb    |  22 ++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta-oe/recipes-extended/enscript/enscript/enscript-autoconf.patch
 create mode 100644 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb

diff --git a/meta-oe/recipes-extended/enscript/enscript/enscript-autoconf.patch b/meta-oe/recipes-extended/enscript/enscript/enscript-autoconf.patch
new file mode 100644
index 000000000..d3bb5c03a
--- /dev/null
+++ b/meta-oe/recipes-extended/enscript/enscript/enscript-autoconf.patch
@@ -0,0 +1,118 @@
+autoconf no longer supports AM_C_PROTOTYPES
+
+| configure.ac:14: error: automatic de-ANSI-fication support has been removed
+| /bitbake_build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12/protos.m4:10: AM_C_PROTOTYPES is expanded from...
+
+Upstream-Status: Pending
+
+Author: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Index: enscript-1.6.6/configure.ac
+===================================================================
+--- enscript-1.6.6.orig/configure.ac
++++ enscript-1.6.6/configure.ac
+@@ -11,7 +11,6 @@ AC_PROG_INSTALL
+ AC_PROG_CC
+ 
+ AC_USE_SYSTEM_EXTENSIONS
+-AM_C_PROTOTYPES
+ 
+ AC_C_CONST
+ AC_FUNC_ALLOCA
+Index: enscript-1.6.6/afmlib/afm.h
+===================================================================
+--- enscript-1.6.6.orig/afmlib/afm.h
++++ enscript-1.6.6/afmlib/afm.h
+@@ -24,11 +24,7 @@
+ #define AFM_H
+ 
+ #ifndef ___P
+-#if PROTOTYPES
+ #define ___P(protos) protos
+-#else /* no PROTOTYPES */
+-#define ___P(protos) ()
+-#endif /* no PROTOTYPES */
+ #endif
+ 
+ /**********************************************************************
+Index: enscript-1.6.6/afmlib/afmint.h
+===================================================================
+--- enscript-1.6.6.orig/afmlib/afmint.h
++++ enscript-1.6.6/afmlib/afmint.h
+@@ -34,11 +34,7 @@
+ #include <stdio.h>
+ 
+ #ifndef ___P
+-#if PROTOTYPES
+ #define ___P(protos) protos
+-#else /* no PROTOTYPES */
+-#define ___P(protos) ()
+-#endif /* no PROTOTYPES */
+ #endif
+ 
+ #if STDC_HEADERS
+Index: enscript-1.6.6/afmlib/strhash.h
+===================================================================
+--- enscript-1.6.6.orig/afmlib/strhash.h
++++ enscript-1.6.6/afmlib/strhash.h
+@@ -24,11 +24,7 @@
+ #define STRHASH_H
+ 
+ #ifndef ___P
+-#if PROTOTYPES
+ #define ___P(protos) protos
+-#else /* no PROTOTYPES */
+-#define ___P(protos) ()
+-#endif /* no PROTOTYPES */
+ #endif
+ 
+ typedef struct stringhash_st *StringHashPtr;
+Index: enscript-1.6.6/compat/xalloc.h
+===================================================================
+--- enscript-1.6.6.orig/compat/xalloc.h
++++ enscript-1.6.6/compat/xalloc.h
+@@ -28,11 +28,7 @@
+ #define XALLOC_H
+ 
+ #ifndef ___P
+-#if PROTOTYPES
+ #define ___P(protos) protos
+-#else /* no PROTOTYPES */
+-#define ___P(protos) ()
+-#endif /* no PROTOTYPES */
+ #endif
+ 
+ void *xmalloc ___P ((size_t size));
+Index: enscript-1.6.6/src/gsint.h
+===================================================================
+--- enscript-1.6.6.orig/src/gsint.h
++++ enscript-1.6.6/src/gsint.h
+@@ -39,11 +39,7 @@
+ #include <sys/stat.h>
+ 
+ #ifndef ___P
+-#if PROTOTYPES
+ #define ___P(protos) protos
+-#else /* no PROTOTYPES */
+-#define ___P(protos) ()
+-#endif /* no PROTOTYPES */
+ #endif
+ 
+ #if STDC_HEADERS
+Index: enscript-1.6.6/states/defs.h
+===================================================================
+--- enscript-1.6.6.orig/states/defs.h
++++ enscript-1.6.6/states/defs.h
+@@ -37,11 +37,7 @@
+ #include <ctype.h>
+ 
+ #ifndef ___P
+-#if PROTOTYPES
+ #define ___P(protos) protos
+-#else /* no PROTOTYPES */
+-#define ___P(protos) ()
+-#endif /* no PROTOTYPES */
+ #endif
+ 
+ #if STDC_HEADERS
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
new file mode 100644
index 000000000..96129880a
--- /dev/null
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A plain ASCII to PostScript converter"
+DESCRIPTION = "GNU enscript is a free replacement for Adobe''s Enscript \
+program. Enscript converts ASCII files to PostScript(TM) and spools generated \
+PostScript output to the specified printer or saves it to a file. Enscript can \
+be extended to handle different output media and includes many options for \
+customizing printouts."
+HOMEPAGE = "http://www.gnu.org/software/enscript/"
+SECTION = "console/utils"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://enscript-autoconf.patch \
+"
+
+inherit autotools gettext
+
+SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
+SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
+
+RDEPENDS_${PN} = "perl"
-- 
2.11.0


