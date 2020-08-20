Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.110171.1597931392015823066
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 06:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=RfgkcCER;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=494692112=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1597931392; x=1629467392;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AlRj+3jXD8M2e/Eylx7Hq6hkEB5b5/XLx9UE1Zuc3js=;
  b=RfgkcCERzmQZ2oUSbAm4PD17G00BwzsHuwsMTRQI6ty9DtFazexpVvjD
   9Tn95gW/5T7Mgrq3TfKxLugpkYfLh4GjFEp3w0qtCufVBEU58idlbNhWI
   lZaimLk0xfbvmHDWp3nVxkdnx1nwR8OA3v/27GW+CvSLK2k5mTQIHwoF3
   SDvGOnBfC1iAO7AiVvu/lhUF+QYRF6qsd9Zb1Mn0CiPRir79JDVVRx/zs
   ZlY4hVUqm1+7/9/bZpqx/69Pv5H91yuwhjzEiZ8QzmzHHJGYXr0HJQW73
   TJ0ZO1u3UkkcXLZhR8+PmY5xGGh6WdxVmhl+Lv6sIJInbnlh3f1moS+rh
   w==;
IronPort-SDR: Hp3EKpLbfZRE+VgGIFjQnXVQZn8vEf2w4icrMpo9YNufW1fBjpdJMxmZ6RMjCwBO3focBLhQw6
 qv7MT8uKasoUG4thSz55nnVVK84FlXwtpzoFZwHOvDT7a1aEiHjLDCksIP8V2wqrQq72PgMFQk
 dhT2bRZfYmeRmHdgwWlznznSdemfXWR/Z7NfpbJU7JvWQPh14wCWTZo+5A5Zomo3TVRHjtCvpP
 aUnE7x/Mv2kJd/9P5Bn3hP2BOxeMp6zwFSRJO8vK7GjG5qo7V/R/pQI6LCwEiVJLG5h5At1iHm
 f0U=
X-IronPort-AV: E=Sophos;i="5.76,333,1592863200"; 
   d="scan'208";a="2646770"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH] cacao: update to latest git version
Date: Thu, 20 Aug 2020 15:49:27 +0200
Message-ID: <20200820134927.69462-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As the cacao-staging mercurial repository was removed update the recipe
to use the git repository instead. Furthermore update to the latest
revision.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...1-java.in-Do-not-use-hardcode-paths.patch} | 33 +++++++++++--------
 ...se-system-s-boehm-garbage-collector.patch} | 21 +++++++++---
 .../{cacao_2d6f6c14daf9.bb => cacao_git.bb}   | 12 +++----
 3 files changed, 41 insertions(+), 25 deletions(-)
 rename recipes-core/cacao/{cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch => cacao/0001-java.in-Do-not-use-hardcode-paths.patch} (63%)
 rename recipes-core/cacao/{cacao-2d6f6c14daf9/system-boehm-gc.patch => cacao/0002-cacao-use-system-s-boehm-garbage-collector.patch} (64%)
 rename recipes-core/cacao/{cacao_2d6f6c14daf9.bb => cacao_git.bb} (85%)

diff --git a/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch b/recipes-core/cacao/cacao/0001-java.in-Do-not-use-hardcode-paths.patch
similarity index 63%
rename from recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
rename to recipes-core/cacao/cacao/0001-java.in-Do-not-use-hardcode-paths.patch
index 665377b..521814e 100644
--- a/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
+++ b/recipes-core/cacao/cacao/0001-java.in-Do-not-use-hardcode-paths.patch
@@ -1,25 +1,31 @@
-java.in: Do not use hardcode paths
+From 51a63cdac93caf69d1b6ace40f73f6147ba37de5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
+Date: Thu, 20 Aug 2020 13:48:38 +0200
+Subject: [PATCH 1/2] java.in: Do not use hardcode paths
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Cacao uses hardcoded paths to various files, if these paths are not
 provided. This causes issues when sharing sstate with otherwise
 identical workers, if build time paths are not identical.
 
-Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
-
 Upstream-Status: Inappropriate [Yocto-specific fixes]
 
+Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
- cacao-1.6.1/src/scripts/java.in | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
+ src/scripts/java.in | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
 
-diff --git cacao-1.6.1/src/scripts/java.in cacao-1.6.1/src/scripts/java.in
-index 0790f02..2118de7 100644
---- cacao-1.6.1/src/scripts/java.in
-+++ cacao-1.6.1/src/scripts/java.in
-@@ -22,5 +22,17 @@
+diff --git a/src/scripts/java.in b/src/scripts/java.in
+index 0790f0255..a4f16ecdc 100644
+--- a/src/scripts/java.in
++++ b/src/scripts/java.in
+@@ -22,5 +22,16 @@
  ## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
  ## 02110-1301, USA.
-
+ 
 -IFS=""
 -exec $(dirname ${0})/cacao ${1+"$@"}
 +SH_DIR=`dirname "$0"`
@@ -35,7 +41,6 @@ index 0790f02..2118de7 100644
 +export BOOTCLASSPATH="${PARENT_DIR}/share/cacao/vm.zip:${PARENT_DIR}/share/classpath/glibj.zip"
 +LIBRARY_PATH="-Djava.library.path=${PARENT_DIR}/lib/classpath"
 +exec ${REAL_DIR}/cacao ${LIBRARY_PATH} ${1+"$@"}
-+
---
-2.7.4
+-- 
+2.28.0
 
diff --git a/recipes-core/cacao/cacao-2d6f6c14daf9/system-boehm-gc.patch b/recipes-core/cacao/cacao/0002-cacao-use-system-s-boehm-garbage-collector.patch
similarity index 64%
rename from recipes-core/cacao/cacao-2d6f6c14daf9/system-boehm-gc.patch
rename to recipes-core/cacao/cacao/0002-cacao-use-system-s-boehm-garbage-collector.patch
index c30f5be..102e9a7 100644
--- a/recipes-core/cacao/cacao-2d6f6c14daf9/system-boehm-gc.patch
+++ b/recipes-core/cacao/cacao/0002-cacao-use-system-s-boehm-garbage-collector.patch
@@ -1,4 +1,7 @@
-cacao: use system's boehm garbage collector
+From 7833101c8c8938d58a32e355b9af1b56e4229a87 Mon Sep 17 00:00:00 2001
+From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
+Date: Thu, 20 Aug 2020 13:50:47 +0200
+Subject: [PATCH 2/2] cacao: use system's boehm garbage collector
 
 This is a Gentoo's patch [1] to force the use of system's bdwgc.
 
@@ -10,11 +13,17 @@ with the system's version.
 Upstream-Status: Inappropriate [not author]
 
 Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ configure.ac       | 8 ++------
+ src/mm/Makefile.am | 9 ++++-----
+ 2 files changed, 6 insertions(+), 11 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
+index aceb2033b..db8a9770e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -691,6 +691,8 @@
+@@ -738,6 +738,8 @@ AC_CHECK_ENABLE_GCC_PR40134
  
  AC_CHECK_ENABLE_PIC_ASM
  
@@ -23,7 +32,7 @@ diff --git a/configure.ac b/configure.ac
  dnl Define version numbers.
  AC_VERSION_DETAIL
  AC_VERSION_CONFIG
-@@ -793,12 +795,6 @@
+@@ -855,12 +857,6 @@ AC_CONFIG_FILES([Makefile]
  )
  
  
@@ -37,9 +46,10 @@ diff --git a/configure.ac b/configure.ac
  
  
 diff --git a/src/mm/Makefile.am b/src/mm/Makefile.am
+index 9d0945a29..cbd7dc963 100644
 --- a/src/mm/Makefile.am
 +++ b/src/mm/Makefile.am
-@@ -35,14 +35,13 @@
+@@ -35,14 +35,13 @@ GC_FILE = \
  endif
  
  if ENABLE_GC_BOEHM
@@ -58,3 +68,6 @@ diff --git a/src/mm/Makefile.am b/src/mm/Makefile.am
  endif
  
  if ENABLE_GC_CACAO
+-- 
+2.28.0
+
diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_git.bb
similarity index 85%
rename from recipes-core/cacao/cacao_2d6f6c14daf9.bb
rename to recipes-core/cacao/cacao_git.bb
index 0e50b68..1a61e12 100644
--- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
+++ b/recipes-core/cacao/cacao_git.bb
@@ -10,14 +10,12 @@ PROVIDES_class-native = "virtual/java-native"
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES_${PN} = "java2-runtime"
 
-SRC_URI = "https://bitbucket.org/cacaovm/cacao-staging/get/${PV}.zip \
-           file://system-boehm-gc.patch \
-           file://cacao-1.6.1-do-not-rely-on-absolute-paths.patch \
+SRCREV = "6c4694f9bd175386a8c451531e9a5ad97aa23b6f"
+SRC_URI = "git://bitbucket.org/cacaovm/cacao.git;protocol=https \
+           file://0001-java.in-Do-not-use-hardcode-paths.patch \
+           file://0002-cacao-use-system-s-boehm-garbage-collector.patch \
 "
-S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
-
-SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
-SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
+S = "${WORKDIR}/git"
 
 inherit java autotools-brokensep update-alternatives pkgconfig features_check
 
-- 
2.26.2

