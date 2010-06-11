Received: from server211.wifirst.net ([213.91.4.211] helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <adrien.demarez@bolloretelecom.eu>)
	id 1ON7fe-0002jh-Hn for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 19:05:35 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 55DB15FE1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 19:01:06 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 079565FE63
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 19:01:06 +0200 (CEST)
Received: from blini.bolloretelecom.eu
	(LMontsouris-156-26-24-166.w80-14.abo.wanadoo.fr [80.14.183.166])
	by bart.wifirst.net (Postfix) with ESMTP id A08705FE1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 19:01:05 +0200 (CEST)
Received: from karteumbook.polyconseil.fr (KarteumBook.polyconseil.fr
	[192.168.95.175])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id F15DC23EB6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 19:01:04 +0200 (CEST)
From: Adrien Demarez <adrien.demarez@bolloretelecom.eu>
Mime-Version: 1.0 (Apple Message framework v1078)
Date: Fri, 11 Jun 2010 19:01:03 +0200
In-Reply-To: <4BE97940.7030404@freyther.de>
To: openembedded-devel@lists.openembedded.org
References: <6E4816EA-E232-4559-BA26-E62F885B0644@bolloretelecom.eu>
	<4BE97940.7030404@freyther.de>
Message-Id: <A033FE23-52A1-48E9-A00F-34733F9DF66E@bolloretelecom.eu>
X-Mailer: Apple Mail (2.1078)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: adrien.demarez@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Trolltech FTP -> Nokia HTTP
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
X-List-Received-Date: Fri, 11 Jun 2010 17:05:35 -0000
X-Groupsio-MsgNum: 20106
Content-Type: multipart/mixed; boundary=Apple-Mail-26--531763000

--Apple-Mail-26--531763000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Oops, sorry for the missing patch file !
Please find the patch enclosed with this mail !


N.B.: very simple patch since the directory structure does not change between the Nokia HTTP and the Trolltech FTP. Thus I have basically done this : for i in `grep -r ftp.trolltech.com *| cut -d: -f1`; do sed -i -e 's!ftp://ftp.trolltech.com/!http://get.qt.nokia.com/!g' $i; done

Best regards,

--
Adrien Demarez
Bolloré telecom
Bureaux/Office : 11bis, rue Scribe | F-75009 Paris
Tel : +33 1 78 14 04 08 / +33 6 49 46 96 03
http://www.bolloretelecom.eu
>> Mobile broadband is here and across Europe! See us @ http://www.wimaxoperators.org/regional/europe

Holger Freyther wrote :

> Adrien Demarez wrote:
>> Hi all,
>> 
>> Most products from Trolltech still have their SRC_URI pointing to ftp://ftp.trolltech.com.
>> Since Trolltech was bought by Nokia, everything now hosted on http://get.qt.nokia.com/, with the same directory structure. Although the legacy Trolltech FTP is still working, the downloads on http://get.qt.nokia.com/* are much faster, and also probably more reliable in the long term. Thus I propose to change the SRC_URI of all Trolltech softwares (e.g. QT...) as described in the attached patch (of course, the checksums do not change).
> 
> You missed the patch? But the proposal sounds sane.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--Apple-Mail-26--531763000
Content-Disposition: attachment;
	filename=trolltech2nokia.patch
Content-Type: application/octet-stream;
	name="trolltech2nokia.patch"
Content-Transfer-Encoding: 7bit

diff --git a/contrib/qa/checksum/checksum.py b/contrib/qa/checksum/checksum.py
index 6880f04..95afb76 100644
--- a/contrib/qa/checksum/checksum.py
+++ b/contrib/qa/checksum/checksum.py
@@ -71,4 +71,4 @@ def verify_file(config_path, pn, pv, src_uri, localpath):
 
 
 # Test it
-verify_file("sample.conf", "qtopia-core", "4.3.0", "ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-4.2.3.tar.gz", "test.file")
+verify_file("sample.conf", "qtopia-core", "4.3.0", "http://get.qt.nokia.com/qt/source/qtopia-core-opensource-4.2.3.tar.gz", "test.file")
diff --git a/contrib/qa/checksum/sample.conf b/contrib/qa/checksum/sample.conf
index 478a9a0..6cf7cac 100644
--- a/contrib/qa/checksum/sample.conf
+++ b/contrib/qa/checksum/sample.conf
@@ -1,8 +1,8 @@
-[qtopia-core-4.3-ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-4.3.0beta.tar.gz]
+[qtopia-core-4.3-http://get.qt.nokia.com/qt/source/qtopia-core-opensource-4.3.0beta.tar.gz]
 md5=123
 sha256=1000
 
-[qtopia-core-ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-4.2.3.tar.gz]
+[qtopia-core-http://get.qt.nokia.com/qt/source/qtopia-core-opensource-4.2.3.tar.gz]
 md5=d41d8cd98f00b204e9800998ecf8427e
 sha256=e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
 
diff --git a/recipes/qmake/qmake-native_1.07a.bb b/recipes/qmake/qmake-native_1.07a.bb
index 36efe89..ae9a102 100644
--- a/recipes/qmake/qmake-native_1.07a.bb
+++ b/recipes/qmake/qmake-native_1.07a.bb
@@ -7,7 +7,7 @@ PR = "r5"
 
 QTEVER = "qt-embedded-free-3.3.5"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/${QTEVER}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/${QTEVER}.tar.bz2 \
            file://linux-oe-qmake.conf"
 S = "${WORKDIR}/${QTEVER}"
 
diff --git a/recipes/qmake/qmake2.inc b/recipes/qmake/qmake2.inc
index 0e0f9cd..d003da2 100644
--- a/recipes/qmake/qmake2.inc
+++ b/recipes/qmake/qmake2.inc
@@ -10,7 +10,7 @@ DEPENDS = "uicmoc4-native"
 
 QTVER = "qt-embedded-linux-opensource-src-${QTVERSION}"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/${QTVER}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/${QTVER}.tar.bz2 \
            file://0001-fix-mkspecs.patch \
            file://qt-config.patch \
            file://use-lflags-last.patch \
diff --git a/recipes/qpf-fonts/qpf-qte_2.3.10.bb b/recipes/qpf-fonts/qpf-qte_2.3.10.bb
index 07b6fbb..a399627 100644
--- a/recipes/qpf-fonts/qpf-qte_2.3.10.bb
+++ b/recipes/qpf-fonts/qpf-qte_2.3.10.bb
@@ -23,7 +23,7 @@ PROVIDES += "qte-font-unifont"
 RPROVIDES_qte-font-unifont += "virtual-japanese-font"
 RPROVIDES_qte-font-japanese += "virtual-japanese-font"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz"
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz"
 S = "${WORKDIR}/qt-${PV}"
 
 QPF_PKGPATTERN = "qte-font-%s"
diff --git a/recipes/qpf-fonts/qpf-qte_3.3.5.bb b/recipes/qpf-fonts/qpf-qte_3.3.5.bb
index b467271..35d354f 100644
--- a/recipes/qpf-fonts/qpf-qte_3.3.5.bb
+++ b/recipes/qpf-fonts/qpf-qte_3.3.5.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
 LICENSE = "GPL QPL"
 PR = "r6"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-free-${PV}.tar.bz2"
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/qt-embedded-free-${PV}.tar.bz2"
 S = "${WORKDIR}/qt-embedded-free-${PV}"
 
 do_compile() {
diff --git a/recipes/qt/qt-x11-free-native_3.3.5.bb b/recipes/qt/qt-x11-free-native_3.3.5.bb
index fd77159..a5c0d9e 100644
--- a/recipes/qt/qt-x11-free-native_3.3.5.bb
+++ b/recipes/qt/qt-x11-free-native_3.3.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.trolltech.com"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qt-x11-free"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
 	   file://no-examples.patch"
 S = "${WORKDIR}/qt-x11-free-${PV}"
 
diff --git a/recipes/qt/qt-x11-free_3.3.6.bb b/recipes/qt/qt-x11-free_3.3.6.bb
index 8a8d5d9..86e213b 100644
--- a/recipes/qt/qt-x11-free_3.3.6.bb
+++ b/recipes/qt/qt-x11-free_3.3.6.bb
@@ -2,7 +2,7 @@ DEPENDS = "uicmoc3-native freetype virtual/libx11 xft libxext libxrender libxran
 PROVIDES = "qt3x11"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
 	   file://configure.patch \
 	   file://no-examples.patch \
            file://gcc4_1-HACK.patch"
diff --git a/recipes/qt/qt-x11-free_3.3.7.bb b/recipes/qt/qt-x11-free_3.3.7.bb
index 1d4d5f9..9124c39 100644
--- a/recipes/qt/qt-x11-free_3.3.7.bb
+++ b/recipes/qt/qt-x11-free_3.3.7.bb
@@ -2,7 +2,7 @@ DEPENDS = "uicmoc3-native freetype virtual/libx11 libxmu xft libxext libxrender
 PROVIDES = "qt3x11"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
 	   file://configure.patch \
 	   file://no-examples.patch \
            file://gcc4_1-HACK.patch"
diff --git a/recipes/qt4/qt-4.6.0.inc b/recipes/qt4/qt-4.6.0.inc
index d161416..0f6ce22 100644
--- a/recipes/qt4/qt-4.6.0.inc
+++ b/recipes/qt4/qt-4.6.0.inc
@@ -2,7 +2,7 @@ DEFAULT_PREFERENCE = "-1"
 
 FILESPATHPKG .= ":qt-${PV}"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff --git a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
index 35eb4b3..000307c 100644
--- a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
+++ b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "\
-	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${SRCVER}.tar.gz \
+	http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${SRCVER}.tar.gz \
 	file://0004-no-qmake.patch \
 	file://hack-out-pg_config.patch \
 	file://0006-freetype-host-includes.patch \
diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
index c4c86d2..1f8c596 100644
--- a/recipes/qt4/qt-4.6.2.inc
+++ b/recipes/qt4/qt-4.6.2.inc
@@ -2,7 +2,7 @@ DEFAULT_PREFERENCE = "-1"
 
 FILESPATHPKG .= ":qt-${PV}"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 436f64c..c0cb275 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -11,7 +11,7 @@ QT_BASE_LIB  ?= "libqt-embedded"
 QT_DIR_NAME = "qtopia"
 QT_LIBINFIX = "E"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index b6e3107..a273775 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -9,7 +9,7 @@ INC_PR = "r7"
 
 inherit native
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://qt-config.patch \
            file://g++.conf \
            file://linux.conf"
diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tools-native_4.4.3.bb
index c7915f3..78a925d 100644
--- a/recipes/qt4/qt4-tools-native_4.4.3.bb
+++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
@@ -1,7 +1,7 @@
 require qt4-tools-native.inc
 
 # Older releases have different source archive name, than .inc
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-lflags.patch \
            file://qt-config.patch \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-native_4.5.2.bb b/recipes/qt4/qt4-tools-native_4.5.2.bb
index 206e486..07eae88 100644
--- a/recipes/qt4/qt4-tools-native_4.5.2.bb
+++ b/recipes/qt4/qt4-tools-native_4.5.2.bb
@@ -1,7 +1,7 @@
 require qt4-tools-native.inc
 
 # Older releases have different source archive name, than .inc
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-lflags.patch \
            file://qt-config.patch \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
index d54debf..3d57071 100644
--- a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
+++ b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
@@ -7,7 +7,7 @@ SRCVER = "4.7.0-beta1"
 PV = "4.6.2+${SRCVER}"
 PR = "${INC_PR}.0"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${SRCVER}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${SRCVER}.tar.gz \
            file://fix.xlib-test.libs.patch \
            file://qt-config.patch \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-sdk_4.5.2.bb b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
index 0fd4890..914a14e 100644
--- a/recipes/qt4/qt4-tools-sdk_4.5.2.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 
 inherit sdk
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-lflags.patch \
            file://qt-config.patch \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-sdk_4.6.0.bb b/recipes/qt4/qt4-tools-sdk_4.6.0.bb
index 240f053..053a03b 100644
--- a/recipes/qt4/qt4-tools-sdk_4.6.0.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.6.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 DEFAULT_PREFERENCE = "-1"
 inherit sdk
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://configure-lflags.patch \
            file://qt-config.patch \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-sdk_4.6.2.bb b/recipes/qt4/qt4-tools-sdk_4.6.2.bb
index faf0567..328b87a 100644
--- a/recipes/qt4/qt4-tools-sdk_4.6.2.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.6.2.bb
@@ -10,7 +10,7 @@ inherit sdk
 
 PR = "r1"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://configure-lflags.patch \
            file://qt-config.patch \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index fc96f03..a52ff99 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -7,7 +7,7 @@ DEPENDS += "virtual/libx11 fontconfig xft libxext libxrender libxrandr libxcurso
 
 INC_PR = "r17"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \
diff --git a/recipes/qte/qte-common_2.3.10.inc b/recipes/qte/qte-common_2.3.10.inc
index 18811c7..ce66f83 100644
--- a/recipes/qte/qte-common_2.3.10.inc
+++ b/recipes/qte/qte-common_2.3.10.inc
@@ -18,7 +18,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qte-${PV}"
 #CXXFLAGS += "-fno-visibility-inlines-hidden"
 CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz;md5sum=1f7ad30113afc500cab7f5b2f4dec0d7 \
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz;md5sum=1f7ad30113afc500cab7f5b2f4dec0d7 \
    	   file://qpe.patch \
 	   file://vt-switch.patch \
 	   file://daemonize.patch \
diff --git a/recipes/tmake/tmake_1.11.bb b/recipes/tmake/tmake_1.11.bb
index 3707527..5f9c3bc 100644
--- a/recipes/tmake/tmake_1.11.bb
+++ b/recipes/tmake/tmake_1.11.bb
@@ -1,4 +1,4 @@
-SRC_URI = "ftp://ftp.trolltech.com/pub/freebies/tmake/tmake-${PV}.tar.gz"
+SRC_URI = "http://get.qt.nokia.com/pub/freebies/tmake/tmake-${PV}.tar.gz"
 DESCRIPTION = "tmake is an easy-to-use tool for creating and maintaining makefiles across many platforms and compilers."
 LICENSE = "Unknown"
 DEPENDS = ""
diff --git a/recipes/uicmoc/uicmoc-native_2.3.10.bb b/recipes/uicmoc/uicmoc-native_2.3.10.bb
index c161571..b9a4675 100644
--- a/recipes/uicmoc/uicmoc-native_2.3.10.bb
+++ b/recipes/uicmoc/uicmoc-native_2.3.10.bb
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "GPL QPL"
 PR = "r4"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
            file://fix-makefile.patch \
            file://gcc3_4.patch \
            file://gcc4.patch \
diff --git a/recipes/uicmoc/uicmoc3-native_3.3.5.bb b/recipes/uicmoc/uicmoc3-native_3.3.5.bb
index ab4ab80..e652042 100644
--- a/recipes/uicmoc/uicmoc3-native_3.3.5.bb
+++ b/recipes/uicmoc/uicmoc3-native_3.3.5.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL QPL"
 DEPENDS = "qmake-native"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-free-${PV}.tar.bz2 \
            file://no-examples.patch \
            file://64bit-cleanup.patch"
 S = "${WORKDIR}/qt-embedded-free-${PV}"
diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-native.inc
index 1124226..25a5c8e 100644
--- a/recipes/uicmoc/uicmoc4-native.inc
+++ b/recipes/uicmoc/uicmoc4-native.inc
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 PR = "r1"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-fix.patch"
 S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 

--Apple-Mail-26--531763000--
