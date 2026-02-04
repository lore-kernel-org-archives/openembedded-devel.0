Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD19E83EF5
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 08:57:35 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16291.1770195453240311817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 00:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+LnBIPD;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so34109855e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770195451; x=1770800251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hET9oczHyKb0xfCdXiP/3FsTd1soQ5rEIkncCIOWt0E=;
        b=N+LnBIPDZGG1INtPlqXTJh3hrgQL3dCQZJZbQ3xSc7QahpjBDkTfClq+zR2fBmRlJz
         A2SCyom+sSsdcgYPlXaOp7RwEZ6CKV3NRbvUDDD3kxAnbKv0ir1fHtW9CQQ0meOY4tEh
         W7n7+/wxdZR0oJhSpVWO8F6Mp0SvJq89wJAkYkjMN5l9n2Bw8b67zG5PJQbymJjaHrMA
         L8PlDT2T0kBlgbRjehD2kvfUh3Shp2ib5GoUwY1vz8Cinbhfw0sqqLkR2BOdXpVQAWY9
         /yWka9tRiKg7jBwtx2JVJKk/TH9udoVZQaU9upt1US69bDKh4vitTvt6LZHU3o+1bxtR
         MS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770195451; x=1770800251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hET9oczHyKb0xfCdXiP/3FsTd1soQ5rEIkncCIOWt0E=;
        b=JBfj+2BaKSR1a9R3cznF0jkoAgAvHuUyyVgUQLob/m2Iem8loQfXEffsDvTpqFY92+
         GNDNlzuv/amR/vy7OoZGeLvDWyQ8iLNyXFMo5HeSnez6jL/+U6eSn6xkx4aqrbUc1b6i
         GocplBR7THhxbFHJd5jeuGDPch8UIhe5hMcylte+Cq7s34tTR7ZZxLnpGE2zzMf0MwIW
         I4z+peTkdaRjHpMODvmefFcLTTPdmGlMmMTZ7U5y8esw2IVTlbQOme2/KeupE5MGQcG4
         SMHZ+bae9aKyETQhv7msw0OMEniK/qzmkmrETDm1e3tGFJJZ8L16YKFtftXUhKl3p/2s
         cfnA==
X-Gm-Message-State: AOJu0YzQMkq1bmzuxLAF5Z9VtB9CpfnMSjrbX6yNgJPd/z5ifCxbYjir
	vz+lBenTfHJcCTfIr+iEa7Y5i3TQYNheyXqGqwUfOI2lTq6raPrrVNQc1ebrreca
X-Gm-Gg: AZuq6aIkGLWVkiBzwx6EJEtHIBAvFriUyglZbypVfiM3u6heY3pd6cGkkDkjYJDUUsm
	iR0uuvgaIDoxFjPe0fpELf1bzpFzmV/gwXg7yuCFFdCeQ4+DVzYBs0BG0edLi9xGKy/l0BVhqt2
	f1rhDtOgUnHbz0RVFimWmis6EB2P6hlmnJ1VP+i0D+8NQY09rxkIpjEcxXudapD3yieJCWAtf/N
	HjdICbN4D+cuOiDiyAHogbqvE13efDaYyJiLALYMX2O+B78m5lsxLbn0haUXhRjIP+MJqm8Ehu8
	cPGdrVCPxkqbXSysai2I43xI1Er78h/nu/sEBH6in27XNtdqgxmIQgL1AIElzvzx2CBy1Cj2Kfz
	6SKAfAnhXXNzPPb2IXgdEsBvkWbSH0iNBgicDBrdYeAef4KSVQuYkgnybslz3AR1gO2KwmwF67g
	iRSTSZFsva
X-Received: by 2002:a05:600c:350e:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4830e973685mr28384425e9.25.1770195451320;
        Wed, 04 Feb 2026 00:57:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ffc39b8sm15360525e9.17.2026.02.04.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 00:57:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: hongxu.jia@windriver.com
Subject: [meta-oe][PATCH] nodejs: extend libatomic patch to x86
Date: Wed,  4 Feb 2026 09:57:30 +0100
Message-ID: <20260204085730.2441346-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124121

This patch isn't intended to introduce new behavior, rather it
changes the order of some existing LDFLAGS to fix a workaround that
stopped working at some point in the past.

LDFLAGS:x86 contains libatomic, because linking with this library
is required for this platform.

However when gyp links, it invokes the following (pseudo-)command:
$LD $LDFLAGS $RESOURCES_TO_LINK $EXTRA_LIBS $EXTRA_LDFLAGS

The EXTRA* arguments are coming from the gyp config. Since
LDFLAGS appears very early in the command, libatomic also
appears early amongst the resources, and the linker couldn't
find the relevant symbols when compiled for x86 platform (as
it was processed the very last):

| [...] undefined reference to `__atomic_compare_exchange'

Using this patch the library appears at the end, along with
the other EXTRA_LIBS, after the list of linked resources,
allowing linking to succeed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nodejs/nodejs/libatomic.patch             | 29 +++++++++++++++----
 .../recipes-devtools/nodejs/nodejs_22.22.0.bb |  2 --
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index d987ac50be..835c7018de 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -17,6 +17,10 @@ Fix:
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Added libatomic library explicitly to x86 targets.
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
  node.gyp                 | 13 ++++++++++++-
  tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
@@ -26,7 +30,7 @@ diff --git a/node.gyp b/node.gyp
 index b425f443..f296f35c 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -487,7 +487,18 @@
+@@ -503,7 +503,18 @@
          ],
        }],
        ['OS=="linux" and clang==1', {
@@ -50,7 +54,7 @@ diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
 index b23263cf..dcabf4ca 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -1100,9 +1100,18 @@
+@@ -1348,9 +1348,18 @@
          # Platforms that don't have Compare-And-Swap (CAS) support need to link atomic library
          # to implement atomic memory access
          ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "riscv64", "loong64"]', {
@@ -72,6 +76,21 @@ index b23263cf..dcabf4ca 100644
          }],
        ],
      },  # v8_base_without_compiler
--- 
-2.35.5
-
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index cb82d4f15bc..65cb123b7bf 100644
+--- a/tools/v8_gypfiles/v8.gyp
++++ b/tools/v8_gypfiles/v8.gyp
+@@ -1820,6 +1820,13 @@
+         ['enable_lto=="true"', {
+           'ldflags': [ '-fno-lto' ],
+         }],
++        # For future patch-rebases: this hunk is in mksnapshot target.
++        # ia32 includes x86 also
++        ['v8_target_arch=="ia32"', {
++          'link_settings': {
++            'libraries': ['-latomic']
++          }
++        }],
+       ],
+     },  # mksnapshot
+     {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
index 1ef01cc3b2..b3a4fb4245 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -133,8 +133,6 @@ python do_create_v8_qemu_wrapper () {
 do_create_v8_qemu_wrapper[dirs] = "${B}"
 addtask create_v8_qemu_wrapper after do_configure before do_compile
 
-LDFLAGS:append:x86 = " -latomic"
-
 export CC_host
 export CFLAGS_host
 export CXX_host

