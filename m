Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrEo7-0000ef-T1
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 19:10:45 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090407170656.OPQT27308.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 13:06:56 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id ch6v1b00G4dMFYL03h6veB; Tue, 07 Apr 2009 13:06:55 -0400
X-Authority-Analysis: v=1.0 c=1 a=N1_5PmUnuBUA:10 a=DI6_7SifsxEA:10
	a=mDV3o1hIAAAA:8 a=n44mm9jJAAAA:8 a=Z8aUKFZE1Fl35COtwjAA:9
	a=BW4xF2KLJygH7CiOMk0y5DdsxH4A:4 a=PkpkE_fElL8A:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 10:06:55 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090407170655.GG2195@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.45
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH] gcc: Fix 4.1.[012], 4.2.[1234] and 4.3.[123]	SRC_URI to use ${GNU_MIRROR}
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
X-List-Received-Date: Tue, 07 Apr 2009 17:11:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

gcc: Fix 4.1.[012], 4.2.[1234] and 4.3.[123] SRC_URI to use ${GNU_MIRROR} and update checksums.ini
 This fixes a big problem with 4.3.3 as it wasn't using ftp.gnu.org but
 an alternate mirror that's gone away.  Since I had to fix one I noticed
 others not calling ${GNU_MIRROR} but ftp.gnu.org.  Also a few weren't
 using ${PV}, so use that too.

---
 conf/checksums.ini        |   20 ++++++++++----------
 recipes/gcc/gcc-4.1.0.inc |    2 +-
 recipes/gcc/gcc-4.1.1.inc |    2 +-
 recipes/gcc/gcc-4.1.2.inc |    2 +-
 recipes/gcc/gcc-4.2.1.inc |    2 +-
 recipes/gcc/gcc-4.2.2.inc |    2 +-
 recipes/gcc/gcc-4.2.3.inc |    2 +-
 recipes/gcc/gcc-4.2.4.inc |    2 +-
 recipes/gcc/gcc-4.3.1.inc |    2 +-
 recipes/gcc/gcc-4.3.2.inc |    2 +-
 recipes/gcc/gcc-4.3.3.inc |    2 +-
 11 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2a119dd..c416e16 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6906,15 +6906,15 @@ sha256=38a9a01e195000976dcd04ec854c398478ada839510b1de384ffbd5f99791bdc
 md5=a659b8388cac9db2b13e056e574ceeb0
 sha256=37b3286c2bfb68da9df983f60721f868e29897f7a426306748fee93b25c5fb61
 
-[http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2]
 md5=88785071f29ed0e0b6b61057a1079442
 sha256=1159457a0e4c054b709547ae21ff624aebab2033e0d9e5bf46c9cf88b1970606
 
-[http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2]
 md5=ad9f97a4d04982ccf4fd67cb464879f3
 sha256=985cbb23a486570a8783395a42a8689218f5218a0ccdd6bec590eef341367bb7
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2]
 md5=a4a3eb15c96030906d8494959eeda23c
 sha256=cfc0efbcc6fcde0d416a32dfb246c9df022515a312683fac412578c4fd09a9bc
 
@@ -6922,23 +6922,23 @@ sha256=cfc0efbcc6fcde0d416a32dfb246c9df022515a312683fac412578c4fd09a9bc
 md5=ac6d19831220c4aeef4475492725486f
 sha256=98bdb26cd2644f2290e34453d9115b88bcff940bd1feb88db5a0fc557ec0ea5e
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.1/gcc-4.2.1.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.1/gcc-4.2.1.tar.bz2]
 md5=cba410e6ff70f7d7f4be7a0267707fd0
 sha256=ca0a12695b3bccfa8628509e08cb9ed7d8ed48deff0a299e4cb8de87d2c1fced
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.2/gcc-4.2.2.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.2/gcc-4.2.2.tar.bz2]
 md5=7ae33781417a35a2eb03ee098a9f4490
 sha256=673b85d780a082c014ded4ac11f8269a3fe893b4dbb584d65b8602d50b3872b1
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.3/gcc-4.2.3.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.3/gcc-4.2.3.tar.bz2]
 md5=ef2a4d9991b3644115456ea05b2b8163
 sha256=5df9a267091eea09179651ad2a2302fe99f780ac7e598278e7f47b2339fa2e80
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2]
 md5=d79f553e7916ea21c556329eacfeaa16
 sha256=afba845e2d38547a63bd3976e90245c81ea176786f9e6966339c6d3761f1133a
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2]
 md5=4afa0290cc3a41ac8822666f1110de98
 sha256=66596b80995f88cb66aaaf937598df7a9af10cc06799c3a7a64879e20b552fd5
 
@@ -6946,11 +6946,11 @@ sha256=66596b80995f88cb66aaaf937598df7a9af10cc06799c3a7a64879e20b552fd5
 md5=5dfac5da961ecd5f227c3175859a486d
 sha256=bfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
 md5=5dfac5da961ecd5f227c3175859a486d
 sha256=bfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
 
-[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.3/gcc-4.3.3.tar.bz2]
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.3/gcc-4.3.3.tar.bz2]
 md5=cc3c5565fdb9ab87a05ddb106ba0bd1f
 sha256=309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
 
diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
index e12f93c..5cf2687 100644
--- a/recipes/gcc/gcc-4.1.0.inc
+++ b/recipes/gcc/gcc-4.1.0.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://arm-nolibfloat.patch;patch=1 \
 	file://arm-softfloat.patch;patch=1 \
 	file://zecke-xgcc-cpp.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
index ac8a4a8..22c20ce 100644
--- a/recipes/gcc/gcc-4.1.1.inc
+++ b/recipes/gcc/gcc-4.1.1.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
 	file://110-arm-eabi.patch;patch=1 \
 	file://200-uclibc-locale.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
index 614e2bb..7ffb9ce 100644
--- a/recipes/gcc/gcc-4.1.2.inc
+++ b/recipes/gcc/gcc-4.1.2.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
 	file://110-arm-eabi.patch;patch=1 \
 	file://200-uclibc-locale.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
index 16e5b8f..920805b 100644
--- a/recipes/gcc/gcc-4.2.1.inc
+++ b/recipes/gcc/gcc-4.2.1.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
 	file://103-uclibc-conf-noupstream.patch;patch=1 \
 	file://200-uclibc-locale.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
index 0f4de3c..f587812 100644
--- a/recipes/gcc/gcc-4.2.2.inc
+++ b/recipes/gcc/gcc-4.2.2.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
 	file://103-uclibc-conf-noupstream.patch;patch=1 \
 	file://200-uclibc-locale.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
index 7726030..35d8cc6 100644
--- a/recipes/gcc/gcc-4.2.3.inc
+++ b/recipes/gcc/gcc-4.2.3.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
 	file://103-uclibc-conf-noupstream.patch;patch=1 \
 	file://200-uclibc-locale.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
index b21569b..085f241 100644
--- a/recipes/gcc/gcc-4.2.4.inc
+++ b/recipes/gcc/gcc-4.2.4.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
 	file://103-uclibc-conf-noupstream.patch;patch=1 \
 	file://200-uclibc-locale.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index cdab6dc..132bbe7 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -6,7 +6,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-ia64-libunwind.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-java-nomulti.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index aeb3477..e053ba2 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -6,7 +6,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-ia64-libunwind.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-java-nomulti.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 4bed0e4..860c96c 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -6,7 +6,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "http://gcc.releasenotes.org/releases/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-ia64-libunwind.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-java-nomulti.patch;patch=1;pnum=0 \
-- 
1.5.6.3

-- 
Tom Rini


