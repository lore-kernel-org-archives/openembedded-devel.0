Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C53C2A088
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61172.1767607372060635313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PvoAunHn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so140027875e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607370; x=1768212170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdaDlSr8fqTx409Pvt7eLnxC/6Mk7K2OfkL3MKjdt48=;
        b=PvoAunHnhM+Fr53MgIfdmxlHfXFVZuGYo6StAnhDeGDFMCplKKpz8sRi+prc6oYMU9
         deL9O0hiHuvh2RS3uRhbKlxVYQF+ysIQMPigwerhDC/NCW/tkZcXhwowSYqihO1BJ3Md
         /91noJDiO9m8BpNAc4x3C4MW728i5QlGChGQXL+NaEQyVtaWS5cb94vtJUwp51mhWfSC
         AfsOVCftIZ6+leLLNxzrBmH4LKaMsDhhVjyJnJrSpM7qTFPi8DRtTej1VhRutVu8OzPH
         M4q5uFhajgMu8RJHlcDqXnXf7+i9a2djV3wORQXK42LpOYgZprpwsA4oniqxWMNwRya0
         pa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607370; x=1768212170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdaDlSr8fqTx409Pvt7eLnxC/6Mk7K2OfkL3MKjdt48=;
        b=aavIqnd4z86aOnvS6i6lDBLhfTukzV6ci6OUWKVpp+0yhzErCG53FQZHxR7Z587ns0
         drlQPtGEECxPcyiOQnkOqi8b5L1k4i60OU3vGo17rGpp3nafZpjVbnUsaZObkXtmxzAS
         PNaM5aPsMmBcpingQObQTn5iFGhRHmStNZ5tBM7JHB9es895SFXwozgG02wS3JvYI019
         hmbEqEHP8BZ+3Qz7ypoLviTK4/EkYdiDcxl8rALrwk6M+v0V95PkPUyBSTS/AYPpd/Rq
         XcwQ4bRkRDtlkxanDYvCs4UMmWn2lGw/UaaQ+1PxjZC5lBDHnRBumMKWipD9aQk5X6wo
         nTPw==
X-Gm-Message-State: AOJu0YwB2C1cn6ZMzEp9y+9GEDXv3jhxlaRr5F2wMrK91p9mVYARjB/V
	tkuif4Oxv7SDKBBwRquhBjbJqE+t52NhzYiv0UuNwyxxctDwX6nAfnQYvyO6lg==
X-Gm-Gg: AY/fxX6jkAscdgn0CqvkOnTX5wxXLs7J+Q+lzAnj1+dSbfeMRFJwDp+8dCuz1t5/r67
	as3KvUFGTD551fUV5bp4rtuGRYVjpscyJKC346GfrzxFXSRuap02K/Y9vYlailiKUdKOfelX4yT
	6ZuxN+H5DtzVuZC6B+v3KL6ngm8JlEkPKGcku1j1kkgyzosaP5xl6NtzKdMxrooMXVMywVgbdQv
	cBe4/+WulCEjaLthXO3jiOjQyKvwrV6lCClpi3rxcQMoKSOZSlUGreEE3KhGtu36VXJ7qhg9Z1L
	FZ2+QgiwqwYaJW5v2PFR8DPxs8FCHize5paMwUiFssjjN69I5lc97hRt0Zls5o3POLNlerk7XiR
	5HBCJ6P9+r0ssVHodAWqZw7I1hp0f/ZI5J8ZIS6W4mPgGuRmT75HCsbbxL2PxNY2KHujpDw3bxf
	EYxCj1H/Xc
X-Google-Smtp-Source: AGHT+IH+XjH8YunQltr4rB5E7iTom9BfCYkmAdn9gxfpmkEBtvJgfT5BrjsvJuRLodbZ5iXqeAlQwQ==
X-Received: by 2002:a05:600c:5246:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47d1957f707mr665534025e9.21.1767607370299;
        Mon, 05 Jan 2026 02:02:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 17/17] python3-django: upgrade 5.2.8 -> 5.2.9
Date: Mon,  5 Jan 2026 11:02:37 +0100
Message-ID: <20260105100237.3081345-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123148

Includes fix for CVE-2025-13372 and CVE-2025-64460

Changelog: https://github.com/django/django/blob/5.2.9/docs/releases/5.2.9.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2538918df1826b965215e0441c7aa6d0958f1911)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-django_5.2.8.bb => python3-django_5.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.8.bb => python3-django_5.2.9.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.8.bb b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.8.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.9.bb
index f205b5b247..c0aff44a78 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "23254866a5bb9a2cfa6004e8b809ec6246eba4b58a7589bc2772f1bcc8456c7f"
+SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

