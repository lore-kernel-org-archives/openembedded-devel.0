Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4C3D1119E
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3905.1764190164621210196
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X5aBV6sk;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297d4a56f97so2671745ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190164; x=1764794964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsGyb+TphcmJeHBD6XFPXmb8coIA1f6z9WDPMEJL/kc=;
        b=X5aBV6sktAt29uPNGBgNY1RATYTiTOiN8jQWzHfZZQrd5d5toHTkfSAZGynL8Vib1M
         HUTNsj9dQrZM2b84SU528ZmLlyqjnCX2cDAh/jXj/G7m7lu/AIa3PE7/vth+ss1AW73Z
         exiSuW0JBfHwpj0hf78ZueECG41EtKJ5nw85aPn1Fzfe29Yd1XbtBMcSyN7jIK/Tzm2Y
         sAcdmyCwdwyX8A9ynIFoxxjE5VyGNcQzg4UKjTHJg08mwxjtdRmM+oexuXVmJyjlujC7
         uhmMzsimRpA6JjJmUxC3PdTiEcFp31MHpAFpDt5jqFLeDAuztSh4fs3KEqPzHajOnYa4
         k8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190164; x=1764794964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsGyb+TphcmJeHBD6XFPXmb8coIA1f6z9WDPMEJL/kc=;
        b=XIphcPoSyMk2RbTF0L8CSSR4zL6ktKEdvQ7gBVdE3+Q31kAa1YP+u7kyH8Qg7a+3w4
         yh/v7yjplDow5NAKeP/jKhZiOUQVa8nV8Eon9UQ5pSWB1pkxdYSLw6g/IpmjliSdBzBN
         ZdSbqiOEQhbuExFFRJpqvkgLg3fZ0cxKNY/jaqewbp/lipgs7/8rBkkvPlbi2aKjMeKT
         /sP+CWtX4mM20m5iu++3FoxPaEpjZo4FPUcdEeYvA22CegNwaYGGfx5HG/DZx7BxaPbY
         O2VtZVfWc4pyC+ZXyI43inQXEtoBBshUj7biVm0ab1Ezi1WNez3f1Wmx/DKt9AHS/Q5Y
         Cdcw==
X-Gm-Message-State: AOJu0YyYARqqiBRoTiSW/2c/ph4NCvaqWVEKA5LeGscmMSdGPUp2hT1o
	OUNJgeNtTjbNayJ7oBzM1w6OxfLVE9/pJ72gX9eTrwoCp/NwM3NPvUdwcnlLbg==
X-Gm-Gg: ASbGncsuLRx3dMd8md6tU3gpreIfhQIprXjr0YQ9V+S5dGdV3U8lOZbf1n682WxPArw
	X6DYK6brAfFz9jmtn4thU2WupqObT90HbB+kV64VyejvhKlePxACa85JlugCmrt9TP5xqDqp9ay
	vJotpUhNHWPlEqIngd0pbeGxyf/9dzd2jlxK5k7hkoxOaNvEJmK6mXJya/a01Xh3IFJELaz4hL4
	5cG9Yeg1yQGZSZBzNq7ue4AkFC+Eklslsf/RjirhaDtUNpRbQefjmCtaH2jFvKoxXAg9DBKZee8
	fhN1m10e85PrSMEsOV7c00JK/zjW5cJv8ZtnfyOpD/qzhyAGkae/DzmYbt97r9ign5of0W/3X3U
	1iVgyQJbGZrSL4Cs3W7ZcLol4Ua1v0JIdN6hSubhrQr9hFDM1xBl5bxhbflqOnCKQ1YTwGlqLbG
	0nNlBaKl3A4/O6CXrk7ezIPQU=
X-Google-Smtp-Source: AGHT+IH8S++IAfyVjX3HjvBasSzgcvoF75qgJlTxeTY6C9k0qmG6CeycWlKS6oAHl7ys1JSdKr4xRw==
X-Received: by 2002:a17:903:19d0:b0:295:9db1:ff41 with SMTP id d9443c01a7336-29b6c3e922amr227024335ad.21.1764190163848;
        Wed, 26 Nov 2025 12:49:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 4/9] libao: ignore CVE-2017-11548
Date: Thu, 27 Nov 2025 09:48:41 +1300
Message-ID: <20251126204847.1969339-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122086

From: Gyorgy Sarvari <skandigraun@gmail.com>

Both Suse[1] and Debian[2] disputes that this is a vulnerability in libao.
Based on their investigation while an issue exists, it is not in libao, however
higher in the audio-toolchain, most likely in libmad or mpg321. There seem to
be nothing to be fixed about this in libao - ignore this CVE due to this.

[1]: https://bugzilla.suse.com/show_bug.cgi?id=1081767
[2]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870608

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a993eb8b93f16e3a16c9a1ab2eb0939cb2331593)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index 233b890711..42c0934b2e 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -31,3 +31,5 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 FILES:${BPN}-ckport = "${libdir}/ckport"
+
+CVE_STATUS[CVE-2017-11548] = "disputed: the referenced vulnerability is not in libao"

