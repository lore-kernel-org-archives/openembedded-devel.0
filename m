Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWR-0006eF-47
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164020.HRXH15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:20 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgKuL; Fri, 24 Apr 2009 12:40:19 -0400
X-Authority-Analysis: v=1.0 c=1 a=yDtfI_l8lCgA:10 a=LmNd2lpZ8vYA:10
	a=4HVRqb_MAAAA:8 a=LF2dOfbMAAAA:8 a=OhRitRJUqTgdkfz89mAA:9
	a=dM5kYtTYX8pfJtT4Q1mBJ6BRiy0A:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:57 -0700
Message-Id: <1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] canadian-sdk: We DO want DEPENDS_prepend to always bring in host virtual gcc/binutils
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:06 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 classes/canadian-sdk.bbclass                   |    6 +-----
 recipes/binutils/binutils-canadian-sdk_2.18.bb |    6 +-----
 recipes/make/mingw-make-canadian-sdk_3.81.bb   |    2 --
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/classes/canadian-sdk.bbclass b/classes/canadian-sdk.bbclass
index 6b4fdf8..a6c5552 100644
--- a/classes/canadian-sdk.bbclass
+++ b/classes/canadian-sdk.bbclass
@@ -19,11 +19,7 @@ CFLAGS = "${SDK_CFLAGS}"
 CXXFLAGS = "${SDK_CFLAGS}"
 LDFLAGS = "${SDK_LDFLAGS}"
 
-# TODO: add logic to add the following unless PN ~= gcc*
-#DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc "
-# and otherwise just
-DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils "
-
+DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc "
 
 # On mingw systems we want to have the real sysroot default to c:/... and
 # assume that the default install will be on the C drive.  This can be changed
diff --git a/recipes/binutils/binutils-canadian-sdk_2.18.bb b/recipes/binutils/binutils-canadian-sdk_2.18.bb
index e44e7b7..96726f8 100644
--- a/recipes/binutils/binutils-canadian-sdk_2.18.bb
+++ b/recipes/binutils/binutils-canadian-sdk_2.18.bb
@@ -2,11 +2,7 @@ SECTION = "devel"
 require binutils_${PV}.bb
 inherit canadian-sdk
 
-DEPENDS="\
-	virtual/${HOST_PREFIX}binutils \
-	virtual/${HOST_PREFIX}gcc \
-	flex-native bison-native \
-"
+DEPENDS = "flex-native bison-native"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
 # On MinGW hosts we want to prepend a drive letter, in ${SDK_REALPATH_MINGW}
diff --git a/recipes/make/mingw-make-canadian-sdk_3.81.bb b/recipes/make/mingw-make-canadian-sdk_3.81.bb
index 3479dad..a4b1f72 100644
--- a/recipes/make/mingw-make-canadian-sdk_3.81.bb
+++ b/recipes/make/mingw-make-canadian-sdk_3.81.bb
@@ -9,8 +9,6 @@ interdependent files, and, if necessary, issues commands \
 to bring them up-to-date - MinGW port."
 HOMEPAGE = "http://www.mingw.org/"
 
-DEPENDS = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/mingw32-make-3.81-20080326-src.tar.gz"
 
 S = "${WORKDIR}/make-${PV}-patched"
-- 
1.5.6.3



