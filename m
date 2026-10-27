Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14855.1793092879031622872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SLQKJ+et;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14664945e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092877; x=1793697677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pu4+0PHMDfab7yqplNJULlSWYrzKH3YA/cynim+KyMQ=;
        b=SLQKJ+etFeY/qyYL9FYFoCj1KPZWaU31tm4QW6ij0E5XtTfNM2C6S+I0PF6o+tS8sQ
         DKM7WlSCsQgDj5ybzR9k7o8ON7E6AYlZ5jKCK04SJkAwR3d0A3OnaEoGHRsUStzFq8GK
         EC5+6fFXN3STrUPPDT6nYXxYO5M/OItYKosBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092877; x=1793697677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pu4+0PHMDfab7yqplNJULlSWYrzKH3YA/cynim+KyMQ=;
        b=0d+39HPlSsIhJEGFjQFLK/vM6kZ4dAt0D0gOiz6CnfxEN1h7oWk7xIOQeDN39KN176
         r6knJKaoP/RtFVM4z2F6+Hcw8wAu9Dkb4X+4aVexpXooZw6uaNENLbgV7SFz1COrFljk
         5Zhz71ulnI/xhjQ5WVs6MzJXXNZeBOqVNojuE++XJp+YT/6oVA8UEKIenS5013bKF4li
         K7nujJGn86cnZbsDrvCkAZ/qoa6NakEQmBlBrRac4OOXl9JSqGBJKF7+jiXdQZkITPhq
         bh1Q168hBwXvjnDMUdm4CcDeIqMYqBhxXAixt6QvFIX6uxn+fjYTvYmN/Il/fFBGj605
         1MLg==
X-Gm-Message-State: AFq9FYKsY/7ZNYf4tVVAKijl3+dtSbkOuvSHCKlXwRfNvDJEGhN4bqWb
	6RNAkINrQkq+QKT85jrMtD1tMAKazUq5LpRRcQRhuyqq0WJpagAkqOFKkBLjEui9ZfjpvhF5IAJ
	j7nKi
X-Gm-Gg: AYBFou0Hdt7Cjh9yGQQtOsHY9smaYww9Oi3DhBEsoq8e8dzyhcRmFIGrqfv1N9QWtJO
	SRzRlaX1cF2peWIAvXaiLtYB2/1g4O4/v88QlGROkVUW/Ora8o+dR4oxJSTVrElVEEDSzonx+Ke
	pEEKgNkXD9NOVdPqibQhajaFNn0dQOoQVKar2nyEOictKW9rMtR2BL/FgPGTmRAJ8G9OlRhu8Yx
	tmVboAR+WkGBXuJLxl26Qn+Vh/7WEc9HY/XQri5nJo9M74ivKhc85OT4wE0t4xf4eHL/a4TJXdB
	QvWaDuGjIKTwwlT6QpxO+FAr7AJ/P2EOo2i4Q6BSfLg4MaDsYZCGYyA/Wna6UhEJChZx08G3Gyc
	ILXc9ahFBlezmDTiiMKasooNFqsEG+jN637a6jRmorWa+rhK0o99R3i2fpPXFPybG69CSoQQvwO
	dsK/mdoL3llGZ74POmyWhILooFgaHGWPyc/rVL5U5J9UB9mDafTF9rUGysR+2k8rxjEtC0aamyQ
	ZcR0dOxDNmlqgXLAK6hLX91bSQlKKI1yYP1bb+2wvHS6VZDQx1CG05G9Og3umbSlmZ6tQJ70QnD
	MNO3nTQOfc8BRkbE0ESFJTPrv9l50cRGp/I1qP+D2XrtR5oq2Eh7cQdmF3LXH/n/c0Lzqh4Tu9X
	0z5AV
X-Received: by 2002:a05:600c:a00c:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4a35ac7df10mr160656045e9.8.1793092877272;
        Tue, 27 Oct 2026 02:21:17 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 39/61] python3-simplejson: Upgrade 4.1.2 -> 4.2.0
Date: Tue, 27 Oct 2026 11:20:06 +0200
Message-ID: <20261027092028.782979-39-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131503
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.2.0:

- Start building CPython 3.15 wheels
- Use the first-key error message in the C scanner
- Support large integer stringification thresholds in both encoders
- Check circular references introduced by custom JSON methods
- ci: build and test riscv64 wheels
- Prep for v4.2.0 - Update CHANGES and build matrix

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-simplejson_4.1.2.bb => python3-simplejson_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_4.1.2.bb => python3-simplejson_4.2.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_4.1.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_4.2.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-simplejson_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_4.2.0.bb
index 0c3c79927d..1f9ba284cd 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_4.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "6ae4186f90362e9c03c80a1cd5062a20f3a11ac9d391f7ee0ef0701a0e2b7394"
+SRC_URI[sha256sum] = "55b121b70a560f4610bd3a355ab2015aca4f39978f6a82353f24d2013fe85861"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

