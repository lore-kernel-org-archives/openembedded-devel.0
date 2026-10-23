Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1648.1792738452026208441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QAzNiioL;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so275423b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738451; x=1793343251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HTK4F01rOpHGB17O/3Cmrg+9FIRdcS/77w1Iy+oeKc=;
        b=QAzNiioLebKWTqsGzFRhvEJN9oSs1LPpvSKp/3WCZ203pGjGNMkAmDM2SLK0mnHjdP
         zvSs0m1mHW9PJCwQkXjgbEfgXYl913yWJUUZYk+e0ChfFbILWca9Y1KOEb9dexLwmpYp
         1ZDJ8pri3cszawtB4QH7dnKduBaTX1E2LSYwZAMpxn0GrTnpLd4vMGlU3M6zs+811Aeg
         g22XQnlCL+3v6IOLdCA0V5L6c6uLSm+o4pLS+Vuc+p0JF3984RI9+VT1oI/yfLFlz7EH
         X9GUc1c53FY7qbJKjrczQ8Op7XD2D36wk30enjMfYK344rFkGKYa+h3VZli9pzVmmNY3
         pbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738451; x=1793343251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HTK4F01rOpHGB17O/3Cmrg+9FIRdcS/77w1Iy+oeKc=;
        b=TEp7oh/b9FGrHyxUtNGe1os70GGpEAkTeS8CMcaHi+0TsExfJIHaie3tVHomVAlS6+
         rIkfa7dhQ5dg0ZMLot/ejVYF449YWmQ63u3wCJXPZ9BXeANpwCjK1S33XyezIAOx92Ra
         UgQRvUcSTfkTdbkhNIbR5Io6YeqHryLaVZD0m2cMWOaa5p8GbctgX8e62k0gmY3tmiKW
         wBYusAPpG58bM3nHpnh1UF4fPyPgNbc95uQyDNFjZv4YKkm505K26e+bM6EcHViNUwvT
         FGF2O/PrTrYZlwDxYtxhKcQbP8/pLXkrki92dnVh5VDRPfO/fANjWjaNFisorj0pdBim
         CmFA==
X-Gm-Message-State: AFq9FYLRErOpcuazoUcr57yJmAq6P2EKnQf/4Xa+Vo5YaJ6hXmRmoBNv
	BvsUMacE7uJKFhIJr+8Fa4PBgCXT+SspyZD8MfaFp0jAlGYmfQFTf3bz5LUB8Kjpuv4=
X-Gm-Gg: AYBFou1gqDHFT45bA0S7R7GnfG6NUqeqVw/UAEe+fe9Rnwed+cC/dv4dsllt9mtM0El
	U2y86f4IvUvn808MbQoK+iZ/6WesPJ2YovAbBeMUe7a654vyfmYEfCaz82Dnd05ozjyaDyIuZvW
	0VNw2nie3WsobVKBGzHuxrocpcH+3UzlPYwMcr2BE8mDdna0FKMspFHZVaR1WR1zH6CGZYZIqhm
	VA4qFQYJMV/7CP4rSCI1nhhHfZa6Ri5asaJENLbwCft7y/7QYCSqLrUkt3h/hEOpDlcYvpRGFV2
	JU7SQVwm94+niK7kY3m0lSEexqoY+hQH8W68qq254KHvlNAgAqf1kPZjbELzqYI+KbcWzGEgdak
	yIq1x9FP592nohPo6zCE+A7gPMchXGz2U41wMXr0Tw88kkdjbqht6kBznjesaHflE2Sgh5quqJM
	5WB2vqAhZ+xC1jXT6ZwRYOIh0PPiDHI1LMzixtYnICBfFDotVNERJ/CW+2HXTiHcc/xMI8qMxnj
	l5Md7WWxO2XGc2Qa7MVGf2SJ85hGTzdVSAyMd8B/noDQ3w/i7W8BTPLmqla23ythCpZw9Q8Wl5c
	BFp6tnQyXlBMVmja5S9z2PLNedRwjZ68FFZ2e4YODDSLjYx9o5pKIo3sVr/FjENFPLhPl6yCmLB
	C4qxE9JG21Ti+dN3RCY7PZLV2xH+doyNwvX5WxqnShWL+oTPbBXP254KYdaMSDsDF5DJm62kHlf
	pMWuCapS/dmpfl1X9XTP0A0MW7AqIOLFcKe9HkIYVeOSJ0yFg5MGqoBKvErcP83k7IoIlOdBrPw
	3ggdUmi+w3iFUKrM5FK6O05IphS6/k=
X-Received: by 2002:a05:6a00:2d9e:b0:899:465d:c8ff with SMTP id d2e1a72fcca58-8a2c626e42fmr1288801b3a.13.1792738451361;
        Thu, 22 Oct 2026 23:54:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH 15/29] klibc: Mark incompatible with riscv32
Date: Thu, 22 Oct 2026 23:53:36 -0700
Message-ID: <20261023065350.3228996-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131339
Content-Type: text/plain; charset="utf-8"

klibc only has a riscv64 port, which hardcodes KLIBCBITSIZE = 64 and
uses 64-bit loads and stores in its assembly, and upstream has no
riscv32 port. With KLIBC_ARCH defaulting to TARGET_ARCH, the build fails:

  make[1]: *** No rule to make target '.../usr/klibc/arch/riscv32/MCONFIG'.  Stop.

Mark klibc and the recipes sharing klibc.inc incompatible with riscv32
so they are skipped instead of failing to build.

Also skip all recipes inheriting klibc

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-initramfs/classes/klibc.bbclass            | 3 +++
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index ad5d9019fd..7bde5eb74e 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -23,3 +23,6 @@ LDFLAGS:append:toolchain-clang:libc-klibc:arm = " --rtlib=libgcc --unwindlib=lib
 LDFLAGS[export] = "1"

 OVERRIDES =. "libc-klibc:"
+
+# klibc is not yet ported to riscv32
+COMPATIBLE_HOST:riscv32 = "null"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 24f5ee0c7b..c46a8685aa 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -78,3 +78,5 @@ KLIBC_ARCH:powerpc = "ppc"
 KLIBC_ARCH:powerpc64 = "ppc64"
 KLIBC_ARCH:powerpc64le = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
+
+COMPATIBLE_HOST:riscv32 = "null"
