Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A18D116F6
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4994.1764534915973277078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdJb/Avv;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2e5da5fcso509180f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534914; x=1765139714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sglZdjRKSyInwuG51prJLwxHInojGFdbvq/u4E8eop4=;
        b=FdJb/AvvdpzWpjE4CUePbQB4RWPEPKwoMK6E9v8cTtRu7JXhREas+bEzmEBefEmorv
         wV72/aM/0vH8AgjzFpQQrW0lrXxg1l1IiQ+D40zBWLbwtpj+XDaUdZnNzi/qrua/9xCe
         55wYF42MW6YekDnkJ1HYUIz1GQ2KryF34zPp649mvgukG70vme0uOzUQTJVJCpXUtBml
         5EQoKUnq9XIJWdeQFqTOVvNT0J2kUyGi/2zml/o0X/D8CUEwI8Jn89/v2xS5rC6M0TFk
         DGkOmYL+a/Mx/xl6dAIHV+xV6p2V9et4n1EZGbLCldw4/p7IgaprKvQG/0HDE88rfdHb
         T2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534914; x=1765139714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sglZdjRKSyInwuG51prJLwxHInojGFdbvq/u4E8eop4=;
        b=L7f5Q/qnVu7eRMqX3p29k2QUA6o7quJRLzaqpEpe7tqYGKdx4ZqiVSNQDrFDKlCiMF
         aWpxaoDk6qlvKMHTyRI7ofIQLsYeSGtusYb1nHjzMaeNIGarZD8b7Q02vcuRFm44L/Ai
         jZEM3yBzgvjLQTSeQdoV4as9TgpS9ql1BF7BJmunFv0W4zCfj6MVvQvyz66Ep6Se3Vfr
         1jmv6mqtBRqn2zNxCxwhv9VlsPEe3jc926XtXaddD0WQ0xU8UaUaNVIseGH7YSiZTTXh
         FhNw5sEQpZnrXpq9VAM+ghmuesiG5qwXXQSTnqUguf2W2fetLJH4LIcxyWJ54FZZG+jA
         U8Ow==
X-Gm-Message-State: AOJu0Yxbga33AOTa3x57A0OWhH9CpKa2xJLCpmovwZd5IIXaaLrJ4XKc
	H2wJTVjSzpMlx229fS5mqwhMhAEOpiQMVBz7/6sJZoqBsCvX3cr2K53qqh5kQw==
X-Gm-Gg: ASbGnctCWyB9obEVh+vuwbXwPdbCmNGgdAewKt8QcSLwB6+tt/uy2rPs5D/jTH6t+gc
	xPhlczAwK2XUd/AGMKtO8Z8QIxddOCyntFy6kD17Ufy5Vx5nyVAr+d/eD7w+CIKW2G83HKdsWq2
	fZrqmhcTeILb8f2G9LwDasfIPwpZdUQQDKXyfb+XDx62kmTew24FxFijPxTrfzw/FaKALbExgY/
	D7zkZERy9SxCqpXhJ3MSqqH96U2oOSrh5BQN6CpnF2qOEhFkS0MXR5425IIV5GdpdPRDcpl3TzA
	Yn5t7/ktfKEA29McJ9ajbWe76v+yXz1ZNln6zwVodtJyeOo+gyOQfX6UQc/KnA2mtUEW9Vh39tL
	xg3EMnJ69jB1hyx07ng0IlFe4YHWm4dBnlNFbsDlbo6lhBNvfhd/jlVahXUkFv4NPOqs71TW7vW
	B8A4Xf+sTPUk0r9hJ27/I=
X-Google-Smtp-Source: AGHT+IGMjsbkNH8Qf/v0uTCYbq63aE937P/4yd0UdFwNapV+zCtidbXu/bgLM++UAPDDVl65etL59g==
X-Received: by 2002:a05:6000:4028:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42e0f355caamr23772102f8f.39.1764534914231;
        Sun, 30 Nov 2025 12:35:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/8] yasm: patch CVE-2023-29579
Date: Sun, 30 Nov 2025 21:35:05 +0100
Message-ID: <20251130203511.462501-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122182

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-29579

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc30757a7fd0af5f60b9a6408b3eb94c0810acda)
---
 .../yasm/yasm/CVE-2023-29579.patch            | 39 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
new file mode 100644
index 0000000000..58b4ed1996
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
@@ -0,0 +1,39 @@
+From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:24:21 +0100
+Subject: [PATCH] Make sure CPU feature parsing use large enough string buffer.
+  Fixes CVE-2023-29579.
+
+Author: Petter Reinholdtsen <pere@debian.org>
+Bug: https://github.com/yasm/yasm/issues/214
+Bug-Debian: https://bugs.debian.org/1035951
+Forwarded:  https://github.com/yasm/yasm/issues/214
+Last-Update: 2025-04-30
+
+This patch is taken from Debian:
+https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/
+
+CVE: CVE-2023-29579
+Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/214]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/arch/x86/x86arch.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c
+index bac11774..58327958 100644
+--- a/modules/arch/x86/x86arch.c
++++ b/modules/arch/x86/x86arch.c
+@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *valparams,
+                 yasm_error_set(YASM_ERROR_SYNTAX,
+                                N_("invalid argument to [%s]"), "CPU");
+             else {
+-                char strcpu[16];
+-                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
++                char strcpu[21]; /* 21 = ceil(log10(LONG_MAX)+1) */
++                assert(8*sizeof(unsigned long) <= 64);
++                snprintf(strcpu, sizeof(strcpu), "%lu", yasm_intnum_get_uint(intcpu));
+                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
+             }
+         } else
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 71d3c7e47e..bce62caadd 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -17,7 +17,8 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
            file://CVE-2024-22653.patch \
-"
+           file://CVE-2023-29579.patch \
+           "
 
 S = "${WORKDIR}/git"
 

