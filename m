Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LrYo7-0002a7-Ey
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 16:31:18 +0200
Received: by yw-out-1718.google.com with SMTP id 9so82922ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=ocrM9omGWBC5WsHlbxclGmX0uWWwFIlr2jxqhh/gucs=;
	b=O7tvxb2gR+K+VohnyIzNis/CnSboFQFOu87oVAUcuNBw2DdaZ1BGyei7lztC6ppli4
	6NMm+mgGkY+i3jxIXhXLUKQYCbObHVYz8l5hFTKUYVXQu5fz8QVFONfUxI4aB7tgerhb
	ekv3Ua5LY22KVUkZmOBwkp2xJHykt2WGNrFMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=d2ISGvYsaN5H3H3IN1J4bQJmX3TgX/dN+tNHYmTi9xDQ4zIQvgmNZEq/Rs5W/lNDpC
	1B19AKpuYlS4EI5ogaIPi0KgtOqh1qjKTk5ie8x6m7xmgE1GFVGRscvIqxJQtzwJ1p7t
	g3Zsnx4bSvIUFdCoDLvFyqmZaEMaDW8JJpCyI=
MIME-Version: 1.0
Received: by 10.100.205.15 with SMTP id c15mr1991309ang.82.1239200880529; Wed, 
	08 Apr 2009 07:28:00 -0700 (PDT)
Date: Wed, 8 Apr 2009 16:28:00 +0200
Message-ID: <d2b9ea600904080728vd8fad4n7cd4c1a2bd73276d@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.153
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS,URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH v3] mingw-binutils: restructure and update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 14:31:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 conf/checksums.ini                                 |    7 ++++---
 ...w-binutils-canadian-cross_2.17.50-20060824-1.bb |    9 +--------
 .../mingw-binutils-canadian-cross_2.19.1.bb        |    8 +-------
 recipes/binutils/mingw-binutils.inc                |   11 +++++++++++
 .../binutils/mingw-binutils_2.17.50-20060824-1.bb  |   12 +-----------
 recipes/binutils/mingw-binutils_2.19.1.bb          |   13 +------------
 6 files changed, 19 insertions(+), 41 deletions(-)
 create mode 100644 recipes/binutils/mingw-binutils.inc

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 20dc248..3249090 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -2550,6 +2550,10 @@
sha256=6fe3c4b2d45a50582f832bc77deb4e3da74a15ea8e09dbb214b9c44e7c3378fc
 md5=9d22ee4dafa3a194457caf4706f9cf01
 sha256=487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b65632b6c945e961ee9b

+[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
+md5=ad3f2b5fdcd599a772ad75fec2c384d8
+sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7
+
 [ftp://ftp.gnu.org/gnu/binutils/binutils-2.19.1.tar.bz2]
 md5=09a8c5821a2dfdbb20665bc0bd680791
 sha256=3e8225b4d7ace0a2039de752e11fd6922d3b89a7259a292c347391c4788739f6
@@ -26886,6 +26890,3 @@
sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

-[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
-md5=ad3f2b5fdcd599a772ad75fec2c384d8
-sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7
diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
b/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
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
diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
index 130dea5..7f80a77 100644
--- a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
+++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
@@ -1,10 +1,4 @@
 require mingw-binutils_${PV}.bb
 require binutils-canadian-cross.inc

-DEFAULT_PREFERENCE_sdk-mingw32 = "1"
-
-require binutils-canadian-cross.inc
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
-
-S = "${WORKDIR}/binutils-${PV}"
+DEFAULT_PREFERENCE_mingw32 = "1"
diff --git a/recipes/binutils/mingw-binutils.inc
b/recipes/binutils/mingw-binutils.inc
new file mode 100644
index 0000000..fbef1ea
--- /dev/null
+++ b/recipes/binutils/mingw-binutils.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
+HOMEPAGE = "http://www.mingw.org/"
+PR = "r1"
+
+require binutils.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
b/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
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
diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb
b/recipes/binutils/mingw-binutils_2.19.1.bb
index 19d1077..0f719ed 100644
--- a/recipes/binutils/mingw-binutils_2.19.1.bb
+++ b/recipes/binutils/mingw-binutils_2.19.1.bb
@@ -1,12 +1 @@
-PR = "r1"
-
-require binutils.inc
-
-DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
-HOMEPAGE = "http://www.mingw.org/"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
-
-S = "${WORKDIR}/binutils-${PV}"
-
-DEFAULT_PREFERENCE = "0"
+require mingw-binutils.inc
-- 
1.6.2.2


