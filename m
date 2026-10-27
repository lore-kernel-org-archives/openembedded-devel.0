Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14853.1793092875859894520
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VhQPVfup;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso29763475e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092874; x=1793697674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLZ5lUQb+9hGYYoEHUFrzgFB5JW1myjR6W21ItxS3MY=;
        b=VhQPVfuprgf55N3nNqo+QdBm5wtbnHgaT7nISx/dFCBIPALeYKfR7esVdIwkAG7Qrd
         Rp1mmvMXcR+7mrT31OTQLFGK4J5sObbfzAkDaV119dsg69DQ0JU/5vWt1Jy9qWBexpMD
         4ioqzI9lNX42Gd5zt1Co0rGAbsDD82QxXYyDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092874; x=1793697674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLZ5lUQb+9hGYYoEHUFrzgFB5JW1myjR6W21ItxS3MY=;
        b=UFSjRDuidu8B/qBlP0d9W9C4GWGNVCncuPHn46c+xkYOLWmGR1M80JE+sxPOcgicAq
         wZfLpzQW9IAOfMvin8H15Z0tcTCZZ7dCD8cDMXHZCmNJztjjU+gyeY9DiVsUoXD3n5rh
         MlYpvfYLqEmjy4oX5tXX0R6ygGHZbh5XMOJ/oObTEbPqQga03HfTdVKa1lBK3EKftrmb
         wkftOPMI9iGluPq8LafjKH+PX42cvZipn3OCH6H6e3NjT0KhLzjqjox4Fm26xXZ0DDAK
         gMrFtXH8m6KuDL1m28n6cw3c9IymptaBE1pKyvDt4QFAsPtFy+hx2uPFW+t7PnqDRICj
         4HBQ==
X-Gm-Message-State: AFq9FYIvKq4584a7hcUtGkpvRdqxy9BPaNnfzP7FUBDTo5uDKj8hSYf/
	/nejVIYnjDltLQc/NRhv6m2oiuPNkERQqVQ470yeVATsjXl4R4KulKsr54SQMyb9jhFo7PbBVhJ
	jsj/J
X-Gm-Gg: AYBFou2OP3x6yd+NMoRtTagNkUEyRKcoXmWw1Dmml/1Fl1jpe66pTm8rYNjKIHtCotW
	lk3XHfKejiCWSu60BCVQAEneK6WYwJ+mCU9hDkdhjqIKsy7FuRFkkPy5zBeUEvUlfZaWYEXqINg
	Rg58w9hyYhTBK9yArJZ9bxc2O3tCHZJyNXHOJ4t8EqVAi41ofOJh/v0oEf+Bb5ORSBV9JxV6VoO
	OfB84XvnHsrHPA+vDhvSKxJ2LcWjFbWcFUEHIo3nRqQU0CTSXv7uuuE7sGQk+FR5k0j4LTWpXKQ
	jKTDbbI+PN1KA0B0UvdeXVtH0lK80SPWEkGqzS17M0vlQ2NVE3zz68IhzvFqjZ58PInm6jWnz2U
	mONRbESaZerDwz4F7uI/OPKPWWGB5ikBpWY6YDdm3JOqwhYGMCWg3U6Rax1CfAojxGjjD9XGgsH
	CwXAtuDM5J4ORh8Orga/B+gKtlZEDThDd9fOm/kSw6jnQKktdhE+dSAcjrBuTw6oR+PkiKvgIF4
	5XI1NFFFcsK9nx8yIkIqhEaRk9MsYPY0ewdZO7wJEvwKdaebWyjMmZh43wpWqJOBNMzPsSImm45
	fj0LVSVw+ZL4p7y0R6/sA2bl2sHxeLcy+kBVpwu6ipfhsxkZyb4BOQ0fWNhhKRRvPw41jXn1su+
	N+uiF
X-Received: by 2002:a05:600c:8114:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4a35ac9781cmr161122815e9.18.1793092874156;
        Tue, 27 Oct 2026 02:21:14 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 37/61] python3-sentry-sdk: Upgrade 2.64.0 -> 2.73.0
Date: Tue, 27 Oct 2026 11:20:04 +0200
Message-ID: <20261027092028.782979-37-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131501
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.73.0:

New Features:

- (arq) Add an option to monitor arq cron jobs
- (huey) Add an option to monitor Huey periodic tasks
- (rq) Add an option to monitor rq-scheduler jobs
- (types) Export Attributes from the public types module

Bug Fixes:

- (arq) Don't monitor cron jobs with unsupported schedules
- (attributes) Handle special float values correctly
- (celery) Don't round down beat schedule intervals
- (cohere) Stop swallowing exceptions during stream iteration
- (huggingface_hub) Stop swallowing exceptions during stream
  iteration
- Exclude litellm==1.107.0 from extras

Other:

- (litellm) Require filelock>=4.0.3 on Python 3.10/3.11
- (monitor) Stop background health checks in tests that drive the
  monitor
- Update AGENTS.md
- Update test matrix with new releases (10/12)

Extend RDEPENDS with the runtime dependency python3-certifi.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...2.64.0.bb => python3-sentry-sdk_2.73.0.bb} | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.64.0.bb => python3-sentry-sdk_2.73.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.73.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.73.0.bb
index a45f4543d6..b946bafaac 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.73.0.bb
@@ -5,16 +5,17 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03dc788d9a9486be5e6a1d99c2c1ce3a"
 
-RDEPENDS:${PN} += "\
-	python3-urllib3 \
-	python3-core \
-	python3-json \
-	python3-logging \
-	python3-threading \
-	python3-compression \
-	python3-datetime \
+RDEPENDS:${PN} += " \
+    python3-urllib3 \
+    python3-core \
+    python3-json \
+    python3-logging \
+    python3-threading \
+    python3-compression \
+    python3-datetime \
+    python3-certifi \
 "
 
-SRC_URI[sha256sum] = "68be2c29e14ae310f8a39e1a79916b6d85c6cb41dcce789d14ff05fe293e4c55"
+SRC_URI[sha256sum] = "4a2ab97b16e4693c325ab361c7bbbb346dbc7d0bc0150922d795a25bac8d5280"
 
 inherit pypi setuptools3
-- 
2.47.3

