Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1A93B6FD28
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:03 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so2774915wgg.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cH40zceG0U49TmLXs26w9fJl/vO+iMV5y6EHaR/rsao=;
	b=IoC3KTUKi71CZLB0f0ejlvZo/seAd0yK1d1G/1unfTCDbS/0dun52zrIRyRLqDhqyI
	Q8cVS/rVUf55Hpu5sU1vww8uPD53BxPmUNB2E14a0Ks8XGwPW5ALDmq3UvonL4wp6YXG
	t1A+IjjKrOQA6s2YxdWiZjYsq+G/3cfdMIoopzT/taYydU6XpTMlu/5hu8kK9v0saTst
	JGURkMFuiz3UaguvsZxNCOsWh05cr2wtgCAJnWzIPJ38hkH5HgVJ71jYrlQcdT9CGW/+
	FOUbZeVLUj7fjzZGF3d3Kij1jIXejVwVveVFShSTQ1X8YWQic6jIVBuvQWWEqLq49gbl
	Ygwg==
X-Received: by 10.180.13.226 with SMTP id k2mr2333287wic.27.1412389504348;
	Fri, 03 Oct 2014 19:25:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dc9sm3716580wib.5.2014.10.03.19.25.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:54 +0200
Message-Id: <1412389558-13237-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 3/7] qtbwebengine: fix build for qemux86-64
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
X-List-Received-Date: Sat, 04 Oct 2014 02:25:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nclude-atomicops_internals_x86_gcc.cc-whe.patch | 27 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch

diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
new file mode 100644
index 0000000..1cf1242
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
@@ -0,0 +1,27 @@
+From 9ad77853050ccd2102fe4c9ad0671b82554ce4c1 Mon Sep 17 00:00:00 2001
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
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 08486df..dd93d1f 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
     file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
     file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
+    file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
 "
 SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
-- 
2.1.1


