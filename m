Return-Path: <net147@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D5BC377389
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:20:30 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id e127so48435067pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UAVdb73eHytBzusow0QAdIX8FecheZjzUrjtH1/ZBAQ=;
	b=Kdofe42I1Gvr7mEUF0W7eiDgLlijYTNuMf3qAaAa09swqbB5k04nVI4cRHRXLOPoQ5
	IGOJkXzjvCFa1kIVFh+QSE64ezAJljYoBtnfAZU+G3SEeKsbripEY1Znzx3Wel2kTH4n
	Q+ZuAoUkzXV9qDL5hx/tK8FVQtYUo0aS7ULxf1EHEWfOU0X0G12G7932pFn5F6Lh6mXX
	zmzHasVcjOgYH3JwhQmoZ4k/H3QKp1oDvqtkzzIx82yiBm1zBfWskNaLKzRXTQI9JIHF
	hpjkRKo+lDflOHHIp1W2FvR+n1J4RDKUGL7BiLS4pzyYPHyFpxnrj4zwMPrtpOChYLqX
	tc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UAVdb73eHytBzusow0QAdIX8FecheZjzUrjtH1/ZBAQ=;
	b=RnQ88bXyackMvaJDufn9URD5jMCoMlPoFNkbxDOkFzhT1S31XjE/pyo5o/Buc+mbr1
	7P2KmD/ZSNyCMdjrEDqTNHOrbJDuVyitEPvi7GFFIL1Tje5dpQiRj6kqnuB5axieiI7e
	0ggB3xEgDah782USgbQ55pDQU48PpfTp5wog7gv68V908CfhHsU+yq+MGn77NqQ/ZTvb
	YBXEGr+lmV1Pt1VmameZmXeEQAtf8dcFbkNcNPFm8kTB4v8ipWwylHMh179Qs3za7PTw
	4PnSuuDmsZL8M1fDfVLuAZ9hJIGNJgjunrtNxiUrFV+2c3YtQn1uFaBN2Gzm228tUgzo
	C3Ag==
X-Gm-Message-State: AD7BkJJb2dD96EwOf0HXFcHeF2WTOJBLIAITY1DIRWJm3+F06STfu2d4iXGTKI9rbSpX0Q==
X-Received: by 10.98.71.147 with SMTP id p19mr286136pfi.165.1456474831503;
	Fri, 26 Feb 2016 00:20:31 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	87sm17277973pfq.93.2016.02.26.00.20.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 00:20:30 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2016 19:20:45 +1100
Message-Id: <1456474845-27746-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-qt5][PATCH] qtwebkit: backport patch to fix linking with qtwebkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 08:20:31 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0004-Fix-linking-with-libpthread.patch         | 33 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_git.bb                     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch

diff --git a/recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch b/recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch
new file mode 100644
index 0000000..c5e6ac5
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch
@@ -0,0 +1,33 @@
+From 5dd4bb67cfce812fd7686e43616e2069f354a7df Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+Date: Mon, 22 Feb 2016 10:57:32 +0100
+Subject: [PATCH] Fix linking with libpthread
+
+WebKit use libpthread directly but is depending on other qt modules
+causing it to be linked against, which might break unless -lpthread
+is last. Instead just add it explicitly after the static libraries.
+
+Upstream-Status: Backport from 5.7 branch
+
+Change-Id: I2b95cff2c96373f8dce6f95052c4fccbe1982b33
+Reviewed-by: Simon Hausmann <simon.hausmann@theqtcompany.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ Tools/qmake/mkspecs/features/default_post.prf | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Tools/qmake/mkspecs/features/default_post.prf b/Tools/qmake/mkspecs/features/default_post.prf
+index 67276b7..39bb3f7 100644
+--- a/Tools/qmake/mkspecs/features/default_post.prf
++++ b/Tools/qmake/mkspecs/features/default_post.prf
+@@ -201,6 +201,7 @@ needToLink() {
+         linkAgainstLibrary($$library, $$eval(WEBKIT.$${library_identifier}.root_source_dir))
+         LIBS += $$eval(WEBKIT.$${library_identifier}.dependent_libs)
+     }
++    posix:!darwin: LIBS += -lpthread
+ }
+ 
+ creating_module {
+-- 
+2.7.1
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 9044d4f..04cefad 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Remove-TEXTREL-tag-in-x86.patch \
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
+    file://0004-Fix-linking-with-libpthread.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
-- 
2.7.1


