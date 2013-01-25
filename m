Received: from mail-qc0-f177.google.com ([209.85.216.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1Typ87-0007DS-Vc
	for openembedded-devel@openembedded.org; Fri, 25 Jan 2013 20:40:04 +0100
Received: by mail-qc0-f177.google.com with SMTP id u28so363856qcs.22
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Jan 2013 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=bXS2sB1ThxURTQzVftx5KUCwXJMWxEEicWDSDgWiq98=;
	b=nx4AiIgyZxsLJW0ZrLzmFrFKEjqCCK0t9JoTM2Ja1hc/+191GVE6ra3nyFJaL972Sq
	aqBWiuNqHPUKxZHCwe1232Wcmi6ZI4k4+Eqcc/O8LDzlvXwOrCJSo90BY5lpU5e7+/L6
	2O52lvwlqIZab7vsQ8Ba/nUhC8Ck0gTGgGTf0l3M2gMq8IH7yM00VnEqjoGLbG3FEk/g
	S8UI6oZJodQ5Z9V6Z8g7RCqGV6zb67uza0JQWnyqsMB1Quyz5fPnUEWuCUAkdgSTzetk
	AyR8vIzbZ0GF/cGifXc+eORM4/b2ea/njHr5jOTCZ9ghcrtjzQKPBkCcPyqibHhBgpqS
	hj9g==
X-Received: by 10.224.180.212 with SMTP id bv20mr6958341qab.6.1359141869060;
	Fri, 25 Jan 2013 11:24:29 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-188-95.ronkva.east.verizon.net. [96.240.188.95])
	by mx.google.com with ESMTPS id bb8sm958683qeb.5.2013.01.25.11.24.27
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:24:28 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Fri, 25 Jan 2013 14:24:26 -0500
Message-Id: <1359141866-19402-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] gnuradio : Use PACKAGECONFIG so users can tweak build options.
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
X-List-Received-Date: Fri, 25 Jan 2013 19:40:04 -0000

I hear from users that they are fiddling with the recipe to build gnuradio
with different options for various purposes. Start adding PACKAGECONFIG
support to reduce user editing of the recipe.

Currently these options are supported:

uhd : enable support for UHD based hardware.
grc: Build gnuradio companion.
qtgui: Build the qtgui component.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 30 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index e1a023f..85f52fc 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -4,8 +4,17 @@ SECTION =  "apps"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "uhd gsl fftwf python alsa-lib boost cppunit \
-           swig-native python-numpy python-pygtk orc qt4-x11-free qwt"
+DEPENDS = "gsl fftwf python alsa-lib boost cppunit \
+           swig-native python-numpy python-cheetah-native orc"
+
+#Available PACKAGECONFIG options are qt grc uhd
+PACKAGECONFIG ??= "qtgui grc uhd"
+
+PACKAGECONFIG[uhd] = "-DENABLE_GR_UHD=ON,-DENABLE_GR_UHD=OFF,uhd,"
+PACKAGECONFIG[grc] = "-DENABLE_GRC=ON,-DENABLE_GRC=OFF,python-pygtk python-cheetah, "
+
+PACKAGECONFIG[qtgui] = "-DENABLE_GR_QTGUI=ON,-DENABLE_GR_QTGUI=OFF,qt4-x11-free qwt, "
+
 
 inherit distutils-base cmake pkgconfig
 
@@ -16,8 +25,9 @@ RDEPENDS_${PN} = "python-core python-audio python-threading python-codecs \
                   python-lang python-textutils python-shell python-pickle \
                   python-compiler python-pkgutil python-pydoc python-mmap \
                   python-netclient python-difflib \
-                  python-pprint python-numpy python-pygtk python-lxml \
+                  python-pprint python-numpy  \
                  "
+RDEPENDS_${PN}-grc = "python-pygtk python-lxml python-cheetah"
 
 C_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -68,7 +78,19 @@ S="${WORKDIR}/git"
 OECMAKE_BUILDPATH = "${S}/build"
 OECMAKE_SOURCEPATH = "${S}"
 
-EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE -DENABLE_GR_QTGUI=ON -DENABLE_GR_WXGUI=OFF -DENABLE_GR_VIDEO_SDL=OFF -DQT_HEADERS_DIR=${STAGING_INCDIR}/qt4 -DQT_QTCORE_INCLUDE_DIR=${STAGING_INCDIR}/qt4/QtCore -DQT_LIBRARY_DIR=${STAGING_LIBDIR} -DQT_QTCORE_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtCore.so -DQT_QTGUI_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtGui.so -DENABLE_GR_FCD=OFF -DIMPORT_EXECUTABLES=${S}/gr-vocoder/lib/generate_codebook.txt"
+EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE \
+                 -DENABLE_GR_FCD=OFF \
+                 -DENABLE_GR_WXGUI=OFF \
+                 -DENABLE_GR_VIDEO_SDL=OFF \
+                 -DIMPORT_EXECUTABLES=${S}/gr-vocoder/lib/generate_codebook.txt \
+                 -DQT_HEADERS_DIR=${STAGING_INCDIR}/qt4 \
+                 -DQT_QTCORE_INCLUDE_DIR=${STAGING_INCDIR}/qt4/QtCore \
+                 -DQT_LIBRARY_DIR=${STAGING_LIBDIR} \
+                 -DQT_QTCORE_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtCore.so \
+                 -DQT_QTGUI_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtGui.so \
+"
+
+inherit distutils-base cmake pkgconfig
 
 EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
 
-- 
1.7.11.7



