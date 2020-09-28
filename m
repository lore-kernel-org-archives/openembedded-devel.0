Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.37737.1601302561865705790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 07:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oQhpvpVT;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id kk9so744921pjb.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=r8h7d4XJI9UfLOdwaQAwboY2WW/xLGbYellhQcD68Mw=;
        b=oQhpvpVTSN0Ievc/cffm46i2ntpisHKDSDqP11/dyoAkbhzAXgzuiJ0+i7kENiDJwW
         GE4EcjbLpmgAnVSGK547enB8gLfybdWzo7DTQLET6bfeebpfgp+S0LyGNhPy1jPFPO+C
         kfNxgTpvgckfQDb1bT5G/woB5663vMyLBYGmW0Y2Pxf8DAdo0pA8LMmPf3fRrU/bRQoZ
         zam7q1y7ZiaXqUV8rElv3tg1C53BVRh9Km1hLqtCCi8H45+n46trrLDKGJao/F28Kikz
         vN8vY7K70IOdFR9EDhN6i6iAwSTjDj6KgU2MwLpUtHBk6i/CxocO5EimCXxoPnswg+5Y
         TCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=r8h7d4XJI9UfLOdwaQAwboY2WW/xLGbYellhQcD68Mw=;
        b=oh1eZGqPbLkZVaEkGxp7Ifx04frQL/X/Pp7JDM5gOpxkHmOWL+W9BDtfTzBUUmm6ZI
         LNEO+sMKHANSQ+GYSoq4T4KU64e7kP3dJ6Qm8Dpd4A9yj1UpSjBSqpEpnK51cqnkk6mB
         mpeFx9PhmELJwkjlo2TZItMpQfpN24ehvj/RoSoI5RZsNI8Qqn5bMfbvDsa/jOpyRulo
         z0DAWDYy3MkKMrOO5ZnZMR71tDYUwX7ZuHte4588GDNRVLkuIVde+sMepHsZxjF+idvJ
         /6zrHwlEOmGW/uqZ+e54NeAzcrFS7i6oiK+85MwwMvwMgEsaNk+L0HKhM5PoBugDF3kp
         5gkA==
X-Gm-Message-State: AOAM5322XN2mvJeB7QqH5fMV6JjwZG14wt71jVdkYSlAMlZ1h8UTsuia
	+v6ZadpfKEuTiGREL2chgybPOK453IY=
X-Google-Smtp-Source: ABdhPJwf/n8d7JIjPaD2kIEEM5kOYwl+ETLzWEEpxZeyvxGmKOkzR92+9rXJr77OUcelWOFd1OiH0A==
X-Received: by 2002:a17:90b:46c4:: with SMTP id jx4mr1613733pjb.190.1601302560850;
        Mon, 28 Sep 2020 07:16:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9d97:e0e:5802:c8f4])
        by smtp.gmail.com with ESMTPSA id d15sm1938285pfo.85.2020.09.28.07.15.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 07:16:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v3][PATCH] cmocka: add recipe
Date: Mon, 28 Sep 2020 07:15:59 -0700
Message-Id: <20200928141559.13494-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

includes ptest and bundling of examples that can be used for testing

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
V2]
Backport the OE Samba fix
amba: fix build on qemumips64 with musl
https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba?id=b758150d30a5fbdc47c465d0e9dca3a7e6d71f3c

The cmocka fix "Don't redefine uintptr_t" did not address the musl failure.
https://git.cryptomilk.org/projects/cmocka.git/commit/?id=28ce16b29911e5adc60140b572dee177adc7a178

WIll have to submit the samba fix to cmacka and see how it goes.

v3]
add pkg to pkg-groups
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +
 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb   | 39 ++++++++++++++
 .../cmocka/files/cmocka-uintptr_t.patch       | 53 +++++++++++++++++++
 meta-oe/recipes-test/cmocka/files/run-ptest   | 10 ++++
 4 files changed, 104 insertions(+)
 create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
 create mode 100644 meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
 create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 46cc935c66..9bfc8ffaa4 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -886,6 +886,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
 
 RDEPENDS_packagegroup-meta-oe-test ="\
     bats \
+    cmocka \
     cppunit \
     cukinia \
     cunit \
@@ -916,6 +917,7 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     uthash-ptest \
     libee-ptest \
     poco-ptest \
+    cmocka-ptest \
 "
 RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86 = " mcelog-ptest"
 RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86-64 = " mcelog-ptest"
diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
new file mode 100644
index 0000000000..5aee5ef931
--- /dev/null
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
+objects. It only requires the standard C library, works on a range of computing \
+platforms (including embedded) and with different compilers."
+HOMEPAGE = "https://cmocka.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
+           file://run-ptest \
+           file://cmocka-uintptr_t.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
+
+do_install_append () {
+    install -d ${D}${datadir}/${BPN}/example
+    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
+    install -d ${D}${datadir}/${BPN}/example/mock/uptime
+
+    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
+    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
+    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
+    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
+}
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+
+FILES_${PN}-examples = "${datadir}/${BPN}/example"
diff --git a/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch b/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
new file mode 100644
index 0000000000..8d3b73b631
--- /dev/null
+++ b/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
@@ -0,0 +1,53 @@
+From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 25 Jul 2018 09:55:25 +0800
+Subject: [PATCH] samba: cmocka.h: fix musl libc conflicting types error
+
+Fix build on qemumips64(el)
+
+taken from:
+[PATCH] libldb: fix musl libc conflicting types error
+
+/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
+            typedef unsigned int uintptr_t;
+                                 ^~~~~~~~~
+use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Taken from [PATCH] samba: cmocka.h: fix musl libc conflicting types error
+https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba?id=b758150d30a5fbdc47c465d0e9dca3a7e6d71f3c
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+This fix is not in cmocka, so pending pending??
+
+
+Index: git/include/cmocka.h
+===================================================================
+--- git.orig/include/cmocka.h
++++ git/include/cmocka.h
+@@ -116,7 +116,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+ 
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
++#if !defined(__DEFINED_uintptr_t)
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -140,9 +140,8 @@ typedef uintmax_t LargestIntegralType;
+ #  endif /* __WORDSIZE */
+ # endif /* _WIN32 */
+ 
+-# define _UINTPTR_T
+-# define _UINTPTR_T_DEFINED
+-#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
++# define __DEFINED_uintptr_t
++#endif /* !defined(__DEFINED_uintptr_t) */
+ 
+ /* Perform an unsigned cast to uintptr_t. */
+ #define cast_to_pointer_integral_type(value) \
diff --git a/meta-oe/recipes-test/cmocka/files/run-ptest b/meta-oe/recipes-test/cmocka/files/run-ptest
new file mode 100644
index 0000000000..48b9cd9fc5
--- /dev/null
+++ b/meta-oe/recipes-test/cmocka/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in `ls *`; do
+   if [ ./$i ] ; then
+       echo "PASS: $i"
+   else
+       echo "FAIL: $i"
+   fi
+done
-- 
2.17.1

