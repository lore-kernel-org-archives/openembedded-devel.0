Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lprjy-0005uL-0O
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 00:20:00 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090403221721.DKDW4363.fed1rmmtao103.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Apr 2009 18:17:21 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id bAHM1b00R4dMFYL04AHMhT; Fri, 03 Apr 2009 18:17:21 -0400
X-Authority-Analysis: v=1.0 c=1 a=sZHuR9OE2OIA:10 a=e3vUCPa-lKMA:10
	a=Z_Xx3qcRMLgFEhl_gL0A:9 a=wcG0dFgHwDbuPY9KZCIA:7
	a=mNj5wW4XockgRZq_ZFirO4RkJ3gA:4 a=XJFOml7XyaMA:10
X-CM-Score: 0.00
Date: Fri, 3 Apr 2009 15:17:21 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090403221721.GI30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090403221352.GH30840@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.43
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] binutils-cross-sdk: Make relative, not absolute symlinks	for 'as', etc, bump PR
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
X-List-Received-Date: Fri, 03 Apr 2009 22:20:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

binutils-cross-sdk: Make relative, not absolute symlinks for 'as', etc, bump PR
 While I'm in here, make the cvs recipe use FILESPATHPKG not mung FILESDIR.

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
1.6.0.4

-- 
Tom Rini


