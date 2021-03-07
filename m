Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.18012.1615095820300388534
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 21:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sDB8K0P2;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a24so3338151plm.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 21:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pypHz8huwssZfFHcrfpHZO8v8EMIaPS6tDROQMmv4Cc=;
        b=sDB8K0P2imH5yv+HeiY9IUB7F1c7vbB73yARYeNhGpc6TtVkJgEwycW0WT1LG4SDPd
         8ivsMGW0kwREte0HIru79ATcJuTJ8rInq4r28HgVOFXycI49SGWEccDjPRtsi4SLaKXA
         BMx9qklntC9GmCPDggUcIWuK1sJq6gk2+5JSMn9OA5wGu6UzxPudkkg8ikohZc5D5QH5
         QhJMBtOw+JhKTX/fUimrvBlh1ENtwHcduLzraoMjwIqZbBVoqvWVEsvSv2gbqpUJs/ZG
         MEcioqPrSNbIbSMEa2d6HPHEUiyT17vqLGbrlh2EQv1mxJd3XIcu72co84vcAyCJjavU
         vNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pypHz8huwssZfFHcrfpHZO8v8EMIaPS6tDROQMmv4Cc=;
        b=DwuTeFOrsNvS3gat3StKy06U1QKslMypRWsRBKVy3vyvmSdoS9F1mQaAMwtEar2ZNX
         hAL9Ylci6ZP1eIFyHmii4nDt2ZqWmzTLb+Cp/2ZRJjLt5amV8uYQrIj/Koq3LnAFCmRh
         apN9GMJApBMVe/xGWLgbPYTiVCfKCsJG6i28HuNp/PpV2nPBVxuIzH1ei3kMhlgrMNpo
         ACI6kLU9KaTAt+mPQfm6gxrNTIhBCYF6S8Wyb7EVtS9Bir8BoXYSuXl10hRR0uHsC7Ti
         RlkiRrjyS6Kw9I57ThNIqvW+/IGCJkeH9ohRBPrAZ/joLJ5gB6xcDHrqyEA9tqImsO2b
         tcRw==
X-Gm-Message-State: AOAM531613NJMNcP0FTmwWDoJa965Cl/Ck47WGziggQEcUYWeXywBa4o
	nVM+8U75fAro6UuZtZvVxykQgEjGwx3xkA==
X-Google-Smtp-Source: ABdhPJykLVLoBM25h/7gMaqG6NR4C8X80krPHDq4GeylZADkd4DulH0MHqRN0sJMla/1lzAkqX2jwQ==
X-Received: by 2002:a17:90a:aa8b:: with SMTP id l11mr19121112pjq.225.1615095819470;
        Sat, 06 Mar 2021 21:43:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id e185sm6796810pfe.117.2021.03.06.21.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 21:43:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] libleak: Add recipe
Date: Sat,  6 Mar 2021 21:43:34 -0800
Message-Id: <20210307054335.2332899-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307054335.2332899-1-raj.khem@gmail.com>
References: <20210307054335.2332899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Exclude on riscv

 .../0001-respect-environment-variables.patch  | 25 ++++++++++++
 .../recipes-extended/libleak/libleak_git.bb   | 38 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
 create mode 100644 meta-oe/recipes-extended/libleak/libleak_git.bb

diff --git a/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
new file mode 100644
index 0000000000..bbdfa3c960
--- /dev/null
+++ b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
@@ -0,0 +1,25 @@
+From ea3f11a7846ad27926c6eacc0534914f4873504f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Mar 2021 19:30:09 -0800
+Subject: [PATCH] respect environment variables
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1d70f17..c7e726e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,5 @@
+-CFLAGS = -g -O2 -Wall -fPIC -Ilibwuya
+-LDFLAGS = -Llibwuya
++CFLAGS += -g -O2 -Wall -fPIC -Ilibwuya
++LDFLAGS += -Llibwuya
+ 
+ libleak.so: libleak.o
+ 	CFLAGS='-fPIC' make -C libwuya
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-extended/libleak/libleak_git.bb b/meta-oe/recipes-extended/libleak/libleak_git.bb
new file mode 100644
index 0000000000..309553c909
--- /dev/null
+++ b/meta-oe/recipes-extended/libleak/libleak_git.bb
@@ -0,0 +1,38 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "libleak detects memory leak by hooking memory functions (e.g. malloc) by LD_PRELOAD"
+HOMEPAGE = "https://github.com/WuBingzheng/libleak"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://README.md;beginline=18;endline=21;md5=de4f705f12cdedbe452b2c3524572b03"
+
+DEPENDS += "libbacktrace"
+
+SRC_URI = "gitsm://github.com/WuBingzheng/libleak;protocol=https \
+           file://0001-respect-environment-variables.patch \
+          "
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "ea2bb608ae25701692269a37d39d77e966b887ac"
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	install -Dm 0755 ${B}/libleak.so ${D}${libdir}/libleak.so
+}
+
+FILES_SOLIBSDEV = ""
+
+FILES_${PN} += "${libdir}/libleak.so"
+
+# libunwind does not support RISCV yet
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.30.1

