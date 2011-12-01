Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW8AD-0001cF-Gh
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 16:03:05 +0100
Received: by bkbzv15 with SMTP id zv15so1784115bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Pc5JMLJ8R+QiBEa9afjHZyMenqsubyTaU0+0d2tm0oQ=;
	b=xx3/sjK8JBUvsEHJE/IISn52bjn4XxojEcsPA+J/xxlhD0mg3+F71FJJDd4vnYBq/i
	w+UWFYAWGge7O6WNCH3frL9iGs0Yb6+NU3bEn5c7fTM7ZIhK6ua/IwW/35+yFdcIUhxX
	Dq/0mmDivgFipzyvvqjYnoFRXDQfCIYasyrq8=
Received: by 10.204.157.27 with SMTP id z27mr7612376bkw.37.1322751374896;
	Thu, 01 Dec 2011 06:56:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm11811778bkk.13.2011.12.01.06.56.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 06:56:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2011 15:56:05 +0100
Message-Id: <1322751365-21171-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <jb7cun$3n6$1@dough.gmane.org>
References: <jb7cun$3n6$1@dough.gmane.org>
Subject: [PATCH][meta-oe] pixman: replace pixman_0.24.0.bb with smaller bbappend with only diff against oe-core version
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
X-List-Received-Date: Thu, 01 Dec 2011 15:03:05 -0000

* disable iwmmxt for now, because it breaks build
* neon is not really enabled for people not having FEED_ARCH in OVERRIDES
* maybe this diff should be merged to oe-core recipes instead

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/pixman.inc       |   13 -------------
 meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bb |    4 +++-
 .../xorg-lib/pixman_0.24.0.bbappend                |   16 ++++++++++++++++
 3 files changed, 19 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman.inc
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman.inc b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
deleted file mode 100644
index f77c6a8..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SECTION = "libs"
-DESCRIPTION = "Low-level pixel manipulation library."
-LICENSE = "X11"
-
-DEPENDS = "perl-native"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI = "${XORG_MIRROR}/individual/lib/${BPN}-${PV}.tar.gz;name=archive "
-
-INC_PR = "r5"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bb b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bb
index 7037546..258cbf1 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bb
@@ -18,4 +18,6 @@ SRC_URI[sha256sum] = "a5647c7158f103eedff5fba799018f4169f6b26b573ab7685812ebc9a1
 NEON = " --disable-arm-neon "
 NEON_armv7a = " "
 
-EXTRA_OECONF = "${NEON} --disable-gtk"
+IWMMXT = " --disable-arm-iwmmxt "                                                                                                                             
+                                                                                                                                                              
+EXTRA_OECONF += "${NEON} ${IWMMXT} --disable-gtk"                                                                                                                           
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend
new file mode 100644
index 0000000..61a9558
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+DEPENDS += "perl-native"
+BBCLASSEXTEND = "native"
+
+PRINC = "6"
+
+SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+NEON_armv7a-vfp-neon = " "
+
+IWMMXT = " --disable-arm-iwmmxt "
+
+EXTRA_OECONF += "${NEON} ${IWMMXT}"
-- 
1.7.8.rc4



