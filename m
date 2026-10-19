Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1769.1792434891749323137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RiSLzqr+;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so875580a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434891; x=1793039691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maK3VU0H8BYd9ZrDTWkjCHP9dqDfgfRjfMH51PyTkkA=;
        b=RiSLzqr+uwGLnQgBrRv/TghpMWkF00wF5kJ4F5obX0auwPznCkUWn1JwSf6g53Rqsq
         KVed6aiFQwUa7Q6uNCPQdvLTf4hwg4xgkpJ1YBC39hHQjmKmDcTg4qow/2GdBmVRTRxy
         esCXLnPPLvhgrjp9bgqu2BEEXf5UkpN52LuaEeo1W5ExUI5o77tZxIXK+6sWV12i4LHz
         ObImYJgB+FgYHBkxQzy1q3UyQf4HmxUmDCEFUcYWeTlqomZQBw6WB5eic/PXNIey0dC/
         64ZW1M609M9dDVi1rpm3SzrcyMcdA1eUxYgadU6XY3gotDYYMFbFOfDC9ox/cUWMKVgI
         Tnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434891; x=1793039691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maK3VU0H8BYd9ZrDTWkjCHP9dqDfgfRjfMH51PyTkkA=;
        b=XPRfjR0f6muINFghgJUGsRwGPIzXwHb9GY6R0gYSNYH7epjO5Eum40U7tb1vZXjj1A
         n0Qecut/CSiuGzA6IKsDeiiKxfbuLHmHJfgiEMKowm/O5KR0cpnZqv8SePhiqMuYu7yV
         hZSvzlaZgDEfZrKWxq5ag72JDfNKGwzyBPokjDhkIN+d41dw9mS2FcJj+20u8j+HCTkE
         fA+APKGzE/5ydqrVGYIFm6KACwxqQ6D/wLAhv2TMp8in0laZj7TI+283pgiaMu27rqAd
         P64gUT9yIcE1TzQRksr7nuUG2coVRaa0VoZlCkrR4c607BRd84oFUP/YZLeBdaZE479f
         +P5Q==
X-Gm-Message-State: AFq9FYJQ+UC4y37axywFuoNGlpNjMwnkysN8Y00fmAQzHd4T5M4XfrzY
	atryAzmeatcmkqfog1LXQ/xbs3ACE51CT7VS70/srG2zHqPjd94kKRi9NJfdXA==
X-Gm-Gg: AYBFou2xWxng3K2oaSRoy4mouASsMjqarc15BjOAPc/eTTnjDIb1DnfvKa8Sl7bTScC
	e1kWZViFqXjOgCNzu8qXdyrr/1VACWAIKnud/r7O0lySpbfbRRKYDS2DbHGcd/Yub3zOe6IfC+H
	epsrukcHHp5wX48VCZxIMKezZvdgCGK4bEnxrStTsGggl66TZG/uspkK4U5mkxlp8AtmqJApZpq
	rYA+6C90Kf/24SDnI0U/pyJ1ZhWWQINBeYvGUyHFQlZpbT2vOg+pfER8pWVh5IR9nTl3VxMxsNE
	q57R7RDyP1lAKAJ16+wHPVC4fnr4FdAPhVC3s5GohgKzvJ5Qs8Inti1F2BhzajCQHDSsfZq+wuB
	ma2pNY8b1KN8AfO5/7oDOpBMpCg/65Km7xHIGNRAkRHFQXi/zpQVQ5/2DJH6FPRX+etjPhyUeMN
	Q35VuqsGVrnQgijS0TvUJO9zeQv6k8PeS3+0s9ZTecmSvvxr/rR6KIpjqSYjOW+UlauFrdgIp+J
	F3BZi5D0iDbwIuAszY2FmSHh+9p2xLfdJAueJY=
X-Received: by 2002:a05:6a21:8284:b0:3dd:85a8:cac8 with SMTP id adf61e73a8af0-3e22626fd4amr7045046637.31.1792434891119;
        Mon, 19 Oct 2026 11:34:51 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 15/20] opensc: include tag in the SRC_URI
Date: Tue, 20 Oct 2026 07:34:01 +1300
Message-ID: <20261019183407.1037972-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131141
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/opensc/opensc_0.27.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
index bcd94dfb90..70406513ad 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 DEPENDS = "openssl"
 
 SRCREV = "19868984dc4dc697af6a86d65ab32a1f19a43ea4"
-SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
+SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https;tag=${PV} \
            file://0001-Changes-for-OpenSSL-4.0.0.patch \
            file://CVE-2026-103531.patch \
            "
