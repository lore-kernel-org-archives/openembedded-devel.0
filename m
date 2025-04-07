Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B010C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.39640.1744003246778387802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 22:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJxoFxOJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so919892a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003246; x=1744608046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SFDqn+a+eaD2oZ8cStqyivEoSjydV7gitGudtUfVqE=;
        b=XJxoFxOJpqsQBdtYXYpJZCQYgpTzy+elL4UndNlXLoqa1JYz8rjvHnjuAOhXdHTTGQ
         C71ptIN7QEMhFD7WngRRg4ykyyZBg36bkxVNqy7R8qHBrmnO3o9dzP3YkJOW586+xG41
         jH86gfWI3h10bT+ejGh068qS7ddsmRlVhbQF51gT2H54rcYvQsbo/SkDRMc2YcrzRw9e
         1YorpE6RjqwvtmswYNu2Eut6lWTe+FDAXftROKdzAlY2D3qyx/NgJQ0ueTc4z9KZQcAx
         FR1XBDSgBE0gQmWOHNqDyOg1v8JgKVm+6arTHFhBBOA+CMgLAmYG4decAIh6joxWvkfN
         +cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003246; x=1744608046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SFDqn+a+eaD2oZ8cStqyivEoSjydV7gitGudtUfVqE=;
        b=D+HCCVPMvBKZkjH6eeW4GtRfQ3HUiV0Nhn1akyFTAJhxbQYAUaDyfxg8NmfDNGswXN
         1BOFcFd/Q41XeJow5YKdneGe+tJwWEw2USlxzBWySAr1kZJ825qW7JhIOE7GcenxJPrz
         SdNuQs9qNPY1x7z6jBTjgKJSQ3UW+tp8s/oGnTeAZizdOM2yU1N76pn3hgfHewSKLwAs
         z66lO9aiFzGj5V9f0kmVrM8nArPHWEduueISvUi7NTJsM3nhthmXRlhEjlro8dCqS2Ke
         06GryUE2wNZ3on+cb7PIE9xPBbQA3Ydzeny6PI7yikzZkc0eg6IKLu8iRcjxptVa/E14
         2bhg==
X-Gm-Message-State: AOJu0Yy8uNAtjGd+pEJuxtT1tsgOVO0/F9+a8GMl3XxaM8POrM0T/VcQ
	15ldJa46z131PZMTqbofZf3utDxR4i/GH/B+MOHgiegeIYIT4+HEMxcTcNHj
X-Gm-Gg: ASbGnctDweIaYU4+W4PhEQdicjR0aLQIimfQzCXLp4u/gXLRjEZPif/pzM8CeVmxmL1
	pdbOZ/QACqGR9G1+fbVqEVrrz7Pfz5bvV6TQBcV4wvENoIkCOHrReTHaPeLEQLQ5Y3Thz2Mps/2
	d2odZCL1L1r6gaJCGnLx7u71iaavHjXaWA2918LQ3GK9VTAeO7GBibELS5IOi1FZh+ZWUKAbiUJ
	yBiKPLxnFee+6ZcAL8jfh3m1CVLwPvO9Xv7N9Guc91q5pXS8RSvaqxOKoAKEgDCPSw1H2cbug2g
	3WWd0o+aZxwLXsAnKRoyNuGXR4dQg4pqigPj
X-Google-Smtp-Source: AGHT+IFHewOpwTuSARRs6p175FElEhsXLLthelqnyi2s5sfxBvy3K18/U9X6Ra2j5eIAzgWN6DOpnw==
X-Received: by 2002:a17:90a:d650:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-306a4821b95mr14503278a91.1.1744003245856;
        Sun, 06 Apr 2025 22:20:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm7607546a91.0.2025.04.06.22.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:20:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] deqp-runner: Use linux_raw for getrandom backend on riscv32
Date: Sun,  6 Apr 2025 22:20:36 -0700
Message-ID: <20250407052037.502341-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407052037.502341-1-raj.khem@gmail.com>
References: <20250407052037.502341-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116621

Fixes
| error[E0425]: cannot find function `getrandom` in crate `libc`
|   --> /usr/src/debug/deqp-runner/0.20.3/sources-unpack/cargo_home/bitbake/getrandom-0.3.2/src/backends/getrandom.rs:29:15
|    |
| 29 |         libc::getrandom(buf.as_mut_ptr().cast(), buf.len(), 0)
|    |               ^^^^^^^^^ not found in `libc`
|
|     Building [===============>          ] 77/121: thiserror-impl, indexmap,...
|     Building [===============>          ] 78/121: thiserror-impl, indexmap,...
| For more information about this error, try `rustc --explain E0425`.
| error: could not compile `getrandom` (lib) due to 1 previous error
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
index cc8fef757c..57f1635426 100644
--- a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
+++ b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
@@ -17,3 +17,5 @@ SRC_URI += " \
 SRC_URI[deqp-runner-0.20.3.sha256sum] = "2de4b135ed68a7f821deeedebb4084d33058b0307f1f9935e2c960430f7532e8"
 
 require deqp-runner-crates.inc
+
+RUSTFLAGS:append:riscv32 = " --cfg getrandom_backend=\"linux_raw\""

