Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1899.1795113392435053572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=G217LnD6;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so94555b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113392; x=1795718192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJE9+Tm2KQ3aXQWBYP6o9BO+bZM4qzqKnZR5fljxIuU=;
        b=G217LnD6gOrH0aCDQaOnBoVrIdp8hKqoMF4sEbfPot1tgOiylHD+ZCiBZvT9xBYxSV
         dzR8PI8J4C/V3YeB1Gf4THrzdNmqO1gyAJ/hLLolMhnQ8WCO0qoT/0zJpNRF3MUOaDXV
         dDWmBltaUXv2NBwereBaetUvIfJ3H1IrfesTcj+I69N0zUwr9DMBEXumS9p6wj0M0yQa
         vA6JIcwZvJkYZezqITZ2bLIJcbPRbEIhhl5oa5X5KctXDg3rYYVlkKFBdSbu/xF6tsGn
         Ky2m54qTVHrO/Pdrf25ELeFfvSJ3EjhL9J85lJRXQOiNHqUMmppd9ToOSFlpTx8BByMv
         vz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113392; x=1795718192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJE9+Tm2KQ3aXQWBYP6o9BO+bZM4qzqKnZR5fljxIuU=;
        b=YgEO9TTFpp/gFiHCbkxWeQHtcMY7Pq7TIDGalOt8JiQg/gkZPp5dsUQvqSVTnLxZXz
         hpW2p83GI75pwDrzku32i8YwbdcqPa8MEsER0U0kKgkijCcD9EbZ7KJkPJqMVuNeHwJs
         Xw/BhoTCmyomKZcoo1KhyKNpEAi0AGRQven7ts9AK+1vPFwkAebyQvgw8Q2JD6iun7Qe
         yqC446tztfuhWqkSocXltoNNQMq3tH5kiTPkh+c/scZ8F1Q814Uuj615l2cobL2FPp17
         mtDxUjl85iIU7NkLuEygPFtM7iicyjQCeHtBbnLpSHvtCHPN+VbF7vyAO0nhgLGO8CGn
         WcnQ==
X-Gm-Message-State: APuU4Z/EKsTvwEp/wDQ9U4qzS9ErwRp+yKJ15HoXg76YwyaoDR+c6jvW
	uMVYicFJeG09MsQ5sZn4Wz8PRynQmcDxXRFYhLzVZ5YNrtvLzE2fkuJ5+8Di/w==
X-Gm-Gg: AYBFou1Vzk+s+3/iqJD2znBhVcZiMi0R6onv4v3qv6Fy8o/qXq1gldWWNqH11stU8LR
	Yxs3YhGq6R0PYIz5rAoP1veAv0MxnJmTz6szOsyq4DmUN1YlbKrZ3EYvAIZwwSC83qy16/4ILvz
	oNSlqugkW6jYuivI6Dx1bBsAvZtPuwuAFV7AEjfYGSm73tz3i/mgvnBp9182X7af3DFNpLhhJYa
	8/kBZdKajV+W1OmFAt/mBKCO+ZYBShPBRFp+ZaQftsAsliiFTpMMfDcSZNE90Y099DJMzv7yL2k
	VLRfWVX5S3XSsTH3hVw9/WWFtc37ZvjOw7TzbZU6DWzzlDW5xGhz0OOE0fjs8QNmKlLGU20VopW
	Qydx4reXMJ4emQfyewMwSmeePBDumt2lkIB9M/6Hmn88JPGBkRwae0c3WCJo2ue3a7p/sks+1ZW
	k2eHHWpOmfPhPelb/LDu4m31R5fFJWhrQ2aP6C6tuMT4taJ4WcQVw0xaV7WxrEUw1/JLJy/Pll3
	IQO1XdHWcSOewFUmnj99A258BieCMNcSyrnj9CeXGOh7n5KNEwQkwlON6oqQbN9SCYs7L4GOrpe
	z/8xGrZzIqGexae13s2KzjYFYgITwqbgMNTg5z6WeW4rHVrcAe+pl+q9LKoBKA==
X-Received: by 2002:a05:6a00:2d01:b0:89c:d875:603c with SMTP id d2e1a72fcca58-8c87d615131mr500717b3a.53.1795113391822;
        Thu, 19 Nov 2026 10:36:31 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 14/64] flatcc: patch CVE-2026-116733
Date: Fri, 20 Nov 2026 07:32:42 +1300
Message-ID: <8308d8c8c4ae1371dc37b1249b631dee69777fb1.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132704
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116733

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-116733.patch       | 30 +++++++++++++++++++
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
new file mode 100644
index 0000000000..86272984f7
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
@@ -0,0 +1,30 @@
+From 8fcc19366aa081068d2c845084a3ffd907c88129 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Thu, 22 Oct 2026 18:59:04 +0200
+Subject: [PATCH] Guard against adversarial buffer overrun in JSON parser
+
+(cherry picked from commit 356792dc155a9e685acdfe0ec1e209bdadcb4ab9)
+
+CVE: CVE-2026-116733
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/356792dc155a9e685acdfe0ec1e209bdadcb4ab9]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/runtime/json_parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/runtime/json_parser.c b/src/runtime/json_parser.c
+index 4472af2..f9bc9fa 100644
+--- a/src/runtime/json_parser.c
++++ b/src/runtime/json_parser.c
+@@ -538,7 +538,7 @@ static const char *__flatcc_json_parser_number(flatcc_json_parser_t *ctx, const
+     if (buf != end) {
+         if (*buf == '.') {
+             ++buf;
+-            if (*buf < '0' || *buf > '9') {
++            if (buf == end || *buf < '0' || *buf > '9') {
+                 return flatcc_json_parser_set_error(ctx, buf, end, flatcc_json_parser_error_invalid_numeric);
+             }
+             ++buf;
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index 059f888eed..9defbfac04 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -6,7 +6,9 @@ SECTION = "devel/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
-SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV} \
+           file://CVE-2026-116733.patch \
+"
 SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
 inherit cmake
