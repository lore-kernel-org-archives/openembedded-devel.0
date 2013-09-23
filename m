Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 589BE610FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 04:30:00 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so5599516iec.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2013 21:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FdqzPt8Ef3Rbg8GlIIQy5ez8vEHhzqGjNq4fr/j19vM=;
	b=CjMJC0UXuRpHFWDMtET5gTx3BhpfOvbWamS/IotnhRtvxqWbD4nqq2XYIe0AdknIVS
	3TV5uuYOr54UZElumH/1N1isaTg4JttfBU/c34cM4Mz6aJlaC34YWymqYSFPMhFDsY9B
	Ka9odn/HmFY/Na7D4UMcyDN01DTRb+/OgxXF5N5kAAiBIMPVhIRZXC5Fs9/aZl3GLcjr
	Jq3RgBD583NOxMQatrSH/jeb8NK4w+JVLqwEtv4p3kE0g/4KwsBMAP2r0jX4aqbYWkH7
	HT846/ScI7ws5hwwJW7AmMcR+CRKAXKAT+tsw5QFMymnMyVP1T/pOUj59FsW5hl2u+qB
	Z8uQ==
X-Gm-Message-State: ALoCoQnGsz7F9siIrYrLQXbEezl02I23MraHA1wYHkZfW53odnhNGRtX5RvSn6ACQXs0lRNbA6u0
X-Received: by 10.42.142.129 with SMTP id s1mr11638313icu.30.1379910601960;
	Sun, 22 Sep 2013 21:30:01 -0700 (PDT)
Received: from suse64-i7.site (dsl-67-55-9-50.acanac.net. [67.55.9.50])
	by mx.google.com with ESMTPSA id i11sm17043340igh.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 22 Sep 2013 21:30:01 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2013 00:29:36 -0400
Message-Id: <1379910576-24363-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.4.rc3.1.gc1ebd90
Subject: [meta-qt5][dylan][PATCH] qtwebkit 5.0.2: fix QA issue (bad RPATH)
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
X-List-Received-Date: Mon, 23 Sep 2013 04:30:00 -0000

Building qtwebkit would cause a QA issue (which, in my distro, would cause a
build error) such that QtWebPluginProcess and QtWebProcess would contain bad
RPATHs which pointed into the build location. This fix adds a patch to not
include the rpath.prf which leads to this problem.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch | 12 ++++++++++++
 recipes-qt/qt5/qtwebkit_5.0.2.bb          |  3 +++
 2 files changed, 15 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch

diff --git a/recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch b/recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch
new file mode 100644
index 0000000..f74a5cf
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-5.0.2/rpath.patch
@@ -0,0 +1,12 @@
+diff -urN qtwebkit-opensource-src-5.0.2/Tools/qmake/mkspecs/features/unix/default_post.prf qtwebkit-opensource-src-5.0.2__new/Tools/qmake/mkspecs/features/unix/default_post.prf
+--- qtwebkit-opensource-src-5.0.2/Tools/qmake/mkspecs/features/unix/default_post.prf	2013-04-08 20:11:53.000000000 -0400
++++ qtwebkit-opensource-src-5.0.2__new/Tools/qmake/mkspecs/features/unix/default_post.prf	2013-09-22 22:37:51.096270035 -0400
+@@ -32,8 +32,6 @@
+     QMAKE_OBJECTIVE_CFLAGS += -Wno-c++11-extensions -Wno-c++0x-extensions
+ }
+ 
+-contains(TEMPLATE, app): CONFIG += rpath
+-
+ isEqual(QT_ARCH,i386):CONFIG(debug, debug|release) {
+   # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
+   config_gnuld: QMAKE_LFLAGS += -Wl,--no-keep-memory
diff --git a/recipes-qt/qt5/qtwebkit_5.0.2.bb b/recipes-qt/qt5/qtwebkit_5.0.2.bb
index 4d2f34d..1cad62b 100644
--- a/recipes-qt/qt5/qtwebkit_5.0.2.bb
+++ b/recipes-qt/qt5/qtwebkit_5.0.2.bb
@@ -2,6 +2,9 @@ require qt5-${PV}.inc
 require ${PN}.inc
 
 PR = "${INC_PR}.0"
+SRC_URI += "\
+	file://rpath.patch\
+	"
 
 SRC_URI[md5sum] = "85aad9f287910c21c8464d7d1ea010a9"
 SRC_URI[sha256sum] = "6ff4038f8db68be51661d1a6646f510b26f6ebbecbdeefb76cd8361f808768f6"
-- 
1.8.4.rc3.1.gc1ebd90


