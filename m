Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8867.1792580498584656066
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NEFJk0pO;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40e30c26a4so246421266b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580497; x=1793185297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dpSX3E6VSUkHz108mGZbbSbPiJJZvx2SmPvawUa8k0=;
        b=NEFJk0pO8dbMGRc2RNmU4t5FRgqCifCBE/ABOnP5iyYCobHDZtCBKQjanuJ1qRvi1G
         uXeZTlmlbAe4QtRZPbwR9XN2Qw+Gwjc46ku8oAFCstyxWTQYJwWChd+ijJVlK7U9h65R
         Mg2lRqpMBKp7ja8pdS9rsdSA3Y1wm3aOvVYgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580497; x=1793185297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dpSX3E6VSUkHz108mGZbbSbPiJJZvx2SmPvawUa8k0=;
        b=iCCEYa39iq1NOHYXiGT8OLMHYbRp04SJbZQfKhXCCVKLvpxyxnhtw7wHzKSGYovunI
         B5O4iCVu6kkop0NeNuW2Tn/OqSBd5U7JwRxX2/XrU1cvQKDpqP37NxzQ5326taYEcClU
         YzYxJJ7qXaUAYEiGCh6FH0LNoH2lS6GG6eJbAnxDOfvAefeTKhRcKXTByLmkdtmMgEfK
         wV1C7j0zA42DmYIEgakZkb8L68yxw2yJUy/zElAZd2dTQMYLRzayvCc535NuJV30MLIX
         Z+kRAiCmw1UL6jd2a7OvYi9vYNlr21O3Gy1aJgqtZgt5n+w99iDkj7JHB2ognjzqRDW9
         pwHA==
X-Gm-Message-State: AFq9FYKWZkYmVEeVRbavLH9X8S/qtc9Wg6xIxbM+wo5mgrpDnJ4L6TOa
	msp3xZ4a3OhRJTEzDsenCXNVCjBVOYBB6Q9SdhnaNCh5fJDkmJl5nE/ZnJuvk3YA+0AGJvCpOyf
	bvkK5
X-Gm-Gg: AYBFou3tEpX5qwTdqgQSEk2UzqmsogOkYprLb+8fA8toU0GFkAOeH1NWKsicQi1wNaz
	2QPiPVFrg6QtcMysGE7r/tKq6i5qFc6qZmP1oAcZypukf/qjXATPJEjvWilX8XYV42sFZg5+H1j
	r1aKHdHv0Afr5fjS89gtBslziL4JyKvznY4L9p6ngpvcOcsHCLjkp/KgI1stV2X4+VDydscF594
	SivnArw2QnnQIsD20ZpZPZaDIPPEjy7rWuJt2PTehImg5hfnE6OD/7JhmS2MHpfpGDqCOZsL+Fp
	ywv8OKHhRyGjMa3gzFb4cnudjfFktRfbWSv0o8TUPy0SVppa1qzB/Fpu1wE0PheXQKnMyBOkqfg
	/r/LQ0rJd6c2bHuhUx4vk2Vy3MIVZXRj7D4gWSXbRi3nhFMF8XmhDF4vcj1UK91dm0FyTa+gmFI
	jF9Qsj5co4xB6mRPoOWEmQRZw7LVfL0Sjgd1dE8nnepisYJBzqLXbOqLh48RbtFdhq0aRE1E1kt
	yPKBZFGvpz4Ewu76bNsPpSKK4ROCMAwA/FzO8KCwKLZ0tE2JroAzRzs2Qo/oEgJjKpWJW8EQ/TB
	i7O1DqdYoXhoUbeDT24kRi5CHiTmBHxIh4m+FTXN42nRdMGWWCvQhcWcjiLwOJGihppsyxB+6Qq
	16BOU05ipo4Bt5LzwJbgJbYSLRQ==
X-Received: by 2002:a17:907:6e88:b0:c2e:204d:9490 with SMTP id a640c23a62f3a-c4604ed5c6cmr412862366b.17.1792580496605;
        Wed, 21 Oct 2026 04:01:36 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/36] python3-grpcio-reflection: Upgrade 1.76.0 -> 1.84.0
Date: Wed, 21 Oct 2026 14:00:39 +0300
Message-ID: <20261021110103.1943456-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131274
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.84.0:

- Fix -Werror=unused-result error triggered by Cythonized code.
- Release Python 3.15 wheels publicly.
- Fixed reference cycles.
- fix: remove ghost key in grpc.aio.Metadata.delitem when last
  value is deleted.
- Fix the StatusCode Enums to be int.
- Fixed the parenthesis placement.
- Removed UsageError exception from registered method.
- Added registered methods support in AsyncIO stack.
- AIO Part 4 - Typehints fixes and add Pyright for aio/_channel.py.
- grpc-status: Relax protobuf dependency lower bound to allow 6.x.
- Observability plugin fixes

Fixes:

WARNING: python3-grpcio-reflection-1.84.0-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml specifying
backend setuptools.build_meta, use the correct class [pep517-backend]

License-Update: Use LICENSE file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-grpcio-reflection_1.76.0.bb   | 16 ----------------
 .../python/python3-grpcio-reflection_1.84.0.bb   | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb
deleted file mode 100644
index 6e0a4b0c49..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Google gRPC reflection"
-HOMEPAGE = "https://www.grpc.io/"
-SECTION = "devel/python"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
-
-inherit pypi setuptools3
-
-DEPENDS += "python3-grpcio"
-
-SRC_URI[sha256sum] = "e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1"
-
-RDEPENDS:${PN} = "python3-grpcio"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb
new file mode 100644
index 0000000000..c1460596fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Google gRPC reflection"
+HOMEPAGE = "https://www.grpc.io/"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "06bf3d7d8cef9afbcc721ee52191652b4483831774255e174404b0e0551741bc"
+
+DEPENDS += "python3-grpcio python3-wheel-native"
+
+RDEPENDS:${PN} = "python3-grpcio"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

