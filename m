Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D77665CA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:08:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA788IAk007364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:08:18 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 00:08:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 16:08:08 +0800
Message-ID: <2dcb6ebbb369cc662795d0b74d8a197433aadc88.1415347548.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415347548.git.hongxu.jia@windriver.com>
References: <cover.1415347548.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ssmping: add do_install to ssmping
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
X-List-Received-Date: Fri, 07 Nov 2014 08:08:18 -0000
Content-Type: text/plain

The previous do_install is empty and do nothing.

Tweak install doc dir, so the man doc could be installed to /usr/share/man
rather than /usr/locale/man.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-Makefile-tweak-install-dir.patch    | 35 ++++++++++++++++++++++
 .../recipes-support/ssmping/ssmping_0.9.1.bb       |  8 ++++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch

diff --git a/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch b/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch
new file mode 100644
index 0000000..0cb981c
--- /dev/null
+++ b/meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch
@@ -0,0 +1,35 @@
+From 693cfce5431e191a3955fd56fa822927d92c9e43 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 7 Nov 2014 14:27:00 +0800
+Subject: [PATCH] Makefile: tweak install dir
+
+For oe-core, the man doc should be installed to /usr/share/man
+rather than /usr/locale/man.
+
+Upstream-Status: inappropriate (oe specific)
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b5d12f8..9b2663c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,9 +14,9 @@ install: ssmping asmping ssmpingd mcfirst
+ 	install -D asmping $(DESTDIR)$(PREFIX)/bin/asmping
+ 	install -D ssmpingd $(DESTDIR)$(PREFIX)/bin/ssmpingd
+ 	install -D mcfirst $(DESTDIR)$(PREFIX)/bin/mcfirst
+-	install -D ssmping.1 $(DESTDIR)$(PREFIX)/man/man1/ssmping.1
+-	install -D asmping.1 $(DESTDIR)$(PREFIX)/man/man1/asmping.1
+-	install -D mcfirst.1 $(DESTDIR)$(PREFIX)/man/man1/mcfirst.1
++	install -D ssmping.1 $(DESTDIR)$(PREFIX)/share/man/man1/ssmping.1
++	install -D asmping.1 $(DESTDIR)$(PREFIX)/share/man/man1/asmping.1
++	install -D mcfirst.1 $(DESTDIR)$(PREFIX)/share/man/man1/mcfirst.1
+ 
+ clean:
+ 	rm -f $(OBJ) joinch.o joingrp.o ssmping asmping ssmpingd mcfirst
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
index 06d6d28..0eaa7ca 100644
--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -3,8 +3,14 @@ HOMEPAGE = "http://www.venaas.no/multicast/ssmping/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
 
-SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz"
+SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz \
+           file://0001-Makefile-tweak-install-dir.patch \
+"
 SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
 SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
 
 CFLAGS += "-D_GNU_SOURCE "
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
+}
-- 
1.9.1


