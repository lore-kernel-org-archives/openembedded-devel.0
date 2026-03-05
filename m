Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E13F3D338
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:02:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49252.1772730127041430524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 09:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mxv48iyW;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9419e561fcso74785366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772730125; x=1773334925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCLZPHF1ZjZp3SQRQeIh5mZltLSp7FmXQvcBAf5bX8k=;
        b=mxv48iyWTFTETV2MwgDCtq8IRkXya0isji1VD1K1ypNRm7lrWtFt8qJ9O6cNGMjixq
         1mbROSs3YU8jeCeUZ9xkgL+v6ws2Akk4j423LaMDSFV45OMBgSBM3o/LTrJNaa0iGWEp
         Y8GJoFtuQoTBqbjrYBO7JHONrGTg0kY7zehJoDnchl26DUchBmZ2auOmZSsAEU/0MUJb
         iu10SZTievTCq0R/csWZIvs0V8JLAJ7uWii8G9/+aeN7xUcUM2EMfL7FTa9RvbJt8j/j
         5y/1gYsdHkv01gPpObMEmBrmnI3b4lWqSm120oBRmcHzRoms4nmM1fI5BDSit848bQo9
         uOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730125; x=1773334925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCLZPHF1ZjZp3SQRQeIh5mZltLSp7FmXQvcBAf5bX8k=;
        b=FzwF3RIiqXCbJDJbST5R9T9kq5KPNrIablKbvI4lXCySjyqqfx5CyIJvN9pZdu6yLG
         vwgvBGxP7ADj5Tvwu/YMR6zQSNFJbw1tRZ3oyhgJI9w5o7/A9U0HawoIZ0Gc0oIYh+fp
         BC1IDoheIXrnu1NB6Kr2sMMty+PHtbCNUha2QeDFTXUqcigHFMdSNg0HDrWvKDKjP0DL
         cSRZ0/NVIAcx2PTmUqk5RsKTqwKMGK1MkBxMyP4tvMg+/dk2qEOkyLKosRi9MlNXKyk/
         jeUrwqQHB07MX6ltrcoBF79NX1HbT/hjuyQUcEIJSxYor3WiHIGmzxvC3T9iztAoit3J
         73Hg==
X-Gm-Message-State: AOJu0YzSn9oz8r7xHYmxKe13Zb2TvCYOcBgf3WsCvIlElny8ldk5DngV
	GjCP+KSr5Bdl0+4SZ5+rquzwaPk1/BuiOq6/LGTtqZqr+ry6XvjzY9Cf4I+kog==
X-Gm-Gg: ATEYQzx4mndGUEnspsxacbYnFUo2OY+C3dhwoRkibmr51wJlQTdX6wNMu73aibVmUzt
	bbYtKdzt/AY0CKy/LG/O+AoCh6w2bZenOduNct33+B3hWn7G3qkib3f45O1YN3jhc5ie6TjCA3K
	L7qweuHGy3rl2aEZYf7xefjGe+J8fWBxTS5/7yy0NFqiehp1qJptRi70qJmVCZU9jNeFVa8Tr/e
	0bH2Zkz75GhVcp4TLa2yFBPRm2xakmGhv5OOxZo1u6XcOQC+sroHbl8P91jpUifvxgYEgJ7V8Kb
	DTuJ6zpfouwIIa79wXxF1Q/V9SuXM0mUuh0nNPq8BbQmGWiIDYFh2NHslQuurYm++uGZCLWjBDI
	PdGX0QCSj0d1LCVOPfqvDCtlzXzC3utqzih4ycLyfwR58EaIBoWORI6z9xzwHuqatJW8UNW16Ct
	KRs0WQceZqm9irO0fnQrCW
X-Received: by 2002:a17:907:3f8e:b0:b93:8cc3:99ca with SMTP id a640c23a62f3a-b94229dd182mr19121466b.28.1772730124945;
        Thu, 05 Mar 2026 09:02:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1116698sm38468637f8f.16.2026.03.05.09.02.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:02:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-django: upgrade 5.2.11 -> 5.2.12
Date: Thu,  5 Mar 2026 18:01:56 +0100
Message-ID: <20260305170157.3357499-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305170157.3357499-1-skandigraun@gmail.com>
References: <20260305170157.3357499-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 17:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124890

Ptests passed successfully.

Changelog: https://docs.djangoproject.com/en/6.0/releases/5.2.12/
- Fixed CVE-2026-25673 and CVE-2026-25674
- Fixed NameError when inspecting functions making use of deferred
  annotations in Python 3.14.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_5.2.11.bb => python3-django_5.2.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.11.bb => python3-django_5.2.12.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.11.bb b/meta-python/recipes-devtools/python/python3-django_5.2.12.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.11.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.12.bb
index d18aa35169..13166d4c53 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.12.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3"
+SRC_URI[sha256sum] = "6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb"

