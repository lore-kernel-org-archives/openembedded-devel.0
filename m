Received: from server211.wifirst.net ([213.91.4.211] helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <adrien.demarez@bolloretelecom.eu>)
	id 1NmmqW-0007Vk-Qr for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 12:34:37 +0100
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id C04A65FE7D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 12:21:44 +0100 (CET)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 772655FE7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 12:21:44 +0100 (CET)
Received: from blini.bolloretelecom.eu
	(LMontsouris-156-26-24-166.w80-14.abo.wanadoo.fr [80.14.183.166])
	by bart.wifirst.net (Postfix) with ESMTP id 1E0925FE7D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 12:21:44 +0100 (CET)
Received: from [192.168.95.185] (unknown [192.168.95.185])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id CBA9F23E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 12:21:43 +0100 (CET)
Message-Id: <F97EA517-D01C-4175-93A1-00BF60EFAD5F@bolloretelecom.eu>
From: Adrien Demarez <adrien.demarez@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 3 Mar 2010 12:21:43 +0100
X-Mailer: Apple Mail (2.936)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: adrien.demarez@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] switch sources for all Trolltech products to Nokia HTTP server
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
X-List-Received-Date: Wed, 03 Mar 2010 11:34:37 -0000
X-Groupsio-MsgNum: 17277
Content-Type: multipart/mixed; boundary=Apple-Mail-12--602188786

--Apple-Mail-12--602188786
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Hi all,

Most products from Trolltech still have their SRC-URI pointing to ftp://ftp.trolltech.com.
Since Trolltech was bought by Nokia, everything now hosted on http://get.qt.nokia.com/ 
, with the same directory structure.
Although the legacy Trolltech FTP is still working, the downloads on http://get.qt.nokia.com/* 
  are much faster, and also probably more reliable in the long term.  
Thus I propose to change the SRC_URI of all Trolltech products as  
described in the enclosed patch.

best regards,




--
Adrien Demarez
Bolloré telecom
Bureaux/Office : 11bis, rue Scribe | F-75009 Paris
Tel : +33 1 78 14 04 08
www.bolloretelecom.eu

--Apple-Mail-12--602188786
Content-Disposition: attachment;
	filename=trolltech2nokia.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="trolltech2nokia.patch"
Content-Transfer-Encoding: 7bit

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 498e050..60a263b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23722,7 +23722,7 @@ sha256=e828dc4aaa7948eafee343e70190dd8003498d50d9258d75d47f05f9970683db
 md5=66cfcc9cb5f4e32ef30b2c13de51499b
 sha256=99e73cec97c62fecaccc4a7f354392ea9964d8c20b0a4a330890c32dbac87732
 
-[ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-2.3.10-free.tar.gz]
+[http://get.qt.nokia.com/pub/qt/source/qt-embedded-2.3.10-free.tar.gz]
 md5=1f7ad30113afc500cab7f5b2f4dec0d7
 sha256=883363eb0c94de3d1e36f3ab9e09a8f127418d497213cc1a0ed1a1588ecd66b8
 
@@ -23734,35 +23734,35 @@ sha256=0a706cf4c2a70dfeff2e886f225007844a4675f5c6387fb46c4b7f7ef327b68e
 md5=fec42313fd5508d840240b5dd2fe27eb
 sha256=0a706cf4c2a70dfeff2e886f225007844a4675f5c6387fb46c4b7f7ef327b68e
 
-[ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-free-3.3.5.tar.bz2]
+[http://get.qt.nokia.com/pub/qt/source/qt-embedded-free-3.3.5.tar.bz2]
 md5=022d7a3c572b554f3c47b12cae71a8a4
 sha256=a97656796c0ef8e87dd83e6138bc406e31830d08f9b213e039d8be39ea65c8e4
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-free-3.3.5.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-free-3.3.5.tar.bz2]
 md5=022d7a3c572b554f3c47b12cae71a8a4
 sha256=a97656796c0ef8e87dd83e6138bc406e31830d08f9b213e039d8be39ea65c8e4
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.4.0.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-4.4.0.tar.bz2]
 md5=e17ad8c9dfecc95a3fd2bd5ed1d7bd3a
 sha256=79945d06de16736d14210139e8e68cf29f8ea312190d2375507511f367a2f872
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.4.1.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-4.4.1.tar.bz2]
 md5=491d41cae681a2bab2656f8adc3ba503
 sha256=37274eff0b7cfb6f5a01e2535639ccd3eb4e9c6b27902d1f3bdf68a705c438d0
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.4.3.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-4.4.3.tar.bz2]
 md5=9a639aec44a1e4c70040117183d247a3
 sha256=05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.5.0.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-4.5.0.tar.bz2]
 md5=3bd081c940c8580ecaabc1bd898e48f0
 sha256=4f6319c6031af47ef81fef08f465e4db61c0f169f5eb9bbc8f060cc3db3ffafa
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.5.1.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-4.5.1.tar.bz2]
 md5=43e7384c59625af0830032348f672a1d
 sha256=f525ad885675f4c2413d67d9a5efaf7c34862d88c796fe7e7e2d05a42a1a66c8
 
-[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.5.2.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-4.5.2.tar.bz2]
 md5=62186345c609a72b89f16d83bc7a130f
 sha256=272301a27e2f7bcd44c8d09f496e1c749c80b86d9489ea9c30bb265bf2dd02fc
 
@@ -23770,95 +23770,95 @@ sha256=272301a27e2f7bcd44c8d09f496e1c749c80b86d9489ea9c30bb265bf2dd02fc
 md5=61784f1bcac80f18f468b8dd013eab4f
 sha256=9cfe0418699e231587182b441c8f6ca68f109059c62bfc8dd9daeafb8277d211
 
-[ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-4.6.0.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-4.6.0.tar.gz]
 md5=2a7b5126f2450d8525af355fc4c12ad6
 sha256=55259c813324f6383cbd441aa2f23e01c320b6d63fbe3b5d52a7715055d28589
 
-[ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-4.6.1.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-4.6.1.tar.gz]
 md5=0542a4be6425451ab5f668c6899cac36
 sha256=4c84b39b8a2546854ce9c0c9f761dd55da76dab2c33eeb876e3d17db1d2ea0c5
 
-[ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-4.6.2.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-4.6.2.tar.gz]
 md5=eb651ee4b157c01696aa56777fc6e0e5
 sha256=176f51ddb06dce67ab4b2efc6b327dc21ed8f764c5d97acc15ff1f907c2affae
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-free-3.3.5.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-x11-free-3.3.5.tar.bz2]
 md5=05d04688c0c0230ed54e89102d689ca4
 sha256=aac89e862c74b2f3ead768e50e9fa7ada1e4225fe9d1d9e05723a3279259eb96
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-free-3.3.6.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-x11-free-3.3.6.tar.bz2]
 md5=dc1384c03ac08af21f6fefab32d982cf
 sha256=04f12083f6a6f7a8fd4d34a6c1efd37db76a67580c424f4fb7b7c43c0565e6ae
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-free-3.3.7.tar.bz2]
+[http://get.qt.nokia.com/qt/source/qt-x11-free-3.3.7.tar.bz2]
 md5=655e21cf6a7e66daf8ec6ceda81aae1e
 sha256=48c05b501029f0640db665fbc7f981a0efbf69ad3cf87a43c5eea4872f4f7ba1
 
-[ftp://ftp.trolltech.com/pub/qt/source/qt-x11-opensource-src-4.1.1.tar.gz]
+[http://get.qt.nokia.com/pub/qt/source/qt-x11-opensource-src-4.1.1.tar.gz]
 md5=d82b0374d481f93e481aad4e3f26893a
 sha256=a23860a7390bbbc87cf98833f8716cd03b88b1d6fce77e0624daba3150a177e9
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.1.1.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.1.1.tar.gz]
 md5=d82b0374d481f93e481aad4e3f26893a
 sha256=a23860a7390bbbc87cf98833f8716cd03b88b1d6fce77e0624daba3150a177e9
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.1.2.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.1.2.tar.gz]
 md5=18bca010d09b98e94210710047baca0a
 sha256=025655971eef7f76ece9754346d6eb4e2dd44ddf569c4c84de27836aa24b04a3
 
-[ftp://ftp.trolltech.com/pub/qt/source/qt-x11-opensource-src-4.2.3.tar.gz]
+[http://get.qt.nokia.com/pub/qt/source/qt-x11-opensource-src-4.2.3.tar.gz]
 md5=13f12bf58a32ebf15837fcd605cb3c99
 sha256=c163e72cb002435d1d261a47acdcb23e59c10e4263f983a5f2c2d2ca40ede75b
 
-[ftp://ftp.trolltech.com/pub/qt/source/qt-x11-opensource-src-4.3.0.tar.gz]
+[http://get.qt.nokia.com/pub/qt/source/qt-x11-opensource-src-4.3.0.tar.gz]
 md5=8012acea71b35c18247bd92c4721589d
 sha256=abc37774d327a9b1d1d35e223f014c7e92168cd6c7baf66156badca68f8f1440
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.3.3.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.3.3.tar.gz]
 md5=19678fe35170559cd6a6fa531c57799c
 sha256=89934bacc5cee5cb35a231275b0f9948f29483faf9082bed0e7255ce41751570
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.4.0.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.4.0.tar.gz]
 md5=f13ad0aa75efad314715930e663bad55
 sha256=4d1a5bf6a4e85eea83ef3e73d994f74cc4dd979e1023eaedef8da931ea37833a
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.4.1.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.4.1.tar.gz]
 md5=b09decad252b5181f300135e3122481d
 sha256=5aca7b784fc4de3db292666490ade84cfd1810f189c089c5c2810a710993f386
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.4.3.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.4.3.tar.gz]
 md5=376c003317c4417326ba2116370227d0
 sha256=79ea9fb46d75c3759e3e98ab0064a47eaa5bdbbc2a53d923d60bd8e9cd0bc5c6
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.5.0.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.5.0.tar.gz]
 md5=d6d1555b7a074e0a746f6247af402e11
 sha256=61831af6b71c7bd4e1ef542071225835d8c741fa8e079bceab8c83f712e396a1
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.5.1.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.5.1.tar.gz]
 md5=f81a94e2ab7713b2d375d4e5cfc8e051
 sha256=aa3f5a459d042681a321f33e8d99468337a00674d68b8a512e0078625c1f51da
 
-[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.5.2.tar.gz]
+[http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-4.5.2.tar.gz]
 md5=d8bcc070a58db25c228b7729ffad4550
 sha256=4e4c8619335cac14ba0c52d1555fab549a562fb774c1c08dcbd2be9de38120a2
 
-[ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-src-4.2.0.tar.gz]
+[http://get.qt.nokia.com/qt/source/qtopia-core-opensource-src-4.2.0.tar.gz]
 md5=9519eccf0638c9962f73a7b20da77e0e
 sha256=8fdbc7da376b22796879d6e3b756f71a8800ed1b35fc88aa76cddffd6f1fd883
 
-[ftp://ftp.trolltech.com/pub/qt/source/qtopia-core-opensource-src-4.3.2.tar.gz]
+[http://get.qt.nokia.com/pub/qt/source/qtopia-core-opensource-src-4.3.2.tar.gz]
 md5=70b729dd5dd8b2b432d685918e1971f1
 sha256=38af7b39e7805d8e3ba81091aa29af8bd38ce7cbbf8e721c8bb7ab810c38d963
 
-[ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-src-4.3.2.tar.gz]
+[http://get.qt.nokia.com/qt/source/qtopia-core-opensource-src-4.3.2.tar.gz]
 md5=70b729dd5dd8b2b432d685918e1971f1
 sha256=38af7b39e7805d8e3ba81091aa29af8bd38ce7cbbf8e721c8bb7ab810c38d963
 
-[ftp://ftp.trolltech.com/pub/qt/source/qtopia-core-opensource-src-4.3.3.tar.gz]
+[http://get.qt.nokia.com/pub/qt/source/qtopia-core-opensource-src-4.3.3.tar.gz]
 md5=f7022c57ec4cf4f1d5f5c8b8a70a9e5f
 sha256=2ed9f5006ac9f63db08bce409a3626141d5f6e8d562e25df5bd97cebc65ec10d
 
-[ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-src-4.3.3.tar.gz]
+[http://get.qt.nokia.com/qt/source/qtopia-core-opensource-src-4.3.3.tar.gz]
 md5=f7022c57ec4cf4f1d5f5c8b8a70a9e5f
 sha256=2ed9f5006ac9f63db08bce409a3626141d5f6e8d562e25df5bd97cebc65ec10d
 
@@ -26670,7 +26670,7 @@ sha256=bbc3bdbdefc81f7b186f1c5697f6939b5fc77d4569112edd1a6b3aceae177228
 md5=5e1c19500e30fc7580939c18b435f937
 sha256=3d79170d8c3a662fa717b6401e8004208df113aaf3b18689bbeb704a23bf5b9f
 
-[ftp://ftp.trolltech.com/pub/freebies/tmake/tmake-1.11.tar.gz]
+[http://get.qt.nokia.com/pub/freebies/tmake/tmake-1.11.tar.gz]
 md5=b007a86a83483ff9bd6795f45780ddce
 sha256=6d828029e276f42fee507f58ed0bd6890ef75f0e54f45f2b1129a2426c817c61
 
diff --git a/recipes/qmake/qmake-native_1.07a.bb b/recipes/qmake/qmake-native_1.07a.bb
index bb3e79b..41cb4b9 100644
--- a/recipes/qmake/qmake-native_1.07a.bb
+++ b/recipes/qmake/qmake-native_1.07a.bb
@@ -7,7 +7,7 @@ PR = "r5"
 
 QTEVER = "qt-embedded-free-3.3.5"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/${QTEVER}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/${QTEVER}.tar.bz2 \
            file://linux-oe-qmake.conf"
 S = "${WORKDIR}/${QTEVER}"
 
diff --git a/recipes/qmake/qmake2.inc b/recipes/qmake/qmake2.inc
index 6924d1f..5273a06 100644
--- a/recipes/qmake/qmake2.inc
+++ b/recipes/qmake/qmake2.inc
@@ -10,7 +10,7 @@ DEPENDS = "uicmoc4-native"
 
 QTVER = "qt-embedded-linux-opensource-src-${QTVERSION}"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/${QTVER}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/${QTVER}.tar.bz2 \
            file://0001-fix-mkspecs.patch;patch=1 \
            file://qt-config.patch;patch=1 \
            file://use-lflags-last.patch;patch=1 \
diff --git a/recipes/qpf-fonts/qpf-qte_2.3.10.bb b/recipes/qpf-fonts/qpf-qte_2.3.10.bb
index 16f1563..e5d8baa 100644
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
index 6ac091f..b35b8b4 100644
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
index f23d874..c9cd8fd 100644
--- a/recipes/qt/qt-x11-free-native_3.3.5.bb
+++ b/recipes/qt/qt-x11-free-native_3.3.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.trolltech.com"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qt-x11-free"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
 	   file://no-examples.patch;patch=1"
 S = "${WORKDIR}/qt-x11-free-${PV}"
 
diff --git a/recipes/qt/qt-x11-free_3.3.6.bb b/recipes/qt/qt-x11-free_3.3.6.bb
index f5ff6b0..2c915c6 100644
--- a/recipes/qt/qt-x11-free_3.3.6.bb
+++ b/recipes/qt/qt-x11-free_3.3.6.bb
@@ -2,7 +2,7 @@ DEPENDS = "uicmoc3-native freetype virtual/libx11 xft libxext libxrender libxran
 PROVIDES = "qt3x11"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
 	   file://configure.patch;patch=1 \
 	   file://no-examples.patch;patch=1 \
            file://gcc4_1-HACK.patch;patch=1"
diff --git a/recipes/qt/qt-x11-free_3.3.7.bb b/recipes/qt/qt-x11-free_3.3.7.bb
index e218073..a213ab6 100644
--- a/recipes/qt/qt-x11-free_3.3.7.bb
+++ b/recipes/qt/qt-x11-free_3.3.7.bb
@@ -2,7 +2,7 @@ DEPENDS = "uicmoc3-native freetype virtual/libx11 libxmu xft libxext libxrender
 PROVIDES = "qt3x11"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-free-${PV}.tar.bz2 \
 	   file://configure.patch;patch=1 \
 	   file://no-examples.patch;patch=1 \
            file://gcc4_1-HACK.patch;patch=1"
diff --git a/recipes/qt4/qt-4.6.0.inc b/recipes/qt4/qt-4.6.0.inc
index 91565f7..ec8708a 100644
--- a/recipes/qt4/qt-4.6.0.inc
+++ b/recipes/qt4/qt-4.6.0.inc
@@ -2,7 +2,7 @@ DEFAULT_PREFERENCE = "-1"
 
 FILESPATHPKG .= ":qt-${PV}"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch;patch=1 \
            file://0002-fix-resinit-declaration.patch;patch=1 \
            file://0004-no-qmake.patch;patch=1 \
diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
index 94777e5..f0e5657 100644
--- a/recipes/qt4/qt-4.6.2.inc
+++ b/recipes/qt4/qt-4.6.2.inc
@@ -2,7 +2,7 @@ DEFAULT_PREFERENCE = "-1"
 
 FILESPATHPKG .= ":qt-${PV}"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch;patch=1 \
            file://0002-fix-resinit-declaration.patch;patch=1 \
            file://0004-no-qmake.patch;patch=1 \
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index e8184e7..06a3883 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -11,7 +11,7 @@ QT_BASE_LIB  ?= "libqt-embedded"
 QT_DIR_NAME = "qtopia"
 QT_LIBINFIX = "E"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
            file://0002-fix-resinit-declaration.patch;patch=1 \
            file://0003-no-tools.patch;patch=1 \
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index bd0d2e1..be69129 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -9,7 +9,7 @@ INC_PR = "r6"
 
 inherit native
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
            file://linux.conf"
diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tools-native_4.4.3.bb
index 3ad402f..40a51cc 100644
--- a/recipes/qt4/qt4-tools-native_4.4.3.bb
+++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
@@ -1,7 +1,7 @@
 require qt4-tools-native.inc
 
 # Older releases have different source archive name, than .inc
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-lflags.patch;patch=1 \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-native_4.5.2.bb b/recipes/qt4/qt4-tools-native_4.5.2.bb
index 77171a1..6e01cc2 100644
--- a/recipes/qt4/qt4-tools-native_4.5.2.bb
+++ b/recipes/qt4/qt4-tools-native_4.5.2.bb
@@ -1,7 +1,7 @@
 require qt4-tools-native.inc
 
 # Older releases have different source archive name, than .inc
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-lflags.patch;patch=1 \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-sdk_4.5.2.bb b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
index c0f2f7a..b84c560 100644
--- a/recipes/qt4/qt4-tools-sdk_4.5.2.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 
 inherit sdk
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-lflags.patch;patch=1 \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-sdk_4.6.0.bb b/recipes/qt4/qt4-tools-sdk_4.6.0.bb
index b74b8a2..8fee0cb 100644
--- a/recipes/qt4/qt4-tools-sdk_4.6.0.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.6.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 DEFAULT_PREFERENCE = "-1"
 inherit sdk
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://configure-lflags.patch;patch=1 \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-tools-sdk_4.6.2.bb b/recipes/qt4/qt4-tools-sdk_4.6.2.bb
index b74b8a2..8fee0cb 100644
--- a/recipes/qt4/qt4-tools-sdk_4.6.2.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.6.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 DEFAULT_PREFERENCE = "-1"
 inherit sdk
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://configure-lflags.patch;patch=1 \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index dffe3a0..19928d9 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -7,7 +7,7 @@ DEPENDS += "virtual/libx11 fontconfig xft libxext libxrender libxrandr libxcurso
 
 INC_PR = "r14"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch;patch=1 \
            file://0002-fix-resinit-declaration.patch;patch=1 \
            file://0003-no-tools.patch;patch=1 \
diff --git a/recipes/qte/qte-common_2.3.10.inc b/recipes/qte/qte-common_2.3.10.inc
index cd2aa4f..5cc574b 100644
--- a/recipes/qte/qte-common_2.3.10.inc
+++ b/recipes/qte/qte-common_2.3.10.inc
@@ -18,7 +18,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qte-${PV}"
 #CXXFLAGS += "-fno-visibility-inlines-hidden"
 CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz;md5sum=1f7ad30113afc500cab7f5b2f4dec0d7 \
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz;md5sum=1f7ad30113afc500cab7f5b2f4dec0d7 \
    	   file://qpe.patch;patch=1 \
 	   file://vt-switch.patch;patch=1 \
 	   file://daemonize.patch;patch=1 \
diff --git a/recipes/tmake/tmake_1.11.bb b/recipes/tmake/tmake_1.11.bb
index 9d1ecd1..73fdcfd 100644
--- a/recipes/tmake/tmake_1.11.bb
+++ b/recipes/tmake/tmake_1.11.bb
@@ -1,4 +1,4 @@
-SRC_URI = "ftp://ftp.trolltech.com/pub/freebies/tmake/tmake-${PV}.tar.gz"
+SRC_URI = "http://get.qt.nokia.com/pub/freebies/tmake/tmake-${PV}.tar.gz"
 DESCRIPTION = "tmake is an easy-to-use tool for creating and maintaining makefiles across many platforms and compilers."
 LICENSE = "Unknown"
 DEPENDS = ""
diff --git a/recipes/uicmoc/uicmoc-native_2.3.10.bb b/recipes/uicmoc/uicmoc-native_2.3.10.bb
index 1674353..b1b149c 100644
--- a/recipes/uicmoc/uicmoc-native_2.3.10.bb
+++ b/recipes/uicmoc/uicmoc-native_2.3.10.bb
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "GPL QPL"
 PR = "r4"
 
-SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
+SRC_URI = "http://get.qt.nokia.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
            file://fix-makefile.patch;patch=1 \
            file://gcc3_4.patch;patch=1 \
            file://gcc4.patch;patch=1 \
diff --git a/recipes/uicmoc/uicmoc3-native_3.3.5.bb b/recipes/uicmoc/uicmoc3-native_3.3.5.bb
index 11b0c50..26af445 100644
--- a/recipes/uicmoc/uicmoc3-native_3.3.5.bb
+++ b/recipes/uicmoc/uicmoc3-native_3.3.5.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL QPL"
 DEPENDS = "qmake-native"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-free-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-free-${PV}.tar.bz2 \
            file://no-examples.patch;patch=1 \
            file://64bit-cleanup.patch;patch=1"
 S = "${WORKDIR}/qt-embedded-free-${PV}"
diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-native.inc
index 1a3e069..f9b0e5c 100644
--- a/recipes/uicmoc/uicmoc4-native.inc
+++ b/recipes/uicmoc/uicmoc4-native.inc
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 PR = "r1"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-fix.patch;patch=1"
 S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 

--Apple-Mail-12--602188786--
