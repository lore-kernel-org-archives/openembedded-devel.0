Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWn-0006ej-LR
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:46:05 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090424164019.WDHC4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:19 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgJtr; Fri, 24 Apr 2009 12:40:18 -0400
X-Authority-Analysis: v=1.0 c=1 a=ATbKhvJdpK4A:10 a=hsvOrjgbp18A:10
	a=4HVRqb_MAAAA:8 a=pGLkceISAAAA:8 a=8jWpCq5TGciD_e-lwewA:9
	a=qOoGirLewRKkWSocYFEA:7 a=o-y6pZUmFtg2kvk6178GMDzIQxwA:4
	a=k-kO48AawpMA:10 a=0pA2U7TmfLoA:10 a=MSl-tDqOz04A:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:50 -0700
Message-Id: <1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:18 -0000

From: Tom Rini <trini@embeddedalley.com>

Acked-by: Florian Boor <florian.boor@kernelconcepts.de>
Acked-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/gcc/gcc-configure-sdk.inc           |    3 +--
 recipes/gcc/gcc-cross-sdk_3.3.4.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_3.4.3.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_3.4.4.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.1.0.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.1.1.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.1.2.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.2.2.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.2.3.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.2.4.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.3.1.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.3.2.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_4.3.3.bb          |    2 +-
 recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb |    2 +-
 recipes/gcc/gcc-package-sdk.inc             |    3 ++-
 15 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes/gcc/gcc-configure-sdk.inc b/recipes/gcc/gcc-configure-sdk.inc
index 7508030..d04f608 100644
--- a/recipes/gcc/gcc-configure-sdk.inc
+++ b/recipes/gcc/gcc-configure-sdk.inc
@@ -4,8 +4,7 @@ require gcc-configure-common.inc
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibcgnueabi", "no", "", d )}'
 
-EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${prefix}/${TARGET_SYS}/${layout_includedir}/c++ \
-                      --with-sysroot=${prefix}/${TARGET_SYS} \
+EXTRA_OECONF_PATHS = "--with-sysroot=${prefix}/${TARGET_SYS} \
                       --with-build-time-tools=${CROSS_DIR}/${TARGET_SYS}/bin \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
diff --git a/recipes/gcc/gcc-cross-sdk_3.3.4.bb b/recipes/gcc/gcc-cross-sdk_3.3.4.bb
index f53c5d3..ed9c18c 100644
--- a/recipes/gcc/gcc-cross-sdk_3.3.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_3.3.4.bb
@@ -1,4 +1,4 @@
-PR = "r6"
+PR = "r7"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_3.4.3.bb b/recipes/gcc/gcc-cross-sdk_3.4.3.bb
index 48a7ecd..0b1f661 100644
--- a/recipes/gcc/gcc-cross-sdk_3.4.3.bb
+++ b/recipes/gcc/gcc-cross-sdk_3.4.3.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 require gcc-${PV}.inc
 require gcc-cross-sdk.inc
diff --git a/recipes/gcc/gcc-cross-sdk_3.4.4.bb b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
index f6dd053..e334659 100644
--- a/recipes/gcc/gcc-cross-sdk_3.4.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 
 require gcc-${PV}.inc
 require gcc-cross-sdk.inc
diff --git a/recipes/gcc/gcc-cross-sdk_4.1.0.bb b/recipes/gcc/gcc-cross-sdk_4.1.0.bb
index 5caec0b..6b6097f 100644
--- a/recipes/gcc/gcc-cross-sdk_4.1.0.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.1.0.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 require gcc-${PV}.inc
 require gcc-cross-sdk.inc
diff --git a/recipes/gcc/gcc-cross-sdk_4.1.1.bb b/recipes/gcc/gcc-cross-sdk_4.1.1.bb
index 461008d..a6418f6 100644
--- a/recipes/gcc/gcc-cross-sdk_4.1.1.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.1.1.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 
 require gcc-${PV}.inc
 require gcc-cross-sdk.inc
diff --git a/recipes/gcc/gcc-cross-sdk_4.1.2.bb b/recipes/gcc/gcc-cross-sdk_4.1.2.bb
index 55c9cee..7bc2480 100644
--- a/recipes/gcc/gcc-cross-sdk_4.1.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.1.2.bb
@@ -1,4 +1,4 @@
-PR = "r9"
+PR = "r10"
 
 require gcc-${PV}.inc
 require gcc-cross-sdk.inc
diff --git a/recipes/gcc/gcc-cross-sdk_4.2.2.bb b/recipes/gcc/gcc-cross-sdk_4.2.2.bb
index 297bd8e..a326263 100644
--- a/recipes/gcc/gcc-cross-sdk_4.2.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.2.2.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_4.2.3.bb b/recipes/gcc/gcc-cross-sdk_4.2.3.bb
index ee4ce85..297bd8e 100644
--- a/recipes/gcc/gcc-cross-sdk_4.2.3.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.2.3.bb
@@ -1,4 +1,4 @@
-PR = "r6"
+PR = "r7"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_4.2.4.bb b/recipes/gcc/gcc-cross-sdk_4.2.4.bb
index 3b66660..0a3af9e 100644
--- a/recipes/gcc/gcc-cross-sdk_4.2.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.2.4.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r5"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.1.bb b/recipes/gcc/gcc-cross-sdk_4.3.1.bb
index 13d3958..876c65c 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.1.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.1.bb
@@ -1,4 +1,4 @@
-PR = "r13"
+PR = "r14"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.2.bb b/recipes/gcc/gcc-cross-sdk_4.3.2.bb
index 8057608..ee4ce85 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.2.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.3.bb b/recipes/gcc/gcc-cross-sdk_4.3.3.bb
index 29ee187..7f3e146 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.3.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.3.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb
index 361b0c1..3352e41 100644
--- a/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 inherit sdk
 
diff --git a/recipes/gcc/gcc-package-sdk.inc b/recipes/gcc/gcc-package-sdk.inc
index 0dc19c7..3d9cc0c 100644
--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -48,7 +48,8 @@ do_install () {
 	# Create the ${prefix}/${TARGET_SYS}/bin/* symlinks
 	install -d ${D}${prefix}/${TARGET_SYS}/bin/
 	for l in ${D}${bindir}/*; do
-		ln -sf "${bindir}/`basename $l`" "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e 's,${TARGET_PREFIX},,'`"
+		echo $l
+		ln -sf "../../${layout_base_bindir}/`basename $l`" "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e 's,${TARGET_PREFIX},,'`"
 	done
 	ln -sf "${bindir}/${TARGET_PREFIX}gcc${EXEEXT}" "${D}${prefix}/${TARGET_SYS}/bin/cc${EXEEXT}"
 
-- 
1.5.6.3



