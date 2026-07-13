Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACEBC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1187.1783903514347234858
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nCKpKOCn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7cfa17fedso36664835ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903514; x=1784508314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9kGdehbCRjFaoT03zDJZ9IeqteOvkBXunnIrTvXhMM=;
        b=nCKpKOCnyu4EQSgjtPhSM8zsMZcV7pBokNSBsFdzPktbSJEwI8+nGpDlzRv3Zq3nX3
         0xptA87ebetSEntC2nYBWA0FSiHsSRAluUTDC4SR855ao5xs/x+E+Ojv3F2ixzpH4MnS
         LeobRzEK63KL2MvYmA0YxVdNOSPqIwGwPdNH3nOwxvPZ205mGEoxQy485yyxszvfUOsv
         6C9MWGc+al5i/L5nYDTIQbaI6jBFGA+kk+N6cmy0oBwwy2jwJRgyPaSfBIg2yuB5+SvV
         f0lWhpml9LsLfueuNHgFwOADhhSKWmbgmwYvu13qN7DIqZt2nOVkVNeOVv/cKTJjfWOC
         Xvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903514; x=1784508314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9kGdehbCRjFaoT03zDJZ9IeqteOvkBXunnIrTvXhMM=;
        b=ro3WN4ZjBb8ZXuseQOMurKq1eP2pFBVpZDvInwEVXiAW1foxKe3XhWD1PqZ1b7hwaD
         YiQKEIe5/NWJwPhtmVbZzf2psBrTZzFfu7kXfA+tT6KTZSxDvffhSJWBPvNM5IlY1RWp
         rYcMzvErIY0jhWmbXgX+48l/VS2t/wFUaCGEqq3GmYKNlkKZH99YjQMMg8MGbpDj5jMU
         0XCakXDXVmX8Z+Rfi4rCTN0JYRD+CfQ0D+PzWH0Hx8P/Tw40n3QUiTvBpluQD0bcbJan
         1NloWHFdZoq6DttgC6ZzWPqFaPLEcY2fmZukoza05pDW6g+iFRgubuJddcvO2utFbDrB
         vumA==
X-Gm-Message-State: AOJu0Ywz+QgA2dnwr+gi6Djb0Vohg43OgQkqb9mdBFaX09JeQsVNRwAt
	anCxsLOLYHIrVg1tnwcpVY11UDyDJHlV63O4Ecyoihx8f3rsDx4cacoWiRRhTBiqZXY=
X-Gm-Gg: AfdE7cmUAJtIHcANScGggOQ+BvgkeXg6hcdGCYB/FA4I+QUhcs3yXsr+ZUnFpadBox6
	EBblG7sgDFHWuPoBgqjPVx2gszvnajULW44yHcOHfzmIKb/cX+RlKXkyCn6gbcg0DBmLNc67G8T
	7JGJs8+1lQKheoFC6n8DA9KZXXDEk5rUZlACP0y6Qol4hwlKTYvWWAdEHMiSw25/pgRcLC1IUPE
	PoToQufBlbmj/sJA2S7GOyandDstCCCTXlCOPhQ+WF8hnKEIQSDG3y1Yqo/Lf8o/RLFCmqURRPM
	VgvFnvybyTF42eqKTjlalEHoOMaU5TB72YkNvjNTfHdTc7gBKluwZSpGVJoMBtOS1Ol1VhcYGpv
	RmGiK2EOyKfF+4zODzRktttO3kGuKGiy8jDZ5m/vkWW7RAdPc1a4oCwOpvkk6HMHOFYif5/cFrm
	hqi2BPUihyDXCJHixfUUsvbzZNFdKqV74TTGSweBpmy9qRATKkwslC/D/dLvvE7t71U7TpVQkDq
	n6I6ICo8AP11MKVWgLcHm8eb6eDeaQxFD5yZK6ViKvXq//uYCZAp6GLHuWOIbk2s9leEaad9Oze
	CF0936ovGke9zUW4EvEnPbAMwov7zA==
X-Received: by 2002:a05:6a20:2d09:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c1100003e7mr7935550637.13.1783903513675;
        Sun, 12 Jul 2026 17:45:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 6/8] librav1e: fix nasm-native dependency override for x86-64
Date: Sun, 12 Jul 2026 17:45:00 -0700
Message-ID: <20260713004502.716970-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128148

The DEPENDS append used the raw TARGET_ARCH value "x86_64" as an
override:

  DEPENDS:append:x86_64 = " nasm-native"

but OVERRIDES is built from TRANSLATED_TARGET_ARCH, which replaces "_"
with "-", so the effective override token is "x86-64". The "x86_64"
form never matches and nasm-native is never pulled in, so do_compile
fails on x86-64 with:

  error: Unable to run nasm: No such file or directory (os error 2)

Use the correct "x86-64" token (matching the INHIBIT_PACKAGE_DEBUG_SPLIT
line right below it) and also add the "x86" variant for 32-bit x86
targets, mirroring dav1d.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
index 80ac5d9268..4c03c9417d 100644
--- a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
+++ b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
@@ -7,7 +7,8 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates

 require ${PN}-crates.inc

-DEPENDS:append:x86_64 = " nasm-native"
+DEPENDS:append:x86 = " nasm-native"
+DEPENDS:append:x86-64 = " nasm-native"

 SRC_URI += "git://github.com/xiph/rav1e.git;protocol=https;nobranch=1;tag=${PV}"
 SRCREV = "a2f01b3e233f531c28a20b4c29fb5c9e5d29fa6d"

