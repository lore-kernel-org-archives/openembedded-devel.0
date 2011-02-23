Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PsLBh-0007LJ-Je
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 21:19:53 +0100
Received: by wyb38 with SMTP id 38so691135wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 12:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=GkyGD9omvXMZzrdr5yaeJz94Yq510SqiaQjd1kW1pTY=;
	b=sDO2tvFyK8BjmWfMT5Be7zvpatkL1uAuZb1Y3vKUekapgZTwEPBLYU0I2F3sNinpam
	n9sMLUeDMKaxD0g/qSq2ZACm39Fs2FmZznPyYoRzNdhFyy9XQpWe+WImaChxTEVywLn4
	yztiTOvwNlraMIRG6vDgBWtwHfrIIQARKbvWE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vc6MYPkhSSyPvv43llpaSYcFaTW2E+rxC1DPt+uutFo+bh44czfrGAlhoFVdVGtz9R
	hZxqqWdyVpf6akjfiP8syRx//dMGLmFvl4ULHkjSypN//NCvXxc2aQgaeM9Kw5lUcSfx
	vkhUUv5Zt/qj7EH7sVl7KcqDB8mg9/xcKXug4=
Received: by 10.216.50.72 with SMTP id y50mr4978070web.28.1298492271615;
	Wed, 23 Feb 2011 12:17:51 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id i80sm3359441wej.4.2011.02.23.12.17.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 12:17:50 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 21:17:26 +0100
Message-Id: <1298492246-18066-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] gcc 4.1.2: fix dependency_libs for libstdc++ and libsupc++
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
X-List-Received-Date: Wed, 23 Feb 2011 20:19:53 -0000

This fixes a QA issue in gcc 4.1.2.
The patch is identical to what is done in gcc 4.2.2 and 4.2.4
The issues caused neek compilations to fail

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

NOTE: gcc 4.1.0 4.1.1 4.2.1 4.2.3 are also missing this patch.
Can't easily test those now so not submitting a patch for these.
and maybe the patch is also needed for gcc 4.0.*
No idea about gcc3.

 recipes/gcc/gcc-4.1.2.inc |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
index 36b45db..9df67e2 100644
--- a/recipes/gcc/gcc-4.1.2.inc
+++ b/recipes/gcc/gcc-4.1.2.inc
@@ -5,7 +5,7 @@ NATIVEDEPS = "mpfr-native gmp-native"
 
 COMPATIBLE_TARGET_SYS = "."
 
-INC_PR = "r27"
+INC_PR = "r28"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
@@ -60,6 +60,19 @@ do_compile_prepend_avr32() {
        ln -sf ${S}/libstdc++-v3/config/os/uclibc/ ${S}/libstdc++-v3/config/os/uclibc-linux
 }
 
+# with sysroot this change is not needed for gcc 4.3+ but its needed
+# for older compilers because of bug in libtool as well as this PR
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=5291
+# we append the .la munging specially for libstdc++ and libsupc++ here
+# This change if needed for other compilers in use should be put
+# in there specific inc file.
+
+do_install_append () {
+        for d in ${target_libdir} ${target_libdir}/nof; do
+                sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-lm '|" ${D}$d/libsupc++.la || true
+                sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-lm '|" ${D}$d/libstdc++.la || true
+        done
+}
 
 # Language Overrides
 FORTRAN = ""
-- 
1.7.1



