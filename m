Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A31DC6FA8D
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.11314.1662276879216579056
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ArJ4ell5;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so5912748pji.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=G/z8Sp0qw/aJ8FYSyzRES6haZM0zZogrZqQ8PQq3LFw=;
        b=ArJ4ell5vSQ5C/O+JP7DeJnguCxC0HvQvlCsTC3SItjEnyM4mFuZt77N/QGMVwSlrh
         0AZQEIrWUrJR/eD98Zdtx2udbfslmQjk1I6sPdtsGXNRsekt4BZNwvRBgttF3eaPiIPl
         hId/2ogEoXcFZbAA1STzqDMQAqCkEh+an+LUoz1zgqt/eB/w2zSG6kQ4AaiK59YI4RD8
         T+treG5bBD11azx6NIn1bX3jDZMaGQav4cKGprUG5aUEdMy0yX5w6OoO3oNo42AT7/kO
         Gjcjd9njIzKdH/8p/AOkEQC3ARYY4nBFkPR0If3URj2Qj4li3y8GZppk5MM5ThaChj28
         ipcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G/z8Sp0qw/aJ8FYSyzRES6haZM0zZogrZqQ8PQq3LFw=;
        b=WCD5JXRWjohc8tlzGBrNE+LBtrGWYKaIGHJVuzH60qdPcGF6v9KjqH7MLBSpVDkZD6
         14D62oE4iarXlLAeLt/MRs0/9liDJXeibFGO+mruOW6CQnF0qv8NIRv0jQOALPNEjyWq
         T6E5YBT7lMLdEitd39emK1mjnYibG2B+dHsjAQa1GEVN9KfedXV2KJwnN7pyUiqT/wvl
         AxUkYn3MX0f3aoHywZAxqN+ATc261/2OaOGGMw55t97EtFTWSzrKUO5G7r95PDvjrPw9
         TiJA6nE2jcpWY4CV0h0zrtaC4Fr+zQ3PvBrgXHLvuo2sLlzqPjtt2dl6B3BUEy3Lkla6
         I1VA==
X-Gm-Message-State: ACgBeo34ry/VeMSy5KamFrsNqaogO4sgwtlMV95PTuRtCRAjw7pwJqA1
	jduVgg/zLzleSKOeS3Y1PJ9f+XfaJ4HkAg==
X-Google-Smtp-Source: 
 AA6agR5B9GAxBlPdXMTLXiYUlVCmsuScnC3gFdzoxlFnxbjqG08GA571B4sMHhYvRjOATtT9VOM3Ug==
X-Received: by 2002:a17:902:ea10:b0:175:458e:659b with SMTP id
 s16-20020a170902ea1000b00175458e659bmr19789541plg.69.1662276878167;
        Sun, 04 Sep 2022 00:34:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 17/63] lmbench: Add patch to fix typo including
 string.h header
Date: Sun,  4 Sep 2022 00:33:31 -0700
Message-Id: <20220904073417.3251865-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98611

Move all patches under one directory, to keep it simple

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-guard-before-redefining-sockle.patch |  0
 ...ch.h-Fix-typo-in-specifying-string.h.patch | 27 +++++++++++++++++++
 ...ypos-in-lat_unix_connect-manual-page.patch |  0
 .../0001-doc-Fix-typos-in-manual-pages.patch  |  0
 .../0001-lat_fifo-Fix-cleanup-sequence.patch  |  0
 .../0001-lat_http.c-Add-printf-format.patch   |  0
 ...Point-webpage-lm-to-target-directory.patch |  0
 ...-use-libdir-instead-of-hardcoded-lib.patch |  0
 ...AGS-LDFLAGS-to-append-values-passed-.patch |  0
 .../fix-lmbench-memory-check-failure.patch    |  0
 .../lmbench_result_html_report.patch          |  0
 .../obey-ranlib.patch                         |  0
 .../update-config-script.patch                |  0
 .../update-results-script.patch               |  0
 .../lmbench/lmbench_3.0-a9.bb                 |  1 +
 15 files changed, 28 insertions(+)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-Check-for-musl-define-guard-before-redefining-sockle.patch (100%)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/0001-bench.h-Fix-typo-in-specifying-string.h.patch
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-doc-Fix-typos-in-manual-pages.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-lat_fifo-Fix-cleanup-sequence.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-lat_http.c-Add-printf-format.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-lmbench-Point-webpage-lm-to-target-directory.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/fix-lmbench-memory-check-failure.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/lmbench_result_html_report.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/obey-ranlib.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/update-config-script.patch (100%)
 rename meta-oe/recipes-benchmark/lmbench/{lmbench-3.0-a9 => lmbench}/update-results-script.patch (100%)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-bench.h-Fix-typo-in-specifying-string.h.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-bench.h-Fix-typo-in-specifying-string.h.patch
new file mode 100644
index 0000000000..e9220ecbdd
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-bench.h-Fix-typo-in-specifying-string.h.patch
@@ -0,0 +1,27 @@
+From 4bbedd25e74adb5cb181a9ae589adb2052ade630 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 23:34:48 -0700
+Subject: [PATCH] bench.h: Fix typo in specifying string.h
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bench.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bench.h b/src/bench.h
+index 2ebdf5a..750bebf 100644
+--- a/src/bench.h
++++ b/src/bench.h
+@@ -21,7 +21,7 @@ typedef unsigned char bool_t;
+ #include        <signal.h>
+ #include        <errno.h>
+ #ifndef WIN32
+-#include        <strings.h>
++#include        <string.h>
+ #endif
+ #include        <sys/types.h>
+ #ifndef WIN32
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-manual-pages.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-manual-pages.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Point-webpage-lm-to-target-directory.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lmbench-Point-webpage-lm-to-target-directory.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Point-webpage-lm-to-target-directory.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-lmbench-Point-webpage-lm-to-target-directory.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/fix-lmbench-memory-check-failure.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/fix-lmbench-memory-check-failure.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench_result_html_report.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/lmbench_result_html_report.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/obey-ranlib.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/obey-ranlib.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/update-config-script.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/update-config-script.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/update-results-script.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
rename to meta-oe/recipes-benchmark/lmbench/lmbench/update-results-script.patch
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 2046b13f4b..492ea4b10b 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-doc-Fix-typos-in-manual-pages.patch \
            file://0001-lat_fifo-Fix-cleanup-sequence.patch \
            file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch \
+           file://0001-bench.h-Fix-typo-in-specifying-string.h.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
2.37.3


