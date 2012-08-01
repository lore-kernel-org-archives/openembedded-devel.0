Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhTw-00067E-0r
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:32 +0200
Received: by wibhq4 with SMTP id hq4so3911624wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mVcJu+G6Sz4CS2qqpgNVvfMvPV5NMIWBN4m2cjkQp7A=;
	b=M4gH+6ACT0kk3ljWb0/SAz+yqlLcqvHDRj25iYBvBkPRQdxy2fyAkgHt7u6ls6Bnl/
	DX3JYxGSOswM9HF/WuDDWADwavC54TvrRnrKoL2o22Aavr9anKjWg7ts1uD9FL+Tfe37
	R+agbfXWyGh9riGJ3Bn2zeqgYLyPkqCU26pPLpLpJFyY+JbvRPGGrN2pV5ifrmamPp9j
	lxFWR125ZAByJV2yuhA1hSnW6vPrT3hWrQADZstE0rXoVVM7awsmubE18W0idacaDGv4
	stgTLlVOEF8aPUBN9Dtr/mXkH6KgCUGzD+FdZBlrLsSuVD5eyZtHjuGHCkMohXDxhhK0
	CosA==
Received: by 10.216.132.76 with SMTP id n54mr9294977wei.135.1343859713203;
	Wed, 01 Aug 2012 15:21:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm12074568wib.0.2012.08.01.15.21.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:21:02 +0200
Message-Id: <4df04db5cb5fc05c1540d203aacab0dc6d976bba.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/8] sip: import from oe-classic and upgrade to latest
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb |   33 +++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb

diff --git a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb b/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
new file mode 100644
index 0000000..2ef10bf
--- /dev/null
+++ b/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "SIP is a C++/Python Wrapper Generator"
+AUTHOR = "Phil Thompson"
+HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://sipgen.sbf;endline=15;md5=88e887a386c18a01240d8d055da4e441"
+
+SRC_URI = "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/sip-${PV}.tar.gz"
+SRC_URI[md5sum] = "76192829cc42ec558db46e4f9e1d8ba9"
+SRC_URI[sha256sum] = "ec295f71ef339c5b98db5650865f2c6c1200c4085b7a3f33f284111e1f534ac1"
+S = "${WORKDIR}/sip-${PV}/sipgen"
+
+inherit qt4x11 native python-dir
+
+EXTRA_QMAKEVARS_POST += "DESTDIR=${S} CONFIG=console"
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+
+do_configure_prepend() {
+        cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
+}
+do_install() {
+        install -d ${D}${bindir}
+        install -m 0755 sip ${D}${bindir}/sip
+        # python-pyqt expects sip4
+        ln -sf sip ${D}${bindir}/sip4
+        cd ${WORKDIR}/sip-${PV} && python configure.py
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        install -m 0755 sip*.py ${D}${PYTHON_SITEPACKAGES_DIR}
+}
-- 
1.7.8.6



