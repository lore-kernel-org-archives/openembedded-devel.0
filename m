Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1RIrPM-0001C5-3P
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Oct 2011 02:31:52 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9Q0Ppfb023851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2011 19:25:51 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9Q0PpJn025227
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2011 19:25:51 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9Q0PpKG014390
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2011 19:25:51 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 25 Oct 2011 19:25:50 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9Q0PmK4022330;	Tue, 25 Oct 2011 19:25:49 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Oct 2011 19:09:39 -0500
Message-ID: <1319587780-10897-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH meta-oe] memtester: Corrected recipe following review comments and guidelines
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 00:31:52 -0000
Content-Type: text/plain

This is an import of memtester from OE classic,
commit ID: 5671855bfba71575e4919c4b5fc9c5dcb8052612

Fixes to recipe:
* Added patch header to Makefile.patch
* Corrected order of variables and added HOMEPAGE to recipe
* Removed the line, S = "${WORKDIR}/memtester-${PV}" as its the default
* Removed new-line at end of recipe

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../memtester/files/Makefile.patch                 |   23 +++++++++++++++----
 .../recipes-benchmark/memtester/memtester_4.1.3.bb |    6 +---
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-benchmark/memtester/files/Makefile.patch b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
index 57a0464..971e52a 100644
--- a/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
+++ b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
@@ -1,8 +1,18 @@
-Index: memtester-4.0.5/Makefile
-===================================================================
---- memtester-4.0.5.orig/Makefile	2005-03-14 06:02:30.000000000 -0800
-+++ memtester-4.0.5/Makefile	2006-07-08 23:53:42.000000000 -0700
-@@ -24,8 +24,8 @@
+From 9a950b14b9f7767d83e5faac2e1e8203c500e2c2 Mon Sep 17 00:00:00 2001
+From: Rod Whitby <rod@whitby.id.au>
+Date: Tue, 25 Oct 2011 18:43:50 -0500
+Subject: [PATCH] memtester: Added patch to Makefile to change no-longer-supported 'head -1' syntax to 'head -n 1'.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a271bf5..6bccff3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,8 +32,8 @@ install: all
  auto-ccld.sh: \
  conf-cc conf-ld warn-auto.sh
  	( cat warn-auto.sh; \
@@ -13,3 +23,6 @@ Index: memtester-4.0.5/Makefile
  	) > auto-ccld.sh
  
  compile: \
+-- 
+1.7.0.4
+
diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
index 9f4e53e..f220553 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
@@ -1,5 +1,6 @@
-SECTION = "console/utils"
 DESCRIPTION = "Utility to test for faulty memory subsystem"
+HOMEPAGE = "http://pyropus.ca/software/memtester/"
+SECTION = "console/utils"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
@@ -10,8 +11,6 @@ SRC_URI += "file://Makefile.patch"
 SRC_URI[md5sum] = "e562451620cf5343016950462bc0dc38"
 SRC_URI[sha256sum] = "ac56f0b6d6d6e58bcf2a3fa7f2c9b29894f5177871f21115a1906c535106acf6"
 
-S = "${WORKDIR}/memtester-${PV}"
-
 do_compile () {
 	echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
 	echo '${CC} ${LDFLAGS}' > conf-ld
@@ -24,4 +23,3 @@ do_install () {
 	install -m 0755 memtester ${D}${bindir}/
 	install -m 0755 memtester.8 ${D}${mandir}/man8/
 }
-
-- 
1.7.0.4



