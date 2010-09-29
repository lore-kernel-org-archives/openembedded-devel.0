Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13VE-0001m1-VX
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id AB4753148E25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jFLFcGXTX1qj; Wed, 29 Sep 2010 22:36:59 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8BA9D3148E18;
	Wed, 29 Sep 2010 22:36:58 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:36:58 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:19 +0000
Message-Id: <1285792594-10032-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/18] libmad-0.15.1b: fix compile with gcc-4.4 (mipsel)
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:53 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libmad/files/mips-fix-gcc-4.4.0.patch |   38 +++++++++++++++++++++++++
 recipes/libmad/libmad_0.15.1b.bb              |    3 +-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 recipes/libmad/files/mips-fix-gcc-4.4.0.patch

diff --git a/recipes/libmad/files/mips-fix-gcc-4.4.0.patch b/recipes/libmad/files/mips-fix-gcc-4.4.0.patch
new file mode 100644
index 0000000..9438392
--- /dev/null
+++ b/recipes/libmad/files/mips-fix-gcc-4.4.0.patch
@@ -0,0 +1,38 @@
+diff -Naur libmad-0.15.1b.orig/fixed.h libmad-0.15.1b/fixed.h
+--- libmad-0.15.1b.orig/fixed.h	2004-02-17 03:02:03.000000000 +0100
++++ libmad-0.15.1b/fixed.h	2009-07-11 16:42:48.000000000 +0200
+@@ -22,6 +22,14 @@
+ # ifndef LIBMAD_FIXED_H
+ # define LIBMAD_FIXED_H
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __MAD_GNUC_PREREQ(maj, min) \
++  ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __MAD_GNUC_PREREQ(maj, min)  0
++#endif
++
+ # if SIZEOF_INT >= 4
+ typedef   signed int mad_fixed_t;
+ 
+@@ -303,10 +311,19 @@
+  * This MIPS version is fast and accurate; the disposition of the least
+  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
+  */
++#if __MAD_GNUC_PREREQ (4,4)
++#  define MAD_F_MLX(hi, lo, x, y)  \
++    do {									\
++	    mad_fixed64_t __ll = (mad_fixed64_t)(x) * (y);			\
++	    hi = __ll >> 32;							\
++	    lo = __ll;								\
++    } while (0)
++#else
+ #  define MAD_F_MLX(hi, lo, x, y)  \
+     asm ("mult	%2,%3"  \
+ 	 : "=l" (lo), "=h" (hi)  \
+ 	 : "%r" (x), "r" (y))
++#endif
+ 
+ # if defined(HAVE_MADD_ASM)
+ #  define MAD_F_MLA(hi, lo, x, y)  \
diff --git a/recipes/libmad/libmad_0.15.1b.bb b/recipes/libmad/libmad_0.15.1b.bb
index bab40d0..3c5359d 100644
--- a/recipes/libmad/libmad_0.15.1b.bb
+++ b/recipes/libmad/libmad_0.15.1b.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "libid3tag"
 LICENSE = "GPL"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
            file://add-pkgconfig.patch \
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
 S = "${WORKDIR}/libmad-${PV}"
 
 SRC_URI_append_avr32 = " file://libmad-0.15.1b-avr32-optimization.patch"
+SRC_URI_append_mipsel = " file://mips-fix-gcc-4.4.0.patch"
 
 inherit autotools pkgconfig
 
-- 
1.7.1



