Return-Path: <athoik@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id B02EF6C45D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 06:31:57 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g22so16787420edr.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kJBteG1QSdApu1r+hQ12yEIme5iKP6DpM2ydgCeYQQc=;
	b=Aa8c7JsMDxU4DSsthEP8YeoAqHRUiX2DHPxDPel7k24pxpW2kbeVY0O4qs73QendSn
	l4gQ0g13sexeYXEnAUxQ6be5+6H8B/28415pwvA+Hxf58oigLHXIFTpL4zfHFKxnTWaT
	xli/r+Zlz9KmpWmmFreTpWYXqGzrDcsD8vC6zCceHrpbG3WfhHyGV4kM+K19oMHleocj
	H1OelvY6NErTUOQQPrNtryrWZBzaPWfsLU0ZbO0g7BpZfxk8fYOltz9KU2i9HmJrZbOr
	A5gyQi7MfV1f+4Ar9rxTX3Ye7Md5y6K9g1ZnAXinHRedHjA/c0QZ7nL/eTdL6DC7Cnif
	2qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kJBteG1QSdApu1r+hQ12yEIme5iKP6DpM2ydgCeYQQc=;
	b=hbBvqrOwXfYTgvHS/0miK+P+7PRPTk4o1YMNDeR/TBUEgHOB95pD9vBC1bHyDpWirA
	8a+pSG4EdvPbdtt9WUBhngdyv4oLa8uB8Hl/m2ryHNGtoqFvsUu3+RaKF58/JjLBMhwk
	toSXrjWZx/LHXXWnh34ebL4F4Ax94QNUvPYS64tc2LwecekEZNtvn+p0BvwvS+DzlmOv
	CHVFU+Rm0GY7aH6NcZWrj0+2hyd6MF1R8Iq+Zv5Xk5Ty2C1E0Rr3A45/croIvCkAmS+B
	d/qVlz/kaVERbfIfYsMxu02v1/oo5Py6xaOpqN751qmrFhgtT+pYl3YZ/DIoCr71KAUV
	Suqg==
X-Gm-Message-State: AA+aEWbX6VyZzvPCNHK2K4dE7biweXUX+Eq/d5l6xVLAvYieiz4ErQVG
	EKRudmxBM4C+DH1SHq+++T//4wmPKOQW
X-Google-Smtp-Source: AFSGD/Wgcr4+oodlAZT81JEfqIEMJD2D5A1Yl/WONS92Lfno3Nsg3LmoSllXUIPIm8Wg7Oh0NrpGVg==
X-Received: by 2002:aa7:d35a:: with SMTP id m26mr20422355edr.244.1545978717852;
	Thu, 27 Dec 2018 22:31:57 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	v14sm11836703edq.74.2018.12.27.22.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Dec 2018 22:31:57 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 08:28:40 +0200
Message-Id: <1545978520-30261-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-multimedia][PATCH] faac: update 1.29 -> 1.29.9.2
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
X-List-Received-Date: Fri, 28 Dec 2018 06:31:58 -0000

Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".
Previously not required mp4v2 library was dropped on 1.29.9.2.

While being there also fix issue with multilib build on aarch64
using FILES_lib${BPN} instead of FILES_lib${PN}.

WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: Files/directories were installed but not shipped in any package:
  /usr/lib/libfaac.so.0
  /usr/lib/libfaac.so.0.0.0
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-faac: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 .../faac/{faac_1.29.bb => faac_1.29.9.2.bb}        | 14 ++++-------
 ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 ----------------------
 2 files changed, 4 insertions(+), 38 deletions(-)
 rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb => faac_1.29.9.2.bb} (56%)
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
similarity index 56%
rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
index d36f2f4..4fc1121 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
@@ -1,29 +1,23 @@
 SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
 SECTION = "libs"
 LICENSE = "LGPLv2+"
-HOMEPAGE = "http://www.audiocoding.com/faac.html"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
 
-LICENSE_FLAGS = "commercial"
-
 inherit autotools
 
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
-    file://0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch \
 "
 
-SRC_URI[md5sum] = "78603720f655180059d6970c582a3005"
-SRC_URI[sha256sum] = "8cc7b03ceb2722223a6457e95d4c994731d80214a03ba33d1af76ba53f4b3197"
-
-EXTRA_OECONF += "--without-mp4v2"
+SRC_URI[md5sum] = "2b58d621fad8fda879f07b7cad8bfe10"
+SRC_URI[sha256sum] = "d45f209d837c49dae6deebcdd87b8cc3b04ea290880358faecf5e7737740c771"
 
 PACKAGES =+ "lib${BPN} lib${BPN}-dev"
 
 FILES_${PN} = " ${bindir}/faac "
-FILES_lib${PN} = " ${libdir}/*.so.*"
-FILES_lib${PN}-dev = " \
+FILES_lib${BPN} = " ${libdir}/*.so.*"
+FILES_lib${BPN}-dev = " \
     ${includedir} \
     ${libdir}/*.so \
     ${libdir}/*.la \
diff --git a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch b/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
deleted file mode 100644
index d845ddf..0000000
--- a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 46cc9298c38b9dd735fec3f39aa2d6e56a362410 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Mar 2017 21:33:36 -0700
-Subject: [PATCH 2/2] mp4v2: Define __STRING if cdefs.h does not exist
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common/mp4v2/mp4util.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/common/mp4v2/mp4util.h b/common/mp4v2/mp4util.h
-index 1f9cb64..1e7aced 100644
---- a/common/mp4v2/mp4util.h
-+++ b/common/mp4v2/mp4util.h
-@@ -23,6 +23,10 @@
- #define __MP4_UTIL_INCLUDED__
- #include <assert.h>
- 
-+#ifndef __STRING
-+#define __STRING(x)     #x
-+#endif
-+
- #ifndef ASSERT
- #define ASSERT(expr) \
- 	if (!(expr)) { \
--- 
-2.12.1
-
-- 
2.1.4


