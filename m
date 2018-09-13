Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 08F1779861
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 07:24:36 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u11-v6so2202603plq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BefcACETUwSr1/j+V/14BV69NaewL92soCyi2EDzdF8=;
	b=jMdnwvzw89ZjdWCUFj/BkIH/74+RTSiK4CgKbzOMkbX/zAfFdgSJtDtI8zs/vrQ7K9
	Bsde8vvQY32IEnwpL8+Bf96NohhlzqYKq/9wEvFkEsKsB7iXb9maC3l7QN726Bw2FwqB
	nbiKaSD8pRAGj++z8Uzx7Z0po5KW8q6CHpUKFaM+hluQn0PZN9P3Wi7Ke8Rh/KJVrgqj
	ULeIMbka29rzTU/XCS0sXC9kDBU4e0DdGh7BOzX6DyEVJzx7sbVv2gtJMgPnToiOR7jT
	Kypjlib3S9825YKRixjNQOgyE4MleZ5l/wHXn3WqyltuQ8XUcWRh7OM0o5GviJw7Y3N3
	6XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BefcACETUwSr1/j+V/14BV69NaewL92soCyi2EDzdF8=;
	b=cT/c47Vn4WaAK3KlQlmwsMi9j4B0HuQ2G/aPefiVhaQAMKh+H3c5TUZn+EdhB1l5Pm
	qTqdVupmF45jlDY/N/Z8eaJeHP2fApJRWqG2wjJsmeIdAUu9brAwuKorwP1P4gA4klh2
	GwUkP7RQj95nFb3bRpZFpTBTiN1qg/9E4D9TDxWovZodwE3zKgVeD2dBjA4Kcnk1JbC8
	Bszp6kEIC2waJ9JQMjptye1I2Qi8JGLqGDlJfA6U288io0pxomqA9vmlIhzK/nN5CsR/
	ndlWrfkPjZbdb31LhGFYfzoYuT5EZ8t9dBXt046yKJD/l7ECL7h5KuEnnMs31l+ljcFx
	18/g==
X-Gm-Message-State: APzg51AeP4xi8FRpw7wFXT3eNheZTUHaCC3TT7rG8nxuHKeF4XiCQ3AY
	rK4RhspId4oTyPHO+90gK/JJ7xBE
X-Google-Smtp-Source: ANB0VdbjJiWbHOF93h5+r0a6bga3TOjvEBIVw5pPc0p9eER6L6whq4AAQrFeJaOCnHxOv9qtoqCYTg==
X-Received: by 2002:a17:902:7803:: with SMTP id
	p3-v6mr5853426pll.119.1536823477730; 
	Thu, 13 Sep 2018 00:24:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	z2-v6sm3514373pgv.12.2018.09.13.00.24.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 00:24:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Sep 2018 00:24:28 -0700
Message-Id: <20180913072428.33129-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: Deliberately add -O2
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
X-List-Received-Date: Thu, 13 Sep 2018 07:24:37 -0000
Content-Transfer-Encoding: 8bit

This helps the compiler to be more aggressive and do the expected
optimizations to remove unused code which otherwise gets flagged on some
architectures e.g. armv7l

errors like
undefined reference to `bad_unaligned_access_length'

Also see
http://lists.infradead.org/pipermail/kexec/2009-August/003488.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index fe34671987..25f5da48da 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -60,7 +60,7 @@ EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
 
 # fix purgatory/printf.c:2:10: fatal error: limits.h: No such file or directory
 # fix include/limits.h:42:10: fatal error: bitsize/limits.h: No such file or directory
-COMMON_CFLAGS += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${S}/purgatory/include"
+COMMON_CFLAGS += "-O2 -I${STAGING_DIR_HOST}${libdir}/klibc/include -I${S}/purgatory/include"
 CFLAGS_x86_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-- 
2.19.0


