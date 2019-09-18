Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2F43F7F7CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 19:14:46 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id i18so385681pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A02VprSkX469S29kidWmCK3v0WmeYMq/M7kL7lXtQp8=;
	b=YVfiKaURVIqexiQL1G4TMeRPUtCGmYjMuc8RGWuOhBEsPI+PkpHpaRBLEXfSlA6zpj
	1nPQi3u6QCGOut4le86V34/fqj5ZtBCHFu16k5eWHG39QFs3d7yL8BC45NyxzW1aYmKJ
	IlMoExoBLlbbF9jo4HGMbrT94U3E9q86KFb/SCfLDCVKDqFfYKaKDxqTmk5MrDPIQ/i8
	bx3nhOv6VHjFTxMyJbYK3cpPlipWh+DbtpHJ4sSGxSzbO4fTCiJHVVH5BmLGBAVu5Rgp
	xan8gEzArcRdXAp4jQ6+J9FpOQd4xBrgvdPbaEhfLFgO+lzbKyEmFZ5Nu7eWDw9rEZtT
	sRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A02VprSkX469S29kidWmCK3v0WmeYMq/M7kL7lXtQp8=;
	b=t27Y5w8tgNned3ODWK9WVJelpCvEoU2yCw3SgnvNqQzy9SaHe+FkM8w71U2TsO5tAc
	kYn0NEmEl5egQUWp2usLUmbxuw/+CS6J+r4HUnzPc0Vd6dsVA0eIUeDAO9JZltgGNqZT
	sT/dEADI/9t8cTtP/r3FP2NhPYyAqzN6k7JY5sinN2f+WLsgPZc2NN4c3wkJ79hdOxfT
	lWvsvDSJsYiAfP/+xSeYCzQBEIi4IqxEyiu/TsG8c6NkqBnlPKXXDNA8GQImBysSmVyV
	g1dBkNItwrvQtFH/MNYcdbH92QdZeGtCj3f09MbjP9t/waGUvnYXdanP4MXcSQsHBSmk
	2i2w==
X-Gm-Message-State: APjAAAUxVCIAfmbtT5EKev1fTrLqAD2n6GRVx4nlSy0eNVe9WjODRSn0
	mHxXSdPJxAY09Z3ljP3R6ubk8Q0X0SE=
X-Google-Smtp-Source: APXvYqx9WMSViaWB1wZ8MfgQnBHXc5Ywgl5sXcS9VhCLtyauvb5I64aLTPXUxGPSWK9iWEdUpw6zSg==
X-Received: by 2002:a62:ea10:: with SMTP id t16mr2162952pfh.233.1568834086539; 
	Wed, 18 Sep 2019 12:14:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a13sm10736290pfg.10.2019.09.18.12.14.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 12:14:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2019 12:14:35 -0700
Message-Id: <20190918191435.1798025-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dfu-util-native: Dont build static binary
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
X-List-Received-Date: Wed, 18 Sep 2019 19:14:46 -0000
Content-Transfer-Encoding: 8bit

This did serve a purpose in past, this however is adding additional
requirement on build host to require static libc.a. in general it will
be good for user to select static linking explicitly, since it does have
distribution obligations once static linking is in place.

Add packageconfig to enable static builds and keep it off by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin JaMa Jansa <Martin.Jansa@gmail.com>
---
 .../dfu-util/dfu-util-native_0.9.bb           |  7 +-
 ...ert-Makefile.am-Drop-static-dfu-util.patch | 68 -------------------
 2 files changed, 5 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index aeca23bf2d..76faefefbb 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -4,12 +4,15 @@ inherit native deploy
 
 DEPENDS = "libusb1-native"
 
-SRC_URI += "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch"
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[static] = "CFLAGS='${CFLAGS} -pthread -static',,"
 
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 do_deploy() {
-    install -m 0755 src/dfu-util_static ${DEPLOYDIR}/dfu-util-${PV}
+    install -m 0755 src/dfu-util ${DEPLOYDIR}/dfu-util-${PV}
     rm -f ${DEPLOYDIR}/dfu-util
     ln -sf ./dfu-util-${PV} ${DEPLOYDIR}/dfu-util
 }
+
 addtask deploy before do_package after do_install
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
deleted file mode 100644
index 1c6ad0807e..0000000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From c2aab3b9ae1febcb6b4c6561a59df1930a57b394 Mon Sep 17 00:00:00 2001
-From: Martin JaMa Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 11 Aug 2011 11:19:52 +0200
-Subject: [PATCH] Revert "Makefile.am: Drop static dfu-util"
-
-This reverts commit fe0426ddc04f503d148c5e5f931f16b8f674f071.
-
-Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>
----
- configure.ac    |  2 +-
- src/Makefile.am | 22 +++++++++++++++++++++-
- 2 files changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f5a43b8..6a3757e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -21,7 +21,7 @@ AS_IF([test x$native_libusb = xno], [
-         AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
- ])
- 
--LIBS="$LIBS $USB_LIBS"
-+LIBS="$LIBS $USB_LIBS -lpthread"
- CFLAGS="$CFLAGS $USB_CFLAGS"
- 
- # Checks for header files.
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 70179c4..e8736ee 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,6 +1,6 @@
- AM_CFLAGS = -Wall -Wextra
- 
--bin_PROGRAMS = dfu-util dfu-suffix dfu-prefix
-+bin_PROGRAMS = dfu-util dfu-util_static dfu-suffix dfu-prefix
- dfu_util_SOURCES = main.c \
- 		portable.h \
- 		dfu_load.c \
-@@ -19,6 +19,26 @@ dfu_util_SOURCES = main.c \
- 		quirks.c \
- 		quirks.h
- 
-+dfu_util_static_SOURCES = main.c \
-+		portable.h \
-+		dfu_load.c \
-+		dfu_load.h \
-+		dfu_util.c \
-+		dfu_util.h \
-+		dfuse.c \
-+		dfuse.h \
-+		dfuse_mem.c \
-+		dfuse_mem.h \
-+		dfu.c \
-+		dfu.h \
-+		usb_dfu.h \
-+		dfu_file.c \
-+		dfu_file.h \
-+		quirks.c \
-+		quirks.h
-+
-+dfu_util_static_LDFLAGS = -static
-+
- dfu_suffix_SOURCES = suffix.c \
- 		dfu_file.h \
- 		dfu_file.c
--- 
-2.7.2
-
-- 
2.23.0


