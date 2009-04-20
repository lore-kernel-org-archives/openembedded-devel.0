Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR2-0006hH-RV
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:28 +0200
Received: (qmail 21738 invoked by uid 813007); 20 Apr 2009 15:25:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:09 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:25:03 +0200
Message-Id: <1240241104-21935-11-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH 1/1] irda-utils: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Jeremy Lainé <jeremy.laine@m4x.org>

---
 recipes/irda-utils/irda-utils/ldflags.patch |   28 +++++++++++++++++++++++++++
 recipes/irda-utils/irda-utils_0.9.16.bb     |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/irda-utils/irda-utils/ldflags.patch

diff --git a/recipes/irda-utils/irda-utils/ldflags.patch b/recipes/irda-utils/irda-utils/ldflags.patch
new file mode 100644
index 0000000..bb4f5cd
--- /dev/null
+++ b/recipes/irda-utils/irda-utils/ldflags.patch
@@ -0,0 +1,28 @@
+diff -urN irda-utils-0.9.16.orig/irattach/Makefile irda-utils-0.9.16/irattach/Makefile
+--- irda-utils-0.9.16.orig/irattach/Makefile	2004-03-31 23:55:41.000000000 +0200
++++ irda-utils-0.9.16/irattach/Makefile	2009-04-08 10:17:39.000000000 +0200
+@@ -53,10 +53,10 @@
+ all: $(TARGETS)
+ 
+ irattach: irattach.o util.o
+-	$(CC) $(CFLAGS) irattach.o util.o -o $@
++	$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
+ 
+ dongle_attach: dongle_attach.o
+-	$(CC) $(CFLAGS) dongle_attach.o -o $@
++	$(CC) $(CFLAGS) $(LDFLAGS) dongle_attach.o -o $@
+ 
+ .c.o:
+ 	$(CC) $(CFLAGS) $(INCLUDES) -c $<
+diff -urN irda-utils-0.9.16.orig/irdaping/Makefile irda-utils-0.9.16/irdaping/Makefile
+--- irda-utils-0.9.16.orig/irdaping/Makefile	2004-03-31 23:55:47.000000000 +0200
++++ irda-utils-0.9.16/irdaping/Makefile	2009-04-08 10:17:57.000000000 +0200
+@@ -52,7 +52,7 @@
+ all:: irdaping
+ 
+ irdaping: $(OBJS)
+-	$(CC) $(CFLAGS) $(OBJS) -o $@
++	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
+ 
+ .c.o:
+ 	$(CC) $(CFLAGS) $(INCLUDES) -c $<
diff --git a/recipes/irda-utils/irda-utils_0.9.16.bb b/recipes/irda-utils/irda-utils_0.9.16.bb
index 19bcdf3..1d9d184 100644
--- a/recipes/irda-utils/irda-utils_0.9.16.bb
+++ b/recipes/irda-utils/irda-utils_0.9.16.bb
@@ -3,11 +3,12 @@ IrDA allows communication over Infrared with other devices \
 such as phones and laptops."
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
 	   file://configure.patch;patch=1 \
 	   file://m4.patch;patch=1 \
+	   file://ldflags.patch;patch=1 \
 	   file://init"
 
 export SYS_INCLUDES="-I${STAGING_INCDIR}"
-- 
1.6.2.3





