Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8941.1793358213468312846
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ASIFSF5u;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso78507666b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358212; x=1793963012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUrO7q9UeVnVljR+R5+bv8XPW5iBY6mGc4t8jOfYkS0=;
        b=ASIFSF5uoGQ/KQ2fZ2MTIITw6tLmaX9LLNz0bTMXVSUk+rdzGjNZhwCFUgQgCKeGke
         pRbUnm+p8LzQH6etQC1QbrTsHo8QzsuR2uW31UGwTKUHjrgE0lTb+7Ecr8bUalicsXKk
         EfzU0SvB9MM4HjwkwzZDhS20a4da1pnPnKAUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358212; x=1793963012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUrO7q9UeVnVljR+R5+bv8XPW5iBY6mGc4t8jOfYkS0=;
        b=ETXJt9Q3Df695nsML0//2n+FuBNaYCGMYmTcBh7Jm2a3Scs5av2L8PAtQfNFGemWpw
         ZnpN105umgsGUYMwOr7MyQqyn28XGldaKfyG3IPIcDOA8It4rfTbPaqr6Fp0f+Hp2gGk
         7Cqx/LAfUzxV4BJvPZjRGEQs1Nr3aadUA2hXv8KNo93lO7E0CJQ+dLmu5oQX1MH+wByx
         fTGiuK1IQGlNmgVRvAf3uKzW1lIjJGnlKbSyQmV20HSE7S8N5ntMp3SW2Cyc3HGTK/OB
         vGC7D/NQtshdXjRQIjXHPvRY6npZ4S+cJbIWaK2aLprSI6BFPMTe16TyR+MKYI16XREV
         4YNA==
X-Gm-Message-State: AFq9FYKb3vbnnoOTc8bsBqTB1DmmFhV8HY2WnA4X7XFCF5yYWsvqvDe5
	yYvMP4jPbnOBG7Mh1/vNmZ/HGdhlkuz0JjqDhYpr5J7STfAOLTHqtHpbByZXGU/OvAC3CC6z47b
	2MDSG
X-Gm-Gg: AYBFou1VU6Wfdzn0tH6JCZTGlC/ekug+olIzULbrkqBTfbxqY5fH+JgBif3sth93QM3
	rKpkTqUmXxU08uvBl8NTPLG4pUTrS6i7RN7yQ+woUddtWt3useZCfRhx6Jlor1rsxvHzwT/JgZu
	UWdI3EKrPE8atrZjlN5yi63st1qEaJgS4E+9GKDqn0baOlo+oMi9S49JIVN2Skk3+HfCtHM/d1t
	xMwBEbXqSAbBbj9gUFrpzhnjsxwFIcjXpYlZ+u6oLoW7hRhtEt6yebFYnFFTAPVt6J4Ijt7CQ7f
	wilNcIJG8SyF12lGPn/xlmMSVuNlo4LL6fNMbKIFU3YbVCO/fQWsx8fEttLNPG1QjFTFeaZvBBi
	WT9/2HKdOj6qyzylycz8nwv+T/qWjLh9ieqnLi5ZUv3eeisqfEytc4VsTTu0E1js2lOiT7QQ/M7
	n+uGKBbAKJol0g0k7BWBW3l6Gq2uzCQgEtMlZRu3YWPnrJau4tWgZMO+TCA8Awismregz1RFVwP
	VcB1Ep3autugUF2YPKuZ0Kkx0qyxkVfA4wtaxxuhRq/1al8kgCvxSOCMnF4ZeDFGtCfYsZsnH3E
	I4QbZRoRkkMejQ6S/fH1l4K9Gl/X7AJ04tJBkFrIgSv63AukGXyXtgNaymW1Vs+HZc97VsPlD7I
	XlxdLd+Lv3NSqy7dgkz6On0FA2vAITvNB/qDsABliwR9cYoYlXFutXA==
X-Received: by 2002:a17:907:928d:b0:c42:5363:38dc with SMTP id a640c23a62f3a-c4ca7a4a91fmr162354266b.25.1793358211405;
        Fri, 30 Oct 2026 04:03:31 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/25] python3-ruff: Upgrade 0.17.2 -> 0.17.3
Date: Fri, 30 Oct 2026 13:03:00 +0200
Message-ID: <20261030110309.1124614-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131697
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.17.3:

Preview features:

- [suspicious] Add shared-clock-mock

Bug fixes:

- [pyupgrade] Avoid incorrect conversions to f-strings (UP032)

Performance:

- Buffer stdout in ruff format
- Specialize ASCII identifier lexing
- Speed up identifier and keyword lexing

Documentation:

- [flake8-bandit] Describe what the rule actually checks for
  httpx (S113)

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch | 8 ++++----
 .../{python3-ruff_0.17.2.bb => python3-ruff_0.17.3.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.17.2.bb => python3-ruff_0.17.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
index ccf1d645be..2fbda610aa 100644
--- a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
+++ b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
@@ -1,4 +1,4 @@
-From d2c053cc5d1906f1276ce323531c626f6e199e26 Mon Sep 17 00:00:00 2001
+From 3db4e7361ecdafec16b5ea23a2a21e62bc5d87bd Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Wed, 21 Oct 2026 18:00:00 -0700
 Subject: [PATCH] ruff: Use portable-atomic for AtomicU64 on targets without
@@ -31,7 +31,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  4 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 08da4b1..f6ae6ce 100644
+index 84eda7b..4444142 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
 @@ -3123,6 +3123,7 @@ dependencies = [
@@ -43,7 +43,7 @@ index 08da4b1..f6ae6ce 100644
   "regex",
   "rkyv",
 diff --git a/Cargo.toml b/Cargo.toml
-index ae31696..57a66fb 100644
+index f5f3f6c..288535a 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -172,6 +172,7 @@ pathdiff = { version = "0.2.1", default-features = false }
@@ -55,7 +55,7 @@ index ae31696..57a66fb 100644
  proc-macro2 = { version = "1.0.79", default-features = false, features = ["proc-macro"] }
  pyproject-toml = { version = "0.13.4", default-features = false }
 diff --git a/crates/ruff/Cargo.toml b/crates/ruff/Cargo.toml
-index a7cd6cd..b7ca393 100644
+index d88c322..a0de836 100644
 --- a/crates/ruff/Cargo.toml
 +++ b/crates/ruff/Cargo.toml
 @@ -77,6 +77,9 @@ tikv-jemallocator = { workspace = true }
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.17.2.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-ruff_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.17.3.bb
index 0a18c03807..0c3a0dec55 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 SRC_URI += "file://0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch"
 
-SRC_URI[sha256sum] = "84d632402d14c23b488f941db23712d6736a013225162062d34558c3f3c780eb"
+SRC_URI[sha256sum] = "a57049c8addb3662073859bb55a7ad35aa54f8a7c9ed268911d1333c5aadaaa9"
 
 inherit pypi python_maturin cargo-update-recipe-crates
 
-- 
2.47.3

