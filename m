Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04BDCD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:45 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17720.1763014842731647379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MxmOTEe6;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6ceb3b68eeso287089a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014842; x=1763619642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOKBlIkdLV/fy68fs364s/h3k8a8ic6qqWLxy2M42ok=;
        b=MxmOTEe6MeKgrA0siVvNKkNR4hoB+wNB4RpnoKD3I6yGVL3LD5nhbm7t1nvh1Km5Hw
         312Ex2Ag8hg6V/TJVVWjYJ8JvJszKPQ6sbv2sc5R7aefp262pjKBw/PtCZOo3IBu7EZP
         i6L6e7/QhpieboexbmaUrRa0NipnC1YMPj0iD8mbYJnNU7N/2up5QTI+/Ds/9+bR0OH9
         HWHNA/OIInZbYmJC2hIqp0UpzTvQxccDDveUisbTC/2VfhcOyvv7noXBjGDFlxFBdRjM
         lbNYVlERKimaKPaNPZS66CPQPjU9TXYN+t00EcxUkbth0wcLDamJPMd710wTmfF2Vyh3
         LagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014842; x=1763619642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yOKBlIkdLV/fy68fs364s/h3k8a8ic6qqWLxy2M42ok=;
        b=GXpV8g9apUKwXToOtwvUTxBIOgux7EqLH4UyKNXAIqwb3Vno0WsUxz9DNmjfuVOgA7
         X5lEPxr/k/2Dbw1AHymojagvp7kLuSJDMoxHypj2syCtoahX8oSYtum7pf3YTvU6uuK8
         yjdJhoXNb/kJ1hdhcTOd3erE0lDxQVciRydzLOZxr2dfSShRvPmfZK4lwZK7uKlZqmEJ
         YnyKauJaRFxjR+hqZ3zmNGk0XhPySVnz3IgSRv208/roDh5UAoBkCjVRylpvOzfNshyl
         foK3CqxOdpUWNmjlIB+9+igmEXAEF18vAZqWRBGFz6EnxOMRaR92pw0HH2DeZq6jl+kR
         boWA==
X-Gm-Message-State: AOJu0YwZJzezljge6Aor32Et+Q6TCnzzYFFBv/bPrSO6NLI7UUofHwLp
	MqrJsKjP8qgEyWexPs9DX+iEfX+tKUsxFpO6Dy0VLCjLMmyQcaoBlAaVUp1VWw==
X-Gm-Gg: ASbGncvDDwjgiUS5/dOqBIXVS9NKLCtw+n5JF85zC7g0sQu6InYM/lCsdyKclvTA5Kt
	+gSxq+8c6vT+YrZuFIscC0nFCnPniIPS2Tr0bLlQ6SOcjCobhGH5AAfLtWpgRHOJRlYVjdzXtZL
	/ihOLmZWGNZ3hTNZM56XgibHSRqyGMFBzYmdLw0/T+FJzLEjlmiq1gvHjzJj7k0Q1mC1nuiKuT7
	OA6j1DkPQoQNbv32iwTbp9UKfmqC1Ehxf5eftD3u4OdO7sdGwmbxxTUarLOxh0O7HAen9jQ+U42
	SXn+3uXEpV/B9ELDV7nsIuIiqZQQZ20AbPNjO+7wiNCNBZtwaFzNdi6nGunaSxjF6nhpbhwviXl
	bS90fKx9yw7eFdpXb3syU06q2BrWzEGyLimJwDTRq2tt3NtQBjlQnFfbca7LsvQJ1DNnIh3LA+b
	3JcVpSnsbptjor6A==
X-Google-Smtp-Source: AGHT+IEBdRP+dfUrUJ2ePlJU0+mB/RZ3k5xeKuvNrnKUK1TsPBxn+b0ModCB5Nez8DgvXXvrlGaJPg==
X-Received: by 2002:a17:90b:2784:b0:339:cece:a99 with SMTP id 98e67ed59e1d1-343dde26f80mr6597881a91.13.1763014841835;
        Wed, 12 Nov 2025 22:20:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 24/38] libbpf: upgrade 1.4.3 -> 1.4.5
Date: Thu, 13 Nov 2025 19:18:59 +1300
Message-ID: <20251113061914.3756301-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121622

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix BPF skeleton forward/backward compat handling
- detect broken PID filtering logic for multi-uprobe

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9773b1358eb300d083ebe6200a048bd10c5b6626)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbpf/{libbpf_1.4.3.bb => libbpf_1.4.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.3.bb => libbpf_1.4.5.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
index 665585d0cb..5ee7701484 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.3"
-SRCREV = "f8c6e0393d4be665fc0b584266b2a1354a71835e"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.5"
+SRCREV = "a5086158dc90593b4e4b3ddbafab9bdaf9ec97ef"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

