Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5097CCD8CB2
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 18:52:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2457.1696963962450659549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 11:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j96CTSOZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-693375d2028so5367870b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696963962; x=1697568762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ6kWY3es2cFd60gR2ja/UAgUp63VjmurOF5+omKAb0=;
        b=j96CTSOZQ3PpuIqxsLUAYv9ZFwU8IJ2/HLWB64yaCw89YLhdDYZtdfa5C2FJPVHgZu
         oNKX5U3UljG/x8vDQS0gY3Y6GbTr6sXHbUuQcZsyTv7iS0hIMvkoqF1fPMKR/vQmCCxX
         2g/3dv6xry17JVbBMjr5XNaz3HW53oyzxj7C1fUZRgYTjuBjqaGWy+Fs8CTqx/NsFqNY
         +dkoQS55og0dEBo1HBJR142Cdb4uY1cbeOHYrM7YediUJaRdADFk9IobFyqt1Kg916ku
         Rs9IO46TXu2/nmgbOuiNh53sKHVKPj5ZnZn/bVUbYaAVfGrFrF77ll0t8QLJTIep/iFj
         CROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696963962; x=1697568762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZ6kWY3es2cFd60gR2ja/UAgUp63VjmurOF5+omKAb0=;
        b=RN6sec0ZJLWyGnaISS3t9DohM99/qwLDDzfjPPLM97oXRF2DMFl2S3rBRE7UqCZuUI
         4zFzUUxGIa4PMiRmu2XVkCIkDW8lCUeoQKAT8zFKC4uT2cgFc7HvvHe6do9+jHQ6itWZ
         tdReKlmH4YVz6T4gwMxUnRxJmv0e2qkWP1y3XJu2bUOZ1lT+99sAUWGTQ0jxUl0Onf0b
         PG1H9qdzSL24GCKysvKxIrcbJhJNVloD3XHGdQ/w01fNyOBMKf8POiuS43thliIpYQFg
         jnvRsCTg2QMUdv5izWWKodGtnlhbQYP1SB2Fliat1av12gvjN5WapRBfU+KY0xRUGaA6
         GqDQ==
X-Gm-Message-State: AOJu0YwjccTLVhgjluBOjz6ARr46BZmXRTJaEv0RZR0MvvXNokxR+i67
	5SNBhw1rwbSyAa/8DKFL3g0waXFhd5jeUQ==
X-Google-Smtp-Source: AGHT+IES/3fBLjIMVaiCgKzPMhHCt9DQRU1l9GQoAhqbB815ThPWcXfOA9g+7kYm/MkcON5skUviYQ==
X-Received: by 2002:a05:6a00:230c:b0:68a:6305:a4cc with SMTP id h12-20020a056a00230c00b0068a6305a4ccmr22422332pfh.5.1696963961634;
        Tue, 10 Oct 2023 11:52:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id a21-20020a62e215000000b0069353ac3d3esm8534886pfi.38.2023.10.10.11.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 11:52:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] kernel-selftest: Use clang options when clang is available
Date: Tue, 10 Oct 2023 11:52:38 -0700
Message-ID: <20231010185238.2842132-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010185238.2842132-1-raj.khem@gmail.com>
References: <20231010185238.2842132-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 18:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105415

Enable bpf only with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb           | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 2e5680d775..291a83aaad 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -18,7 +18,9 @@ SRC_URI += "file://run-ptest \
 # we will append other kernel selftest in the future
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
-PACKAGECONFIG ??= "firmware bpf"
+PACKAGECONFIG ??= "firmware"
+# bpf needs working clang compiler anyway
+PACKAGECONFIG:append:toolchain-clang:x86-64 = " bpf"
 PACKAGECONFIG:remove:x86 = "bpf"
 PACKAGECONFIG:remove:arm = "bpf vm"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
@@ -54,17 +56,15 @@ EXTRA_OEMAKE = '\
     CC="${CC}" \
     AR="${AR}" \
     LD="${LD}" \
-    LLVM=1 \
-    CONFIG_CC_IS_GCC= \
-    CONFIG_CC_IS_CLANG=y \
-    CONFIG_CC_IMPLICIT_FALLTHROUGH= \
     CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
-    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
-    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
     DESTDIR="${D}" \
-    MACHINE="${ARCH}" \
     V=1 \
 '
+EXTRA_OEMAKE:append:toolchain-clang = "\
+    LLVM=1 CONFIG_CC_IS_GCC= CONFIG_CC_IS_CLANG=y CONFIG_CC_IMPLICIT_FALLTHROUGH= \
+    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
+    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
+"
 
 KERNEL_SELFTEST_SRC ?= "Makefile \
                         include \
-- 
2.42.0


