Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrcGN-0002ag-Jz
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 20:12:47 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090408180922.EMKS4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 8 Apr 2009 14:09:22 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id d69L1b00D4dMFYL0469L6c; Wed, 08 Apr 2009 14:09:22 -0400
X-Authority-Analysis: v=1.0 c=1 a=iaQTyCaarDsA:10 a=TZwtE2nETPoA:10
	a=4HVRqb_MAAAA:8 a=FP58Ms26AAAA:8 a=mDV3o1hIAAAA:8 a=LF2dOfbMAAAA:8
	a=txD1SLpAXUJqih03Go8A:9 a=ARugnrK1h5lK2H5RIOYA:7
	a=l0Q7HhH_Lms9fjTIIKm_eFI4TwsA:4 a=uu3eWrlIPmIA:10 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Wed, 8 Apr 2009 11:09:20 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090408180920.GN2195@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.43
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH] mingw-binutils: Add 2.19.1 recipe and split common	parts out into mingw-binutils.inc
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
X-List-Received-Date: Wed, 08 Apr 2009 18:12:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

mingw-binutils: Add 2.19.1 recipe and split common parts out into mingw-binutils.inc

Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 conf/checksums.ini                                 |    4 ++++
 ...w-binutils-canadian-cross_2.17.50-20060824-1.bb |    9 +--------
 .../mingw-binutils-canadian-cross_2.19.1.bb        |    4 ++++
 recipes/binutils/mingw-binutils.inc                |   10 ++++++++++
 .../binutils/mingw-binutils_2.17.50-20060824-1.bb  |   12 +-----------
 recipes/binutils/mingw-binutils_2.19.1.bb          |    1 +
 6 files changed, 21 insertions(+), 19 deletions(-)
 create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
 create mode 100644 recipes/binutils/mingw-binutils.inc
 create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index c416e16..658aae7 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -2550,6 +2550,10 @@ sha256=6fe3c4b2d45a50582f832bc77deb4e3da74a15ea8e09dbb214b9c44e7c3378fc
 md5=9d22ee4dafa3a194457caf4706f9cf01
 sha256=487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b65632b6c945e961ee9b
 
+[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
+md5=ad3f2b5fdcd599a772ad75fec2c384d8
+sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7
+
 [ftp://ftp.gnu.org/gnu/binutils/binutils-2.19.1.tar.bz2]
 md5=09a8c5821a2dfdbb20665bc0bd680791
 sha256=3e8225b4d7ace0a2039de752e11fd6922d3b89a7259a292c347391c4788739f6
diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb b/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
index 385aa1d..7f80a77 100644
--- a/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
+++ b/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
@@ -1,11 +1,4 @@
 require mingw-binutils_${PV}.bb
 require binutils-canadian-cross.inc
 
-DEFAULT_PREFERENCE_sdk-mingw32 = "1"
-DEFAULT_PREFERENCE_sdk-mingw64 = "1"
-
-require binutils-canadian-cross.inc
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
-
-S = "${WORKDIR}/binutils-${PV}-src"
+DEFAULT_PREFERENCE_mingw32 = "1"
diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
new file mode 100644
index 0000000..7f80a77
--- /dev/null
+++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
@@ -0,0 +1,4 @@
+require mingw-binutils_${PV}.bb
+require binutils-canadian-cross.inc
+
+DEFAULT_PREFERENCE_mingw32 = "1"
diff --git a/recipes/binutils/mingw-binutils.inc b/recipes/binutils/mingw-binutils.inc
new file mode 100644
index 0000000..1e3898a
--- /dev/null
+++ b/recipes/binutils/mingw-binutils.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
+HOMEPAGE = "http://www.mingw.org/"
+
+require binutils.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb b/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
index 9d17873..7021cfe 100644
--- a/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
+++ b/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
@@ -1,12 +1,2 @@
-PR = "r1"
-
-require binutils.inc
-
-DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
-HOMEPAGE = "http://www.mingw.org/"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
-
+require mingw-binutils.inc
 S = "${WORKDIR}/binutils-${PV}-src"
-
-DEFAULT_PREFERENCE = "0"
diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb b/recipes/binutils/mingw-binutils_2.19.1.bb
new file mode 100644
index 0000000..0f719ed
--- /dev/null
+++ b/recipes/binutils/mingw-binutils_2.19.1.bb
@@ -0,0 +1 @@
+require mingw-binutils.inc
-- 
1.5.6.3

-- 
Tom Rini


