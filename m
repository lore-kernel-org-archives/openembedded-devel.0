Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1Oz4V7-00020H-9T
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:23:46 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8137D491282
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:23:24 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 24 Sep 2010 11:23:24 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 2FFA12A1C2; Fri, 24 Sep 2010 11:23:24 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 11:23:11 +0200
Message-Id: <1285320191-22618-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4C9C696B.4050800@dresearch.de>
References: <4C9C696B.4050800@dresearch.de>
X-OriginalArrivalTime: 24 Sep 2010 09:23:24.0275 (UTC)
	FILETIME=[233A8430:01CB5BCA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libatasmart-0.13: resolve cross compile problem
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
X-List-Received-Date: Fri, 24 Sep 2010 09:24:00 -0000

* This patch solves a cross/native compile problem:
| ./strpool atasmart.c atasmart.strpool.c
| ./strpool: ./strpool: cannot execute binary file

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/devicekit/libatasmart-0.13/strpool.patch |   11 +++++++++++
 recipes/devicekit/libatasmart_0.13.bb            |   12 +++---------
 2 files changed, 14 insertions(+), 9 deletions(-)
 create mode 100644 recipes/devicekit/libatasmart-0.13/strpool.patch

diff --git a/recipes/devicekit/libatasmart-0.13/strpool.patch b/recipes/devicekit/libatasmart-0.13/strpool.patch
new file mode 100644
index 0000000..e9f6ab3
--- /dev/null
+++ b/recipes/devicekit/libatasmart-0.13/strpool.patch
@@ -0,0 +1,11 @@
+--- git/Makefile.am.orig	2010-09-24 11:03:40.917602895 +0200
++++ git/Makefile.am	2010-09-24 11:07:04.145852660 +0200
+@@ -81,5 +81,8 @@
+ BUILT_SOURCES = \
+ 	atasmart.strpool.c
+ 
++strpool: $(strpool_SOURCES)
++	$(BUILD_CC) -o $@ $?
++
+ atasmart.strpool.c: atasmart.c strpool
+ 	$(top_builddir)/strpool $< $@
diff --git a/recipes/devicekit/libatasmart_0.13.bb b/recipes/devicekit/libatasmart_0.13.bb
index 992ff3e..4a4986e 100644
--- a/recipes/devicekit/libatasmart_0.13.bb
+++ b/recipes/devicekit/libatasmart_0.13.bb
@@ -2,20 +2,14 @@ DEPENDS = "udev"
 LICENSE = "LGPL"
 
 SRCREV = "a80d7d5c25e88adea7b8e843cdb57143e6cfb46b"
-SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git"
+SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git \
+	file://strpool.patch"
 
 S = "${WORKDIR}/git"
-PR = "r1"
+PR = "r2"
 
 inherit autotools lib_package
 
-do_compile_prepend() {
-	rm strpool -f
-	${BUILD_CC} -o strpool strpool.c
-	chmod +x strpool
-}
-
 do_install_append() {
 	sed -i -e s://:/:g -e s:${base_libdir}/libudev.la:-ludev:g ${D}${libdir}/libatasmart.la
 }
-
-- 
1.7.1



