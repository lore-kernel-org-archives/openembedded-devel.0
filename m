Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Of4iW-0005uX-Pq
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 07:34:42 +0200
Received: by pvg13 with SMTP id 13so831255pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 22:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=V5FVKD4AKPhyzL0OjyVaoQw1FMKeYx+w5xzbUkgX+fY=;
	b=fTEHBmBzK5VbncQO1Di8v9WFQGi9sP3NP9Ka1jlNd0ZCP9lC7Uwd9bB6y4bcCThpNQ
	g7wieq7GQyQANHoh5D3Lm+B8LQwq8GCtOuaeWu3kN/u4rnWPjDA9wJzbZGm/J6fIuMpT
	jmfIjo9Vppxd8gSMoROo7w9NMeFgCccQn9hwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YKk9HQHUgyftf8eOl4QDA8T1nskRPfpv/n7rKb/UohoDrq2zjOBzNSHObcDkNN2tDL
	yztSsItwpnAvJBcwhb8MqlJisrxXltqi90QhdUw+2DayNb4mXm1cWHb/y7WLZiyn3RpU
	f+HoYGWa8t8Ms8AUiX04WvQvL7HzU+ymX0RZI=
Received: by 10.114.27.2 with SMTP id a2mr3598475waa.25.1280554459093;
	Fri, 30 Jul 2010 22:34:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n32sm5308381wag.23.2010.07.30.22.34.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 22:34:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 22:34:08 -0700
Message-Id: <1280554451-27780-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] binutils-cross.inc: Dont install duplicate copies of tools create relative symlinks instead.
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
X-List-Received-Date: Sat, 31 Jul 2010 05:34:42 -0000

* Dont generate shared libraries and bfd.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/binutils/binutils-cross.inc |   33 ++++++++++++++++++---------------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
index f3ba5c3..ba3e6b5 100644
--- a/recipes/binutils/binutils-cross.inc
+++ b/recipes/binutils/binutils-cross.inc
@@ -5,25 +5,28 @@ PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 PACKAGES = ""
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
 		--program-prefix=${TARGET_PREFIX} \
-		--enable-install-libbfd \
-		--enable-shared \
 		--disable-werror \
 	       "
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-	install -m 0644 libiberty/pic/libiberty.a \
-	${D}${libdir}/libiberty_pic.a
-
+	rm -rf ${D}${prefix}/${TARGET_SYS}
 	# We don't really need these, so we'll remove them...
-	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/lib/ldscripts
-	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/info
-	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/locale
-	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/man
-	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/share || :
-	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}/gcc-lib || :
-	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64/gcc-lib || :
-	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir} || :
-	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
-	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
+	rm -rf ${D}${prefix}/lib/ldscripts
+	rm -rf ${D}${prefix}/share/info
+	rm -rf ${D}${prefix}/share/locale
+	rm -rf ${D}${prefix}/share/man
+	rmdir ${D}${prefix}/share || :
+	rmdir ${D}${prefix}/${libdir}/gcc-lib || :
+	rmdir ${D}${prefix}/${libdir}64/gcc-lib || :
+	rmdir ${D}${prefix}/${libdir} || :
+	rmdir ${D}${prefix}/${libdir}64 || :
+	rmdir ${D}${prefix}/${prefix} || :
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found.
+	dest=${D}${prefix}/${TARGET_SYS}${base_bindir_native}
+	install -d $dest
+	for t in ar as ld nm objcopy objdump ranlib strip; do
+		ln -sf ../..${base_bindir_native}/${TARGET_PREFIX}$t $dest/$t
+	done
 }
-- 
1.7.1



