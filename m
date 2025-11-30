Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CD8D116F6
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4959.1764534917379436323
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWgM9jRg;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso418678f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534916; x=1765139716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4MzH1tmKFTfAbDJrDo4LzBnUn1tuX0GGLIU+P0bOck=;
        b=OWgM9jRgW7o8HVxEhk6p5HvmuLAyWaAP5chn6NC+D4RjmLX2XYKCQef5vdgHjbKo/I
         Kx56K4EozgFyX4DH47R5Js95gP/Ob0rsPu+mBmy6VhC0xs7h+/4m29U4X++cGMUs04W6
         giNxFlt0UFmACcbHDiPR60H5JX/tChKcLc9+AEMukGss9tTiDcfPTMw3IVt1qgQN4WLM
         alSypE14Pdq1jbM9p8Agjhnh5Fl1HOpLYsHIF4ddrXRhSMPR912lwlZeSM7dX0hwOSZV
         ZLGWSyRT9neYGMJVRx2SN1tHujW+EfGyarb/TPS5KQmcmLv2v2u8KZ+4lnBpqhnCPSX7
         rPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534916; x=1765139716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4MzH1tmKFTfAbDJrDo4LzBnUn1tuX0GGLIU+P0bOck=;
        b=rGjnFrtw94TSdXl6UpKm7hoLgBmLZ6yrKdhVkHXG+rME5Be4Ou9GsILSZzcWCZ2zGG
         i+5xJhSZQWOgOq2ye9EzEiInVtd4+5FfjGN4itOuei+gA4x/YcDPyxlRz+YAbe+lzQkK
         1v++Ywsa33MTXoWR9tOzDO6LmnkXNlO2ykM/eV/9R8L7qQ4as5DxErjKega777HefkN5
         hZKSPrcTRNlXKc1ZgcLLrynPdkRZTvYCMavGSDo9crfddZfRM6jVZuevg0Jz2mkKZyrg
         XOY5Ya9aXF9qWfRlC6Xfk1E/kZ6cA4ab0ZfMv4pd0Po+a5WgUUQ12qi3Mxrya67HrXHU
         j8Qg==
X-Gm-Message-State: AOJu0Yw8vQ3keMf6KYhTbzYhgKR4/5PJ4Iew7WQr9/fBFJZ+yVF4OAgY
	DiEQOFwLG1SqTHZ1GKoTh5NUO98eiWL9MejOF2z1vPIlZkFrMhSbCUWau4xxHA==
X-Gm-Gg: ASbGncuwLDz5hLrtKxdotVZOvPucuk2Bvv26+Be7wTxQyhSqmdXY/n/RwZ7sbdWefoV
	9kv2FI+UMCyTLBQoqj80GjKML+WugPXdN87TxrB9bVHOwEXXun4xilxlKyxYtUBtdGG9yp9I7KL
	qRoMOoyliNPUxeaPKxhc9SG8ZnSt5l71QKV+xhwA1ZCsIKCTfhaz6lD+LupKab8fEAz/ZuqBk64
	RM4dAdz3J6w8B8ACWpKIWidu/T2DI4Q1DRhQqXA5h7Ut2h0IRHu3AtnP997YY5dvOye/l4tTARs
	2CfUj2sNF4CObtkp6bKaIo7ajf7ya9/Z8BMJr7wR6O8GcaTdbyjrfCboTjVEQBBlGL+JBwoFYG6
	JZ3DReClgZN/Pq3vH6zrCNahFlmZJ+8d9gysOM8t4yGY+Meeokro37/nELjzSjMys/OplsZ8m4d
	JCEyIsrSd0c9bMrFwmeUo=
X-Google-Smtp-Source: AGHT+IGp8dTEjpkZ7OIIExGZHByE52vrKYvbccHV9pUFsPtMD3hzyFNz2uvILVR3Q6w+CxJN+VczNg==
X-Received: by 2002:a05:6000:310f:b0:429:bce4:20bf with SMTP id ffacd0b85a97d-42cc1d194fdmr36381302f8f.55.1764534915478;
        Sun, 30 Nov 2025 12:35:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/8] yasm: patch CVE-2021-33464
Date: Sun, 30 Nov 2025 21:35:06 +0100
Message-ID: <20251130203511.462501-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122183

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
index bce62caadd..304fa0b34a 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
            file://CVE-2024-22653.patch \
            file://CVE-2023-29579.patch \
+           file://CVE-2021-33464.patch \
            "
 
 S = "${WORKDIR}/git"

