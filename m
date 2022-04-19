Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90FAC4707A
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.1477.1650397477529977001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 12:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IJgJPcKX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso2946985pjj.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SC4n1sdqxn9msAiKKMqCY61V+agX5DjPcvh070jMIxs=;
        b=IJgJPcKX2MjuDREbn1m88JTk1hpuoZsP9GfOecQLLNnu32yIFKy/KC9L/ZibEaIK21
         2+ueFxGd8eGPfb6k0zzlFHpTTk4iKv2oyUT0KvKBsstcphLuyPaL3BYtZ5OkVjO+eSoM
         CKzHKHGchROnvuFf2l8Od8bUVukt+4lW5UY4TzVrC3M9ZwOaLsG3rKCETBGbpioBqzm/
         8rdy0/4qGD19PmnwiJFOO8BoITlzkO85aGv0aJbqvSI67/rAf6Ea9uZRYzwI4R0NSJ0u
         1OM1AnIeeRu3IEwrGzWHHJvbj4GEQV4bGX3iUCLrsuzKp/VyxLU/nk6agh6fzCZwXxrr
         GSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SC4n1sdqxn9msAiKKMqCY61V+agX5DjPcvh070jMIxs=;
        b=mIsTZYZF9GdoFPa5YYN9+Bqo0Ksm+IfuXFaClXBwSRZHboaglZq0qNb9FCLHL9bot0
         +Cjz57tRCKWpDPaU23ysvlk6wW4L0sCF//tLguX21M/f7S79sYpT4bP6LFZ66t9UPIRN
         6DSglJXkqJaXo3c3ejqpZoU6EmgwN0SNyfmxH2yz6dcI+IGr/0vlLaYGA6HrcrkuKohZ
         cuNq586ejDznzGDWhNI8q7inG1Uo7xuutGovNSVpNji3c7R/dZ3+wEuxuAbubUGZusoE
         8MEqC6ggUizDyStNHsWSRFhYjF9TruofRUaOBBkiGjw+JREzQHN+VPYxg0pnW/KrvEPC
         smrQ==
X-Gm-Message-State: AOAM533Wjh+wxmZaDYF6ng/6kCVoOy0gyJqp2kTog57x8EO0jg7j4FIE
	Lmj4INez1jzcqG9WY5kr2eLX6h42sTclYA==
X-Google-Smtp-Source: 
 ABdhPJxqi3lUHXomnsycGePS9TjeqlsmlblNqYXEKblBKHrv42he78DSjnYv/dgM+tB9jUQUzqDcZA==
X-Received: by 2002:a17:902:8c81:b0:156:7fee:643b with SMTP id
 t1-20020a1709028c8100b001567fee643bmr17210004plo.59.1650397476773;
        Tue, 19 Apr 2022 12:44:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a17090a441800b001ca9b5724a6sm16498027pjg.36.2022.04.19.12.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 12:44:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Upgrade to 16.14.2
Date: Tue, 19 Apr 2022 12:44:33 -0700
Message-Id: <20220419194433.3127143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96702

Fix build with mips32, found with gcc12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-32bit-cast-for-operand-on-mips32.patch | 34 +++++++++++++++++++
 .../{nodejs_16.14.0.bb => nodejs_16.14.2.bb}  |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.0.bb => nodejs_16.14.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-operand-on-mips32.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
new file mode 100644
index 0000000000..a0242d8e18
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
@@ -0,0 +1,34 @@
+From e65dde8db17da5acddeef7eb9316199c4e5e0811 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Apr 2022 12:40:25 -0700
+Subject: [PATCH] mips: Use 32bit cast for operand on mips32
+
+Fixes
+deps/v8/src/compiler/backend/mips/code-generator-mips.cc: In member function 'void v8::internal::compiler::CodeGenerator::AssembleReturn(v8::internal::compiler::InstructionOperand*)':
+../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4233:48: error: call of overloaded 'Operand(int64_t)' is ambiguous
+ 4233 |                 Operand(static_cast<int64_t>(0)));
+      |                                                ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ deps/v8/src/compiler/backend/mips/code-generator-mips.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc b/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
+index 2b8197e..b226140 100644
+--- a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
++++ b/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
+@@ -4230,7 +4230,7 @@ void CodeGenerator::AssembleReturn(InstructionOperand* additional_pop_count) {
+     } else if (FLAG_debug_code) {
+       __ Assert(eq, AbortReason::kUnexpectedAdditionalPopValue,
+                 g.ToRegister(additional_pop_count),
+-                Operand(static_cast<int64_t>(0)));
++                Operand(static_cast<int32_t>(0)));
+     }
+   }
+   // Functions with JS linkage have at least one parameter (the receiver).
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
index 0ab68cc608..62188f94a7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://mips-less-memory.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
+           file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            "
 SRC_URI:append:class-target = " \
            file://0002-Using-native-binaries.patch \
@@ -36,7 +37,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "05eb64193e391fa8a2c159c0f60c171824715165f80c67fcab9dbc944e30c623"
+SRC_URI[sha256sum] = "e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab955d3822da90ff8d1"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.36.0


