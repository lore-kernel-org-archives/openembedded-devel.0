Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id B68A274CAF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 14:27:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b19-v6so4869180wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Pbmj2FP3BPNXRek141z+iUhko8RFL98sqNQHWWqVUhY=;
	b=Se3Utg3ahgEPVkghWmIe30LQPDVfwx27dRNpfC4ys5P2B3ONFq/Sn129yRPBOaH14p
	TqgbxVquD6Mt7Fy1hGK9PxlDaMMIFWCEyWjqTJ50Q1EM3piRGh25k9vgeFimSAHDlcgJ
	/7Xo3Exzsxw92wkrkE45amaue1dsT1MuGQMbRURS+5pUa8YUpAy4IwwXxqyYSRshUoD/
	g0At2EB3+GEOZFVu75wcubFR1PX0xbsRML2ig9ni3p0N0bV9uTPbfu01bD8FeNJaLkOa
	CuofD/w5UQopkHtZ2qKDWDjbsdOrq8vb33pGzQgRr1ygDecyouZWk5r8CndSbzhDuPmk
	Uzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pbmj2FP3BPNXRek141z+iUhko8RFL98sqNQHWWqVUhY=;
	b=Q/GF5yPWNMs6xMc9TtDroWuzPsrXM3t4+Uiv/taos49e7W3KMOpKAMPcl+QlgscGYX
	QiMn/wmGKLl/GiRvuseTpWm2M4hNuJ9bjGI0/h91/iKSVsLQDuttAQqqhX6YBdkDeyqU
	FnfWT7OKoGFz6J2uUbIywq1EjbYIFiV4nHeYaDXPFmeZfqnRrSGNThSJmW+FsQWkJhYs
	so4qIQ5tkksrzzNAxy4x9xEXHiKnTzGGonS9pASzvIb2O5xg5abKQkmHj7yAB926Z2y8
	W5YWazYUCjsDm+9IutlhoQZ79UW5mEz3osRKV8E2OeFFLRsN+B2n8RKN0VpVfLkm71IP
	ZwZg==
X-Gm-Message-State: APzg51C40PnT4xO2x4kjaVECiHXREX0fnoTGjRGKCtx/sn/aaFtYhUYo
	y1mXydzWViONLMQvJzI8v1QwoXnk
X-Google-Smtp-Source: ANB0VdbYGSGmFaeb2RTvRYctZb1iHfk2dknY075sfJbjK+qVMWQpfjvbTG4E1WV/wU0ZYkZwq2GJDA==
X-Received: by 2002:a1c:2283:: with SMTP id
	i125-v6mr5916101wmi.28.1537021634811; 
	Sat, 15 Sep 2018 07:27:14 -0700 (PDT)
Received: from localhost.localdomain
	(host215-117-dynamic.54-82-r.retail.telecomitalia.it.
	[82.54.117.215]) by smtp.gmail.com with ESMTPSA id
	j11-v6sm8354932wrr.37.2018.09.15.07.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Sep 2018 07:27:13 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Sep 2018 16:27:10 +0200
Message-Id: <1537021630-14111-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc: fix build with GCC and -pie for mips, mips64, aarch64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Sep 2018 14:27:15 -0000

The MCONFIG makefiles for mips/mips64 do disable pic so we do not insist
linking it with -pie.

For aarch64 we have to readd the -Os optimization to avoid

 | usr/dash/shell.h:103:25: error:
 '-mgeneral-regs-only' is incompatible with floating-point argument

as committed (c296fb707ae3 klibc: Pass Optimization with KLIBCOPTFLAGS)
but reverted (76bc58e9329 klibc: Fix build with security flags) trying to
fix the i386 build (see ld.bfd: discarded output section: `.got.plt').
This latter issue was fixed for i386 passing -pie to the linker.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 837b026..6342be0 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -44,7 +44,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'INSTALLDIR=${libdir}/klibc' \
                 'SHLIBDIR=${libdir}' \
                 '${KLIBCTHUMB}' \
-                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
+                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
                  V=1 \
                 "
 EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
@@ -76,3 +76,5 @@ KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
 
 SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"
+SECURITY_LDFLAGS_mips = ""
+SECURITY_LDFLAGS_mips64 = ""
-- 
2.7.4


