Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LprkR-0005vb-SF
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 00:20:30 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090403221751.THRV10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Apr 2009 18:17:51 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id bAHr1b00K4dMFYL04AHrqP; Fri, 03 Apr 2009 18:17:51 -0400
X-Authority-Analysis: v=1.0 c=1 a=aG9XdOEaK-gA:10 a=cM9435QcCoYA:10
	a=8jWpCq5TGciD_e-lwewA:9 a=LQ2EIsjFZ8iJtTS1up8A:7
	a=m1Lajv507ZhXUK517TRLLrJU-SUA:4 a=PkpkE_fElL8A:10
X-CM-Score: 0.00
Date: Fri, 3 Apr 2009 15:17:51 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090403221751.GJ30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090403221721.GI30840@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
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
X-List-Received-Date: Fri, 03 Apr 2009 22:20:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
 There's two parts to this.  The first is to make relative, not absolute
 symlinks for 'cpp', etc.  The second is that we need to configure
 without --with-gxx-include-dir and instead install the base C++ headers
 into the expected location.  The path passed to --with-gxx-include-dir
 will not be relocated and is an absolute.

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
1.6.0.4

-- 
Tom Rini


