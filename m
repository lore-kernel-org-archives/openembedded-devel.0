Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71B3CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:55 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17721.1763014848286302761
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjOUqgKC;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso301691b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014847; x=1763619647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nd6UHB9SRLUfBZOHDP5D6hWsrD0mmTdKltDkUrMq4DE=;
        b=mjOUqgKCDf/2NcUPHuXG0NMuFet7rzswKBnN73z7WM3P89Os7Y1egC6xvTmKoAfjg4
         d00QAvL1RSB1Xz5OgRBd+l4K2Y+8GDorVmBWehpfjnOWR7+ngAoCj5iluMcu3cCaQpgG
         aywO23pbCBClRkaUt5S0jQA4DGOPnjBpRnhOuOUgW5ENzTSmc4MsY5SSuROGEaz+99sI
         9Tke3mitlQjgAhUDnC4S2jl/MaeAFliIMNjY7MR651mFKvpIR+q9arERLso+I9JxSFhM
         bw8GDp1mqS9bATXvXpwBuSEGB4Hf6eDtBuiE+Hrr79aGa5k1bPIHjYVrQNrx+17s22Uj
         F/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014847; x=1763619647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nd6UHB9SRLUfBZOHDP5D6hWsrD0mmTdKltDkUrMq4DE=;
        b=eHGjs2q1E+ls+nq9pM2qRsci9lBL2Rh7wkMh05a7fKVl8AYwlobpu95y1m8yyY2IQz
         4XBm4J7GClyDF13UNH7Aq0eyTwdUQA2Rs2IV7ygEQg0SmN0fes51zaclx6sinimadLt1
         z77PL2IBHs+PomeoxjF1hShD8xiJq98dXunpFB0jUxqgoNnxhcgLyP8W3CIsrPdJH5LC
         r8tZb2vwBmnK4M8m30L7/Moo5h6GlJrzEX4KVUlohJ4PGU7FqhiM3krRJWkJXDe0LTzh
         SyNVqPq19X1FsKz6mBuWcAPJEHT0FUGuatXN4/pJIQLqMhBQsvb8TMUf5FiRXs9aLC2J
         kfDg==
X-Gm-Message-State: AOJu0Yx6r4MiQ2e7FmNovRSEqQvcblKdVFrckzThGA7xKwi1/+jpLkq3
	+KtRBOpQgs4R+pnsBPdSvVdUiyTZp+iBydbdq/srAdclqh1eKcHbtpjznO6Epw==
X-Gm-Gg: ASbGncsyjXJmnS6G1kT1CLxc4YDqzWmEBjL//ReVt3Tgo0admIBKJctEJay2ukKQ89N
	F7BvF7msIvagD9Gtx6YVEDR2uTzXyGO6AdqiuiLzGOec8rNdOFootEZwaLXUfQlF0vG3Vrkfu77
	AprGMkphxhXGeQ34edRe2oE9U3FWOadNPDSVwTSgFbvaEU2QQeRLP7Yf476ZH+u/LB2GfTUksuI
	4ymATwiOXqxjI/iIcKT3cgY90MJPXxVVr+mvXNQslOl88C8dv1U1T6ogg8ABQEiSXgqQiDIvc65
	ViAaruniRczgqAFY0wcGhu+zOjngEZoIqIQnji1EevF//QrLuYUqrY46BDYd81lJdSceKIVUkJ/
	7Rwb0DJp5rLAXdsywnl97Iv5dmAcJbiZDJsCB7+mnSojkNd+kusk6O1eBWRMMeriznbqo9suJlc
	aaNrmL2rT6k24x4w==
X-Google-Smtp-Source: AGHT+IH56T+QsocmVbpxRWFjvtWaPtrlyiIsKnSmSFgvpJaBV9FlDK0RGbhJMCrhVBu1etX1Kj3JDw==
X-Received: by 2002:a05:6a00:3a05:b0:7ab:6fdb:1d40 with SMTP id d2e1a72fcca58-7b7a27a42b2mr5375809b3a.3.1763014847528;
        Wed, 12 Nov 2025 22:20:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 26/38] libbpf: upgrade 1.4.6 -> 1.4.7
Date: Thu, 13 Nov 2025 19:19:01 +1300
Message-ID: <20251113061914.3756301-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121624

From: Yi Zhao <yi.zhao@windriver.com>

ChangLog:
https://github.com/libbpf/libbpf/releases/tag/v1.4.7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 07cdb574a5a4931ba0629604f5ea90591b31b1b4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbpf/{libbpf_1.4.6.bb => libbpf_1.4.7.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.6.bb => libbpf_1.4.7.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
index 914ac9f087..8df1c639ed 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.6"
-SRCREV = "fdf402b384cc42ce29bb9e27011633be3cbafe1e"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.7"
+SRCREV = "ca72d0731f8c693bd98caba70d951fc0bfe20788"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

