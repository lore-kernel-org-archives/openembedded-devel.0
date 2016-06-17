Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B9788731AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:53:41 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u5HDreWQ006414
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 15:53:40 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u5HDre0e025070;
	Fri, 17 Jun 2016 15:53:40 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:53:31 +0200
Message-Id: <1466171611-29613-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] p7zip: update to version 15.14.1
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
X-List-Received-Date: Fri, 17 Jun 2016 13:53:42 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...do_not_override_compiler_and_do_not_strip.patch | 25 +++++++++++-----------
 .../p7zip/{p7zip_9.20.1.bb => p7zip_15.14.1.bb}    |  9 ++++----
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-extended/p7zip/{p7zip_9.20.1.bb => p7zip_15.14.1.bb} (71%)

diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
index a3b02c5..b0a560f 100644
--- a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
+++ b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
@@ -7,25 +7,24 @@ Upstream-Status: Pending
 Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
 Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
 
-Index: p7zip_9.20.1/makefile.machine
-=====================================================================
---- p7zip_9.20.1/makefile.machine	2011-03-13 12:54:57.000000000 +0100
-+++ p7zip_9.20.1/makefile.machine	2015-02-03 08:39:44.427696944 +0100
-@@ -4,14 +4,14 @@
+diff -Nurp p7zip_15.14.1_orig/makefile.machine p7zip_15.14.1/makefile.machine
+--- p7zip_15.14.1_orig/makefile.machine	2016-03-23 20:37:47.000000000 +0100
++++ p7zip_15.14.1/makefile.machine	2016-06-17 15:33:39.720454477 +0200
+@@ -2,7 +2,7 @@
+ # makefile for Linux (x86, PPC, alpha ...)
+ #
  
- OPTFLAGS=-O
+-OPTFLAGS=-O -s
++OPTFLAGS=-O
  
--ALLFLAGS=${OPTFLAGS} -pipe -s \
-+ALLFLAGS=${OPTFLAGS} -pipe \
+ ALLFLAGS=${OPTFLAGS} -pipe \
      	-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
- 	-DNDEBUG -D_REENTRANT -DENV_UNIX \
+@@ -10,8 +10,6 @@ ALLFLAGS=${OPTFLAGS} -pipe \
  	-D_7ZIP_LARGE_PAGES \
  	$(LOCAL_FLAGS)
  
--CXX=g++ $(ALLFLAGS)
--CC=gcc $(ALLFLAGS)
-+CXX+=$(ALLFLAGS)
-+CC+=$(ALLFLAGS)
+-CXX=g++
+-CC=gcc
  CC_SHARED=-fPIC
  LINK_SHARED=-fPIC -shared
  
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
similarity index 71%
rename from meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
rename to meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
index b89fc42..8e2e241 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
@@ -1,13 +1,14 @@
 SUMMARY = "7-zip is a commandline utility handling 7z archives."
 HOMEPAGE = "http://www.7-zip.org/"
 LICENSE = "LGPL-2.1+ & unRAR"
-LIC_FILES_CHKSUM = "file://DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a \
-                    file://DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de"
+LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
+                    file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
+                    file://DOC/License.txt;md5=8346bfd0a2fa0987e7a3a512adf84ab9"
 
 SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
           file://do_not_override_compiler_and_do_not_strip.patch"
-SRC_URI[md5sum] = "bd6caaea567dc0d995c990c5cc883c89"
-SRC_URI[sha256sum] = "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"
+SRC_URI[md5sum] = "92cca093312b5a71a7be7dc7d1d32509"
+SRC_URI[sha256sum] = "699db4da3621904113e040703220abb1148dfef477b55305e2f14a4f1f8f25d4"
 
 S = "${WORKDIR}/${BPN}_${PV}"
 
-- 
2.1.4


