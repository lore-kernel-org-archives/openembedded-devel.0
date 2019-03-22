Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 33E1B7D012
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g3so1693612wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hLdNOjE/vWh377Wp1WWpyqL8Ko1Ch+H0mIfrtcl1L/Y=;
	b=kNi18UIcUYWARe94cM2RL+nmtq8VI46pdIGamy+Y/vWt/gmUoqPzPLPAmQmM3x6Xjy
	IUPOO96LwYRWHZRPhamf+4UeWBsLSS7RXsRjDK7XI4iYTNCK+YuDt+hH8GW6I2xR6Ln6
	Vxe2cKkJwChJ3YLXIyp4OCSbglqMZXqHeJU4xR0WKlplvFA/nuy97zUDscOHyji80HAL
	A5Z646MvNs7DeFM6Dbfn42MfaTK4zkzGCeNYrxi3YKA0/JyN0IUEc7+OIsd+j1pUghGt
	BN2yaWXQ+wWvT3/03BomlGKq0tIvtELoL+fv4D6Tke9EQwC4oxnHjCH5Fklb1dXs4vJG
	clxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hLdNOjE/vWh377Wp1WWpyqL8Ko1Ch+H0mIfrtcl1L/Y=;
	b=d7tbrMZjcAwjjZehwSTI3b6KUjSt5fWGtUufbbOQnJC5nWt4W/R/97q24aAEkQYmJd
	DNMjoIWgPsHs0iGzaPpgfZO6X2v5sMI5wJ8ce7nTFZko4o+mG+btgVfqADzrmJrQZih5
	dIY0uuvEfJxoQIm5gv6BiSdWterKPkoSlIDj6BRkt26ZHez5OidGD3mxN1yvjIbdDjVO
	ihnSBFPP6QTirL+zURShqd71hMzWcAS0MGdISNKncfWwjS0PPpfwuYv6RYjOEaxBikBS
	n4S3nwvcjkKQQwQDbXXb/rKGQ77Bn8jp2Eo1DAHghtLJUtfseVlKl0MVSQabARW0V+fp
	Ofqw==
X-Gm-Message-State: APjAAAUs9huEuLqBDG/9Zdihc43GSpl8f9bbJXOz75z6+E0nBgOZ4/qc
	tegHNfHeeQsfrsaOi2E49V1gQdNe
X-Google-Smtp-Source: APXvYqwC1I321FewWe5GjPDqqR9n0RfvtUn7dXqVYJox01iGUuYnXMkEP34QI+uVaKfSX2L5IJgIfQ==
X-Received: by 2002:adf:9dcf:: with SMTP id q15mr5609432wre.205.1553250109743; 
	Fri, 22 Mar 2019 03:21:49 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:26 +0100
Message-Id: <20190322102129.5067-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] poppler: upgrade 0.71.0 -> 0.75.0
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch | 9 ++++++---
 .../poppler/poppler/basename-include.patch               | 2 +-
 .../poppler/{poppler_0.71.0.bb => poppler_0.75.0.bb}     | 6 +++---
 3 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.71.0.bb => poppler_0.75.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
index 7ed795ef7..c364d7372 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
@@ -15,15 +15,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
-index 33c6608..87e1b44 100644
+index 6f91669..ca5021f 100644
 --- a/glib/CMakeLists.txt
 +++ b/glib/CMakeLists.txt
-@@ -127,7 +127,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
+@@ -135,7 +135,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
    get_directory_property(_tmp_includes INCLUDE_DIRECTORIES)
    _list_prefix(_includes _tmp_includes "-I")
-   set(Poppler_0_18_gir_CFLAGS ${_includes} -L${CMAKE_BINARY_DIR})
+   set(Poppler_0_18_gir_CFLAGS ${_includes} -L${CMAKE_BINARY_DIR} -L${CMAKE_CURRENT_BINARY_DIR})
 -  set(Poppler_0_18_gir_LIBS poppler-glib)
 +  set(Poppler_0_18_gir_LIBS poppler-glib poppler)
    _list_prefix(_abs_introspection_files introspection_files "${CMAKE_CURRENT_SOURCE_DIR}/")
    list(APPEND _abs_introspection_files
      ${CMAKE_CURRENT_BINARY_DIR}/poppler-enums.c
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/poppler/poppler/basename-include.patch b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
index 528528ae7..ab6bdb080 100644
--- a/meta-oe/recipes-support/poppler/poppler/basename-include.patch
+++ b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
@@ -8,8 +8,8 @@ Index: poppler-0.64.0/utils/pdfsig.cc
 --- poppler-0.64.0.orig/utils/pdfsig.cc
 +++ poppler-0.64.0/utils/pdfsig.cc
 @@ -35,6 +35,10 @@
- #include "Win32Console.h"
  #include "numberofcharacters.h"
+ #include <libgen.h>
  
 +#if !defined(__GLIBC__)
 +#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
diff --git a/meta-oe/recipes-support/poppler/poppler_0.71.0.bb b/meta-oe/recipes-support/poppler/poppler_0.75.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.71.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.75.0.bb
index 371648d1a..febdc8eda 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.71.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.75.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "b505011e49e922c83f3ffb57ab40bc28"
-SRC_URI[sha256sum] = "badbecd2dddf63352fd85ec08a9c2ed122fdadacf2a34fcb4cc227c4d01f2cf9"
+SRC_URI[md5sum] = "3fb4ca803d989742695ca586c5cc489e"
+SRC_URI[sha256sum] = "3bbaedb0fa2797cac933a0659d144303e4d09eec6892c65600da987d8707199a"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
@@ -40,7 +40,7 @@ EXTRA_OECMAKE += " \
 do_configure_append() {
     # poppler macro uses pkg-config to check for g-ir runtimes. Something
     # makes them point to /usr/bin. Align them to sysroot - that's where the
-    # git-wrappers are:
+    # gir-wrappers are:
     sed -i 's: ${bindir}/g-ir: ${STAGING_BINDIR}/g-ir:' ${B}/build.ninja
 }
 
-- 
2.20.1


