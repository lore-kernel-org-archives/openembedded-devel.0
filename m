Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWP-0006e0-IE
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:10 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164018.HRWY15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:18 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgJtl; Fri, 24 Apr 2009 12:40:18 -0400
X-Authority-Analysis: v=1.0 c=1 a=EC_Ls_ZbL-UA:10 a=OWzvGqeLN-YA:10
	a=4HVRqb_MAAAA:8 a=pGLkceISAAAA:8 a=8IFUabOSF-BAsCQdFIgA:9
	a=BTDXMKIMaAK2n5W9Ho0A:7 a=-KNFWKQM63VmTih6jiuRslGoDf0A:4
	a=k-kO48AawpMA:10 a=0pA2U7TmfLoA:10 a=MSl-tDqOz04A:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:49 -0700
Message-Id: <1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] binutils-cross-sdk: Make relative, not absolute symlinks for 'as', etc, bump PR
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:02 -0000

From: Tom Rini <trini@embeddedalley.com>

Acked-by: Florian Boor <florian.boor@kernelconcepts.de>
Acked-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/binutils/binutils-cross-sdk.inc            |    2 +-
 recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb |    1 +
 recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb |    1 +
 recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb |    2 +-
 recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb |    1 +
 recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb |    2 +-
 .../binutils/binutils-cross-sdk_2.17.50.0.12.bb    |    2 +-
 recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb |    2 +-
 recipes/binutils/binutils-cross-sdk_2.18.bb        |    2 +-
 recipes/binutils/binutils-cross-sdk_2.19.1.bb      |    2 +-
 recipes/binutils/binutils-cross-sdk_2.19.bb        |    2 +-
 recipes/binutils/binutils-cross-sdk_cvs.bb         |    4 ++--
 12 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/recipes/binutils/binutils-cross-sdk.inc b/recipes/binutils/binutils-cross-sdk.inc
index 5da1d4f..6e9cda0 100644
--- a/recipes/binutils/binutils-cross-sdk.inc
+++ b/recipes/binutils/binutils-cross-sdk.inc
@@ -17,7 +17,7 @@ do_install () {
 	rm ${D}${prefix}/${TARGET_SYS}/bin/.debug -Rf
 	rm ${D}${prefix}/${TARGET_SYS}/bin/*
 	for l in ${D}${bindir}/*; do
-		ln -sf "${bindir}/`basename $l`" "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e 's,${TARGET_PREFIX},,'`"
+		ln -sf "../../${layout_base_bindir}/`basename $l`" "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e 's,${TARGET_PREFIX},,'`"
 	done
 
         # Install the libiberty header
diff --git a/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb b/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
index f509566..f84a61d 100644
--- a/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
@@ -1,2 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
+PR = "r1"
diff --git a/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb b/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
index f509566..f84a61d 100644
--- a/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
@@ -1,2 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
+PR = "r1"
diff --git a/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb b/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
index f84a61d..40e9889 100644
--- a/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r1"
+PR = "r2"
diff --git a/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb b/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
index f509566..f84a61d 100644
--- a/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
@@ -1,2 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
+PR = "r1"
diff --git a/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb b/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
index 574265c..cde4e42 100644
--- a/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r4"
+PR = "r5"
diff --git a/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb b/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
index 574265c..cde4e42 100644
--- a/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r4"
+PR = "r5"
diff --git a/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb b/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
index 574265c..cde4e42 100644
--- a/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r4"
+PR = "r5"
diff --git a/recipes/binutils/binutils-cross-sdk_2.18.bb b/recipes/binutils/binutils-cross-sdk_2.18.bb
index 574265c..cde4e42 100644
--- a/recipes/binutils/binutils-cross-sdk_2.18.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.18.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r4"
+PR = "r5"
diff --git a/recipes/binutils/binutils-cross-sdk_2.19.1.bb b/recipes/binutils/binutils-cross-sdk_2.19.1.bb
index 76dff54..f84a61d 100644
--- a/recipes/binutils/binutils-cross-sdk_2.19.1.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.19.1.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r0"
+PR = "r1"
diff --git a/recipes/binutils/binutils-cross-sdk_2.19.bb b/recipes/binutils/binutils-cross-sdk_2.19.bb
index 76dff54..f84a61d 100644
--- a/recipes/binutils/binutils-cross-sdk_2.19.bb
+++ b/recipes/binutils/binutils-cross-sdk_2.19.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-sdk.inc
-PR = "r0"
+PR = "r1"
diff --git a/recipes/binutils/binutils-cross-sdk_cvs.bb b/recipes/binutils/binutils-cross-sdk_cvs.bb
index 6886255..94d2704 100644
--- a/recipes/binutils/binutils-cross-sdk_cvs.bb
+++ b/recipes/binutils/binutils-cross-sdk_cvs.bb
@@ -1,4 +1,4 @@
 require binutils_cvs.bb
 require binutils-cross-sdk.inc
-PR = "r4"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
+PR = "r5"
+FILESPATHPKG .= ":binutils-cvs"
-- 
1.5.6.3



