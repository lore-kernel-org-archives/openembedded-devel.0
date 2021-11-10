Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3903AC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 22:27:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.2494.1636583228567187880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 14:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1RBAg9F;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so1836634pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 14:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/1c+9jq5UfUqYOi6lzjkDCWa62cMYQsJyVn7nXfMp8=;
        b=E1RBAg9F0k4HXbFBOrRLlRBpTO5h42dA5obX3A7+39OD0GurIneOcjKlxEjbNT99od
         Rh1bzum32MfC/XuykvCrHxLAwoX/juv89AG172YWNGVv5r/FQVJDYdrXELaWDQScERah
         9nHJeJ8RwNw2CogaRdZWDWEffQ7UFEilQwXlZGH7I0QVyJAM3Ks3eq8mYACu8wfc66gb
         myL+Yhhj8lT0Ze1EIIwjyDl+gqKDkSq1sh1dBGHD8DHNTwj51XEtHbMAjkCinNaOghUC
         AgYy2VbdmSCGlYo3ssGfgyJ6ooSGQG/LaGt0QhovIW8Kq6yRM/IopawdZogV6WXBU4VY
         UUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/1c+9jq5UfUqYOi6lzjkDCWa62cMYQsJyVn7nXfMp8=;
        b=sJf0la0M+YAXU+4MudHucfJHp1RTNBYw5bIjhLNPMPyXl31/tTwqWr8xIYsEAvW4Ps
         oZVFi55xvynTW833y2P7HcfqM8Bck0AuD0aTAS+OwZc8tuaNww3127Y2jievy2DIQgUe
         PHHnJQu54nZUCEogqyRqVtKaO657PzPk5WscaUC/USUdHsa0J73MIq9keTZyAeT8rnyQ
         t8Zh8W53ZbgEQivOXAvq+jSG+tmgWnHVXBlrBidGySFw+yGkDD4RdYgP+6T+Ph3hwk0B
         tV8CCTm+yC1ysWJoVdw88HFaXvBsn/LdLCb5NF1GPyi2eE+Ywj9+BmsWnBkoEStheeGO
         TqGw==
X-Gm-Message-State: AOAM533FuzQL04eMsBnMP36KDKI4zTQuu8ITSFCBTSFwdo0LFSKypzZX
	+kmMO0g9o9k4ChBK9fOWzlVaJwnxj+Q=
X-Google-Smtp-Source: 
 ABdhPJytYlRPANPd0juKnMkuW5cKo5MUTCMCO3dxWv0UI4gvLXe2u2vXdfZyDZROvo/wXwXozAfusQ==
X-Received: by 2002:a17:90a:cb98:: with SMTP id
 a24mr21202505pju.69.1636583227865;
        Wed, 10 Nov 2021 14:27:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 s7sm633102pfu.139.2021.11.10.14.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 14:27:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] linpack: Build both sp and dp binaries
Date: Wed, 10 Nov 2021 14:27:05 -0800
Message-Id: <20211110222705.3824547-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 22:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93907

This eases out running single-precision and double-precision benchmarks.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-DP-only-when-SP-is-not-defined.patch | 32 +++++++++++++++++++
 .../recipes-benchmark/linpack/linpack_1.0.bb  | 10 ++++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack/0001-linpack-Define-DP-only-when-SP-is-not-defined.patch

diff --git a/meta-oe/recipes-benchmark/linpack/linpack/0001-linpack-Define-DP-only-when-SP-is-not-defined.patch b/meta-oe/recipes-benchmark/linpack/linpack/0001-linpack-Define-DP-only-when-SP-is-not-defined.patch
new file mode 100644
index 0000000000..4eb18e38ca
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack/0001-linpack-Define-DP-only-when-SP-is-not-defined.patch
@@ -0,0 +1,32 @@
+From f092d4be22acd09e791187b8e9bff6d312721ce4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Nov 2021 11:36:31 -0800
+Subject: [PATCH] linpack: Define DP only when SP is not defined
+
+This helps compiling two versions ( SP/FP ) of the benchmark just by
+passing -DSP on compile cmdline
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linpacknew.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linpacknew.c b/linpacknew.c
+index 17b2824..c656082 100644
+--- a/linpacknew.c
++++ b/linpacknew.c
+@@ -28,7 +28,9 @@
+ #include <time.h>
+ #include <float.h>
+ 
++#ifndef SP
+ #define DP
++#endif
+ 
+ #ifdef SP
+ #define ZERO        0.0
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index aed95cdaa4..603004ddd5 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -4,17 +4,21 @@ SUMMARY = "LINPACK is a software library for performing numerical linear algebra
 LICENSE = "PD"
 LIC_FILES_CHKSUM ="file://${WORKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"
 
-SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c"
+SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
+           file://0001-linpack-Define-DP-only-when-SP-is-not-defined.patch \
+          "
 SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
 SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
 
 S = "${WORKDIR}"
 
 do_compile () {
-	${CC} ${CFLAGS} ${LDFLAGS} -o linpack linpacknew.c -lm
+	${CC} ${CFLAGS} ${LDFLAGS} -DDP -o linpack_dp linpacknew.c -lm
+	${CC} ${CFLAGS} ${LDFLAGS} -DSP -o linpack_sp linpacknew.c -lm
 }
 
 do_install () {
-	install -Dm 0755 linpack ${D}${bindir}/linpack
+	install -Dm 0755 linpack_dp ${D}${bindir}/linpack_dp
+	install -Dm 0755 linpack_sp ${D}${bindir}/linpack_sp
 }
 
-- 
2.33.1


