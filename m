Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8837.1792456228107606364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 17:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QMliHPiK;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-366421dc8ebso44004eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 17:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456227; x=1793061027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EThvYXEKuRLbkWE8nf6hhe7J8ap8ghYw/FsA6cM52Lw=;
        b=QMliHPiKXHLviLmn7Y5PLQMZM7PtaviBtgvbMxKigfa4+CroCWJig802Wf1tj0MveW
         8l9o+Uy4jZ1HXVH1Zr6lpSMhpYDU+a/TxYkKsEFBByK40FzoO74pWOQPC1rwGk85DLUA
         /hO0bQfhTkkAmS2NUJYOaAsnMIlD/WA/mcIf13vDsIsYH30OCscvKwTAvtnOv0aGJ+Pl
         wqpva1nStVk5UPnpQuxJKP+TYi5ud4jDzjYbksuSaB6W0acER2dYjpQIuNRzRRFqW9KB
         LoZdO5YzvDLhUnPFbtWsmDJTuwA7e9/nWn1pcaOewdPUIQArfYXIqHVFN6cCNRr8+eNb
         42aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456227; x=1793061027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EThvYXEKuRLbkWE8nf6hhe7J8ap8ghYw/FsA6cM52Lw=;
        b=hMLnKkxeVpoEwcdOivjSB7vwLrLt2WkZy8WdNHeU/rHp7ZB3uEEDKaFdLvsbZpIp+k
         ybZqCMU4Cn9YucQ+/noiTS7V7dhEIx3mX4qxemP3GKX226vx7z9d35CqRsGGdXxUGNQv
         CIHZdG5TRgsuDKmwxlegp8zD1Il0tNxqhe6vI3s0Hg4Oi+KnCfYswzCT19uVAbCyAH13
         ysGhAPCyWykz8XJrJvCfb9Z/2WdVXwS8huM0g/QsTN26MZ59Kt2fFsqUPhf4eIV0XlM2
         WRjvZzg/cQbJY6WGjSQNo1TxS12QOJxri7/Gnpeww35RxeF67agB30fdRAwEmkybv/9J
         vYUA==
X-Gm-Message-State: AFq9FYLOtfdQFk4nCYI3DJoJs5icq/gcN3zX7+XTiEqFmQXW6Zq7+s6l
	GnFmCNuZwycPQQRwQa18ZAkauCw9Ey9KDHxqSj8wzJxDU6x5D5gNoje37vw5RTJvjCI=
X-Gm-Gg: AYBFou0GFPF5ZuEfEyGMpaWv+FuDeLRKr5x2/HkP9B+vr1uuN2zSWX5ATtukERLeTxW
	cir1muLKw6ixm8IW6431c0w6pbwz7iKwFf2m1+n2tRTKCtzES0CX7AI4cyAJIQw+YGPo65yi1lT
	A2FQqrA0MJdjMWJ+gJfmhXGRDmgfymZN9J7NhKUFzeL7uvMRDMm8kls/34b+JdbO+HtgakOGzgC
	6G5GzNl6bYcTZXjrCLsJNTWY16BDCuZHHhwIOAXlSkFPBaLknH3yLwJHfmdI4CGrcOsURT1UrZP
	aa0/VDhp268332oYPrGX0zI0epbX+d6nGyFLaT/eVx3UNt84+RtSz1lFdZ0HCB2GrMV7nV25w2T
	DHi2BUWEgZ2BctQLX8h8KnGOdJnS5crBXkhXqyaj/6fUHywe60CRhRRDqtk7komW+YwblOjFBjO
	KvFpbDA8ZRlktBKR8sGd+JRsGRvkekobztknPaauKGkEwz/Q2ASoefY96jsBt1icpILwLNCCzIn
	HOhvDRPNhnfBXC7oYrzvlwBjP8qnbQQNKnYBitob+Lan/HaQDYzd8cMqffLq8MJZviFD3dTH31A
	yjNJ5NRyEH4+XtDN8wivtPDLexl0X1LW3amkiRtv1dh6Iu7ptczOg0yfDS42ZsoOCDtbpgwyORU
	VOxMSwK42BXEa6fXNnCdlOBhEkSWXfcgfUqiNPSCKQc67q/vtGZWCmFyusmpmOE4V71Am6PwJyz
	QekjlGKgMz/JY9ulPycUrzEJD2f0TMdZzFNV0ucpCl52/e1aM=
X-Received: by 2002:a05:7301:6197:10b0:360:aeee:9b8a with SMTP id 5a478bee46e88-365fa4906e4mr829667eec.8.1792456227285;
        Mon, 19 Oct 2026 17:30:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm35596579eec.13.2026.10.19.17.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:30:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/5] librice: Point bindgen at the target sysroot
Date: Mon, 19 Oct 2026 17:30:19 -0700
Message-ID: <20261020003022.1913623-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
References: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 00:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131148
Content-Type: text/plain; charset="utf-8"

rice-c/build.rs runs bindgen without any target flags, so libclang
parsed the build host headers in /usr/include, which fails when cross
compiling, e.g. for riscv64/musl:

  /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target

Pass the target arch flags, sysroot and triple via
BINDGEN_EXTRA_CLANG_ARGS, as thin-provisioning-tools does.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/librice/librice_0.4.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/librice/librice_0.4.3.bb b/meta-oe/recipes-support/librice/librice_0.4.3.bb
index 4017b58271..61934acd88 100644
--- a/meta-oe/recipes-support/librice/librice_0.4.3.bb
+++ b/meta-oe/recipes-support/librice/librice_0.4.3.bb
@@ -16,6 +16,11 @@ CARGO_BUILD_FLAGS += " --workspace"

 export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}/libclang.so"

+# rice-c/build.rs runs bindgen, point libclang at the target sysroot instead
+# of the build host headers in /usr/include
+BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
+export BINDGEN_EXTRA_CLANG_ARGS
+
 # rice-c/build.rs builds the internal rice-proto C library in-tree (via
 # "cargo cinstall") and then locates it through system-deps + pkg-config.
 # The generated rice-proto.pc carries an absolute prefix pointing at the
