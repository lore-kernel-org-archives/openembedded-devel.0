Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id E4D1973D89
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 16:56:44 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so66385482igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dHPdK+wHZQbe4+NpuOYDwhN/cfHJuGBbGDTDQPVBogk=;
	b=LfGXWq4aUL+u2u8ZQfg5iNmf+DhjhgDg+UfJWgBqGq/buQp59dM/pQb0VvzYZymwOQ
	Rk+uUlaHWDRJJJyj7eT9cXF0CbD1Qybe6+oa6psImYKwRZznWV4yNjGzXdHOCm6jeYf6
	+NJhgy2/hZ6tJODPoxRYKqY1Aem6aJ/Qr2YCxKNpOMLQXq8rzFq4ZcCQUTXFH8B61N8b
	22vuvYcOZveT4naDrBSjRzbNJbGHArAMP6OQqaY5iw6ewQ7T1rJccratzZLmutl0HiYp
	LXZiHMuscoUCul+IOlmhiq792T4D148g0w3ppCvfXeAGsfNK1pKKu8QzrPsTquZZjjdW
	2m/A==
X-Received: by 10.107.4.204 with SMTP id 195mr21713428ioe.40.1433782605519;
	Mon, 08 Jun 2015 09:56:45 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id rr5sm704273igb.7.2015.06.08.09.56.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 09:56:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2015 09:56:37 -0700
Message-Id: <1433782597-24380-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
References: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtwebkit: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 16:56:45 -0000

Make backtrace() API conditional to glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-backtrace-API-for-non-glibc-libraries.patch | 38 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_git.bb                     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch

diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
new file mode 100644
index 0000000..6a9d1f4
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -0,0 +1,38 @@
+From b345a3414a7d09b47586aac437d79e2bbfa52fb8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jun 2015 19:55:05 -0700
+Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
+
+It was excluding musl with current checks, so lets make it such that it
+considers only glibc when using backtrace API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/Assertions.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
+index 1b2091f..ba03a28 100644
+--- a/Source/WTF/wtf/Assertions.cpp
++++ b/Source/WTF/wtf/Assertions.cpp
+@@ -61,7 +61,7 @@
+ #include <windows.h>
+ #endif
+ 
+-#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
++#if (OS(DARWIN) || (OS(LINUX) && defined (__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
+ #include <cxxabi.h>
+ #include <dlfcn.h>
+ #include <execinfo.h>
+@@ -245,7 +245,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
+ 
+ void WTFGetBacktrace(void** stack, int* size)
+ {
+-#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
++#if (OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
+     *size = backtrace(stack, *size);
+ #elif OS(WINDOWS) && !OS(WINCE)
+     // The CaptureStackBackTrace function is available in XP, but it is not defined
+-- 
+2.1.4
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 77568af..bad44ef 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -20,6 +20,7 @@ ARM_INSTRUCTION_SET = "arm"
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Remove-TEXTREL-tag-in-x86.patch \
+    file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
-- 
2.1.4


