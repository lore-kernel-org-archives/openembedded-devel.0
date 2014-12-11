Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 75E1465D3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 17:42:26 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so7086406wgh.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 09:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rYpdFPFYtaft6h6ihByhKdaBJKP6e8/DfWrCmm27d/o=;
	b=Q7nk1o46fbb22BcwygWFy8Du7IF54lqWE+wPmrz9oY5e8AxC+MGgXPJMN6f53Tl6Ns
	NHHK6orLFndrDrKhRLZXDdx01q5l4fyaP6aBaADskJz/fITCgnq2/FYmb40MGy7cUvdM
	MDGzQNUtzLpWJCKgUJZfI9zH5yDBB1BwA91uvh+BCZRurMqcLpVQQhy/Dd91A8ALj7Zm
	poADEd0e8gPY1gr7BJcNhWAunAZHvq0nGD0x5TvFdHA0pV/BriZSiZdNfComzb7fLVTu
	fASD0nxaWshHFsxjWP47nOfbAZQ28RN5jApeHnbwtlMuVTF/NBn2NSoGAMy8pd7HuM+E
	WUAA==
X-Received: by 10.194.59.234 with SMTP id c10mr8333594wjr.49.1418319746575;
	Thu, 11 Dec 2014 09:42:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id h8sm51581wiy.17.2014.12.11.09.42.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 09:42:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 18:42:28 +0100
Message-Id: <1418319748-13657-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-qt5][PATCH] qtbwebengine: fix build for qemux86-64
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
X-List-Received-Date: Thu, 11 Dec 2014 17:42:36 -0000

* it was applied only for qtwebengine_5.3.2+git.bb, then removed
  completely with 5.4.0 upgrade, but it's still needed for both
  versions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nclude-atomicops_internals_x86_gcc.cc-whe.patch | 27 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_5.4.0.bb                |  1 +
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
new file mode 100644
index 0000000..032fe4d
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
@@ -0,0 +1,27 @@
+From 41b142ec46c61d075b5cd95a88b57f0db74cbf31 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 3 Oct 2014 03:52:11 +0200
+Subject: [PATCH] base.gypi: include atomicops_internals_x86_gcc.cc when
+ building for x64 arch
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ chromium/base/base.gypi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
+index a5a990a..af30cfa 100644
+--- a/src/3rdparty/chromium/base/base.gypi
++++ b/src/3rdparty/chromium/base/base.gypi
+@@ -745,7 +745,7 @@
+                 ['include', '^nix/'],
+               ],
+           }],
+-          ['use_qt==1 and target_arch=="ia32"', {
++          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
+               'sources/': [
+                 ['include', 'atomicops_internals_x86_gcc.cc'],
+               ],
+-- 
+2.1.3
+
diff --git a/recipes-qt/qt5/qtwebengine_5.4.0.bb b/recipes-qt/qt5/qtwebengine_5.4.0.bb
index 85ac397..e74a739 100644
--- a/recipes-qt/qt5/qtwebengine_5.4.0.bb
+++ b/recipes-qt/qt5/qtwebengine_5.4.0.bb
@@ -8,4 +8,5 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+    file://0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
 "
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 31467cb..2f10e13 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -9,6 +9,7 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+    file://0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
 "
 SRCREV_qtwebengine = "8eefc3a0658d1b10de12f43534cfd63af825ebc8"
 SRCREV_chromium = "be4ec3fa64a4c6c2b641830a9811ab7847c7dd39"
-- 
2.1.3


