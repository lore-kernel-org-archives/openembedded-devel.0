Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A9BC7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 18:43:14 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.68072.1686595392414976874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 11:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Go2SKNfw;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-33e53672aa6so30004735ab.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686595391; x=1689187391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6tiYvMviAByBYL86uP3hk7llAkHQH4i03nTUT+wyi0=;
        b=Go2SKNfwE30evimXB9zdr1mYOxXnTtT7hvL3BAwxnlMBmoVBm5Bj5kUcU9ERd8rJMN
         VEzcybn8rkZDbAUQI0pIyF00J9PCApIxYs6eL7m0bYAq2qpT+Lp8ip1OM0NkpmfokaQA
         vBFYdNJ3r93GqxGahL3gu/hD4SYJVc6XU6/FgZk1gzE7xAukd0hJBILZky249IO4ZgGq
         PxV5ddkD7NKdJoNThAQHwx1G44HWDdmsZXV3Z6ova2R/VaU633o3VG6+nAmtcXhY3WMD
         p7oEVwJ1LTUkNIkxXdZ2QpL9S8EgU8ORoIG/oWRLDr2sK4lRp8qT20ice4K2l8wDqD56
         5P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686595391; x=1689187391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6tiYvMviAByBYL86uP3hk7llAkHQH4i03nTUT+wyi0=;
        b=dve8hL0x+ULf8LR+ypvu6lwslu/xOezAxBOvB0T7dZcr5ZU1g60CQFwYZNEnSB96EW
         QYmUiv9a1YMKz375DB215kpGK+n7C7/SwPE5rxvc5fr/Or+iKOErmGvi6sbllf0AY3wy
         LWV5Wju3xh/T7clsyC4TNtaEE3NYlrZ40inW5ewy7hxb+uqACVr2+mHQh9nVtkA3bDM+
         3nhXUSszfxaHu3T9DXWWhpS7jD/F50KCxUYOCAb/pKmA0N4He6ICx8ZHj5ktnrUsi/CS
         KdftUsWN+we93kmKFdiKE8jg99lDMTqqF++XSrauM+4BAz5kMWCgu8KvVoCCPNRVn6GK
         /stg==
X-Gm-Message-State: AC+VfDwVtM4C1lrGdSN12S7C6wSvQ0mQe/Jeaw5qrqr1s1EA2Oor0Pw/
	85p209TlSGFIZ9XBvLrVx39y8eaWlRY=
X-Google-Smtp-Source: ACHHUZ6vinHAXG5Ugtvldg3MXze765gZbPEYaA1ZvzeCzz4TAKSrrc6SMULEBTpH/KrCW678amxaGg==
X-Received: by 2002:a05:6e02:152:b0:331:53ee:921d with SMTP id j18-20020a056e02015200b0033153ee921dmr8827906ilr.25.1686595391333;
        Mon, 12 Jun 2023 11:43:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020a63ff52000000b0054fa8539681sm520190pgk.34.2023.06.12.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:43:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] schroedinger: Fix building tests
Date: Mon, 12 Jun 2023 11:43:07 -0700
Message-ID: <20230612184309.1556169-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 18:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103217

lld finds out this error where _orc_code_orc_deinterleave2_s16 is needed
but is not linked into a testcase wavelet_max_gain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...p-orc.c-for-missing-_orc_code_orc_de.patch | 43 +++++++++++++++++++
 .../schroedinger/schroedinger_1.0.11.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/schroedinger/schroedinger/0001-testsuite-Add-tmp-orc.c-for-missing-_orc_code_orc_de.patch

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/0001-testsuite-Add-tmp-orc.c-for-missing-_orc_code_orc_de.patch b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/0001-testsuite-Add-tmp-orc.c-for-missing-_orc_code_orc_de.patch
new file mode 100644
index 0000000000..498630c638
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/0001-testsuite-Add-tmp-orc.c-for-missing-_orc_code_orc_de.patch
@@ -0,0 +1,43 @@
+From 7c998657c1787fcad8f0a502063adff71d78a140 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Jun 2023 09:37:10 -0700
+Subject: [PATCH] testsuite: Add tmp-orc.c for missing
+ _orc_code_orc_deinterleave2_s16
+
+Fixes
+| aarch64-yoe-linux-ld.lld: error: undefined symbol: _orc_code_orc_deinterleave2_s16
+| >>> referenced by schroorc.h:1312 (../schroedinger/schroorc.h:1312)
+| >>>               wavelet_max_gain.o:(iwt_ref)
+| >>> referenced by schroorc.h:1312 (../schroedinger/schroorc.h:1312)
+| >>>               wavelet_max_gain.o:(iwt_ref)
+|
+| aarch64-yoe-linux-ld.lld: error: undefined symbol: _orc_code_orc_interleave2_s16
+| >>> referenced by wavelet_max_gain.c:281 (/usr/src/debug/schroedinger/1.0.11-r0/testsuite/wavelet_max_gain.c:281)
+| >>>               wavelet_max_gain.o:(iiwt_ref)
+| >>> referenced by wavelet_max_gain.c:281 (/usr/src/debug/schroedinger/1.0.11-r0/testsuite/wavelet_max_gain.c:281)
+| >>>               wavelet_max_gain.o:(iiwt_ref)
+| clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
+| make[3]: *** [Makefile:1147: wavelet_max_gain] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testsuite/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testsuite/Makefile.am b/testsuite/Makefile.am
+index 6ee1130..762ecf2 100644
+--- a/testsuite/Makefile.am
++++ b/testsuite/Makefile.am
+@@ -100,6 +100,7 @@ wavelet_2d_SOURCES = wavelet_2d.c
+ nodist_wavelet_2d_SOURCES = $(top_srcdir)/schroedinger/tmp-orc.c
+ 
+ wavelet_max_gain_SOURCES = wavelet_max_gain.c
++nodist_wavelet_max_gain_SOURCES = $(top_srcdir)/schroedinger/tmp-orc.c
+ 
+ wavelet_noise_2d_SOURCES = wavelet_noise_2d.c
+ 
+-- 
+2.41.0
+
diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index c9d98a2da1..c78e008007 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d91a46405fc074b88c963cc4f2a0aae9 \
 DEPENDS = "orc-native orc"
 
 SRC_URI = "https://download.videolan.org/contrib/${BPN}/${BP}.tar.gz \
+           file://0001-testsuite-Add-tmp-orc.c-for-missing-_orc_code_orc_de.patch \
            file://configure.ac.patch"
 
 SRC_URI[md5sum] = "da6af08e564ca1157348fb8d92efc891"
-- 
2.41.0


