Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.119273.1597953367621905797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 12:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DhTpYKXY;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id nv17so1437674pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZyHJtklK64dFf5px2Ob25Y5z/iPfEmaFgsPcthulGao=;
        b=DhTpYKXYvwAsHJYP475QoYMurdus8OJhcnrjx2YS7wECr94++AUerf53J2T7QRc2ik
         DMmlXYlWeq0fuvVKED97RCfF3cHK8JzLP09RAKMsVE6jrLc7L//RBTz628jqZhOzRS1T
         mY4/+n35vlzXHV5Mi9IbniYuhc4IaWEqf5Uv3g6LvAeon6hwGAhRVwEg9nI7nDHBbipy
         xNLxDr2GgIXU3LoitRcEkdxC+1uh8ZyJnY5kvyxN+R7ce4DtQNZwPXUJLX4gG0gKEq0q
         snJTGYg0yrHWvKc769qeJrNJWTVT7lLXdP4Ti1yap/rTaBCuJxIYuw4/6Ht4oDdd3YWD
         Xn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZyHJtklK64dFf5px2Ob25Y5z/iPfEmaFgsPcthulGao=;
        b=OiHS2ZtrN4X1bO1ZSAI6cvTPc+wW8QMYA5eBu9CDXFmEeYs30nOdy8hRWf3rtR4fYv
         DUHg+9aELUjMI5D1bXcrqrwlLXXWOc7PuBFs7d+CPPsI2Mt36j2P0hE6MtYKhRvinDF2
         ZZd3MOf0dYzUm4EQrzxT86SoGYtgEUiAkvdkhmxArIiEx4j/oLsUwDAhOq3nV5RicGDh
         IEqlraaC9/p0N37CK2BeTh0u7DzW5I8C5uxggYWbdeceKJRBK3qAKVn1RnsFX6k5S5Ft
         fu5eq+m2I2lfnEpUNitY9TT+KXBLDmDXJhWU1pAW7CsUHctqnpmzq+ey2sZX0u934ktd
         vjuA==
X-Gm-Message-State: AOAM5313DHrOlCRf+EeQ6q0NyWzEynTWdUifUe0hsQ9dkn7QgOe7lnQ7
	oWoih3GJtrQbxgdCS6Ep8uxGABSnhHtqhw==
X-Google-Smtp-Source: ABdhPJwPDcDp9sh4Jpn5l66kElrZwja2z/p8ti4h5h8Ar1g4QBl7HlIBqBsYpinYm8DYjxyKKz1vPg==
X-Received: by 2002:a17:902:ed13:: with SMTP id b19mr19117pld.24.1597953366685;
        Thu, 20 Aug 2020 12:56:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id a17sm3394286pgi.26.2020.08.20.12.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 12:56:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] linuxptp: Fix cross build
Date: Thu, 20 Aug 2020 12:56:04 -0700
Message-Id: <20200820195604.509756-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust incdefs.sh to use cross tools to poke for system functionality
Re-enable using incdefs.sh
export KBUILD_OUTPUT to point to recipe sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linuxptp/Use-cross-cpp-in-incdefs.patch   | 26 +++++++++++++++++
 .../no-incdefs-using-host-headers.patch       | 29 -------------------
 .../linuxptp/linuxptp_3.0.bb                  |  7 +++--
 3 files changed, 30 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
new file mode 100644
index 0000000000..876088649e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
@@ -0,0 +1,26 @@
+From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
+From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
+Date: Fri, 23 Dec 2016 18:12:29 +0100
+Subject: [PATCH] linuxptp: Use cross cpp in incdefs
+
+Use cross cpp incdefs.sh shell script since we are doing cross compiling
+we need to ensure we use correct setttings from toolchain
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+ makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/incdefs.sh
++++ b/incdefs.sh
+@@ -27,7 +27,7 @@ user_flags()
+ 	printf " -D_GNU_SOURCE"
+ 
+ 	# Get list of directories searched for header files.
+-	dirs=$(echo "" | ${CROSS_COMPILE}cpp -Wp,-v 2>&1 >/dev/null | grep ^" /")
++	dirs=$(${CPP} -Wp,-v -xc /dev/null 2>&1 >/dev/null | grep ^" /")
+ 
+ 	# Look for clock_adjtime().
+ 	for d in $dirs; do
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
deleted file mode 100644
index 02dbb23465..0000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
-From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
-Date: Fri, 23 Dec 2016 18:12:29 +0100
-Subject: [PATCH] linuxptp: no incdefs using host headers
-
-Avoid using host headers via incdefs.sh shell script.
-
-Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
----
-
- makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefile b/makefile
-index 8cdbd15..85174b8 100644
---- a/makefile
-+++ b/makefile
-@@ -33,7 +33,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
- SRC	= $(OBJECTS:.o=.c)
- DEPEND	= $(OBJECTS:.o=.d)
- srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
--incdefs := $(shell $(srcdir)/incdefs.sh)
-+#incdefs := $(shell $(srcdir)/incdefs.sh)
- version := $(shell $(srcdir)/version.sh $(srcdir))
- VPATH	= $(srcdir)
- 
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
index 69dee1a2f1..1472a671a7 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
@@ -4,14 +4,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-           file://no-incdefs-using-host-headers.patch \
+           file://Use-cross-cpp-in-incdefs.patch \
            "
 
 SRC_URI[md5sum] = "1318805702eb6d59f9f247e1dd5ce12a"
 SRC_URI[sha256sum] = "d74ceca722c75bfff53c633425f926dd48eb04f4a089451b855155c016d15785"
 
-EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
-    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
+EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
+
+export KBUILD_OUTPUT="${RECIPE_SYSROOT}"
 
 do_install () {
     install -d ${D}/${bindir}
-- 
2.28.0

