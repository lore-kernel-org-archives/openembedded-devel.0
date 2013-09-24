Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id F38DC610D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 02:35:19 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id as1so7616000iec.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 19:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oOyBrRODpKEcVXMo0PlFjGewOD8g4xbsEwJfOmDWD4A=;
	b=iBKdzxgtwqseS/fm9p03l/YWbMiaRT1tVge0We1BCUvmUY6xFKGH1sH/UL+ziaXwLN
	2KAnsH98Q8Qvx98GJAFHu6c5J1MS3yHkqc4rJLPnGyfk6UnvYLP76OiEliBaQWYlOezh
	nF/ybwSFnD4yz+KK9lKu/0Dd3jdZTZT5kt2usZjg/et06p/q8NJbYbOn5R+A6pZCO9m+
	aLj01OBWAt4sPJ6TBlZqaE9i5T0+MwdHxERYAire9/UEImowIgyHjKfIIHHy1MUz5ShU
	HuktvH0IbUq9QsiEXkmrgCUFaBpvGKpnifZBO4hSqubyIgsl84H9ez6PXbebm2TOEyuw
	HYqQ==
X-Gm-Message-State: ALoCoQmc6XrI4fsy2BzBVzklH33r2j8RTpKPHhz9F791Dna3H8JHpYZbiydDe/3eealOom8w3PJk
X-Received: by 10.50.23.16 with SMTP id i16mr570998igf.50.1379990121577;
	Mon, 23 Sep 2013 19:35:21 -0700 (PDT)
Received: from suse64-i7.site (dsl-67-55-9-50.acanac.net. [67.55.9.50])
	by mx.google.com with ESMTPSA id ih14sm508023igb.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 19:35:20 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2013 22:35:11 -0400
Message-Id: <1379990111-9021-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.4.rc3.1.gc1ebd90
Subject: [meta-qt5][PATCH] qtwebkit: fix QA issue (bad RPATH)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 02:35:21 -0000

Building qtwebkit causes a QA issue such that QtWebPluginProcess and
QtWebProcess contain bad RPATHs which point into the build location. This fix
adds a patch to not include the rpath.prf which causes this problem.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 recipes-qt/qt5/qtwebkit-5.1.0/fix-rpath.patch | 13 +++++++++++++
 recipes-qt/qt5/qtwebkit_5.1.0.bb              |  4 ++++
 2 files changed, 17 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit-5.1.0/fix-rpath.patch

diff --git a/recipes-qt/qt5/qtwebkit-5.1.0/fix-rpath.patch b/recipes-qt/qt5/qtwebkit-5.1.0/fix-rpath.patch
new file mode 100644
index 0000000..5c20514
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-5.1.0/fix-rpath.patch
@@ -0,0 +1,13 @@
+Index: qtwebkit-opensource-src-5.1.0/Tools/qmake/mkspecs/features/unix/default_post.prf
+===================================================================
+--- qtwebkit-opensource-src-5.1.0.orig/Tools/qmake/mkspecs/features/unix/default_post.prf
++++ qtwebkit-opensource-src-5.1.0/Tools/qmake/mkspecs/features/unix/default_post.prf
+@@ -32,8 +32,6 @@ linux-*g++* {
+     QMAKE_OBJECTIVE_CFLAGS += -Wno-c++11-extensions -Wno-c++0x-extensions
+ }
+ 
+-contains(TEMPLATE, app): CONFIG += rpath
+-
+ isEqual(QT_ARCH,i386):CONFIG(debug, debug|release) {
+   # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
+   config_gnuld: QMAKE_LFLAGS += -Wl,--no-keep-memory
diff --git a/recipes-qt/qt5/qtwebkit_5.1.0.bb b/recipes-qt/qt5/qtwebkit_5.1.0.bb
index 77725e3..4ae151e 100644
--- a/recipes-qt/qt5/qtwebkit_5.1.0.bb
+++ b/recipes-qt/qt5/qtwebkit_5.1.0.bb
@@ -3,3 +3,7 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "fad7e7d6637719c2be101f9b3957d451"
 SRC_URI[sha256sum] = "b49c4cfae697ea67142e7b35ecb0e3fec06814153e8226b8c6655c4dafc92ac3"
+
+SRC_URI += "\
+	file://fix-rpath.patch \
+	"
-- 
1.8.4.rc3.1.gc1ebd90


