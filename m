Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4758D6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 22:58:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 15:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,376,1491289200"; d="scan'208";a="1172465018"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 15:58:54 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 15:58:28 -0700
Message-Id: <20170521225828.25908-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [meta-java][master][pyro][PATCH] inetlib: cleanup and fix RSS regression
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
X-List-Received-Date: Sun, 21 May 2017 22:58:58 -0000

- Add SUMMARY and expand DESCRIPTION
- Move SRC_URI checksums to recommended location in recipe
- Drop PR, no longer required
- Add virtual/javac-native and classpath-initial-native
  to DEPENDS for RSS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-core/classpathx/inetlib_1.1.1.bb | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/recipes-core/classpathx/inetlib_1.1.1.bb b/recipes-core/classpathx/inetlib_1.1.1.bb
index e42a650..9146c9e 100644
--- a/recipes-core/classpathx/inetlib_1.1.1.bb
+++ b/recipes-core/classpathx/inetlib_1.1.1.bb
@@ -1,15 +1,24 @@
-DESCRIPTION = "A Java library of clients for common internet protocols"
+SUMMARY = "A Java library of clients for common internet protocols"
+DESCRIPTION = "GNU Classpath inetlib is an extension library to provide \
+extra network protocol support for GNU Classpath and ClasspathX project, \
+but it can also used standalone to add http, imap, pop3 and smtp client \
+support applications. \
+"
 AUTHOR = "GNU Classpath"
 HOMEPAGE = "http://gnu.org/software/classpath/inetlib.html"
 LICENSE = "GPL-2.0-with-GCC-exception"
-PR = "r1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://ftp.gnu.org/gnu/classpath/${BP}.tar.gz \
            file://datadir_java.patch \
            file://inetlib-missing-dependency-for-util_classes.patch \
           "
+SRC_URI[md5sum] = "aaa24be4bc8d172ac675be8bdfa636ee"
+SRC_URI[sha256sum] = "1b078a39e022f86e4e2c8189b4d2789a5da414e8f1cb285587b7800b950a44de"
 
+DEPENDS = "classpath-initial-native \
+           virtual/javac-native \
+"
 inherit java-library autotools
 
 JPN = "libgnuinet-java"
@@ -25,8 +34,4 @@ do_compile() {
   oe_runmake JARDIR=${datadir_java} inetlib_jar=${JARFILENAME}
 }
 
-SRC_URI[md5sum] = "aaa24be4bc8d172ac675be8bdfa636ee"
-SRC_URI[sha256sum] = "1b078a39e022f86e4e2c8189b4d2789a5da414e8f1cb285587b7800b950a44de"
-
 BBCLASSEXTEND = "native"
-
-- 
2.9.4


