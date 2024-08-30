Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D87FCA0EF6
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 08:52:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.8524.1725007938424890318
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 01:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jI07S9qr;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a867a564911so189633166b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 01:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725007936; x=1725612736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4IGNtknzoItpPdy3MhAl7yaCfq106JyVYMIOcFm3Zg=;
        b=jI07S9qrSyefdvWTCvUDNeuJFpEc7g059kQaElwwk1ABxXbhJ6poKarbfXzetZ9hOK
         2JxCQ3ss+M5XtDZXKrQpUUbySDUnnZRlRZ+o9RS8PMB+S/jziG7Hj5lU8f2mibnnruNV
         s2cqj6iT0H0AQxirJKkI+5f9eXVgDVKraMWg7r0xCu5vU6qJbb6j50vEQPIbz4cxxx/O
         7pHfjBrVNUM5ezRzIBsKJwYK10EGIHysUGhIvC5eOtwL5vk/qrFaFHwBCpPpdnda+nXI
         oPVBaSvcAJg2a685QHIbB3Zod3E4rQ+OsjkBO6NjJPZFKVmRyn3Zgj563UB2+WrYqvqq
         niKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007936; x=1725612736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4IGNtknzoItpPdy3MhAl7yaCfq106JyVYMIOcFm3Zg=;
        b=pUzi/2GpyFHDDzqp8JKfySzbee0pfp1GKDSkTHPugl12ZRhw5pIoJ9LemhPwVbuKF+
         KcTOkxteEAHjvj4nTk2172eqnhNEtl3HD0Xu7FmjCOW2n1a8uLjnyKHmI3YA9XW4qhca
         E65xolqpMvC9waOlt0NWbsoHOAkPTcAJqbg4ECneBadiWKj05IXLOhxOZJrZ5Jaub804
         wNiCOZxUc+KjgSJeythcOReIfZE2JFqGfD5WDtd1Tl2dO2Kwp1t8HpimorpQapibvOpi
         TuPKVo+fttAM8GUKTQa7C178ME1hzLjMk/G5D9s/Mu3mWlPZyIXGOQ3lC7t9FVvG+0nR
         EXVQ==
X-Gm-Message-State: AOJu0Yx4rL9bStS11E3nC2WbJiKZHl7vLb0NtPyhR/nXturQfDTWjs85
	pBDNzG/2xrAwWz8EycZxLIlVtmcUep2vP0NNQflshdgfnRHLIE8veKJaUA==
X-Google-Smtp-Source: AGHT+IHF9Ntaeed91x+X6I+OSjh/Hk+v6WIQba1ZMcVH1QqAZAxtI/nXGMu8ckYsh872QwXZ3piFQw==
X-Received: by 2002:a17:907:7ba1:b0:a7a:97ca:3059 with SMTP id a640c23a62f3a-a897f8e2ef7mr432741466b.34.1725007935953;
        Fri, 30 Aug 2024 01:52:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989008c8dsm188615966b.46.2024.08.30.01.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:52:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH] gcab: fix buildpaths QA issue
Date: Fri, 30 Aug 2024 10:52:09 +0200
Message-ID: <20240830085209.2944457-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 08:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112052

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
RFC: sending as a RFC because Mikko claimed that meson generates the full path by purpose

 ...mplate-include-basename-instead-of-f.patch | 37 +++++++++++++++++++
 meta-oe/recipes-gnome/gcab/gcab_1.6.bb        |  6 +--
 2 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch

diff --git a/meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch b/meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch
new file mode 100644
index 0000000000..dd6ae1b427
--- /dev/null
+++ b/meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch
@@ -0,0 +1,37 @@
+From 6fa1b6d3f72caf6d0cf61752b522dc19fb9933b7 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 30 Aug 2024 10:44:17 +0200
+Subject: [PATCH] gcab-enums.c.etemplate: include @basename@ instead of full
+ path from @filename@
+
+* fixes:
+  ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c in package gcab-src contains reference to TMPDIR [buildpaths]
+
+lib32-gcab/1.6/package $ grep -R styhead .
+./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include "WORKDIR/build/../gcab-1.6/libgcab/gcab-file.h"
+./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include "WORKDIR/build/../gcab-1.6/libgcab/gcab-folder.h"
+
+glib-mkenum supports also @basename@ since 2.22 which would avoid this QA issue
+  @filename@            name of current input file
+  @basename@            base name of the current input file (Since: 2.22)
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Pending
+
+ libgcab/gcab-enums.c.etemplate | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcab/gcab-enums.c.etemplate b/libgcab/gcab-enums.c.etemplate
+index 194b1e0..2e85824 100644
+--- a/libgcab/gcab-enums.c.etemplate
++++ b/libgcab/gcab-enums.c.etemplate
+@@ -21,7 +21,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-#include "@filename@"
++#include "@basename@"
+ /*** END file-production ***/
+ 
+ 
diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 0d9410b4d5..503d25271f 100644
--- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
@@ -7,6 +7,7 @@ DEPENDS = "glib-2.0"
 
 SRC_URI = "\
     ${GNOME_MIRROR}/gcab/${PV}/gcab-${PV}.tar.xz \
+    file://0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "2f0c9615577c4126909e251f9de0626c3ee7a152376c15b5544df10fc87e560b"
@@ -22,8 +23,3 @@ PACKAGECONFIG[nls] = "-Dnls=true,-Dnls=false"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"
 
 BBCLASSEXTEND = "native"
-
-# meson embeds absolute paths to generated files on purpose
-# ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c in package gcab-src contains reference to TMPDIR [buildpaths]
-ERROR_QA:remove = "buildpaths"
-WARN_QA:append = " buildpaths"

