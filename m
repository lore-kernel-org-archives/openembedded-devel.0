Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21F9573173
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:56:32 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so256512079wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ZqfisajjD3+sQgMCi5rFVOBIwsSiUYC/pOy8Gzn8SOg=;
	b=WThKiAjeFaVH90dNkKmKwZNNHJUS89+dkoTd1UitkTkXRVTaC39glbyz/c34YbY4XP
	KN7qxmY3umeIjGePiDzl+UzTgqTQPD2J2Vxm1XC6QxIN4pEwvrBu0IXEDk413GDOL7Ko
	R4zXXYcBJxPSecS7Fu1w7u3l/1mVkJcLgvj1F/pebMfqgX4F7ocjknxh0JJ0+0knbh/D
	cTJAxbXYr8pQk/W62FF3MEPNfyBPJgZhPS/J7LDgZWEJOWU0s+43kRRUb1UgwD4ZLlH5
	Q5+1p7R9XSVDTxWiaVciafQh043115m7UBwYur9ZKeN8fi6Gn9Dbk/Qu64E6Bn6Z/aV7
	xDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ZqfisajjD3+sQgMCi5rFVOBIwsSiUYC/pOy8Gzn8SOg=;
	b=CbUgcrcZl/p0aLKYfV152H0h5FExJL8CzBp+lC9+UXqkUOBIlIHNqsaCKZaVRyof9I
	4QbGND5NAx3CKcGwUsTEGnMkrW3/KaRNzGADzFwBbaN0K8P7t/DsGf36ec5xMaMCvj+z
	9i98zJsb7Tw+bg1IxsketNZTuoADa0THhjmfK7Kle/C+v3W4K32Eeveep8RtfxlM9Nn1
	uW8WA3NJ5qKzJqvlSA5uc8a7v5hcKPCwKQH2Pd8HGd4Je/w7zy1gIOVsrVDvnyN6q+vU
	Hv8rgTLza3JufflyMVfoDvYx+6+Zz9dY3YLF90B+ci9Bl42ct9xe+I1WPLaNg8Td9Q/K
	il7A==
X-Gm-Message-State: AG10YOTiml8AaQAsCUljQJDBwbyAU0HwlvM6Arvu6y5M7emDO2MBUmcZLFQ7AslvKXyscQ==
X-Received: by 10.28.107.140 with SMTP id a12mr29523051wmi.77.1455746193514;
	Wed, 17 Feb 2016 13:56:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s8sm3447496wje.35.2016.02.17.13.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 13:56:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 22:56:43 +0100
Message-Id: <1455746205-31727-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5 3/5] qtbase: Fix WORKDIR references in pkg-config files
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
X-List-Received-Date: Wed, 17 Feb 2016 21:56:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* otherwise all builds fail with:
  ERROR: QA Issue: Qt5Core.pc failed sanity test (tmpdir) in path qtbase/5.5.99+5.6.0-alpha1+gitAUTOINC+f7f4dde80e-r0/sysroot-destdir//usr/lib/pkgconfig [pkgconfig]
  since oe-core insane.bbclass was fixed to properly search for tmpdir
  in all pkg-config files.
* this issue was there for long time, I've checked the build with jethro
  branch and it already has
  prefix=<TOPDIR>/tmp-glibc/sysroots/qemux86/usr
  it just wasn't detected by QA checks until now
---
 ..._module-Fix-pkgconfig-and-libtool-replacements.patch | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 062db89..188ac4d 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From 43305bc5cfe1db5021abb1bf2806dcc63b31f176 Mon Sep 17 00:00:00 2001
+From f1f05d7b671b973903d9c0d411207bcc82a9a9d8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
@@ -63,8 +63,8 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  mkspecs/features/qt_common.prf |  2 +-
- mkspecs/features/qt_module.prf | 11 +++++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
+ mkspecs/features/qt_module.prf | 16 ++++++++++++++++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
 index 38602f6..f9c401f 100644
@@ -80,10 +80,10 @@ index 38602f6..f9c401f 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index e543ea6..0624ce2 100644
+index e543ea6..4a76851 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -273,6 +273,17 @@ load(qt_targets)
+@@ -273,6 +273,22 @@ load(qt_targets)
          ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
      ltlib_replace.CONFIG = path
      QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
@@ -93,6 +93,11 @@ index e543ea6..0624ce2 100644
 +    pkgconfig_include_replace.CONFIG = path
 +    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
 +
++    pkgconfig_prefix_replace.match = "prefix=$$[QT_SYSROOT]"
++    pkgconfig_prefix_replace.replace = "prefix="
++    pkgconfig_prefix_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_prefix_replace
++
 +    # drop -L/usr/lib in .prl files
 +    prl_replace.match = "-L\$${libdir}"
 +    prl_replace.replace = ""
@@ -102,5 +107,5 @@ index e543ea6..0624ce2 100644
  
  contains(QT_PRODUCT, OpenSource.*):DEFINES *= QT_OPENSOURCE
 -- 
-2.7.0
+2.7.1
 
-- 
2.7.1


