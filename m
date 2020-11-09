Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.15160.1604943510161114423
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UZkeuzMk;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id q5so5839657pfk.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UKRwPejDKXfiuW1tOklFG4FqQTc1DCx1YAAZ3WhjwNA=;
        b=UZkeuzMk/0LJlI5lmvSzEH8tXlj7VolZPunx+QfryeBU5xy6GhCAroy1iugoLOZ4F6
         AAY31uYTLfm0nFXmocN55LgLzmG6SAnEtxwsoQMG8NTEfL127a8dQLp5QKzZTNeH3X7Y
         HXWQFHBjwO8CA4DKcwhvri8Ktij+uYFTs9J/NKNALYxoFp89qWaV+hCQUx8bfymUJzEP
         pTfb70KNUE6rU4MCi7DsIsmyBtqU8SmzbdRCbUIySoDSgCZnRq7eSYGj4E9yoQ9ZmE5T
         f1D+WwlQShfPUjAmt/wjc8I20QMn9L5jUvihpZAza2Xl847N9FuuAJb8wgdganNYksNs
         mfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UKRwPejDKXfiuW1tOklFG4FqQTc1DCx1YAAZ3WhjwNA=;
        b=SCsc9Xloh5gghycAf9C7IlB2RU8H5Ym21Xt0+gIkb+p3cDTyfz0lToNZUoywZHJH/F
         hMZAurEeHv0QOHdWiVCO16PIIHIBunXji4XOkDxUZ6pJjm1yFxmRhSlTl12MuiSPxx6X
         0Yg5PCajOHlC5QSBZ/2J7/4InqnQaxok9e6QyogXgo0JQotSruQZoTZVMwQbVRJ2e8/e
         WFaZvoHR8U32LUjVvljS4SL8wzGCKTN7xEkYF526vmxIg0d6WpYOAQ0ZO21Nl0MlwdXG
         f3qSpEeS/kcLpEuKFfn0GSIoaNsQkaiYz/BKYCxsbTZHl3L4Hw9GaWDuWHx2SopVcl3G
         9Eag==
X-Gm-Message-State: AOAM530zZpZQC1iqRkeLEXuIKqJwxlVAtM2+lR0vYW99lZnleswP1joE
	plbyRaTFw0M+tCieAeX9URHxe7PbyAtN1g==
X-Google-Smtp-Source: ABdhPJwsX4p61bGM+xgI4PeP3JwY1lNacudvb2rlTc4r8SnTTe5df4+ESAgMxk2Ep4wJ4RIYkgap0w==
X-Received: by 2002:a17:90a:16c1:: with SMTP id y1mr273967pje.168.1604943509294;
        Mon, 09 Nov 2020 09:38:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/8] cmocka: Fix buils with LTO
Date: Mon,  9 Nov 2020 09:38:18 -0800
Message-Id: <20201109173820.3545516-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109173820.3545516-1-raj.khem@gmail.com>
References: <20201109173820.3545516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to latest on master
Drop uintptr_t patch, its fixed upstream differently

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb   |  7 ++-
 .../cmocka/files/cmocka-uintptr_t.patch       | 53 -------------------
 2 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
index 5aee5ef931..10716b2c5e 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "https://cmocka.org/"
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
@@ -18,6 +18,9 @@ inherit cmake ptest
 
 EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
 
+# Use -Wl,wrap linker flag, which does not work with LTO
+LTO = ""
+
 do_install_append () {
     install -d ${D}${datadir}/${BPN}/example
     install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
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

