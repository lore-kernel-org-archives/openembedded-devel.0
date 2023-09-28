Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFA8E732DD
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 14:26:17 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.14633.1695911173894554970
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 07:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6o04ojx;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3226cc3e324so11807853f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 07:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695911172; x=1696515972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms76LSlaPyUR7j3g0zlGegmOc/NZeETOtmurNIGNmFI=;
        b=O6o04ojxBxjP1WH66UVf0KYp0OB6KpkiaftLJ13wZiFfFVgBHg3mAqiDuD3WWkHD+p
         3f6vv28x2fgafv8gYyA7Uzi1tyKbEi5rG0shggm2F1ecmbxJdB6TIUqd/J+C+hjCoXeH
         VfAQ/tCji6yYkdqKQBtS3f1If57G87hrzRDW7NOkuc740dDb/iZTXhxx6POBlVB13xgO
         K/wVVk2nzd3QOpRDvH3gIW9+IFZ/QDc9w/vvF6ee/dZyjTnqI6Gywsb/Ad25ALzAcQ55
         iyjwPkXLA2HOIFEzD2lZDj+09NWdrevjVjo3o/YXCAPF77ZaBKi7C71ForOqOmiJfh9u
         YfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911172; x=1696515972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ms76LSlaPyUR7j3g0zlGegmOc/NZeETOtmurNIGNmFI=;
        b=HM6dytfKR+0IbiwtEXpcncAZ84OH9cjsgr681InUpkcj39M4EsCiolrOhB45buSk5Y
         0ZFHIykm/QbQt0HczImE7AJali8WAnPwobgy2Une4XW+z7BNIBiMt0M5TCzGr+F8yx8K
         IGsbFTAdrB0/NFOotqtI0JA0AENEvPP+2TptwMP5/qo1zpnEBKTNlX9fYv8M+4q/Fbs9
         4mGy2ZPW0nh3OWT5VI0pNSqtFx+tHfnTvD34cv6j2GePpPrXwGjvQF3cro6heX/tsimV
         s9TzYStXZ8eYf79BOAUnQUMQWENqPYctJtgYHVfSoUFGvdtm/Q/LF7GNDV0bJB9lkVQ1
         whNA==
X-Gm-Message-State: AOJu0YwPEj4o7Y4/7ZIyVgtW3GMRn5QZeTLQQbfFSqjyXCNvHoXaT53q
	JlBlOm9WDTTreFH6pixDDedRpW55en8=
X-Google-Smtp-Source: AGHT+IGaA3ETcmLKcIxzG4wFAVnx9h2m8mJDNsh1AM5DJ2HXSeJDnfXHRdA/KDljBHdWYSan/d1HUw==
X-Received: by 2002:a5d:4a0b:0:b0:321:62b0:7ad8 with SMTP id m11-20020a5d4a0b000000b0032162b07ad8mr1371131wrq.16.1695911171738;
        Thu, 28 Sep 2023 07:26:11 -0700 (PDT)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d50c1000000b003142e438e8csm19506992wrt.26.2023.09.28.07.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 07:26:11 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] jq: Upgrade 1.6+git -> 1.7
Date: Thu, 28 Sep 2023 15:26:03 +0100
Message-Id: <20230928142603.15026-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 14:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105222

Move to new upstream, drop use of autotools-brokensep as the build now
works without it, drop local patches which have been merged, fix
buildpaths leakage.

License-Update: Fix misspellings [https://github.com/jqlang/jq/commit/5cebe86a7b90e5718077c5e1d5c2165939d3f3cb]
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...XOPEN_SOURCE-when-checking-for-strpt.patch | 40 -------------------
 ...ace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch | 32 ---------------
 .../jq/{jq_git.bb => jq_1.7.bb}               | 25 +++++++-----
 3 files changed, 14 insertions(+), 83 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
 rename meta-oe/recipes-devtools/jq/{jq_git.bb => jq_1.7.bb} (67%)

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch b/meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch
deleted file mode 100644
index e4d6ebb45b1d..000000000000
--- a/meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 40bbd419ad8d1bd9cbe8b17063c323f8a40ab327 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Sep 2022 09:59:31 -0700
-Subject: [PATCH 1/2] configure: Pass _XOPEN_SOURCE when checking for strptime
-
-Include sys/time.h for gettimeofday since thats where its in glibc
-
-Upstream-Status: Submitted [https://github.com/stedolan/jq/pull/2480]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a2cd99e..95afe06 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -139,7 +139,10 @@ AC_FUNC_ALLOCA
- 
- AC_FIND_FUNC([isatty], [c], [#include <unistd.h>], [0])
- AC_FIND_FUNC([_isatty], [c], [#include <io.h>], [0])
-+OLD_CFLAGS=$CFLAGS
-+CFLAGS="$CFLAGS -D_XOPEN_SOURCE"
- AC_FIND_FUNC([strptime], [c], [#include <time.h>], [0, 0, 0])
-+CFLAGS=$OLD_CFLAGS
- AC_FIND_FUNC([strftime], [c], [#include <time.h>], [0, 0, 0, 0])
- AC_FIND_FUNC([setenv], [c], [#include <stdlib.h>], [0, 0, 0])
- AC_FIND_FUNC([timegm], [c], [#include <time.h>], [0])
-@@ -147,7 +150,7 @@ AC_FIND_FUNC([gmtime_r], [c], [#include <time.h>], [0, 0])
- AC_FIND_FUNC([gmtime], [c], [#include <time.h>], [0])
- AC_FIND_FUNC([localtime_r], [c], [#include <time.h>], [0, 0])
- AC_FIND_FUNC([localtime], [c], [#include <time.h>], [0])
--AC_FIND_FUNC([gettimeofday], [c], [#include <time.h>], [0, 0])
-+AC_FIND_FUNC([gettimeofday], [c], [#include <sys/time.h>], [0, 0])
- AC_CHECK_MEMBER([struct tm.tm_gmtoff], [AC_DEFINE([HAVE_TM_TM_GMT_OFF],1,[Define to 1 if the system has the tm_gmt_off field in struct tm])],
-                 [], [[#include <time.h>]])
- AC_CHECK_MEMBER([struct tm.__tm_gmtoff], [AC_DEFINE([HAVE_TM___TM_GMT_OFF],1,[Define to 1 if the system has the __tm_gmt_off field in struct tm])],
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch b/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
deleted file mode 100644
index e849436578bd..000000000000
--- a/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cda1734bed3b048c01452c798877d05b8c2f4c15 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Sep 2022 10:00:59 -0700
-Subject: [PATCH 2/2] builtin: Replace _BSD_SOURCE with _DEFAULT_SOURCE
-
-newer glibc has remove _BSD_SOURCE and wants it to be replaced with _DEFAULT_SOURCE
-
-Fixes
-/usr/include/features.h:194:3: warning: "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-W#warnings]
-warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
-
-Uptream-Status: Submitted [https://github.com/stedolan/jq/pull/2480]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/builtin.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/builtin.c b/src/builtin.c
-index 1c6b08c..2a31496 100644
---- a/src/builtin.c
-+++ b/src/builtin.c
-@@ -1,4 +1,4 @@
--#define _BSD_SOURCE
-+#define _DEFAULT_SOURCE
- #define _GNU_SOURCE
- #ifndef __sun__
- # define _XOPEN_SOURCE
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_1.7.bb
similarity index 67%
rename from meta-oe/recipes-devtools/jq/jq_git.bb
rename to meta-oe/recipes-devtools/jq/jq_1.7.bb
index 4fa98aa44f35..5c2e3aae8fc4 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.bb
@@ -2,22 +2,21 @@ SUMMARY = "Lightweight and flexible command-line JSON processor"
 DESCRIPTION = "jq is like sed for JSON data, you can use it to slice and \
                filter and map and transform structured data with the same \
                ease that sed, awk, grep and friends let you play with text."
-HOMEPAGE = "https://stedolan.github.io/jq/"
-BUGTRACKER = "https://github.com/stedolan/jq/issues"
+HOMEPAGE = "https://jqlang.github.io/jq/"
+BUGTRACKER = "https://github.com/jqlang/jq/issues"
 SECTION = "utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2814b59e00e7918c864fa3b6bbe049b4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=488f4e0b04c0456337fb70d1ac1758ba"
 
-PV = "1.6+git${SRCPV}"
-SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master \
-    file://0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch \
-    file://0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch \
+GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
+SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRCREV = "cff5336ec71b6fee396a95bb0e4bea365e0cd1e8"
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "402a0d6975d946e6f4e484d1a84320414a0ff8eb6cf49d2c11d144d4d344db62"
 
-inherit autotools-brokensep ptest
+inherit autotools github-releases ptest
+
+UPSTREAM_CHECK_REGEX = "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ?= "oniguruma"
 
@@ -27,8 +26,12 @@ PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
 # enable if you want ptest running under valgrind
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
+do_configure:append() {
+	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
+}
+
 do_install_ptest() {
-    cp -rf ${B}/tests ${D}${PTEST_PATH}
+    cp -rf ${S}/tests ${D}${PTEST_PATH}
     cp -rf ${B}/.libs ${D}${PTEST_PATH}
     # libjq.so.* is packaged in the main jq component, so remove it from ptest
     rm -f ${D}${PTEST_PATH}/.libs/libjq.so.*
-- 
2.39.0


