Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyI-0001OM-UC
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:18 +0200
Received: by iwn34 with SMTP id 34so3565371iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7Ca2TJVpcpK2v5BAR+onoYJq90pM6tG3B8onG+HLRnU=;
	b=FzXuw7fOHBh2UbvTKFS7168T7RW9FSgkepymCAlpuoFwgEJDwCU8Xrr8o+5yb7x5Og
	mpsY4ysBRI7E0JIezQ4+UEqThPsW+Nl9mf0plmleDvwK256LzOQK7cPrMmgC41tcCx3e
	VFZf58ze2FJiPLAAom4/XglkExxpCXlViw+dw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WhrHYE1DpST5LWbYYo921UzKTvcmLhHgFUwu9ULZ8c9VddvQgPTXiPd/3yEzC1CNu+
	iSD5dO2uarrEDiKuiIpmRiIxLvLq8pFRs6+QhgUfkul8mFTWSeE2oZZeCX18mz9DthwW
	34fCsjKatVItNTT6A5xkIKpcSaWbiN/ZRzIrE=
Received: by 10.231.34.70 with SMTP id k6mr9613688ibd.25.1280213327520;
	Mon, 26 Jul 2010 23:48:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:29 -0700
Message-Id: <1280213315-5513-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/8] binutils-cross.inc, binutils.inc: Overhaul for new cross dir structure.
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:18 -0000

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



