Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SJcJh-0002fF-QR
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 05:09:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3G2KwGV014332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Apr 2012 19:20:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Sun, 15 Apr 2012 19:20:57 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:20:32 +0800
Message-ID: <1334542833-27552-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.202]
Subject: [PATCH 2/3] kdelibs4-native: re-add the original recipe
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
X-List-Received-Date: Mon, 16 Apr 2012 03:09:26 -0000
Content-Type: text/plain

The kdelibs4-native recipe is from Samuel Stirtzel and the recipe
has been deleted by commit: 586dcf21f376d50cbf9fc52bc769824ec92d73af

Because Samuel doesn't fill in the SRCREV, I add it with same commit
in kdelibs4.

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 recipes-kde-base/kdelibs4-native_git.bb |   49 +++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kde-base/kdelibs4-native_git.bb

diff --git a/recipes-kde-base/kdelibs4-native_git.bb b/recipes-kde-base/kdelibs4-native_git.bb
new file mode 100644
index 0000000..decba41
--- /dev/null
+++ b/recipes-kde-base/kdelibs4-native_git.bb
@@ -0,0 +1,49 @@
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5c213a7de3f013310bd272cdb6eb7a24"
+
+DEPENDS = "automoc4-native giflib-native attica-native perl-native"
+#strigi-native
+#soprano-native
+# jpeg-native libpng-native
+
+
+inherit kde_cmake kde_without_docs mime native perlnative
+
+
+SRC_URI = "git://anongit.kde.org/kdelibs.git;branch=v4.8.0 \
+	  file://0001-Don-t-build-documentation-disable-Strigi.patch \
+	  file://0002-Fix-openssl-check.patch \
+	  file://0005-Remove-docs-so-they-don-t-get-pulled-in-elsewhere.patch \
+	  "
+
+SRCREV = "1439483a67135f483632f4c4cd239e96d2ed61fc"
+PV = "4.8.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# kdelibs *must* be built out of tree
+OECMAKE_SOURCEPATH = ".."
+OECMAKE_BUILDPATH = "build"
+
+
+EXTRA_OECMAKE =+ "\
+		  -DAUTOMOC4_EXECUTABLE=${STAGING_BINDIR_NATIVE}/automoc4 \
+		  -DKJS_FORCE_DISABLE_PCRE=TRUE \
+		  -DSTRIGI_REQUIRED=FALSE \
+		  -DSTRIGI_INCLUDE_DIR=TRUE \
+		 "
+
+do_compile() {
+  cd ${S}/build && make -C kdecore/kconfig_compiler
+  cd ${S}/build && make -C kjs icemaker
+#  cd ${S}/build && oe_runmake CC="${CC}" CXX="${CXX}"
+}
+
+do_install() {
+  install -d ${D}${bindir}
+
+  install -m 0755 ${S}/build/bin/icemaker ${D}${bindir}
+  install -m 0755 ${S}/build/bin/kconfig_compiler ${D}${bindir}
+#  install -m 0755 ${S}/build/bin/makekdewidgets ${D}${bindir}
+}
-- 
1.7.5.4



