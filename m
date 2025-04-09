Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB057C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 13:57:03 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9117.1744207020385177657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 06:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4IezTJz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227cf12df27so6759245ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207019; x=1744811819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6L3OZITQAvipangUfd2VEq3OEQZbJdD76Dpkz+Jra0=;
        b=S4IezTJzwrYKm0thyW26paeV2QHuTl5cX5SFMCU5tmgMdQeuF+l49qcuwHAiCisn7C
         ei6qvNDJKB1Ys9QttTyA8ZUJv7+Eh/XigHwXtxkCU2NONPxzAp2srFqzXMUgYSgi2g0B
         xz8wAgKxLpE+oYhjSX7ZybcCpuhNH3o+OmWQotRx8CdO/0Y2N+jcrPCdMboR8U0ZEa9S
         APa5hnHRUouhACCovXtg22sltDPkIsTZyJYrxrKiB8XiVXFQlXJtIcWhH8UpW3E0E7JM
         2/Wc+GqpdbcS+9mrrpHkiyy228nipxSnfq+fkgqti+VW4Pm4ZOM0mkSHSa7oa1O2mlgg
         fcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207019; x=1744811819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6L3OZITQAvipangUfd2VEq3OEQZbJdD76Dpkz+Jra0=;
        b=R62nL+LCJzmI1QI31sptyQgZzkEkaEJjMQm3o4jrZA0VNe5tsHkzpg/R0E3+U97L1X
         wJkui4lPQYNu/3tag2vBwYHll7IoQ5EuhlOlR5g7uUYr+kdePuezdyusnnNa13CBrJ2H
         nJ8agYjsfdkaDvZOrT07aoxAKcCK4cBZDfKpPa+mbcQFE6QWNVA8/UwWLgILexvV1T3F
         F3lTEWUV78/aE0R4qEi1EZqu5dpMXeUEkqrQQ0C91RN6H7sAth8QFg81S6zgarS6J9i7
         FM60uGof3wCz6a2cJskO07r34MwQDDZkBEkcox0s7peYExJpXjoBzA6rHg8W+GvN+yrs
         8sjA==
X-Gm-Message-State: AOJu0YwD/4Jqw5xuQEuNKIyMGLm6aBTAaJucL1K8OUi+EZfNTIc1F7A7
	uMlj6nR7znx2HzvcFRDlDRONF0KLC1eR5Gh9BfJY7iMhRq4uwLvnQffmjfLC
X-Gm-Gg: ASbGnctvXYpWddXAFgcar7g+CVNZeJwXMydQdALKLnxOd6oM3FW64exBwc5l1wFF/Ci
	J0McUgdQb8HT8OrKBlQhNgEV8WVoEpSESiEr5yNzRytBwN9iPXPrcQqQRdk+xH+7WoAXqUZABdv
	tGu1qiQ/dIEB2/YBQGB9qzlS9oY8u9NaOdaTHvuXpDLfugNFAHctUBwCMq9kPZRZxxXFG4hW6Re
	ZommGrEkJ3mrQdi8FXVC71mgB372Ril7k1XrH1myoi0oI7m7x/scTTNkqaggI9WPPzip5hC+lCQ
	j513hUivUDQl/t1uhu2+pgBWoLedGVLv
X-Google-Smtp-Source: AGHT+IF2/TvqfCXhQckWQ6Np9Kk7IwP45uYHhQide4wWWVCVIyF1JcziMLAOSeWix+50M4RTlG7SsQ==
X-Received: by 2002:a17:903:2290:b0:224:24d3:60fb with SMTP id d9443c01a7336-22ab5e24fbcmr108810815ad.10.1744207019436;
        Wed, 09 Apr 2025 06:56:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb4fa9sm11845495ad.179.2025.04.09.06.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 06:56:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pv: Add valgrind dependency on platform where its available
Date: Wed,  9 Apr 2025 06:56:56 -0700
Message-ID: <20250409135656.1066846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 13:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116741

valgrind does not build for RISCV platforms yet and so are some other
platforms ( taken from rsyslog recipe )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pv/pv_1.9.31.bb | 26 ++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pv/pv_1.9.31.bb b/meta-oe/recipes-support/pv/pv_1.9.31.bb
index 2f1d38337f..578012fcfd 100644
--- a/meta-oe/recipes-support/pv/pv_1.9.31.bb
+++ b/meta-oe/recipes-support/pv/pv_1.9.31.bb
@@ -18,7 +18,31 @@ inherit autotools gettext ptest
 LDEMULATION:mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
 export LDEMULATION
 
-RDEPENDS:${PN}-ptest += "bash coreutils tmux valgrind"
+# for ptests
+VALGRIND = "valgrind"
+
+# valgrind supports armv7 and above
+VALGRIND:armv4 = ''
+VALGRIND:armv5 = ''
+VALGRIND:armv6 = ''
+
+# X32 isn't supported by valgrind at this time
+VALGRIND:linux-gnux32 = ''
+VALGRIND:linux-muslx32 = ''
+
+# Disable for some MIPS variants
+VALGRIND:mipsarchr6 = ''
+VALGRIND:linux-gnun32 = ''
+
+# Disable for powerpc64 with musl
+VALGRIND:libc-musl:powerpc64 = ''
+VALGRIND:libc-musl:powerpc64le = ''
+
+# RISC-V support for valgrind is not there yet
+VALGRIND:riscv64 = ""
+VALGRIND:riscv32 = ""
+
+RDEPENDS:${PN}-ptest += "bash coreutils tmux ${VALGRIND}"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-binary-localedata-c"
 

