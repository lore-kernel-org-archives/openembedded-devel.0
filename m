Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10322.1795752982896562592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eygwXZ7A;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b546061d58so17750126c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752982; x=1796357782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6wKh3c3JBjD+B2L/vI05POmwstpUW2MAel89gL5BME=;
        b=eygwXZ7ASkTOJSoK2eJydamieHBLEaCDnMHP1JTv1/FJA8TFkBUjZIZNu2jbUtQqhP
         +5V2oYlZMfpKhdeSXTe0eQLpzWmnlXfgTsC8dOV/yJRD+NSuX5uebvfj0MvOjZKncRBt
         KHWw7trrTrbIuvdLe1vpbQK38mWO3EUraoRzkPPyAE51WW7b/HkM4+uIZ5vBCeiVjWPB
         4l6+MM/on48Lws4Iw3/Gu9G09gxzbpBI9mBhCITtcJmenKvYrLd5kVRJ8458W6F6en5H
         YtfCEzySITof9268ktekJ32F/5o2w+antP/WqO0hpPhgWDw3X1jLi/Z5Db0plIDlO3rX
         jFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752982; x=1796357782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6wKh3c3JBjD+B2L/vI05POmwstpUW2MAel89gL5BME=;
        b=15JGLob7Ht5rDanPTZzFHZTe6P7OOUDVsVbmKFsBy0DXlouFWHzaXvpuYAkXhxl1aB
         owaTAxzvgXo7PlGNFUmqO6dx9quUeDRsngwcJyBw666iBAa6+ClZF8OaZS+kFwyoVcue
         7oYbxn+nPNpHoIR2T1EJJs8464VNNdXKDfp2Zmj5ElzED1u3kBMm5TBEqLSC6VIR419X
         Hoj8PwTZMigRij/peQce/n74qtAklkgMdB4H4qabWdTAj2VZDVajBcIlCHeRZ+f47H94
         2KFzaQPULjhtY2P8atBx6o6mPvmnRPclUIA9P6WH7p4bWuNpJMIz33WZSmDG/0e+nZ7M
         p33A==
X-Gm-Message-State: APuU4Z9arpzytqlX/fHULPjZTm79TohYWixnS5T90IaOnGYmmryBSG/j
	3LYFn/A78PPiWm5e2WenpjmaneFfevpiX9GH/aS/mz7ssTtrFFpprfwxorouSNnE
X-Gm-Gg: AZFdTZeAnGkoJGPcavHfNOe+hK+h7cOjSobhZF1dLJtROgjW7oXPzrDFqOmD+sm2MoB
	HriYN7jFRntSQ8IogXvtQwavZNCCqg4cJVsthbw3RXVbeal5wjqSz02NnAUNqFw9XKpvMlV4wW6
	5JO/+8ZD88vEnp+ak9NiEJ0kjOO2of40lU2kSYYN4u5juYK4IEoyD082xhFWGBiKNxCqe/ef2Ft
	1kqHNcaSQigz8FpYt4s1n4ZpCePL+XpIiax9XvdVRn2JtW/MvWTgQnuCnXU5rKG8p4l+3fkM9y0
	/32V14d23eWVRjcnkWiyQ2A62Xhg/hl2i1pO9Z2aeiCm3mpPzyWnDUnH8JXaM7ngGjS6nVCTrAe
	JhOB1dIRbr/40wZZi5Hvil0OsyyXxAA0eUcwnTQaspzjrPj5zm2DMVK7zcw4o6YicAAuxAMiGM7
	1UCraF7VAZYilG2qWKkM9opif3wzp9fnQRyHAPb4P8mfT4zaSfsvBmEYO2R5N+yKTE0fYbOqcMR
	6zaZtH9Rzjs8ha4IH8qM5PK3Qq0y8O45waXtTsKPjZEaGj/3IXylZdHiOVUbsKT8898wJz43nkS
	5tYx3oTPh72Bl5imKAPGltVq0lTVd6dZ5XCSWDHqIC0+BOOQkV2kA8gGlYJGVujq3vT7Xk+921A
	3jMcpoCExWplQEEci0qYGFehPYSM9gR+5+e/D4pvIkEBgzpErIJRDBI4H49B3Sm3Dpl8VjipNM7
	EnqvHgTQrydS/To880t8fwSuPL4ImUTOJ2mEb61JLwVaWgfvPpcFDBrzYiw8hTLuWF2JvSB0O8H
	sdVVILAtDN51n3UVBX/OxEskEhkKa3oimFKTispsCfy6hJjmpoq5fTkb7JIm4ptM5j6zjgVBMDU
	j2o6
X-Received: by 2002:a05:701b:4513:10b0:1b5:56d8:d596 with SMTP id a92af1059eb24-1b556d8d6fdmr23150266c88.12.1795752982297;
        Thu, 26 Nov 2026 20:16:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 03/32]  python3-opentelemetry-semantic-conventions: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:45 -0800
Message-ID: <20261127041614.1775064-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133222
Content-Type: text/plain; charset="utf-8"

The default pypi regex does not allow pre-release suffixes, and
this package is only released as 0.NNbN versions, so the check found
nothing. Match the bN suffix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-opentelemetry-semantic-conventions_0.66b2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb
index f330ef4464..a5bfd9b413 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "7da5f1a5dc4383eb66711d4d3d3e71824d9403ac1559fea021cc103c1a
 
 inherit pypi python_hatchling
 
+UPSTREAM_CHECK_REGEX = "(?i)opentelemetry[_-]semantic[_-]conventions-(?P<pver>\d+(\.\d+)+b\d+)\.tar\.gz"
+
 RDEPENDS:${PN} += " \
     python3-opentelemetry-api \
     python3-typing-extensions \
