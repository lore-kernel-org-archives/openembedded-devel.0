Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34349.1794851737322083793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cLUY374R;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so105098eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851737; x=1795456537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPLDvyyVjfZ2oKeniRrhQVQess8TylBTM3s39TrTlc4=;
        b=cLUY374RgDDCEZEochJpzwB293S77TUp+xiNQvqj8s13O9p55hQnz4OOtMJOx8lmse
         fnew+A4XR/fyDSgIlGH4J3y9o10OkLaqHA3GB0U58NgZxfrU2alTjGlz6V6q1B6WwYpd
         eqfANGUa2THydfb5IUH1coKjFTLKsIkYn36wcGThby1WjMiTfdt8Pvib0jXFSwOV563H
         AfVE41YvXqkG6AH8U/lAKHOMsVA2wTdvcoro8N90dTYHldApeQpX6GaeK66uG4dXnxfz
         cAww2GGA7EWLZX6ihrFUuOlJc6cLfOIovM+Z9LI8LAPcx8vdXKJl9PZqMRJ/q9xDitKM
         2jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851737; x=1795456537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPLDvyyVjfZ2oKeniRrhQVQess8TylBTM3s39TrTlc4=;
        b=CnWvtwo1zhECKdTk94up6ILuqPf4fft9C4uVyKRCVQdiI1PjcQzzUwk8615KOSXzGJ
         OqU1KyyiknGOQdIg01n9CY4IN/8zdwX0w0S65HR5yG6n5O8CcP8ymXDiEEEySMukmAIl
         OFeTn88zuebO/7DGBvPCltVJ/ZpLbRau03J6dO7EPzmozzmVhdJsMiAfXiZg4IBkTUc8
         7Xp+ssh8LG7aQZ7DX19Iq8Coga9ZiN1G/KS790tGyz1Ka4EO6BVyYY2kpZDema0d26T5
         p8YCNKPk1T0rVdmRnTyW1Hr61jMVnXp5lGasvIndiT4LGCcgSzFKEP+NLFoH6RuUBcjD
         NFlw==
X-Gm-Message-State: APuU4Z+BG/1Uy4Bh2IuCpKy16c1yHuPOga7dMwAlD/sGzRwTIWb2f3KX
	tBMtwbXR5V3ku/r1TrQjV3SN9UcyNicG3ZLyKJJhrDwK8QgFieCjaWcLrYtWwEZQ
X-Gm-Gg: AZFdTZdntPPHx+9oKghWp5N0MpJilLPUNJC8qYphUtovLHFzYMwobRSx+ZZrGm7WfVB
	7IhtdAR90n2IzMf6UvufuOv5GA17Jl5YW+8tBPFfQ3MADzvd5t9kBoZI8XE219HK/cqZ/Q+FkqH
	dlhGDRfq2fQANn59uRBdaxt5lbpyd0zGLUh04XddpvOeHaz/Z4u1Nxqf5radu1vjl6ZXAVw9fYw
	F5G42+RB82GV1OAI56YpYRi5u2O6CSRDV6xiV9r/TDja7sXjSha3vI0W/j2hGMqgBPPb66zHdb4
	lQggvXA2cKHXCOeobDkdqItf4Ca/eY31aC9hlgRK9nIil3hNq5lqmp4BFZCkMR+pjsZlRowz+eA
	WoJkt7dxsyE3I8UuPUoGxpdJtoXUGPG/tZh/fj/vP06QXYOcudp42c2a/w97GcfXmRjBPuz9lA8
	nBwTtYi167JI1//TbxEpxe5L9T64QiN+uC++ICeOkwIdmNTlk6euKQQf5ogY3JRoou8w4g0AXLx
	ZAY9v+LLIkYJjYqWkumgGtk09WaLCaO54iRxvrFwpxHbO83xumxjWmQx22aMpOzSX/z15NXloZT
	5hYB4wZRq3XBk5zEhQUvQyvkQObrrU+AVuKS6f7IaISVJGYebLXBv48r0/8tbvpyniiVckyrNHz
	7+PkyRzwqcawmNUJ3U9TQPeEUqKpXBOtaJaMItr9YT0EUDo/6KnhFeOa+OTov5zTQmzXJQbxvru
	zwKoImTr092PLb5+X3JbEnEvDOfJeSCUgh/fUstlAOh28DYpfFWe4Cnt7oQHc1fkPcFoMMjrtZ7
	ak05KXzMghOpF4K1zVFJiUXt5cGHOIhcHOYblC0rTuVUhldJMgeEeGpJU5YASsCQbiLZcRVkQU0
	ACpJwA==
X-Received: by 2002:a05:7300:6aa1:b0:371:197b:5ade with SMTP id 5a478bee46e88-3810eb09664mr172106eec.11.1794851736592;
        Mon, 16 Nov 2026 09:55:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 068/105] python3-pyee: upgrade 16.0.0 -> 16.1.0
Date: Mon, 16 Nov 2026 09:53:20 -0800
Message-ID: <20261116175359.342679-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132524
Content-Type: text/plain; charset="utf-8"

Upstream moved from setuptools to hatchling; inherit python_hatchling.

Changes:
- 16.1.0: build backend switched from setuptools to hatchling.
- Modernized type annotations; the exported Handler TypeVar was
  removed.
- 16.0.2: Python 3.15 support; Trio nursery/context cleanup fixes.
- 16.0.1: AsyncIOEventEmitter emits falsey errors; pyee.cls
  decorators only use handlers of the decorated class.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-pyee_16.0.0.bb => python3-pyee_16.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyee_16.0.0.bb => python3-pyee_16.1.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pyee_16.0.0.bb b/meta-python/recipes-devtools/python/python3-pyee_16.1.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pyee_16.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyee_16.1.0.bb
index ab40be2150..a632cc18ad 100644
--- a/meta-python/recipes-devtools/python/python3-pyee_16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyee_16.1.0.bb
@@ -3,9 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2b1cc8797dff32cec5d783148fceab5"
 
 DEPENDS = "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "34de6fbc4d8f0880bb997efd0eb642ba01f02688e740cbd3aa3bee9db4b1c5ec"
+SRC_URI[sha256sum] = "fe092d3a2a66f0f6a277fb227b078d3d849318da9a9d5d2f6576143236e84e48"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
 
