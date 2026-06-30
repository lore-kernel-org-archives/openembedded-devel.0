Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08354C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 20:54:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31157.1782852890775893368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 13:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M4lMCJyK;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37e11438c66so2026858a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 13:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852890; x=1783457690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDjfhEB7CiucI/6CqF5Yo9k2iN0sdkUkG6uEYhzsBa4=;
        b=M4lMCJyKt6mfMu6Ac4nbaoWmr705fwwnrPf2fZuT0Xde9MG14Z7ohd5SajdoeH1f5p
         yJKz+UtQc/l56Fn3w20WXM3ZfEEs88R0Zk5UyqNKgrtvlJfUpjy5k76hadrJJ4urysfb
         ED+hi9Z9e+wJ2Je3gnT14FDtGxKeuRAiB5jFH1KKj1bvhXYtUbsII2RAsFboeCqzUoy7
         CzabAs1b6fTKYX7Xy0EORd0SqbcnguUn64TBkq+0k0yIO732C7hA+FS4gcMy8wddp6gV
         9fL1D4t+jVM/c+OtQQQZhJbRTdft9sE9WtmM5n3JBi8fXHHZgvIKoCK26qWxYCJ/BSWu
         /5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852890; x=1783457690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDjfhEB7CiucI/6CqF5Yo9k2iN0sdkUkG6uEYhzsBa4=;
        b=k6slx1NSySlsV65vliPxOV84ygmayHe7slSVCn/JNujmYBQP3Tg+ychDRzByU7XqTd
         BeeASU/scuwZv7Yh7bnpmJVCW2+YAjxQ9ff3SLDLws2a87j9g3AOswSX/t7HEBxM4+Cq
         0+EeigvN9NNUnB18rkHpONoaJiSe0RjUiaQNfnciQJt3H70+mvdge/b/yiL23MGSo3nC
         ZZuW/kLHHovl3qOseZ77GSM74KayhszUl3e3E/osjkWXe6J2GwYoUX1G4DTww3jBAChV
         3HZ1WeeYjLT8NvGjrsRfqQDa3GGZ/qknhCHLNzpYCRPNZRyNYzpl3NFkAL1HU8yqI+Qq
         wvfg==
X-Gm-Message-State: AOJu0YwFFRaqRmrVzsGS9n7WfSlL+R2tGlirjmiIcWruZJ5X3Ym892/y
	3YEbOvR30GG1hr1WtsFsQGju+08GHupWCCGk1u0cicYaT7eVU66YZPOj6fdZoA==
X-Gm-Gg: AfdE7ckOc7ZC2IaoSHXBZuhvVKnCGGFSS2x48VZJ1gaZ5SBD+8RM1zrkAlSIvfOSh1x
	VA12lFTK5tmDyGOStUpjRTeXV159C+rp0xPGWKnF2S8/ZvuifHZ38KcFuJdo4Aaw+iJ21StKHpu
	4HL/XsFlNmQqC0Eon76fIcfvYg2K2QhtDWHcE10zJXrQhD03JV52C+vXZq+dlAKFQj1G7zfh4jU
	0Wk/fkd83QcbIgNi+saMxfHAgyt5S9MBJ2pzDy+GiK8+8UHJJd/eEzH6qf7DOOq6j2l1FZjW/mj
	TA9yvUYEBwVgvUnZTeY+hRYBUSAw28+Ju7tgHFsSb8HZ6AA8Q3GlGr/4yHgbaCugCpZEoAj1sH8
	DHR1s7pDVbGjbODFF9QhzPASh0CtSBGweJKqQwcqhGgGKntAGiva7EmMy3JlK7IRAPcJitQ/VpA
	muEhhFK+J1twgQft1BqErcuGUMx+SpCHM8pb8cXUWghi3zzw==
X-Received: by 2002:a17:90b:2f83:b0:380:5350:6619 with SMTP id 98e67ed59e1d1-3808bfcee93mr1578531a91.18.1782852890057;
        Tue, 30 Jun 2026 13:54:50 -0700 (PDT)
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm20593765ad.63.2026.06.30.13.54.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 13:54:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH] valkey: upgrade 9.0.4 -> 9.1.0
Date: Tue, 30 Jun 2026 13:54:33 -0700
Message-ID: <20260630205432.99639-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 20:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127985

* Refresh lua-update-Makefile-to-use-environment-build-setting.patch

Valkey 9.1.0 GA - Released Tue May 19 2026
---------------------

Upgrade urgency LOW: This is the first stable release of Valkey 9.1.

* Security fixes
  - (CVE-2026-23479) Use-After-Free in unblock client flow
  - (CVE-2026-25243) Invalid Memory Access in RESTORE command
  - (CVE-2026-23631) Use-after-free when full sync occurs during a
    yielding Lua/function execution

* New Features and enhanced behavior
  - Add cluster bus network traffic usage metric in bytes by @hpatro
    (#3396)
  - Reduce latency spikes during rehashing via incremental page release
    by @chzhoo (#3481)

* Bug Fixes
  - Fix(syncio): Set errno on EOF in syncRead and propagate to
    conn->last by @abmathur-ie (#3580)
  - Fix GEOSEARCH BYPOLYGON leak on invalid COUNT by @bandalgomsu (#3568)
  - Handle NULL pointer in streamTrim listpack delta calculation by
    @smkher (#3591)
  - Fixes server crash when RDMA benchmark clients disconnect by
    @quanyeyang (#3448)
  - Fix the memory leak in valkey-benchmark by @nmvk (#3643)

Release announcment:
https://valkey.io/blog/valkey-9-1-delivers-improvements-in-security-performance-and-more/

For full comparison of changes, see:
https://github.com/valkey-io/valkey/compare/9.0.4...9.1.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...akefile-to-use-environment-build-setting.patch | 15 +++++++++------
 .../valkey/{valkey_9.0.4.bb => valkey_9.1.0.bb}   |  4 ++--
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.4.bb => valkey_9.1.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-environment-build-setting.patch
index b91684afd6..7e5a6bb570 100644
--- a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -19,6 +19,9 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 Updated to work with 8.1.x
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 
+Refreshed for 9.1.x
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
 Upstream-Status: Inappropriate [OE-specific]
 
 ---
@@ -28,10 +31,10 @@ Upstream-Status: Inappropriate [OE-specific]
  3 files changed, 6 insertions(+), 12 deletions(-)
 
 diff --git a/deps/Makefile b/deps/Makefile
-index 72389def9..5d3ade528 100644
+index 94d9385..5d49559 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -95,7 +95,6 @@ endif
+@@ -102,7 +102,6 @@ endif
  # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
  # challenging to cross-compile lua (and redis).  These defines make it easier
  # to fit redis into cross-compilation environments, which typically set AR.
@@ -40,7 +43,7 @@ index 72389def9..5d3ade528 100644
  
  lua: .make-prerequisites
 diff --git a/deps/lua/Makefile b/deps/lua/Makefile
-index 209a13244..72f4b2bf2 100644
+index 209a132..72f4b2b 100644
 --- a/deps/lua/Makefile
 +++ b/deps/lua/Makefile
 @@ -33,7 +33,6 @@ INSTALL_DATA= $(INSTALL) -m 0644
@@ -52,7 +55,7 @@ index 209a13244..72f4b2bf2 100644
  # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
  
 diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile
-index f3bba2f81..1555ec028 100644
+index d38b2d8..e6b3540 100644
 --- a/deps/lua/src/Makefile
 +++ b/deps/lua/src/Makefile
 @@ -5,18 +5,14 @@
@@ -78,5 +81,5 @@ index f3bba2f81..1555ec028 100644
 +CFLAGS += $(MYCFLAGS)
 +LIBS += -lm $(MYLIBS)
  
- # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
- 
+ # Pretty-printing setup
+ CC_COLOR="\033[32m"
diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb b/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
index 93e37a922a..8790854ff6 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
 DEPENDS = "readline lua ncurses"
 
-SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.1;protocol=https;tag=${PV} \
            file://valkey.conf \
            file://init-valkey-server \
            file://valkey.service \
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "1cbee84ba69b54c3510597965fc4320ce716a6f4"
+SRCREV = "c9e8005e9d0ec817e26c7db318861cb821409249"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.54.0


