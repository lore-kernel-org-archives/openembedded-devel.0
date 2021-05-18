Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.9136.1621347306052547276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qlc6lxTV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so1607618pjp.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wcno99RIX+86EaWqbyqjJKcRouyXGJqtb5SDr5wiYuQ=;
        b=qlc6lxTV0/d4Lfjys5UOCyv2YCz4dWiTNV4KTRo7pZ7ThYBCNMVpQu9Rl3I32U490g
         W/hWSKaSzWHvr7aYwiAIwLzZRXRQaeqPLc3mmr17peX0kQCoYvuXHBhTpGPkJmiMDZoD
         6hYRVlpREj5gZJfoBn8vdUhe2HXNdPR+bg9a/hTGVwdKAmPTk6vV3WEJRIUQ4hZS6gIL
         /LLSlVXP5MAivF5YPopeUsve9CzSA4uk1z8JrIJVoCc6LLGHJ0Xe2DkYrzBIMKNhZCCg
         jOFw28ibKCzBLnK23UABO+BWZShjTfOAB0RgSLeIr3xH27o1lduxbppjS+BfOMfRdAFV
         nkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wcno99RIX+86EaWqbyqjJKcRouyXGJqtb5SDr5wiYuQ=;
        b=Ig6i0up82a0qV+AeqXujp5Jz3oeta+kK/vPN6d3AbIfS/rUGgvcrRJstTF6h3UrC4k
         yVzZCAU2zl78z2nVuA57/i6dk3YVqSopkQQlRnVyiJaVVkuo+aoPZSXy0mAGObUunaUA
         /tfvaNHSvz3Kx49pG6JS4ZQGFkKF7cnROVHvQgUxK+j4halEXakqicApNoAL5GtEZJuw
         ihPgTLriTVq0spM2Zz0aYHVOV5vUmP2TKMSoWwOSAt4lWDd0maiDycFt2oSO3CT7X3aG
         SX3dvQxEmdQZ9E5+OOC/C5a7tD25Zrr0RBFxc0WeqimGE9gk93rWKajlmrfso4eSwi+R
         ukFw==
X-Gm-Message-State: AOAM532cQlEqxHfrkBqqNgKxvmXRaSVnmRlu90y9Ax7Uxnp6zrbXX5EC
	Q3ldTLiHk7P45YKJkmztjG0Gi2zQEeQ=
X-Google-Smtp-Source: ABdhPJyUkciU58v6zfHe8QpRedIl3gJNdyGYr6cfDeUxaNXIAnkLUUY6ZPLLhAR/DBFplx7tkGvRvQ==
X-Received: by 2002:a17:90a:d496:: with SMTP id s22mr5741602pju.146.1621347305395;
        Tue, 18 May 2021 07:15:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.15.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:15:04 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 6/6] linuxptp: Fix cross build
Date: Tue, 18 May 2021 07:14:57 -0700
Message-Id: <11eae114522a6befa06c7f4021a83bc016133543.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621347202.git.akuster808@gmail.com>
References: <cover.1621347202.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Adjust incdefs.sh to use cross tools to poke for system functionality
Re-enable using incdefs.sh
export KBUILD_OUTPUT to point to recipe sysroot

(From meta-oe rev: b6022761d6880382c5e6ffa4b3dc6f1ec2ae1e73)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linuxptp/Use-cross-cpp-in-incdefs.patch   | 26 +++++++++++++++++
 .../no-incdefs-using-host-headers.patch       | 29 -------------------
 .../linuxptp/linuxptp_2.0.bb                  |  7 +++--
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
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
index 930c6673dc..c989767790 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
@@ -4,15 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-           file://no-incdefs-using-host-headers.patch \
+           file://Use-cross-cpp-in-incdefs.patch \
            file://time_t_maybe_long_long.patch \
            "
 
 SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
 SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
 
-EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
-    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
+EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
+
+export KBUILD_OUTPUT="${RECIPE_SYSROOT}"
 
 do_install () {
     install -d ${D}/${bindir}
-- 
2.17.1

