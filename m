Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.5244.1620688328626467570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 16:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oPfSCPWK;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id h20so9905102plr.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 16:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YMRQcCm2wz5DqFClJjEWM0/FTP09oliHTuvfuIR6uMg=;
        b=oPfSCPWKTNUi1kF98yZpOpDTadIXez35cr4mZ8aFOu+ObdQJmwQ5KcAityD2AQHuyC
         rfyUxN++8jrlLGsUUUju0ZGqfA/aPYNrlnc5XRiShSRCp6cIdEmo68TJjpnHZG031KE7
         +nfZN6qCG474X5JVnNdRcHELq4Fk+Yu5xZb8CeTNEeCUEK4cKhEkb3A9veAPgckp0stM
         BrGLytWu1M6NOAMQkUf3tA1KVjywFzrTamcj4Zf4sr23RDW2UzTniqczxkMiu1Fj0Q2z
         lByXuhXdIdTgpQTDbhylDzERIHfMrYveKeSrVEfUUIRhg2fdjyOEwUs3NwDza4P4TJX1
         eDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YMRQcCm2wz5DqFClJjEWM0/FTP09oliHTuvfuIR6uMg=;
        b=tQFeKgqFR0A2tQtl8uSFQ1TVhMdotRV2VR2ku5g3cho1EifVd/k9vqSg7FI7uYe3Cp
         vJCAOOtkoWuKB8gTZDDHdXg+Pc5mEPw2otUvQ+SypA+xuCEHwD/hWmemQAPkljTydcFl
         N2Y8TvlbvF9TSBjvRU4JJvhLapCLcL31+sYoolj1YK9FfxDV4D1/rJaTpvH5ApvzqbhN
         JX97i8JTtgi48/t2opT6vxgbImOIL+lO/jwnc5EW1GqYWo/Vn8pX18q3pj3KLXJPI4lS
         G1dnTVZiNZTE1NClUG7aKlc7gdxmVS8mVyhKdhGZVFBKUOE/KLfLgUDUgm2B/In7Zzn3
         Ejsg==
X-Gm-Message-State: AOAM530+DwOCtH5pu4h29Yf4LClYzQet5L+CWiy0L3LuRGAjJUOF6wfA
	yI422V1gd/bPRc5QthH2EYwFuA9MEMF+hw==
X-Google-Smtp-Source: ABdhPJwROxjDACeWDG/B7vnloTInrmyglpr1Jz0dUCV1xGsMQsXiG+Y34OzxLh3LTxXlgidiDSULOA==
X-Received: by 2002:a17:90b:3891:: with SMTP id mu17mr30620081pjb.151.1620688327743;
        Mon, 10 May 2021 16:12:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id m19sm12380106pjq.41.2021.05.10.16.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:12:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] apitrace: Upgrade to 0.10
Date: Mon, 10 May 2021 16:12:05 -0700
Message-Id: <20210510231205.102801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apitrace: Fix build with musl

Changes are here [1] which fixed musl build

[1] https://github.com/apitrace/apitrace/releases/tag/10.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build on musl

 .../0001-libbacktrace-include-config.h.patch  | 33 +++++++++++++++++++
 .../{apitrace_9.0.bb => apitrace_10.0.bb}     |  6 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch
 rename meta-oe/recipes-devtools/apitrace/{apitrace_9.0.bb => apitrace_10.0.bb} (80%)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch
new file mode 100644
index 0000000000..87fb4992d4
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch
@@ -0,0 +1,33 @@
+From bdd5f0834d95a9598b0d87a18e7e96afade9d418 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 May 2021 15:28:05 -0700
+Subject: [PATCH] libbacktrace: include config.h
+
+Fixes
+thirdparty/libbacktrace/backtrace.h:53:10: fatal error: gstdint.h: No such file or directory
+   53 | #include "gstdint.h"
+      |          ^~~~~~~~~~~
+compilation terminated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ thirdparty/libbacktrace/backtrace.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/thirdparty/libbacktrace/backtrace.h b/thirdparty/libbacktrace/backtrace.h
+index 2814763f..802cf989 100644
+--- a/thirdparty/libbacktrace/backtrace.h
++++ b/thirdparty/libbacktrace/backtrace.h
+@@ -33,6 +33,7 @@ POSSIBILITY OF SUCH DAMAGE.  */
+ #ifndef BACKTRACE_H
+ #define BACKTRACE_H
+ 
++#include <config.h>
+ #include <stddef.h>
+ #include <stdio.h>
+ 
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
similarity index 80%
rename from meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
rename to meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
index 826291a5e4..616d56daa1 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -5,8 +5,10 @@ LICENSE = "MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRCREV = "cae55f54c53449fd07f8a917dcd0874db2c15032"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git"
+SRCREV = "03e4e9d2cab4f1a61d3f589785641a73dff027c5"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git \
+           file://0001-libbacktrace-include-config.h.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

