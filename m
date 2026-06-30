Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7812FC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 23:21:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33820.1782861710351159575
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 16:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qEumPFqN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9b19bbaefso362475ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 16:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782861710; x=1783466510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLR0yV/9vLJb2hZvlLC4Ocwi+VWO3ik2uXG0C0HcE6U=;
        b=qEumPFqNszzPNNqWLXYhtHFa/iDAvrGYT3o8hFMVP2GcnrQVKKkYGlN2dPacV/cMF5
         u5euSF/IWqYKI43e5hv5U3F86T7FNF8j+LPR07C1ybilOmTSztWKsXj0Fudr5G2tEihO
         z2lV5IJIP7XtclzQe/r2S8vUDb/d3RRRBqyNbo64F/BXEczMPiRsrK00yxbA43z6NVRv
         p0gRfPw3P3RHy5yqSAcqG+uHjnLpIcavlzzDpItolUX4CTgcVeP0ogDdPXZkX8t/3yZL
         bfcBwdsSD2aRSYlzC7+D/BiGRXNU3MvwS7co8lMfE9+NyeAKScXoq+CWbUP4csaRsRSt
         Extg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782861710; x=1783466510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLR0yV/9vLJb2hZvlLC4Ocwi+VWO3ik2uXG0C0HcE6U=;
        b=cW3Wl73Rq+hJUvXJg4sL2WCobdqYOtWb9QbRUQrKdGScMSoHOtGXcOFN38Lf5umYAi
         SB4hyuoh4Fn4R1aEj/YmRmdM9XzYhqr5+ThQ+yL9SeJVKhlCFyMWxlqjkENpcJAEClYy
         J3WhvZwHEslQCJ5oi7PyMeUiwFcD5qHWH7YuTVeNfyoSX+d8CicZXz6kIzSoeZ8Caz8x
         Vq7v/GmhxjBK3x0kUwTf8tzeGuXbr1o8bmWCvv7GsLYR6CEhngI9BUGwUuH9tO1QmnGb
         mU8gha5df/nqTyTsXe5s8NuNrKgfFUWlul6WBcP2za9Q/BH1bnM9NCDs0SLiD4YXM7Iz
         Ps7Q==
X-Gm-Message-State: AOJu0Yw/6ZERycKaNWQ142uYGxjXh6+YOiNMPyy3qFejLMh1NGPlJ+DW
	kcllN+eAouFu7U5uJ1YnGhVtMRm+TsVLvzyBdW1B48en61t2HWV+dNR2xXwJfQ==
X-Gm-Gg: AfdE7claPkAeFtQZmtLjAjLa9+ITW2eLWfZLTJuq3ii6WAGTQoZNKvD4Hu2ufJGDzz9
	rUmSFgT4z/SDcaq3DAGc8gRl2fppUOba5CsGMGRBWaYx/Rt13cVSdDZ1gEVEIWGGXWP31w3Y8fm
	jE9AQ0MwNDwydx7LEeE0XtO4Pr93Z9KJFgAlOs92VxgM1hAigj2fbhBPtw+C8w3pdl6AiNADZk8
	Q6x78yNgLH8D4xDW6JxQyU/fCk/VPwDTqFVo7C/VkkfXXfCrnrM/ntic4rz37xu+YUntwjDq0SE
	+Ntosyy8AZAYbId2ovmytubq+dxZLsY/inQJeJBlcyuSYeU8D/yTejO/8e05tOAjI+JW0UOjkak
	LYo1cSCXUbc3eyoByixPXCMkF4QhWYjwh/4v4UPJ7dzRzQFiMzaXkzra7dg+BY0tRdm2QEkDG5M
	bHE7FV/cKQOxnc0akVfb+jxyD+vfBjhvL2VhcCRweyNiKfnA==
X-Received: by 2002:a17:902:ebc4:b0:2c9:bd37:ae76 with SMTP id d9443c01a7336-2ca2ed2c17cmr45105375ad.47.1782861709564;
        Tue, 30 Jun 2026 16:21:49 -0700 (PDT)
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c950sm21322565ad.51.2026.06.30.16.21.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 16:21:48 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH v2] valkey: upgrade 9.0.4 -> 9.1.0
Date: Tue, 30 Jun 2026 16:21:16 -0700
Message-ID: <20260630232115.32391-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630205432.99639-2-tim.orling@konsulko.com>
References: <20260630205432.99639-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 23:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127987

* Refresh lua-update-Makefile-to-use-environment-build-setting.patch
* Use ${@oe.utils.trim_version(d.getVar('PV'), 2)} to dynamically
  determine branch= in SRC_URI

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
Changes in v2:
* Use ${@oe.utils.trim_version(d.getVar('PV'), 2)} to dynamically
  determine branch= in SRC_URI

 ...akefile-to-use-environment-build-setting.patch | 15 +++++++++------
 .../valkey/{valkey_9.0.4.bb => valkey_9.1.0.bb}   |  4 ++--
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.4.bb => valkey_9.1.0.bb} (93%)

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
similarity index 93%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
index 93e37a922a..de1f413d4f 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
 DEPENDS = "readline lua ncurses"
 
-SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/valkey-io/valkey.git;branch=${@oe.utils.trim_version(d.getVar('PV'), 2)};protocol=https;tag=${PV} \
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


