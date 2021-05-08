Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.3285.1620453124863794892
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 May 2021 22:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OuZYC4mU;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id p17so6295659plf.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 May 2021 22:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIzsaWf9i/CfE+X8tcuuj9i+vw4d8adrxAsyDiqofU8=;
        b=OuZYC4mUkjQiLu9sRGrzud8QaIZq6vdcq1bzyQxwr/wBzd6B3JZHUZyda01ynFYj3T
         GB0OfJfKJLkJivm7dwuF6PCY+Z/sVSmxkjDS3iPQS5456pHU0CEtE5E61oTUVSmDDPzP
         4I63YIn0xfgmgXb7iW9biFL6UwmTEiUXIYh1bqmbJACEsm3lvjX5QcT7a5Q4dF3eo6Nn
         lE38qsHBXOW/2MRTms8ZYAySYWn2jGFsuSQC3vRz710G4qWltjZhY5W7sWM6G0i3GqT2
         GGe+c1v+VBIOWZHu6ATN0Jjhvcv8uOJoOQ4EBJxxp4IYpwAFQkTAW7zQ3thQFs9PbVgC
         sKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIzsaWf9i/CfE+X8tcuuj9i+vw4d8adrxAsyDiqofU8=;
        b=XlmIrGMMYDEBqr4hB9rOloLzw1adAdPvamTSLqzBvcxrpRRQ+p9Y6DRW5ZUbqQdmWd
         CV3YJ+6J95BrwkaaGbwfweCHf5c5VrIOI+JfYweGT1/CDC8Wv5AZF6jPFwTNKmE7JGrK
         urAbKdViqOEI7c6uftAh1QzU58M7zvM3V4UzPWt7qc62o0T4wLH51qrH4R2k4d5+NQAF
         8GUB8iXns5phhb6XcXsnuuFAjk02x/u8QX6O2UOdK+26VQPltNPQcRpoC8kk01+IU1tQ
         e/RU/X7KSzn6yPS63YMjBd8TW1YSvjUEvwnDfdpNVIYb8sa0dCiml7JoRjCQSyMbqO49
         +Cgw==
X-Gm-Message-State: AOAM530RpacYU96r7gAckQIdBQQZFa4nTOXHxUG0nHFzcKIK1DE9o9bs
	IgLiubEVgrkxju6bQBBJp8uXR2PGrqHbiA==
X-Google-Smtp-Source: ABdhPJzkoapEceVTCVJTQtsuLANLaXl49HyqKKfwtNrJaJ1G9SkRcJrhRZNGZBJnNistW0FVNFh97g==
X-Received: by 2002:a17:90b:3796:: with SMTP id mz22mr26905661pjb.80.1620453123957;
        Fri, 07 May 2021 22:52:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id x6sm1141541pjk.19.2021.05.07.22.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 22:52:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Avoid hard dependency on rsync
Date: Fri,  7 May 2021 22:52:01 -0700
Message-Id: <20210508055201.1527814-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  7 +--
 2 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
new file mode 100644
index 0000000000..ae449791f1
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
@@ -0,0 +1,53 @@
+From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 12 Apr 2021 14:03:32 +0200
+Subject: [PATCH] meson: do not fail if rsync is not installed with meson
+ 0.57.2
+
+https://github.com/mesonbuild/meson/issues/8641
+
+Our CI started to fail. Even if the change is reverted in meson,
+we need a quick workaround here.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ man/meson.build | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/man/meson.build b/man/meson.build
+index 3cae8446cda..f9c4b83dc81 100644
+--- a/man/meson.build
++++ b/man/meson.build
+@@ -184,17 +184,20 @@ html = custom_target(
+         depends : html_pages,
+         command : ['echo'])
+ 
+-run_target(
+-        'doc-sync',
+-        depends : man_pages + html_pages,
+-        command : ['rsync', '-rlv',
+-                   '--delete-excluded',
+-                   '--include=man',
+-                   '--include=*.html',
+-                   '--exclude=*',
+-                   '--omit-dir-times',
+-                   meson.current_build_dir(),
+-                   get_option('www-target')])
++rsync = find_program('rsync', required : false)
++if rsync.found()
++        run_target(
++                'doc-sync',
++                depends : man_pages + html_pages,
++                command : [rsync, '-rlv',
++                           '--delete-excluded',
++                           '--include=man',
++                           '--include=*.html',
++                           '--exclude=*',
++                           '--omit-dir-times',
++                           meson.current_build_dir(),
++                           get_option('www-target')])
++endif
+ 
+ ############################################################
+ 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index 4b93087f4f..dee3eab497 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -12,9 +12,10 @@ DEPENDS += "gperf-native gettext-native util-linux libcap"
 
 SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
 SRCBRANCH = "v243-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
-
-SRC_URI += "file://static-libsystemd-pkgconfig.patch"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
+           file://static-libsystemd-pkgconfig.patch \
+           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           "
 
 # patches needed by musl
 SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
-- 
2.31.1

