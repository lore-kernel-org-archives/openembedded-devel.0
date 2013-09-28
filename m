Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A78E460071
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 23:54:56 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1899292eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FgGvnQ2JWD1XALKe51nmWVMS6KRja1D7UxRh19v3XA4=;
	b=wNx6om57mte3z+e6P+nXES2q2JQEfxfyxImjryyF6r3G+6xvHC4ZdzZhAjjFXC946u
	3njr5qhWIyD7W4GnuQxPOSWqF42wNlOhY1xuGNUvR9P+Gq/2okOHMXXiTgvm2tZnIYiz
	IQ56/K+iYdx62krNczuQWlhh75+ddm8FKWaSyBa7zX0Q2ljxoKQ9V6EPWKWADGzVaR0h
	qE0/U/M95j4P34feGfJFYCBCaAqQoyIBsZVFguChLWwuS8u9G2/JJvBuGV2jxwkNIk7l
	WDLSbwNiqhHybCJoNkYX0bJNrZMJllUtyz4HoUVFjP9roCdQ98Ju7pTczoE6usOcAJtr
	2v/w==
X-Received: by 10.14.122.132 with SMTP id t4mr23747236eeh.20.1380412497759;
	Sat, 28 Sep 2013 16:54:57 -0700 (PDT)
Received: from mizar.localdomain
	(host172-229-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.229.172]) by mx.google.com with ESMTPSA id
	r48sm33037046eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Sep 2013 16:54:57 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2013 01:54:52 +0200
Message-Id: <1380412492-15152-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] nandlogical: move to 1.1.0 and add BBCLASSEXTEND for the klibc version
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
X-List-Received-Date: Sat, 28 Sep 2013 23:54:58 -0000

Remove nandlogical-klibc recipe
Sync PV to 1.1.0 like the source tarball
Remove PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/nandlogical-klibc_1.0.0.bb              | 9 ---------
 .../zaurus-utils/{nandlogical_1.0.0.bb => nandlogical_1.1.0.bb}  | 6 +++++-
 2 files changed, 5 insertions(+), 10 deletions(-)
 delete mode 100644 recipes-bsp/zaurus-utils/nandlogical-klibc_1.0.0.bb
 rename recipes-bsp/zaurus-utils/{nandlogical_1.0.0.bb => nandlogical_1.1.0.bb} (83%)

diff --git a/recipes-bsp/zaurus-utils/nandlogical-klibc_1.0.0.bb b/recipes-bsp/zaurus-utils/nandlogical-klibc_1.0.0.bb
deleted file mode 100644
index 47902d7..0000000
--- a/recipes-bsp/zaurus-utils/nandlogical-klibc_1.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require nandlogical_${PV}.bb
-
-inherit klibc
-
-do_compile() {
-        ${CC} ${CFLAGS} ${LDFLAGS} -static -I${STAGING_INCDIR} nandlogical.c -o nandlogical
-}
-
-FILESPATH =. "${FILE_DIRNAME}/nandlogical:"
diff --git a/recipes-bsp/zaurus-utils/nandlogical_1.0.0.bb b/recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb
similarity index 83%
rename from recipes-bsp/zaurus-utils/nandlogical_1.0.0.bb
rename to recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb
index 07180c5..0fb6e2c 100644
--- a/recipes-bsp/zaurus-utils/nandlogical_1.0.0.bb
+++ b/recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb
@@ -1,7 +1,8 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:${THISDIR}/files:"
+
 DESCRIPTION = "Nandlogical for Sharp mtd1"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://nandlogical.c;endline=15;md5=77804e7fdf625e56869f32d9aec762a2"
-PR = "r6"
 
 SRC_URI = "http://distro.ibiblio.org/pub/linux/distributions/pdaxrom/download/1.1.0beta4/src/survive-1.1.0.tar.bz2 \
            file://oobblock-to-writesize.patch"
@@ -11,6 +12,8 @@ SRC_URI[sha256sum] = "0d02edc12509f6dc98cded37c68238f939c522cbd398fd527785a1e7e3
 
 S = "${WORKDIR}/survive-1.1.0"
 
+EXTRA_OEMAKE_class-klibc = "-static -I${STAGING_INCDIR}"
+
 do_compile () {
         ${CC} ${CFLAGS} ${LDFLAGS} nandlogical.c -o nandlogical
 }
@@ -21,3 +24,4 @@ do_install () {
 }
 
 COMPATIBLE_MACHINE = "(poodle|c7x0|akita|spitz|tosa)"
+BBCLASSEXTEND = "klibc"
-- 
1.8.1.5


