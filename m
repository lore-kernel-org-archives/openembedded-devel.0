Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ABBCA5FA0
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:40 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29998.1790469579006989356
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KQas8klN;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1001974a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469578; x=1791074378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ihasz/e0/UPt69klKpRFfp+vEJglF5cPqjGpbJngi9U=;
        b=KQas8klN1px2MH6B1BnClmlrAoFeYvSlvEb8a01nwpALlUntVGvIQCwxEEu7B2eEtC
         pSJG4MoCmwrhc6zaeBa1rI0F/oyQqqHVzFPB3txWCGjhaboyhChf5xGKbd4zdxvhLsMe
         QDj+QutKV+osr6skR+0fgKgjmqbI5I9aNeCBaN8AL5uP5pzq6GgPaPmWJBybdrVmq7oI
         l7VX8YAfsolRP5I8sPckQLEC32XryRoV6DeryBIMr0yTa/uDjxNm1TxB5S+IdY2ZLPDU
         9IL5U0d2hzxFQi0wqic78x4OBMQmWUCOh4zPFh80re4sefLNOucY0VYgMLlCQqqQI109
         BjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469578; x=1791074378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ihasz/e0/UPt69klKpRFfp+vEJglF5cPqjGpbJngi9U=;
        b=wa4vDp7DPxdtG9Vp4gkr1VOMco/1igIKXvbBvXxflwgVIkJaK9TfNKIuE4iiQED4Hb
         tinD9MjKfJL3TvVJcRm5lFySFoqN6MuqymhLuQlZy2NS0anxNPnFIMA+U4UkdwZRu0Cf
         YntNyzj7JDTs+1YT1+7dhSe12blHkmKWw6nOV6SW0yYCY5bVoYPROmm12R2YEDY3MPVk
         6UTbkiaxvvpjJNmrh+wyMbXN6OAdO+gUEWxyPS9nc5EEVAL2W4sovrXnhurUaPWrTE+j
         oTJK4KTUpkIpBZBfIYGxI9k2UrS3MDSkzK6DTdN/DZBKB7jr/GT0ngiWkDLg3BLi9OSh
         4Ntw==
X-Gm-Message-State: AFq9FYJOGQCeRJU7TtMtrqUqsgAPRl+84TbVWJ3Esmjbt7+ehCqQaRQm
	/DeVrjKe8GffonLsxi91NW51CSaXgYU9pxP6s6rwWpf2R/YSHmjhE2kRLQnSxA==
X-Gm-Gg: AYBFou3oE9oY+/lPNARu1OuOtg0teTJ6gGI2vgKkv+awDH98zB/R8V+jZT+B5ePFAxq
	Acnp4trm18xDuu12HBL/ubijoLgu+oTX4CfGGTOyBTuEmDCyhAbs8lj21BTa0r+Bk4rSWwS2wZ1
	1Tl24L39g4A8OmCnLc5n8dJZGBhmn4nZ/HJKG1OyCJzp3pakIOwgx7Pme30rdQjA7iPLOmrSDTx
	szJXyvk3E7cbzECnh8tSGThzOv/zRlPsb9TZhiMxruxKbNpAeYpFWKfj73q1L75r2/bySsHufAN
	neQD5uBXbuLmJH3PGQOrsQlnOGwbCLtSbv1Z/BhBy9azvlcj9WxBMSFChusKcjE1CwWzNKE/C7R
	v1Me9q1ci6oQVVLDYr8DQP3I0UICrkWbJhZT9X5l1ZX/B8CguI1HWMWaBa37sFmpUOiupdOIE4Z
	gFnNmvjhEHh44gpNhY05HJciz7loyxg8YADOWBDopGiq6vX3prpnm7p5B7PhvO3mrqJAMHVgYSL
	ajYyju12/a8CnrsRvPxYvg=
X-Received: by 2002:a17:90b:48d0:b0:3a0:e22b:1b16 with SMTP id 98e67ed59e1d1-3a0e22b1df8mr2380950a91.25.1790469578256;
        Sat, 26 Sep 2026 17:39:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 5/11] python3-tornado: patch CVE-2026-91990
Date: Sun, 27 Sep 2026 13:39:15 +1300
Message-ID: <20260927003921.746786-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130324

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from v6.5.8 matching CVE description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-91990

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2026-91990.patch      | 40 +++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91990.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91990.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91990.patch
new file mode 100644
index 0000000000..65b43b61a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91990.patch
@@ -0,0 +1,40 @@
+From 151ba03ad569ec1c13593899550f4ab7d1fa03c8 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 5 Aug 2026 14:13:32 -0400
+Subject: [PATCH] httputil: Apply multipart max_parts limit earlier
+
+This prevents some CPU and memory amplification attacks.
+
+(cherry picked from commit de85b3f87446e323e881bbaa3d5a74f4b76e5f05)
+
+CVE: CVE-2026-91990
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/de85b3f87446e323e881bbaa3d5a74f4b76e5f05]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/httputil.py | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index 0c9ad832..f698db21 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -37,7 +37,6 @@ from urllib.parse import urlencode, urlparse, urlunparse, parse_qsl
+ from tornado.escape import native_str, parse_qs_bytes, utf8, to_unicode
+ from tornado.util import ObjectDict, unicode_type
+ 
+-
+ # responses is unused in this file, but we re-export it to other files.
+ # Reference it so pyflakes doesn't complain.
+ responses
+@@ -1078,7 +1077,9 @@ def parse_multipart_form_data(
+     final_boundary_index = data.rfind(b"--" + boundary + b"--")
+     if final_boundary_index == -1:
+         raise HTTPInputError("Invalid multipart/form-data: no final boundary found")
+-    parts = data[:final_boundary_index].split(b"--" + boundary + b"\r\n")
++    parts = data[:final_boundary_index].split(
++        b"--" + boundary + b"\r\n", config.max_parts + 1
++    )
+     if len(parts) > config.max_parts:
+         raise HTTPInputError("multipart/form-data has too many parts")
+     for part in parts:
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 4dda1541b8..5d3db11b6b 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c3ddfc2"
 
+SRC_URI += "file://CVE-2026-91990.patch \
+"
+
 inherit pypi python_setuptools_build_meta
 
 # Requires _compression which is currently located in misc

