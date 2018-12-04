Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EB7586C479
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 15:01:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c126so9637976wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G1+c8ik6BMJXamPEPWmbSeX9RdAASrz3iMB5PmSQ0uw=;
	b=HiK4l1JnAV83SytigIdNxTAqKefV/vRFyD0sFz3z8shAyHsmA9tuDnBIHPs/a4chgV
	Rfut5kbycDFB+oTgeb6G6Pt26K1TIYva6CQZxetEk0RhNtzG4YwAVMI/7DO0tCemQZkH
	dqIor5QSpVhKYQHIqfkQJcs50WmFYWkFuuT1rQr4HSmJpUNX5MMfTQvUsyKuMwgY8aCg
	otM73/GA4BTuBYtTVlM61eYUUtPzS0kyoijj8tdXnaLlw7l4tahTfpOBnO9H9xN6b9fd
	pw143xBQ7MMk0mV7gT1g03syLo9ip8mucvNPxfA0cN/6jvhEsvg86AKkZDRxdX3Q9yD4
	gqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G1+c8ik6BMJXamPEPWmbSeX9RdAASrz3iMB5PmSQ0uw=;
	b=leKa6B/oIAsNHxzm7++GZ/Q4vbCK+Nrn/AqDqVF2eoO4aCTiMCtOpCUjnp1bXm0OmQ
	OQEGWacjh6EVmRjs6fsT8fSejdDSd0b5TbTB9UBEZFBnzxTO6ztLiA3WiyUf/+InFpMC
	/ydT9cJWnBkaZzTPYCyVe9F0LKpFvPKXi2v3nwsHsVz12RbGNaQ4XIPWZteMj4dS7/G3
	hoom6H7vHXfcTQI8fTtMtHNlxLCzi4iTfTKqQ+Xc9ExOqbGYomI5qRvPGGnWJh9uxkgq
	nbJrBegBA+OT538N7C15ddTGzIcfFDoclOh5h2DVRnrfupkmlQJMRiS3EowihHA/79hl
	nyAA==
X-Gm-Message-State: AA+aEWZ8E+v+8Wbf5UauyJUBr1uL8sQCz3vMbHB+JR0XuM1NMNFYtPQa
	nayFprWv9OUP692iDiYK+Ne5wj2L
X-Google-Smtp-Source: AFSGD/XVsr4kxPUKDSryLXby0iSkavtVJzcxVB8Xfk1Naa0p3pE14rkOFGqmIly2RxRYJns/R2KTnw==
X-Received: by 2002:a1c:e287:: with SMTP id z129mr12527105wmg.71.1543935661326;
	Tue, 04 Dec 2018 07:01:01 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.184])
	by smtp.gmail.com with ESMTPSA id
	n9sm18905067wrx.80.2018.12.04.07.00.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 07:01:00 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 16:00:57 +0100
Message-Id: <20181204150057.3249-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-initramfs][PATCH] klibc: fix build for mipsel and mips64el with security flags enabled
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
X-List-Received-Date: Tue, 04 Dec 2018 15:01:01 -0000

Fix relocations like:
| mipsel-oe-linux-musl-ld.bfd: usr/klibc/libc.a(kill.o):
 relocation R_MIPS_26 against `__syscall_common' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index be01c2f58..398dfd1cf 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -69,6 +69,7 @@ KLIBC_ARCH = "${TARGET_ARCH}"
 KLIBC_ARCH_aarch64 = "arm64"
 KLIBC_ARCH_armeb = "arm"
 KLIBC_ARCH_mipsel = "mips"
+KLIBC_ARCH_mips64el = "mips64"
 KLIBC_ARCH_x86 = "i386"
 KLIBC_ARCH_x86-64 = "x86_64"
 KLIBC_ARCH_powerpc = "ppc"
@@ -78,4 +79,6 @@ THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
 GCCPIE ?= ""
 SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"
 SECURITY_LDFLAGS_mips = ""
+SECURITY_LDFLAGS_mipsel = ""
 SECURITY_LDFLAGS_mips64 = ""
+SECURITY_LDFLAGS_mips64el = ""
-- 
2.17.1


