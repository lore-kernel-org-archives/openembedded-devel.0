Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37930.1795594071341188847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZwgWF+Ti;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so10923986eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594071; x=1796198871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1jG+W3dyUVe7UjzaplkWPRr0eAbJLOJIZnbQo/f9jU=;
        b=ZwgWF+TiP+VIvzb3z7F2VbunFSA6CdoA+IWCT3UJN+V3tYX28gt4eGWT9bZ7bIiyiH
         SxldgUu0MqTXz6C5np8E5Ra5te+Wa6UGa4ZgMNR67yr/umoKtF2/RwWzZEfU8LeQeXNR
         W+uEcoATENPB3qjqACB/NPTWv9QJcmEGNyDpIUH8F7KEvI6C4DhbuDAMhV68DHo1xKoK
         iB2WL9E79Fai+k6HZS6kLgK+sdm1/mufwB/5BY16SYIRZms1RuAN6u2cTyMly6jdBOgq
         acUfg0FELwmajfgV8hJiH5ZtWy1u5YiIVkYn7I1dG0tXJWsaOAfdHQsfPfXDMIWHlCF1
         dMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594071; x=1796198871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1jG+W3dyUVe7UjzaplkWPRr0eAbJLOJIZnbQo/f9jU=;
        b=oQTRmIfA5vnBtZ2yk/U05BbVzVrZzjh6z/nOyqD8uSQso2tzrq5qdC8AQ99FdyNcAq
         FcZboMZNKMB6l0Z1RjIWqNg7g8LJAZbYlV0Vb3anHzP2SkWzTTiqHUnoarG6StrzZCHQ
         IDBcCkwatFdLZI8OxZ0Qi8AbLhuMeSDkZhK6WRDb7tsoi2GrnuON1M5DkK5F4FNN1jwN
         p80R9wOs40x8+L11a0ZcpgMWuG4KH56g9HUEXRWDB8p/lGzdGKeb1uLO9cl8Py00MAFp
         +r2EJCP2V9f5QOA+XUxbcXZyTeClG0n4nG2ouHWLbW/yi50BM/m+DggEnv2SMRBMGt9G
         xFeA==
X-Gm-Message-State: APuU4Z9+dX1wDEN1T4LqtAOH4ODTH+iLBQOxZlifSzXYkNK1wKL89Wq7
	v26775rH4bvbSMB7d+7P5cuHnAK8e0R99/0zADEa/UhYXjae0EMjd4cuJA5Mut+Y
X-Gm-Gg: AZFdTZf2uOmcqjrnJ7Rynm3IHBWg5q0PdEO3pPXbHQWxJuZdtKorvlb3KsVcbBDFz+c
	QWkLFYhA2Lo1Sjt7JhPWbaY3jv+3GPfKYufH06a3CXq47YypQTXl73aFweENQKtOxaGbFgR+pjs
	WNil8gavXkJBkbmR5bk0V8+pDo43QAWZocpwr4gngU4BFR3cjY08sF+KWgpd/zY5osdCWVXblLn
	4CY9UdyCfYBEOn3EM9ZqU4EnF7l0AhIV7b1XbeabfQNACvr4k61ga0HUZeVZhlrrxoiZlcQNsjk
	BGXvRGfLHinO9KJDjxeQt2hBOZYDsd7+VAzxrh0upqoNIRYob3QOQq9Qn476T7xgL+IfLod5Dch
	gTYBMwYOX8FICUWk2yCP6/6FEOPEeEyQAAZpDoYFZwAxvb09vSPXZiyxgvWXWO/hu8kLpCV0VVJ
	yk16maHN4wOxdMXbf5p5LPO9+IVdsAfpcbEaqfjusWAZzxeRuyj6pwOK9HehBoNsh/8Fj3djRe8
	id2dlx7HZUGXzpQDtjZl8T1rDZ3kNa8RV8moMJYqMzlPdHaxevYK4fBsK2yvNK+cbwpYEIU6ewh
	CkkPx85p0HjAamtjVS1LQGFjJOLpRp1r9UhWXlMB10QBEAKxaOHqqjYZvrzBPb0c6n5kqmq1KWU
	3OrtU3xsF79wM2Yh2b7uTKjMpjV/ywn2HdtyywExt6ezyPObJpc7k7jkXnjwdFvdDt530uJEZoz
	wCoWOp0wC9K3s4HRgJYeYXdFCNLawrJNd3Kji+dp7cv4NvIryun0sQbMyJ7zQHvqCGJ7Hc/MTHL
	lfk60GR7snuGTHXOrNFdmCrcaYUzh+54pks1FR6UCaAraitobQ28JZAGZNs9ERrfR2IiWuX+DjJ
	tjU5
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16745813eec.11.1795594070601;
        Wed, 25 Nov 2026 00:07:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/55] glaze: upgrade 8.3.0 -> 9.1.0
Date: Wed, 25 Nov 2026 00:06:21 -0800
Message-ID: <20261125080732.2419614-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133008
Content-Type: text/plain; charset="utf-8"

- 9.0.0 breaking: MessagePack/CBOR variants are written in their
  declared shape and MessagePack structs as keyed maps, so data written
  by older versions may not read back
- 9.0.0 removes glz::invoke_update, shared_async_map/vector,
  glz::hostname_include and disable_padding_on/off; meta<T>::skip now
  applies to all keyed formats
- Reads no longer resize the caller's buffer for padding, making small
  reads several times faster; glz::custom works in every format
- Networking: HTTPS server negotiates TLS 1.3 and TLS 1.0/1.1 are
  refused; HTTP client gains redirect following, progress callbacks and
  HEAD/DELETE/OPTIONS
- 9.1.0 adds std::chrono::utc_clock support and aligned BEVE complex
  arrays, and stricter TOML, CSV, BSON and JSON Pointer parsing
- Many robustness fixes: bounded HTTP headers, route captures, BEVE lazy
  cursors and an out-of-bounds write in the CSV number writer

Add an upstream check for the release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/glaze/{glaze_8.3.0.bb => glaze_9.1.0.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_8.3.0.bb => glaze_9.1.0.bb} (89%)

diff --git a/meta-oe/recipes-support/glaze/glaze_8.3.0.bb b/meta-oe/recipes-support/glaze/glaze_9.1.0.bb
similarity index 89%
rename from meta-oe/recipes-support/glaze/glaze_8.3.0.bb
rename to meta-oe/recipes-support/glaze/glaze_9.1.0.bb
index e1bef79ba5..266dbfad69 100644
--- a/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_9.1.0.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "dce5e0f7ec572725ec369a0bc59a00eeb2270a9a"
+SRCREV = "43b175e7446862b84ed07b2e5f5138433777680e"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake
 
