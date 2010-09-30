Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P17Vh-0001kM-Ag
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 03:01:03 +0200
Received: by pxi11 with SMTP id 11so351445pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=snJPTJRsg+Ej6m1E8te6Qlt0MnibnAwXYcD37UJPeuA=;
	b=J8+m9eojhm/pgpNBI00RpbQywr2F+Dg6mSAMrir7qb1/X/+D3aoRvWTsu6sWOkthax
	gmSRlLliqWzmT23s/imATkscJlDuXdGwl0ckfMcw3WweAoK60HMDeTA4G4VtB764mP+9
	H0nRPUMBV9u609NhSpEJqyErGj3AxmEWJhXCM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=ml9a5Q3laeeYZH5HybzjGsMttvqUt1oB4t7rtoewQNuFLa9M2rrIXww7OUwTVIuRMM
	HQiLvGd+w6S9IsSE4djR1lTFZ8saAgZ74qJyjndheF/7cbRsH51B7/YxTOqsEGSQrq7b
	f1Fgcg1xMZo7lgkga+ttPdPW7R/tnYDF978/8=
Received: by 10.142.148.18 with SMTP id v18mr2319589wfd.9.1285808418952;
	Wed, 29 Sep 2010 18:00:18 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	v3sm10918038wfv.23.2010.09.29.18.00.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Sep 2010 18:00:18 -0700 (PDT)
Message-ID: <4CA3E11C.50007@gmail.com>
Date: Thu, 30 Sep 2010 10:30:12 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gdb: Don't clobber files installed by binutils.
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
X-List-Received-Date: Thu, 30 Sep 2010 01:01:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Also, move INC_PR into gdb-common.inc and propagate it into all recipes.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gdb/gdb-canadian-sdk_6.8.bb |    2 +-
 recipes/gdb/gdb-canadian-sdk_7.0.bb |    2 ++
 recipes/gdb/gdb-canadian-sdk_7.1.bb |    2 ++
 recipes/gdb/gdb-common.inc          |    9 ++++++++-
 recipes/gdb/gdb-cross-sdk.inc       |    2 --
 recipes/gdb/gdb-cross_6.3.bb        |    2 +-
 recipes/gdb/gdb-cross_6.4.bb        |    2 +-
 recipes/gdb/gdb-cross_6.6.bb        |    2 +-
 recipes/gdb/gdb-cross_6.7.1.bb      |    2 +-
 recipes/gdb/gdb-cross_6.8.bb        |    2 +-
 recipes/gdb/gdb-cross_7.0.bb        |    2 +-
 recipes/gdb/gdb-cross_7.1.bb        |    2 +-
 recipes/gdb/gdb_6.3.bb              |    2 +-
 recipes/gdb/gdb_6.4.bb              |    2 +-
 recipes/gdb/gdb_6.6.bb              |    2 +-
 recipes/gdb/gdb_6.7.1.bb            |    2 +-
 recipes/gdb/gdb_6.8.bb              |    2 +-
 recipes/gdb/gdb_7.0.bb              |    2 +-
 recipes/gdb/gdb_7.1.bb              |    2 +-
 recipes/gdb/gdbserver.inc           |    2 --
 20 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/recipes/gdb/gdb-canadian-sdk_6.8.bb b/recipes/gdb/gdb-canadian-sdk_6.8.bb
index 8051b02..8c9567b 100644
--- a/recipes/gdb/gdb-canadian-sdk_6.8.bb
+++ b/recipes/gdb/gdb-canadian-sdk_6.8.bb
@@ -7,7 +7,7 @@ SRC_URI += "file://gcc-4.3-build-error.patch;striplevel=0 \
 	    file://gdb-6.8-fix-compile-karmic.patch \
 	    file://gdb-6.8-mips-mingw-sim-fixup.patch"
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "925695333524108291dc4012c4c9cbb8"
 SRC_URI[sha256sum] = "a3c5455f30ffb3e6eeafb9e54598b48f9fbf46e3e99f431120360c183ddcc889"
diff --git a/recipes/gdb/gdb-canadian-sdk_7.0.bb b/recipes/gdb/gdb-canadian-sdk_7.0.bb
index b9001cd..22e94a6 100644
--- a/recipes/gdb/gdb-canadian-sdk_7.0.bb
+++ b/recipes/gdb/gdb-canadian-sdk_7.0.bb
@@ -7,5 +7,7 @@ SRC_URI += "\
 	    file://gdb-6.8-fix-compile-karmic.patch \
 	    "
 
+PR = "${INC_PR}.0"
+
 SRC_URI[md5sum] = "67b4144db385620d7b93f7b0c26800f7"
 SRC_URI[sha256sum] = "ccff6cab0e847c486d30b70bdddac4e6646bafcecaa3b63134d6e3d4d5a4b91d"
diff --git a/recipes/gdb/gdb-canadian-sdk_7.1.bb b/recipes/gdb/gdb-canadian-sdk_7.1.bb
index 95b9195..a166f8f 100644
--- a/recipes/gdb/gdb-canadian-sdk_7.1.bb
+++ b/recipes/gdb/gdb-canadian-sdk_7.1.bb
@@ -7,5 +7,7 @@ SRC_URI += "\
 	    file://gdb-6.8-fix-compile-karmic.patch \
 	    "
 
+PR = "${INC_PR}.0"
+
 SRC_URI[md5sum] = "01a6ce13bab5307cfac5c405e4afd1cf"
 SRC_URI[sha256sum] = "fc839b5226b94e58a5c7a526e67b7f8f93c7829d05dae1b6247f1bfe3829f291"
diff --git a/recipes/gdb/gdb-common.inc b/recipes/gdb/gdb-common.inc
index c3eef69..344c10b 100644
--- a/recipes/gdb/gdb-common.inc
+++ b/recipes/gdb/gdb-common.inc
@@ -4,6 +4,8 @@ LICENSE="GPL"
 SECTION = "devel"
 PRIORITY = "optional"
 
+INC_PR = "r8"
+
 inherit autotools
 
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz"
@@ -31,7 +33,12 @@ do_install_append() {
 
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
-	rm -f ${D}${libdir}/libiberty.a
+	rm -f ${D}${prefix}/lib{,64}/libiberty.a
+
+	# Use libbfd from binutils.
+	rm -f ${D}${prefix}/lib/libbfd.{,l}a
 
+	# Use libopcodes from binutils.
+	rm -f ${D}${prefix}/lib/libopcodes.{,l}a
 }
 
diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
index 3e214fe..bd7f0df 100644
--- a/recipes/gdb/gdb-cross-sdk.inc
+++ b/recipes/gdb/gdb-cross-sdk.inc
@@ -1,8 +1,6 @@
 require gdb-cross.inc
 LICENSE = "GPLv3"
 
-INC_PR = "r7"
-
 inherit sdk
 
 DEPENDS = "ncurses-sdk zlib-sdk flex-native"
diff --git a/recipes/gdb/gdb-cross_6.3.bb b/recipes/gdb/gdb-cross_6.3.bb
index dd066fb..c3e5cc0 100644
--- a/recipes/gdb/gdb-cross_6.3.bb
+++ b/recipes/gdb/gdb-cross_6.3.bb
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv2"
 
-PR = "r4"
+PR = "${INC_PR}.4"
 
 SRC_URI += "file://sim-install-makefile.patch \
 	file://sim-install-makefile-common.patch"
diff --git a/recipes/gdb/gdb-cross_6.4.bb b/recipes/gdb/gdb-cross_6.4.bb
index 268e210..a91d154 100644
--- a/recipes/gdb/gdb-cross_6.4.bb
+++ b/recipes/gdb/gdb-cross_6.4.bb
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv2"
 
-PR = "r2"
+PR = "${INC_PR}.2"
 
 SRC_URI[md5sum] = "7dc98022ee96bba5331f195dc8a5491a"
 SRC_URI[sha256sum] = "719f2bbd79d55cdd6f5e31b49cec49df71ddb32a4439dba678de0e09330096da"
diff --git a/recipes/gdb/gdb-cross_6.6.bb b/recipes/gdb/gdb-cross_6.6.bb
index d91c030..733c1a4 100644
--- a/recipes/gdb/gdb-cross_6.6.bb
+++ b/recipes/gdb/gdb-cross_6.6.bb
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv2"
 
-PR = "r4"
+PR = "${INC_PR}.4"
 
 SRC_URI += "file://early_debug_in_nptl.patch;striplevel=0"
 
diff --git a/recipes/gdb/gdb-cross_6.7.1.bb b/recipes/gdb/gdb-cross_6.7.1.bb
index ccc01d1..2d3d1f8 100644
--- a/recipes/gdb/gdb-cross_6.7.1.bb
+++ b/recipes/gdb/gdb-cross_6.7.1.bb
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv3"
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE_avr32 = "99"
 SRC_URI_avr32 = " http://avr32linux.org/twiki/pub/Main/GDBPatches/gdb-6.7.1.atmel.1.0.3.tar.bz2"
diff --git a/recipes/gdb/gdb-cross_6.8.bb b/recipes/gdb/gdb-cross_6.8.bb
index dba7c48..ca0f09f 100644
--- a/recipes/gdb/gdb-cross_6.8.bb
+++ b/recipes/gdb/gdb-cross_6.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 SRC_URI += "file://gcc-4.3-build-error.patch;striplevel=0 \
             file://gdb-6.8-fix-compile-karmic.patch"
 
-PR = "r4"
+PR = "${INC_PR}.4"
 
 SRC_URI[md5sum] = "925695333524108291dc4012c4c9cbb8"
 SRC_URI[sha256sum] = "a3c5455f30ffb3e6eeafb9e54598b48f9fbf46e3e99f431120360c183ddcc889"
diff --git a/recipes/gdb/gdb-cross_7.0.bb b/recipes/gdb/gdb-cross_7.0.bb
index 026a7c0..46f27ab 100644
--- a/recipes/gdb/gdb-cross_7.0.bb
+++ b/recipes/gdb/gdb-cross_7.0.bb
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv3"
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://gdb-6.8-fix-compile-karmic.patch"
diff --git a/recipes/gdb/gdb-cross_7.1.bb b/recipes/gdb/gdb-cross_7.1.bb
index 64a1b57..97ac04c 100644
--- a/recipes/gdb/gdb-cross_7.1.bb
+++ b/recipes/gdb/gdb-cross_7.1.bb
@@ -1,7 +1,7 @@
 require gdb-cross.inc
 LICENSE = "GPLv3"
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://gdb-6.8-fix-compile-karmic.patch \
diff --git a/recipes/gdb/gdb_6.3.bb b/recipes/gdb/gdb_6.3.bb
index 0ebc2e0..e49dd25 100644
--- a/recipes/gdb/gdb_6.3.bb
+++ b/recipes/gdb/gdb_6.3.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv2"
 
-PR = "r6"
+PR = "${INC_PR}.6"
 
 SRC_URI[md5sum] = "812de9e756d53c749ea5516d9ffa5905"
 SRC_URI[sha256sum] = "c06bf9715436b3a28c189163aa5ca42b46af8286659827f033eaaf7d8b1fc342"
diff --git a/recipes/gdb/gdb_6.4.bb b/recipes/gdb/gdb_6.4.bb
index 9eff83f..db65203 100644
--- a/recipes/gdb/gdb_6.4.bb
+++ b/recipes/gdb/gdb_6.4.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv2"
 
-PR = "r4"
+PR = "${INC_PR}.4"
 
 SRC_URI[md5sum] = "7dc98022ee96bba5331f195dc8a5491a"
 SRC_URI[sha256sum] = "719f2bbd79d55cdd6f5e31b49cec49df71ddb32a4439dba678de0e09330096da"
diff --git a/recipes/gdb/gdb_6.6.bb b/recipes/gdb/gdb_6.6.bb
index 24c193f..b630bed 100644
--- a/recipes/gdb/gdb_6.6.bb
+++ b/recipes/gdb/gdb_6.6.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv2"
 
-PR = "r7"
+PR = "${INC_PR}.7"
 
 SRC_URI += "file://early_debug_in_nptl.patch;striplevel=0"
 
diff --git a/recipes/gdb/gdb_6.7.1.bb b/recipes/gdb/gdb_6.7.1.bb
index 9f59978..d1512a1 100644
--- a/recipes/gdb/gdb_6.7.1.bb
+++ b/recipes/gdb/gdb_6.7.1.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv3"
 
-PR = "r3"
+PR = "${INC_PR}.3"
 
 DEFAULT_PREFERENCE_avr32 = "99"
 SRC_URI_avr32 = " http://avr32linux.org/twiki/pub/Main/GDBPatches/gdb-6.7.1.atmel.1.0.3.tar.bz2"
diff --git a/recipes/gdb/gdb_6.8.bb b/recipes/gdb/gdb_6.8.bb
index 630ca9e..616da72 100644
--- a/recipes/gdb/gdb_6.8.bb
+++ b/recipes/gdb/gdb_6.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 SRC_URI += "file://gcc-4.3-build-error.patch;striplevel=0 \
             file://gdb-6.8-fix-compile-karmic.patch"
 
-PR = "r5"
+PR = "${INC_PR}.5"
 
 SRC_URI[md5sum] = "925695333524108291dc4012c4c9cbb8"
 SRC_URI[sha256sum] = "a3c5455f30ffb3e6eeafb9e54598b48f9fbf46e3e99f431120360c183ddcc889"
diff --git a/recipes/gdb/gdb_7.0.bb b/recipes/gdb/gdb_7.0.bb
index 96c267c..abcde95 100644
--- a/recipes/gdb/gdb_7.0.bb
+++ b/recipes/gdb/gdb_7.0.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv3"
 
-PR = "r2"
+PR = "${INC_PR}.2"
 
 SRC_URI += "\
             file://gdb-6.8-fix-compile-karmic.patch"
diff --git a/recipes/gdb/gdb_7.1.bb b/recipes/gdb/gdb_7.1.bb
index 8caab0f..5b0f5c9 100644
--- a/recipes/gdb/gdb_7.1.bb
+++ b/recipes/gdb/gdb_7.1.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv3"
 
-PR = "r4"
+PR = "${INC_PR}.4"
 # there is a bug in GCC for SH4 it ICE's at Optlevel >O1
 # so workaround that for now.
 
diff --git a/recipes/gdb/gdbserver.inc b/recipes/gdb/gdbserver.inc
index 115f293..a976000 100644
--- a/recipes/gdb/gdbserver.inc
+++ b/recipes/gdb/gdbserver.inc
@@ -1,7 +1,5 @@
 require gdb-common.inc
 
-INC_PR = "r2"
-
 DEFAULT_PREFERENCE_avr32 = "-99"
 
 FILES_gdbserver = "${bindir}/gdbserver"
-- 
1.7.1



