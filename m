Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Omggo-0004hs-M6
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 07:32:37 +0200
Received: by ewy7 with SMTP id 7so2652899ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/prKkshk09N0z0tK4xK+GTllRgKY5fQ+3Sso+JU+lys=;
	b=I/AGEGST7JjUYQDyXzyNEUQKxeZTRN/VjZlWVAGP5JcEv6mH07MmvMsEGH/94coCVQ
	jTL8XXLFz0jnTmGff1eobpGh43gcxJZROv8VUtASL1sN0NjFWMo51EhgXTaracesvVV/
	MaWfXY99MZ+Ry4TWx4rUbyjJy6b0Od6vSSx5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xiqdoheFn5W3pd0Y5VelZBH4Jm59AWD+lX037N9WXaTJhI54WkpU0GfxcH4zoxHV6I
	7P1u1EGmHemjHRrl67gyqNOxNJ5tZiHAisa1Vt1G6N/rgGABS8EtStWfRNBwO55SUuLM
	kc9EHUBmQoRExGYaVbm3ptptNlkjiFK6gkeJU=
Received: by 10.213.35.142 with SMTP id p14mr1512421ebd.67.1282368717475;
	Fri, 20 Aug 2010 22:31:57 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v8sm6164635eeh.14.2010.08.20.22.31.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Aug 2010 22:31:56 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 07:31:50 +0200
Message-Id: <1282368710-8302-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc-4.4.*inc: removed FILESPATHPKG
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
X-List-Received-Date: Sat, 21 Aug 2010 05:32:37 -0000

removed unneeded FILESPATHPKG
bumped PR
tested by running bitbake -c configure -b on all
gcc*_4.4*.bb recipes

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gcc/gcc-4.4.1.inc |    4 +---
 recipes/gcc/gcc-4.4.2.inc |    4 +---
 recipes/gcc/gcc-4.4.4.inc |    4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index a64b108..acb5371 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -8,9 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r10"
-
-FILESPATHPKG .= ":gcc-$PV"
+INC_PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 5df40f0..42e8d54 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -8,9 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r4"
-
-FILESPATHPKG .= ":gcc-$PV"
+INC_PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
diff --git a/recipes/gcc/gcc-4.4.4.inc b/recipes/gcc/gcc-4.4.4.inc
index 4c7ee40..51337e1 100644
--- a/recipes/gcc/gcc-4.4.4.inc
+++ b/recipes/gcc/gcc-4.4.4.inc
@@ -8,9 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r4"
-
-FILESPATHPKG .= ":gcc-$PV"
+INC_PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=gcc444tarbz2 \
         file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-- 
1.6.4.2



