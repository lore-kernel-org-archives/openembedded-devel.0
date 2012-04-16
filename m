Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SJcmi-00033n-JE
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 05:39:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3G2Kxh6001776
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Apr 2012 19:20:59 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Sun, 15 Apr 2012 19:20:59 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:20:33 +0800
Message-ID: <1334542833-27552-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.202]
Subject: [PATCH 3/3] kdelib4-native: build makekdewidgets
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
X-List-Received-Date: Mon, 16 Apr 2012 03:39:25 -0000
Content-Type: text/plain

qt4-native has been updated and open phonon and openssl support,
makekdewidgets could be successfully build. So build it.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 recipes-kde-base/kdelibs4-native_git.bb |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/recipes-kde-base/kdelibs4-native_git.bb b/recipes-kde-base/kdelibs4-native_git.bb
index decba41..36241fa 100644
--- a/recipes-kde-base/kdelibs4-native_git.bb
+++ b/recipes-kde-base/kdelibs4-native_git.bb
@@ -2,18 +2,15 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5c213a7de3f013310bd272cdb6eb7a24"
 
-DEPENDS = "automoc4-native giflib-native attica-native perl-native"
-#strigi-native
-#soprano-native
-# jpeg-native libpng-native
-
+DEPENDS = "automoc4-native giflib-native attica-native perl-native libdbusmenu-qt-native"
 
 inherit kde_cmake kde_without_docs mime native perlnative
 
-
 SRC_URI = "git://anongit.kde.org/kdelibs.git;branch=v4.8.0 \
 	  file://0001-Don-t-build-documentation-disable-Strigi.patch \
 	  file://0002-Fix-openssl-check.patch \
+	  file://0003-Fix-FindKDE4Internals-cmake-file.patch \
+	  file://0004-Fix-the-path-to-Icemaker.patch \
 	  file://0005-Remove-docs-so-they-don-t-get-pulled-in-elsewhere.patch \
 	  "
 
@@ -32,12 +29,13 @@ EXTRA_OECMAKE =+ "\
 		  -DKJS_FORCE_DISABLE_PCRE=TRUE \
 		  -DSTRIGI_REQUIRED=FALSE \
 		  -DSTRIGI_INCLUDE_DIR=TRUE \
+		  -DOE_CROSSCOMPILING=FALSE \
 		 "
 
 do_compile() {
   cd ${S}/build && make -C kdecore/kconfig_compiler
   cd ${S}/build && make -C kjs icemaker
-#  cd ${S}/build && oe_runmake CC="${CC}" CXX="${CXX}"
+  cd ${S}/build && make -C kdewidgets makekdewidgets
 }
 
 do_install() {
@@ -45,5 +43,5 @@ do_install() {
 
   install -m 0755 ${S}/build/bin/icemaker ${D}${bindir}
   install -m 0755 ${S}/build/bin/kconfig_compiler ${D}${bindir}
-#  install -m 0755 ${S}/build/bin/makekdewidgets ${D}${bindir}
+  install -m 0755 ${S}/build/bin/makekdewidgets ${D}${bindir}
 }
-- 
1.7.5.4



