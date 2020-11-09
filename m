Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.18271.1604955801721059584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 13:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gNDXvcxp;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 62so8171003pgg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 13:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqpGnCqzca+djJnT3U9TSf9ap8LW//wOCisR2mZ0M30=;
        b=gNDXvcxpWqUNHaWcTv0NeGF60YpPEvgFW5Chksq/jTQfcs7P5oZTw4EVHvjbimJdtD
         4eoOqQZv0F7/B3tlNF5Px5ebN5nK2OIw6lCCFL8QVYGPWArb4qA+imXaJVcmzPzfe/8K
         pw+pGunOv8tWDFXg+yrCTcQ5H5uXQAQEackv3+WMRljGEfUmk3fmjrtziQ2nE+IeIq0i
         eY9ju+7HChbVXDuKB8SRdkUMe6XwPhhP3Z/0G/JxWqDkz9EOC6bEJ4COc45lrFtT9pU4
         7OfOZ9zEblyyBGCNMxu7sqtj/NzNixfATklP94ZorGzQ9JRrORzXDZatVOtdC5/OAEWQ
         vLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqpGnCqzca+djJnT3U9TSf9ap8LW//wOCisR2mZ0M30=;
        b=BycE57dW77iX8UgaWlbOyBl3IJQzV8y7VD3bv10hMcqKkga6Qr0Kng+AMJG+wZJjwl
         EBtxgPx1U32hR9HthUnpnKXQgPGbrDIQAuEl9CQn+KHVQjz5eDqOknA27na0oa1dLJOC
         feYr4sh0j/jX786jXDiAVDAzgRLg7Wy1XZdKcNDXwUhCtH5QD8UCfJ8hwfLeXqOsOO3G
         ZsongO0LhThRd6tJdAO/dw0qC7/9dMTeWZhOSeLveFGPL3p6llV+IPD/+Jp6KgTW9XO3
         FfGjFkKasLen5B6q28jWgFVPv+3ApUiaYNLbuSjxVS7OuTYNHbF7rtvgi2yO9CO/rg3+
         2zPQ==
X-Gm-Message-State: AOAM530r5eSFSXip8lFWRomw03365+RNvfSJ3MsusgVBv+8NzpZegFUq
	SMcYquf0Q/GVDSf09Wpwr99LbCGIs5guHg==
X-Google-Smtp-Source: ABdhPJxSVD3D8BmK9puX5ZKv6ZbMZ+aBXTk/rNyy4iMuQye+xm77FNArjhod1GzJaYe9+q/JiVWsXg==
X-Received: by 2002:a17:90a:454d:: with SMTP id r13mr1184334pjm.122.1604955800727;
        Mon, 09 Nov 2020 13:03:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s17sm364624pjr.56.2020.11.09.13.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:03:20 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] cmocka: Fix buils with LTO
Date: Mon,  9 Nov 2020 13:03:18 -0800
Message-Id: <20201109210318.3776013-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to latest on master
Drop uintptr_t patch, its fixed upstream differently
Package up the new library libproc_uptime.so needed by examples
Add it to INSANE_SKIP for examples

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Package missing libproc_uptime.so

 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb   | 10 ++--
 .../cmocka/files/cmocka-uintptr_t.patch       | 53 -------------------
 2 files changed, 7 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
index 5aee5ef931..e4afa43e97 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
@@ -6,17 +6,19 @@ HOMEPAGE = "https://cmocka.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
+SRCREV = "a4fc3dd7705c277e3a57432895e9852ea105dac9"
+PV .= "+git${SRCPV}"
 SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
            file://run-ptest \
-           file://cmocka-uintptr_t.patch \
           "
 
 S = "${WORKDIR}/git"
 
 inherit cmake ptest
 
-EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
+# Use -Wl,wrap linker flag, which does not work with LTO
+LTO = ""
 
 do_install_append () {
     install -d ${D}${datadir}/${BPN}/example
@@ -27,6 +29,7 @@ do_install_append () {
     install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
     install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
     install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
+    install -m 0644 ${B}/example/mock/uptime/libproc_uptime.so ${D}/${datadir}/${BPN}/example/mock/libproc_uptime.so
 }
 
 do_install_ptest () {
@@ -37,3 +40,4 @@ do_install_ptest () {
 PACKAGE_BEFORE_PN += "${PN}-examples"
 
 FILES_${PN}-examples = "${datadir}/${BPN}/example"
+INSANE_SKIP_${PN}-examples = "libdir"
diff --git a/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch b/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
deleted file mode 100644
index 8d3b73b631..0000000000
--- a/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 25 Jul 2018 09:55:25 +0800
-Subject: [PATCH] samba: cmocka.h: fix musl libc conflicting types error
-
-Fix build on qemumips64(el)
-
-taken from:
-[PATCH] libldb: fix musl libc conflicting types error
-
-/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
-            typedef unsigned int uintptr_t;
-                                 ^~~~~~~~~
-use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Taken from [PATCH] samba: cmocka.h: fix musl libc conflicting types error
-https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba?id=b758150d30a5fbdc47c465d0e9dca3a7e6d71f3c
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
-This fix is not in cmocka, so pending pending??
-
-
-Index: git/include/cmocka.h
-===================================================================
---- git.orig/include/cmocka.h
-+++ git/include/cmocka.h
-@@ -116,7 +116,7 @@ typedef uintmax_t LargestIntegralType;
-     ((LargestIntegralType)(value))
- 
- /* Smallest integral type capable of holding a pointer. */
--#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
-+#if !defined(__DEFINED_uintptr_t)
- # if defined(_WIN32)
-     /* WIN32 is an ILP32 platform */
-     typedef unsigned int uintptr_t;
-@@ -140,9 +140,8 @@ typedef uintmax_t LargestIntegralType;
- #  endif /* __WORDSIZE */
- # endif /* _WIN32 */
- 
--# define _UINTPTR_T
--# define _UINTPTR_T_DEFINED
--#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
-+# define __DEFINED_uintptr_t
-+#endif /* !defined(__DEFINED_uintptr_t) */
- 
- /* Perform an unsigned cast to uintptr_t. */
- #define cast_to_pointer_integral_type(value) \
-- 
2.29.2

