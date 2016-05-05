Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 942D7731CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 15:01:44 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n129so24135708wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Dh+ArHRx3b0MzToIX3uiKOURrAZKL5NLKxaKW2WVgD0=;
	b=Mg95kH5z+QwD5y1gsOWlsYWetAXVGYqJ1LCwekSjMkPafRiV2TfXGp7hACHdBA4y7F
	8a2ls2jYZnxegX1i6aHBjJ4s0ohSxMvar7sH1bGJfajI0Xjqik7ERStEIb027c5nB86f
	LM5AApRVzJMMZh33PCVD/GwX8/5hBI0XpZxSErWeC5Dcz+THyA8VIw8LVWy5jBMSQK6+
	81g0W8OEZL57F+SwObEUAt50VYWKRjW6kKxW0HRpSgfcyGlBO1wOKgZGrjecJolwWvPQ
	4Eg8Hn9PLqJt7Of8DPgQDmV2EgStJXHTJOPnLSbj8skxkOKu3IrZzh8GfKxQaPdYgOI7
	W+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Dh+ArHRx3b0MzToIX3uiKOURrAZKL5NLKxaKW2WVgD0=;
	b=eJZmd9WcxYrez2q54gPJfNwGlAarOwSHIJa2AHsQCvBiwk0pEl/x52S2z8W3wvgjmw
	CRiv5NDub16fk8VNTv20pI82CudpgziQavRzlkOYeadBzEravIsuOKnb4g9RUV7i67V/
	n/w2blsApq6ZyZKMqo7BHEFhCswgtJDNYaVlfbLwW19+7OyZWiMkOKv37/kqLqD3HezG
	nNSA+SKflmcBdWgXrwaXVu9kdPVuLXh4fYfFPTXlFVDQEDrzebeqkyjCeLHIk2mvJyyN
	SF0yd3s0xDgx0wh90Tu8WNdT5Iu5elzfeuCv6vyA2Hz93Xs1QZVaM+igN58uiZvV0x+T
	Wt6Q==
X-Gm-Message-State: AOPr4FX1JTEeiNl9BDPQvQKxgfl/54Vgp9UNAv9R7dc1ICdAJsutVox+affiNhXG6CV2EQ==
X-Received: by 10.194.203.105 with SMTP id kp9mr15068389wjc.70.1462460504502; 
	Thu, 05 May 2016 08:01:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	he10sm1531897wjc.21.2016.05.05.08.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 08:01:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 May 2016 17:03:00 +0200
Message-Id: <1462460580-12774-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462460580-12774-1-git-send-email-Martin.Jansa@gmail.com>
References: <1462460580-12774-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/4] poppler: add --std=c++11 to fix build with Qt 5.7
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
X-List-Received-Date: Thu, 05 May 2016 15:01:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...h-C-11-compilers-that-don-t-define-isinfi.patch | 39 ++++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.41.0.bb  |  4 +++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch b/meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch
new file mode 100644
index 0000000..d5c34a6
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch
@@ -0,0 +1,39 @@
+From a8e3399487258e53df0fd4a79c570c8d71188bed Mon Sep 17 00:00:00 2001
+From: Takahiro Hashimoto <kenya888.en@gmail.com>
+Date: Wed, 27 Apr 2016 00:16:52 +0200
+Subject: [PATCH] Compile with C++11 compilers that don't define isinfinite
+
+Bug #94761
+---
+ poppler/SplashOutputDev.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/poppler/SplashOutputDev.cc b/poppler/SplashOutputDev.cc
+index 13d090c..0e50702 100644
+--- a/poppler/SplashOutputDev.cc
++++ b/poppler/SplashOutputDev.cc
+@@ -36,6 +36,7 @@
+ // Copyright (C) 2014 Richard PALO <richard@netbsd.org>
+ // Copyright (C) 2015 Tamas Szekeres <szekerest@gmail.com>
+ // Copyright (C) 2015 Kenji Uno <ku@digitaldolphins.jp>
++// Copyright (C) 2016 Takahiro Hashimoto <kenya888.en@gmail.com>
+ //
+ // To see a description of the changes please see the Changelog file that
+ // came with your tarball or type make ChangeLog if you are building from git
+@@ -94,6 +95,13 @@ extern "C" int unlink(char *filename);
+ #endif
+ #endif
+ 
++#if __cplusplus > 199711L
++#include <cmath>
++#ifndef isfinite
++#define isfinite(x) std::isfinite(x)
++#endif
++#endif
++
+ static inline void convertGfxColor(SplashColorPtr dest,
+                                    SplashColorMode colorMode,
+                                    GfxColorSpace *colorSpace,
+-- 
+2.8.2
+
diff --git a/meta-oe/recipes-support/poppler/poppler_0.41.0.bb b/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
index 4320408..f7cc076 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
+    file://0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch \
 "
 SRC_URI[md5sum] = "849a8bd6af5794efb961b70418414e5a"
 SRC_URI[sha256sum] = "420abaab63caed9e1ee28964a0ba216d1979506726164bc99ad5ade289192a1b"
@@ -22,6 +23,9 @@ PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,
 PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase"
 PACKAGECONFIG[qt4e] = "--enable-poppler-qt4 --with-moc-qt4=${STAGING_BINDIR_NATIVE}/moc4,--disable-poppler-qt4,qt4-embedded"
 
+# Needed for qt5
+CXXFLAGS += "--std=c++11"
+
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
     --disable-gtk-test \
-- 
2.8.2


