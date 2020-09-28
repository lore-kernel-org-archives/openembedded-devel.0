Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.28365.1601261768474217143
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rID/Rhvt;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b124so7986254pfg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2020 19:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=gnpT9JiUyic5rcgvWbIcskCIBtqTIqOamZt0XjdXzJQ=;
        b=rID/RhvtguwemGaG+bekhEyo29eZ0XOE6m7DBsjDNLvS9t3bALZxGs93Xgfd3uvWZs
         kgOJojXOHXYASzoXgIapUt5OKaAX0wxhKydyrVOs1aW1fewhxArvNKYBD6J2nf54QsEU
         d3ZlDHWAbpfKU64+IEDnFoMDxDB/+aeBDoYosvDDAzzHABRst3DrG/uUGf2Q/xb34U2A
         rvh8pPyQ9fYYI8iKcG1UVuQCEgEIbdZET4ZAiToi8+Yu7eeU7csq03KBsjqf9VBE2svy
         ZoZRjiaPJh1on17hPyPU4QNOx+QAXCg1GS8MaQoiZh40HMtEPmYEXS75uDB8z/QFlGFF
         NkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=gnpT9JiUyic5rcgvWbIcskCIBtqTIqOamZt0XjdXzJQ=;
        b=mVH0ahjz0LylqjshAk4EKtrk9NAXOWfCaL5gwM+LgqV3IrATqSVFj0mxDr1WBm7QXC
         M7ijO9k38pdEXbSL3pgOfjqWot5FFebzROsRC0eMiR527/jk3ul44oCEkTXlD8uNf3hR
         B3jaFPvBr6C94T2CqDaiGruVGXkdEz/5dlvo+0RJ+RLXaGyEXUSTO00cDWvkFbNpJMdN
         KoXn2YbH2Dgf+CRJgjKwcwxTz258iXc25QL8CrPqwS7pO+9VSkWgaWRdZpH3tehr3+Jc
         1+jVh8ztuv18eVlLQOAbA5Qeh/4EROSqPjzm7heOpjRdcgZM2cvGk5dYjWC7uJJ0PC8g
         jKhA==
X-Gm-Message-State: AOAM532MTf0Q6xhG7LGc52QhD8otMXjqqzUTuS3DpXFDvfuxpfnq0pOB
	kOnwekFYYkne02LbNWpF7tKnh05gp7g=
X-Google-Smtp-Source: ABdhPJxICvA9cvBqQGNWyOMxobBC6kouMhc7fnWuXadyAQcQwC2hzSZhoEYgQPFnfLt9NFUeyhXlPw==
X-Received: by 2002:aa7:911a:0:b029:13e:d13d:a13d with SMTP id 26-20020aa7911a0000b029013ed13da13dmr8800471pfh.37.1601261767690;
        Sun, 27 Sep 2020 19:56:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0::41a6])
        by smtp.gmail.com with ESMTPSA id q16sm9853717pfj.117.2020.09.27.19.56.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:56:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH] cmocka: add recipe
Date: Sun, 27 Sep 2020 19:56:06 -0700
Message-Id: <20200928025606.8552-1-akuster808@gmail.com>
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
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb   | 39 ++++++++++++++
 .../cmocka/files/cmocka-uintptr_t.patch       | 53 +++++++++++++++++++
 meta-oe/recipes-test/cmocka/files/run-ptest   | 10 ++++
 3 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
 create mode 100644 meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
 create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest

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

