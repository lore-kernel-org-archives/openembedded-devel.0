Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.400.1624658759007905279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 15:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R1RyDY0Z;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id g192so8525323pfb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jun 2021 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+AhnjKY+MTC6YZGq0BTnTrCBNnpNshLVTq61JY9yCk=;
        b=R1RyDY0ZBMh54QUvxNdRykSmeb97FBIuMCTTsOc2ICiGvpncjzBVNvCZ6/OlXFWCTW
         88kX0ro2wJuRMrszUGd6TaKHKzvbDcp2bLr6MEFBnAjX/CUNhhCQY2PDq6Ey3kJDbetm
         hk0Izc/l788UPbo7obDTQGtLp49oZhZsUP8g1eubmFUvSHf5WcrFqMfxINDbyuDz1FFx
         JLj/uX6g/tBiOeXw/BeDm08AzDvVAOrWQUHCKNhG1o/9lTNiLMgyzzsKEoSSBAzlQgU+
         NKOm6Th2qcPP1rg5WdA3cF+lfvGjre4g9QnxWhqBqaYk/2EwpVx5V5nQVujjJt3D/ehg
         RjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+AhnjKY+MTC6YZGq0BTnTrCBNnpNshLVTq61JY9yCk=;
        b=TGCdTDXOk1XIYH7si32fVXrICgGqJm4sJBpzifDPJFimjF/Hpp6y4youJTfjeDLGBu
         ExhkoSqRdlbwQIzq3FnSdxCNm/KiiBlqpfuhPoZnxZpKwQzoMiKYps7LbRliNDbk4a4H
         Qp32xxbNcRhkIwiykyg8gvRfSvw5B9uX8621AoEPZYKaq4uKyqOMamH2hckKdxZEk9W3
         Xy24F9kphzIk7RhK6NvbQdjcdJwulvzkLMyklhwRSFk3GPaS4sqtsptK/Om6yiusv/Ka
         RMaQTnQgXrOmqmImfW+7OvgSa4sayQ6FIFS3CBiyf9wUtGXkVJMQPQex9eSJKSg31Hx8
         JRWQ==
X-Gm-Message-State: AOAM532/vE5uUSteSfgEy2D4OfIEvxRsvoiilOvtX+wfTFvuO8wAL2Xd
	MTimVSiaxw25oQEO14L6KJ9L2P5nz4ACSA==
X-Google-Smtp-Source: ABdhPJz8pH/fdBvN0nAyLmEZJUi28r/Ik5ICeu+YHMx3JLAWCcA93WK0DURl8v9+RAMPor5UNeZJxw==
X-Received: by 2002:aa7:9198:0:b029:307:f3d:6a2a with SMTP id x24-20020aa791980000b02903070f3d6a2amr12606165pfa.9.1624658758291;
        Fri, 25 Jun 2021 15:05:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e0be])
        by smtp.gmail.com with ESMTPSA id k35sm6398737pgi.21.2021.06.25.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:05:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libc-bench: Do not override ldflags in makefile
Date: Fri, 25 Jun 2021 15:05:54 -0700
Message-Id: <20210625220555.1218235-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-override-ldflags-from-environment.patch | 30 +++++++++++++++++++
 .../libc-bench/libc-bench_git.bb              |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libc-bench/libc-bench/0001-build-Do-not-override-ldflags-from-environment.patch

diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench/0001-build-Do-not-override-ldflags-from-environment.patch b/meta-oe/recipes-benchmark/libc-bench/libc-bench/0001-build-Do-not-override-ldflags-from-environment.patch
new file mode 100644
index 0000000000..060b418fcd
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench/0001-build-Do-not-override-ldflags-from-environment.patch
@@ -0,0 +1,30 @@
+From 419dac71dd524a39ad2333e91334b4650e277a78 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 25 Jun 2021 09:43:00 -0700
+Subject: [PATCH] build: Do not override ldflags from environment
+
+bitbake passed LDFLAGS contain important information e.g. which compiler
+runtime to link etc. Therefore append -static to LDFLAGS instead
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index efda5c0..a867876 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,7 +3,7 @@ SRCS = $(sort $(wildcard *.c))
+ OBJS = $(SRCS:.c=.o)
+ 
+ CFLAGS = -Os -D_XOPEN_SOURCE=700
+-LDFLAGS = -static
++LDFLAGS += -static
+ LIBS = -lpthread -lrt -lpthread
+ 
+ 
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
index e813894316..f16bd99d5d 100644
--- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
@@ -10,6 +10,7 @@ SRCREV = "b6b2ce5f9f87a09b14499cb00c600c601f022634"
 PV = "20110206+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/libc-bench \
+           file://0001-build-Do-not-override-ldflags-from-environment.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

