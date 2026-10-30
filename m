Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8950.1793358228575411255
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=duLIePaM;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20edd106so467925f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358227; x=1793963027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtBiHAsGJ8w2bC9vcaO8J7/xim3qBc6tT3kFC6uz/Og=;
        b=duLIePaMN6nNlYx6xPocZOM5KtGtmrUEN/V451P+oFlnUvDJh+aXe9Mk68xklew8YM
         +7fIP5savKGSYabivF23uFr8Rtuc07tXvOQYN1eisr3yAC8BzwrHlyr2C2Xt33cG6oJu
         JfVrRmiBrkDuVY3xUq1Vz4BCGD3+KJ0cAgklo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358227; x=1793963027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtBiHAsGJ8w2bC9vcaO8J7/xim3qBc6tT3kFC6uz/Og=;
        b=qDAfVRZD+E9IiD0ZZ78rZ0xS/gJfwiTgJ8gu2X6ObXVbEgukKQ7QnjPLF5Vf8CnIP6
         4RgUzsMGsnXaoH2S6ZGgZCxUgJHLb7gB5G+JGqlpZ2hjPN5VZdIb5+i6+GU7RT/IHNeK
         +XohJTkMVE7dCsTcw57ELa5rYvLi+OGpQHbR+tTdM5HLIXTHYOIGx5rdJnhJ/5YJF7OT
         yzug1rrdOARgIhhGoQPM4IIkKaWPSQHJ9UHTYk5wTqiEnAYbrsOSctRSk5/MDv/1v5sB
         C1xqkMbOAIG+r7Iq27GN/P1Tkfn4qmhC6aj+6vPHdu4+fAK3Dzshx0gakIEaHQebtpmQ
         v44A==
X-Gm-Message-State: AFq9FYL8wTutiURo5ZESTD/FQKVuecv6t1Gl1BcLbExyqFVqdLrN1RIL
	wPySP6NVa9p6bzV7GJxklLiErPmN3q9FEFCmIgQiKXTQnCB9KhgzKzH8QN9i9fq/WmhUpVzHP28
	cBARG
X-Gm-Gg: AYBFou3rAHwG+C8OiRZMqj5uHKtYX67QCoq2LZOA735gjTW+P16jX1YzShZ9zL90pYS
	NgAUO6wgkUSE2zYtWQakqmRxhAkzsydZkI0Z/P2ZkFKFUCI4o4cjpdf2AjJnvnbKg2EVZEy7K2D
	/ffpiq9ZBW3ugD4YHVsl2AilQu/pPDn73afXXuYHaVkZvUf5kJeGs218nUr3bZvbgukjbYdEPdO
	yJ3AZxXbDephOYQoiDo+x2vCM2bRizooCCJEI7Sucsta97b8vp+75ccCvyhYbz+aNHW5x5hgq9A
	CRvr7qv7l+TaRTR+nJwrXT162UToTxZId0tW/Y27ie/zf6WaF+XsB5W9qMaUYoZTxr+fV0QHZRV
	VAggH0BVcIAvKOo4tbn35U6VQRBz3NmNdURsqyO1p+IO4bIzEFmTr5gxF57ikwuiV3cB6G35zgW
	9cqD9zpz6GPVTPn0jKYyZhB0RnDsgkJhgDse/tF+mCaKntRwRljzh9DhPWjAMeYm6zxXjpl/xft
	P1vUFLtMYU6f5dr7CIwqxtdXZDphOIqhp4Q0D1p4Fopubpg97s3z6lEDgPw1SX3DajmBU9qSkAX
	Yaa+VtnnR7j2Jp9n4+P9imT0xaswFA9y5bqgt/DTDE9e0QtafPzH4iQQqz5PJEXatDQkamP2QkI
	843KrGeewZUMgtZfPheaPVKPBFZYgJxwnIAay5RMw7hBj4ABVbpIiZQ==
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-48e6e2fc210mr4697806f8f.40.1793358226207;
        Fri, 30 Oct 2026 04:03:46 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 25/25] python3-webencodings: Upgrade 0.5.1 -> 0.6.1
Date: Fri, 30 Oct 2026 13:03:09 +0200
Message-ID: <20261030110309.1124614-25-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131707
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.6.1:

- Update CI dependencies
- Drop support of Python 3.10, support Python 3.15
- Replace deprecated license classifier
- Use HTTP server for Doconfly

Fixes:

WARNING: python3-webencodings-0.6.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
flit_core.buildapi, use the correct class [pep517-backend]

License-Update: Use LICENSE file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-webencodings_0.5.1.bb           | 14 --------------
 .../python/python3-webencodings_0.6.1.bb           | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-webencodings_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
deleted file mode 100644
index 81709435be..0000000000
--- a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Character encoding aliases for legacy web content"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-codecs \
-    python3-json \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.6.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.6.1.bb
new file mode 100644
index 0000000000..b5446eb960
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-webencodings_0.6.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=78ecd9e2dd613fe63d51efca9b793f2c"
+
+SRC_URI[sha256sum] = "565f9ad031c702dae404e27a099e3e09186a3ab1b9520f06d215502b651fd910"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += " \
+    python3-codecs \
+    python3-json \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

