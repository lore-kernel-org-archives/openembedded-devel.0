Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1097.1617143744561131763
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 15:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X1zmsDVZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 11so13110064pfn.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 15:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bt1oP2TxqOyDPgGs5zyUkAc5W+fi/9Nxor/v5nZEulA=;
        b=X1zmsDVZ+5bo/La2DqDHAJFW62I5OccXseLmkNj8G5+2lGIcmFifNlcFvLI935C9q5
         wHeWkmPEF7kpVNDKUGWE3ugo6pdDe0nwgDfDL7RLk53gb4IEeosOqsFG2QuW5oZHmGA3
         jkJyNift5Drq8tVQ0pjvicdkfgqFk+cgGVatUu8jz4/b07uuso0BcMo8aCwS91jLp2Ak
         aW+8yZFnQRlkpeTDX+7WNDzR+Ihm0lh4Pj6z5MiAOXK9P99yRN8rRR0RlReAWBV3MiHN
         RL6dTt/1MTBo6KQzSQtG+uFoyF8kb0LjJyUyR323io1CijLjlnC2Prx6HA1Mg8wKpIHe
         c49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bt1oP2TxqOyDPgGs5zyUkAc5W+fi/9Nxor/v5nZEulA=;
        b=nPpUMi5gBiFLO/qeEYxw3mg8qzgMA85KCa+ghsVKPQu+kqzHbxlGUK36DO6cj0US7N
         s8bKA4+c7nyphmzQwOBRNNY5RhyAY6b29lis2t0FC5glzlAGusqqfExCOj50zlzdaj2f
         plWfa3dpJH/OAK2XlSqUaFu6S78EPiyAuqDDbCfoBtuATYKabRy1K6UzfXeW6q2s6pO8
         7brdDrL+xpYJ8ecugUd0+SrCvaucQXmHPYuCmi69rJ9Dg+aREGpDIISaB0jvWD3WsE6x
         6xN1tdp44ZV3E/DP34ws+fRU453sBT1gFUhfg9egZzTIhCZBg0b8NLFKwEMXyttE+JXJ
         yvqw==
X-Gm-Message-State: AOAM532Ga/bdnwkYkjClcEFwavoa19oPDzYfmkWlRWu7ZooebBS4JdOm
	xLNtI5PwAV1wpwFT0uPwgTd35XCwAHxPWQ==
X-Google-Smtp-Source: ABdhPJzu/ArU84QhJw/iA2v39wK8cu4lr5hEQ9z6tyowfcu7KuEwDymlyHJNYjtW1rMH1Wr03oH8hQ==
X-Received: by 2002:a63:614:: with SMTP id 20mr351015pgg.406.1617143743795;
        Tue, 30 Mar 2021 15:35:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id c21sm216686pgl.71.2021.03.30.15.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 15:35:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH] flashrom: Add remaining RISCV support
Date: Tue, 30 Mar 2021 15:35:40 -0700
Message-Id: <20210330223540.3765539-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...SCV-as-non-memory-mapped-I-O-archite.patch | 44 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
new file mode 100644
index 0000000000..e481c5a161
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
@@ -0,0 +1,44 @@
+From 2c777126765b4095bf481d5cfe4a21470374d940 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Mar 2021 15:12:09 -0700
+Subject: [PATCH] flashrom: Mark RISCV as non memory-mapped I/O architecture
+
+Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
+---
+ Makefile   | 2 +-
+ hwaccess.h | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6d37d55..203e04b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -559,7 +559,7 @@ endif
+ # Disable all drivers needing raw access (memory, PCI, port I/O) on
+ # architectures with unknown raw access properties.
+ # Right now those architectures are alpha hppa m68k sh s390
+-ifneq ($(ARCH),$(filter $(ARCH),x86 mips ppc arm sparc arc))
++ifneq ($(ARCH),$(filter $(ARCH),x86 mips ppc arm sparc arc riscv))
+ ifeq ($(CONFIG_RAYER_SPI), yes)
+ UNSUPPORTED_FEATURES += CONFIG_RAYER_SPI=yes
+ else
+diff --git a/hwaccess.h b/hwaccess.h
+index 5602c15..e79988a 100644
+--- a/hwaccess.h
++++ b/hwaccess.h
+@@ -295,6 +295,10 @@ int libpayload_wrmsr(int addr, msr_t msr);
+ 
+ /* Non memory mapped I/O is not supported on ARC. */
+ 
++#elif IS_RISCV
++
++/* Non memory mapped I/O is not supported on RISCV. */
++
+ #else
+ 
+ #error Unknown architecture, please check if it supports PCI port IO.
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 4e0b2d4a8c..145a3cad02 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            file://0001-typecast-enum-conversions-explicitly.patch \
            file://meson-fixes.patch \
+           file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
            "
 SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
-- 
2.31.1

