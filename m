Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AB2CAC5BF
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.18533.1758896380552497145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dd4frCGj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b29ebf9478bso303660466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896379; x=1759501179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3emkTZujUOBKWty33IVlbkIOk0vjnY3yHIyoXIWRxU=;
        b=dd4frCGj/CmYcW4qTxx/+RwNVsVXSIHfNt+0su7L1pwfPwVdgFw4xdOmES8w/U+Ilv
         uYQT0/QpEa/D8lkzabOKib8dRqZaSVPhStJnLaID+895P87Qih84kkZ1n+594ZrpVQ5i
         ZL+gyYeb6A9Bssd6Ql1LfdRHfZPH3krCfiNGDzxBnUNym1/6NRQY8sisKfHLwthVrMJP
         BWX9go4fX0tpXea0SCHBchd6VmPDfl0HASk2bDqk3i9cUCZrGNIxOu2xxOdR/9YQ0zpC
         T6GUt3ekW184ibDxCJQHVwjXfS9tBN0cPpijKwNyy6JMvjZT63vrcV0OOWA3g48g+Wlu
         naBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896379; x=1759501179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3emkTZujUOBKWty33IVlbkIOk0vjnY3yHIyoXIWRxU=;
        b=SQCOwvTGHhtjmHRIFnLVn0W6KO8aIsESdA5sp9qDd7rWX/PrAA02AtO3H7S9RK4eKW
         9+6WHsbRF4f6QvYio+h95gpECdO0HdsbYcKve8wYDk07SA1gh4AoYqxVxv5PIaJHQbeI
         xvPfJko7BkWEvREzIASua8tCRZkp/X5f5nrz5c3u7qVEKgn0M86EERbsj6hKGXe5NK3+
         Gbj7UU9O3azCRgTSI+4zQV0hiuyX+IUdBGVzkvxxEj0jXyNTZIXBxuIzP64Vp2s8XBL3
         Tr1Ws+JTb8tC3MsnuNyTecZURe+09ZjJSvrzp/yveECwKtqW7jC/tZfoQurqU8k+Rg3X
         n/cQ==
X-Gm-Message-State: AOJu0YxJV00PL44X7re8Faa41gEnpGbZ44ygHIatAb1OCa503Pg76Dl4
	t/Cmp3sj2xS6PWSaA7EUvJXV0TtHGxFuNusqEmZsL9be3/2SxaVxmbm7+lHYvw==
X-Gm-Gg: ASbGncsqSovwb44EjIjTYZxjloTWh4Ii0X1ecxS4/EzcEulnXF+5WACxJ/b3uTsPaW5
	moYXLG/3kuG6NAqUH4OIrnYhMaEgEdp0ZP6wO7/No6kbXNYQFpFCHJ1pogwaybwCvzjYzY2KlWy
	pcP3Eic0wISFVXytVlM1j0yQxszMhZNVgRyYEZ9lrqJdlDRs7+or167StG11C+WVi5BqCSlAaYt
	TRgiVriV2C1i7UBQ+oOlnM27hkb5aTjL946aa29aaSoCz2KFref7iPr1EprggUrxqEO8tzzNhNe
	eJt5uMq1HAAQdTdqxjRPPjtiTndFQ71aXhqQi5oBi/x16P4NUlPy082GpXMlCBn0JcWkcm6kmY6
	tZ4S9H9SDjNSz5P/u4QX/
X-Google-Smtp-Source: AGHT+IEC3xBdsMfeTHbYiGMstvW/EK2H3eHNstT2OM6AFyYQwl1R/NXw/6DyZQoigQscIj3juHYtZg==
X-Received: by 2002:a17:906:4fce:b0:b2d:b5d3:9630 with SMTP id a640c23a62f3a-b34bcd58344mr873339866b.48.1758896378775;
        Fri, 26 Sep 2025 07:19:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 17/20] openflow: Switch SRC_URI to github mirror
Date: Fri, 26 Sep 2025 16:19:16 +0200
Message-ID: <20250926141919.2010846-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119926

From: Khem Raj <raj.khem@gmail.com>

Original repo seems to be not accessible.
Fix build with clang-18

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 59bffb68440c9099d724aa2f2b1e6366216f0f11)

Adapted for Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-protocols/openflow/openflow.inc   |  2 +-
 ...ify-export-dynamic-directly-to-linke.patch | 30 +++++++++++++++++++
 .../openflow/openflow_git.bb                  |  3 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index aaad0e00e1..3c29a5c8cf 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -11,7 +11,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
-SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git;branch=master"
+SRC_URI = "git://github.com/mininet/openflow;protocol=https;branch=master"
 
 CVE_CHECK_IGNORE = "\
     CVE-2015-1611 \
diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch
new file mode 100644
index 0000000000..27fc05f09d
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch
@@ -0,0 +1,30 @@
+From 12bba388719c425d9b5cd970d4fabf01edf56aa4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Feb 2024 22:33:12 -0800
+Subject: [PATCH] Makefile.am: Specify export-dynamic directly to linker
+
+Fixes build with clang-18+
+| riscv64-yoe-linux-clang: error: unknown argument: '-export-dynamic'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 97ac1f0..e557fe7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -23,7 +23,7 @@ if NDEBUG
+ AM_CPPFLAGS += -DNDEBUG
+ AM_CFLAGS += -fomit-frame-pointer
+ else
+-AM_LDFLAGS = -export-dynamic
++AM_LDFLAGS = -Wl,--export-dynamic
+ endif
+ 
+ CLEANFILES =
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 1ac5dd4105..28e8f6cde3 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -1,10 +1,11 @@
 include ${BPN}.inc
 
-SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
+SRCREV = "82ad07d997b0b2ee70e1b2c7e82fcc6d0ccf23ea"
 PV = "1.0+git${SRCPV}"
 
 SRC_URI += "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
            file://0001-generate-not-static-get_dh-functions.patch \
            file://0001-socket-util-Include-sys-stat.h-for-fchmod.patch \
+           file://0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch \
            "

