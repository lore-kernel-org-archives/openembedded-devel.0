Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ocb6e-0005wB-05
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 11:33:23 +0200
Received: by pzk2 with SMTP id 2so464092pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7Ca2TJVpcpK2v5BAR+onoYJq90pM6tG3B8onG+HLRnU=;
	b=CWx29Y7HxyF78EAsxHvBYWwUkw5sCWdQRL9O2K23XQ9ZqmQuU0IDDH6DLg6Md0RR/J
	IIUSOiM069l+w8GBssu0I+SvTTplVGyJTjKM/iAZpqoyKCUAmwBtntpoOVHFcjGNqJQv
	8TzBj2lml9+P7F8VBbFi+Ps5nGv8pjIUPtz6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=il3KxEDiqc/H9G35NhXkKG+AHAvgBWXvR3dFseq4+vj2h9c4Gmj5r1NcdGwOW60vze
	mp3penZ5C+8YsXJcrhe7yw440c4VhfCVNrikR+BL6rkMVM40goOLN+KTS2FszV5ShofW
	UXHW+W7ZZGYqt2339yLYLVjOQumnXztlxIFus=
Received: by 10.114.107.10 with SMTP id f10mr6717310wac.165.1279963984966;
	Sat, 24 Jul 2010 02:33:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d39sm2139120wam.4.2010.07.24.02.33.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Jul 2010 02:33:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jul 2010 02:32:54 -0700
Message-Id: <1279963975-3736-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] binutils-cross.inc, binutils.inc: Overhaul for new cross dir structure.
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
X-List-Received-Date: Sat, 24 Jul 2010 09:33:23 -0000

* Install the symlinks instead of copied of tools.
* Dont build shared libopcodes
* We dont need to install libbfd a separate recipe should do that if
  needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/binutils/binutils-cross.inc |   15 +++++++++++----
 recipes/binutils/binutils.inc       |    3 ---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
index f3ba5c3..073cdad 100644
--- a/recipes/binutils/binutils-cross.inc
+++ b/recipes/binutils/binutils-cross.inc
@@ -5,15 +5,15 @@ PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 PACKAGES = ""
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
 		--program-prefix=${TARGET_PREFIX} \
-		--enable-install-libbfd \
-		--enable-shared \
+		--disable-install-libbfd \
+		--disable-shared \
 		--disable-werror \
 	       "
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-	install -m 0644 libiberty/pic/libiberty.a \
-	${D}${libdir}/libiberty_pic.a
+	rm -rf ${D}${STAGING_DIR_NATIVE}${libdir_native}/libiberty.a
+	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}
 
 	# We don't really need these, so we'll remove them...
 	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/lib/ldscripts
@@ -26,4 +26,11 @@ do_install () {
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir} || :
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found.
+	dest=${D}${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/
+	install -d $dest
+	for t in ar as ld nm objcopy objdump ranlib strip; do
+		ln -sf ../../bin/${TARGET_PREFIX}$t $dest$t
+	done
 }
diff --git a/recipes/binutils/binutils.inc b/recipes/binutils/binutils.inc
index 75ee66a..c09b50a 100644
--- a/recipes/binutils/binutils.inc
+++ b/recipes/binutils/binutils.inc
@@ -43,9 +43,6 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
 		--enable-shared"
 
-# This is necessary due to a bug in the binutils Makefiles
-EXTRA_OEMAKE = "configure-build-libiberty all"
-
 export AR = "${HOST_PREFIX}ar"
 export AS = "${HOST_PREFIX}as"
 export LD = "${HOST_PREFIX}ld"
-- 
1.7.1



