Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862C9D116F8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4095.1764531859495160531
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HB2XANdH;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2e239ec0so566035f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531858; x=1765136658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp2S8uov8vVlWliV7eIOBzTz5Rw24ypmDf8PLIKkBFQ=;
        b=HB2XANdHSvdjdL7emg4qaxQJ9D2SVY8N+doVSa31p2HnIM+wAgIiFII2X2t7EC+t0c
         sJ223Pqzqy92MPIwNkgvA5njjYJaXnaE4bVe/FEpgYejQOYT6WXR0joorc99hVG0DBtE
         vHd4CJPaFu2J4pnaQww9fJe2cVMMh00W/DckAkZj1g0mkQiWF6kMp00LjkxIpa9iM8oT
         oVdaB0hGrdT9Bc2Kva9eUkDGAo6GXeFPrxPftgeag+NrC73XO5NPu7uaPcmA5zrg9sd2
         InEQ+Nhz6z5XHX0LXzQKrebuI2joEx6okMV/EpMSdmi7qhAGPy4cGqbpYq0WHCID6+9Q
         pjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531858; x=1765136658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zp2S8uov8vVlWliV7eIOBzTz5Rw24ypmDf8PLIKkBFQ=;
        b=NSz+zooTR8OtRIC4v7AKQHg99OvaA8g4+GsfXS2Tn5bv6LvRiSoFzTTCYi98qDOnWU
         DrAf7gcyPI8XOtUVZBAsuN5wuoWKTHB6vXFDypiWGGjtHPvS0fLInd5asQ+3A+Muy8U6
         +nAc57XnoZXX1cL1yhoHhvzrWLH5TKwW7ObZE6hMeE/dc40OVMy7CO7cmb9H3tMGjicg
         w8P0wviT4wFDcSKOe8ulHOfGRrIap6QtYeOH2292Vp+dGUMBxLF8Gq/65j0KOyFPKRLs
         oky+wUjet9EYdL4wvBe0kAiw9uOyBzTn8W+hPhFeXdgj8QuiS1qcYCC6JR3/NDJGMc8/
         BDnw==
X-Gm-Message-State: AOJu0YztMH+LXkd7yQ5f0q9ej8AmJQNkRxIhqnc1eKFqaUDt90Snj/qf
	+N+dWxOjvKhCgKoeq7N4NE4UZZXp7JCZ5Jh00V6CVZKBtFa/sBoZb9WnU+UByA==
X-Gm-Gg: ASbGncuvPlXdDTwG7WQqRPzF2YSXPFiuxNApymjUYW+PaamvQpSLvsanRdjgiZgAekA
	sk4np5hTZtINpyU0BZ4nCoIUSeDIZnI1X7/RX/axq/pi/3idcpKMJCsbhhwgl+roGnZb6VbZryO
	FXbWV2WSj7d3ugOFqxjpi1e3XDh+rYSixbuUQUFty+v/58RKpLvZ6A3QEV9JtYyxLc6wAgSaOlU
	/yyLPgic9p+wVZwYuMpIU3PzmCewDmy6oicM5c4sGRTedhTzJ/ZTq6JOYer15PLX3FHWMgcnp/L
	RgGVDUib7NhcwchGrb33bwr0Hl/8LV/cc9tz2Ul5Tn84P+dw5UeDd5Piejn8Get2f1rUYFKKcxn
	1P2StH9e/9unPs9eMu3TC2gbvV9T09xf3BPscisDCcofxVq14GoXwNEAdcoPNzm4KgGX31Umz/D
	N53LNNhmhF
X-Google-Smtp-Source: AGHT+IH4EbcjWCJispfSzl+j1TyNJ1EMjSIwRM0b2UKTyuHFoXTIAAUXVPKp0V7xhGahF1fUdKkFag==
X-Received: by 2002:a05:6000:40cc:b0:42b:2a09:2e55 with SMTP id ffacd0b85a97d-42cc19fc746mr38954035f8f.0.1764531857721;
        Sun, 30 Nov 2025 11:44:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/7] yasm: patch CVE-2021-33464
Date: Sun, 30 Nov 2025 20:44:10 +0100
Message-ID: <20251130194414.2335669-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130194414.2335669-1-skandigraun@gmail.com>
References: <20251130194414.2335669-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122176

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33464

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1010-nasm-pp-no-env-CVE-2021-33464.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 66a0b01b52e5d1cd2af4c41ae0b67541464874e6)
---
 .../yasm/yasm/CVE-2021-33464.patch            | 34 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
new file mode 100644
index 0000000000..ebae250ff9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
@@ -0,0 +1,34 @@
+From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:30:12 +0100
+Subject: [PATCH] Handle file descriptors with nonexisting env names better. 
+ Avoid writing past allocated memory.
+
+This fixes CVE-2021-33464.
+Author: Petter Reinholdtsen <pere@debian.org>
+Bug: https://github.com/yasm/yasm/issues/164
+Bug-Debian: https://bugs.debian.org/1016353
+Forwarded: https://github.com/yasm/yasm/issues/164
+Last-Update: 2025-04-30
+
+CVE: CVE-2021-33464
+Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/164]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/preprocs/nasm/nasm-pp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
+index 512f02c3..f9f92dd1 100644
+--- a/modules/preprocs/nasm/nasm-pp.c
++++ b/modules/preprocs/nasm/nasm-pp.c
+@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)
+             error(ERR_WARNING, "environment variable `%s' does not exist",
+                   p1+1);
+             *p2 = '%';
+-            p1 = p2+1;
++            pb = p1 = p2+1;
+             continue;
+         }
+         /* need to expand */
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index d89f9aebe3..08a9ccab50 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://CVE-2023-37732.patch \
            file://CVE-2024-22653.patch \
            file://CVE-2023-29579.patch \
+           file://CVE-2021-33464.patch \
            "
 
 S = "${WORKDIR}/git"

