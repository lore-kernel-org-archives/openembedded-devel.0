Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A247C98328
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:50 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29271.1790469583794201019
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rhKpK8zf;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a0b0fa2055so1147780a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469583; x=1791074383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KItwui4v3L6Mik1fdMuLAfKsq6yVBG4V7BCkPKoB/Eo=;
        b=rhKpK8zfqCNyagAkDWg5/Pc61WEbgAeU/E0My9MnfBFgz12SPAkdV1yWKwdf506mHu
         D7rrPgAP4H5G0BJLS0+vyOWa2DWgjr6vQ2Z0SGcVNNIkz2SoBQANbL5mO072G6GcksmY
         618CI3HAXLkp6thJQ2WqhG4olKC4ZHsdQ5JRgYCR1tcAphMuXyePoOzWNjVziaYLe6vT
         94py2U8EAN0UsQyM9mrUrX3I6KhlpjM+L19egHrjyLJrWURCyCyqUPU2aqdbpNy1m77V
         4b/7zttc/ZW++R1Fu9OzwX4ClFvNylUMkGVJyv1uQN7Vm9ljVdN+8AswvAvb7XyVijS9
         nEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469583; x=1791074383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KItwui4v3L6Mik1fdMuLAfKsq6yVBG4V7BCkPKoB/Eo=;
        b=f8I1UAFCza05G/bVHFlsYUBGD5N2NJaFoA3ujM5Msi72tzdSmDf/dfohSpKdYBiyqO
         aBvjeU3sYk+U/Ofv/chU7CnXGKhRvT5E5cmmjwh8e7TdPRcGK1wkgu7wLeawDEiBjVRm
         BKjPH6uYo9k/U6ZvQXarxDS/fRcWaQHiBa9+BoCnyWY/bAEcMP2LZ4qSIM//HZjSsySr
         KVBjdUoIBpaXCPCAadH6pe4Nm4QzawbSurAk4LixAL2rW22iMypxM1SZvrNuRSeJ2pMd
         WzHkMHWUhdHemOpD+rYQlkvYwnqfwkSux4Kk+HgX3Z6RaiTwByodscTXgcMwqrRQBpgu
         EnTQ==
X-Gm-Message-State: AFq9FYJtlhp7TapC5ek+9DWhVAcEpi8wR0wR4usDPcxYH9Zpj/CIjS+7
	/6fP+dg5twsJDnAQsgk6wgu43vJjGIWhcluJeSDGQRYJQHlzH4FMSd858af9xA==
X-Gm-Gg: AYBFou1yTVGEzY1My7HlWbWa0IdfjPYv1JeJO1kYI5NMwxrusO+LkU3aoRGBRcUoz0J
	zO96hGnSXq7pU5YAXNBbzT1jdGBux1G2Mf3u6Ko1UOhx0UFSVd0+Y7HjEqOQNnRI75yBB47pyZn
	vJpVwLI5DdOV4Q9zwfqggE0IVSWh7b+mfzaEekBAMvCUfb7GPKLXTNFyWgbigRU5Cz0antYGMHo
	zRa+Aii9sZ/M1EiG3sm6bGdytaNWZMTsfYQo8PltmItnAjox59VCZXGscWiGhW4ci1iK/s5IX8p
	R3x8ddGlEtMQDs4FFzdtcbbh2iAJ6q2wNfyBMJFawzyTE5G6cO1HZ/3zR2UQ2Z6LhfPibL+FT+e
	FCDH9d88ZirzHYGDqdSA2ERFBBs76sOtK0AXZJaBbNkfG7tFZ3CcWRezbfqCiiZs3sRIRqC3kno
	EuxzlB+wciWmseZBA06kQ4aIjNaLwikrQckZon5W3D4kS6mdcMmoPorIqV6pzT5oJKDtgQT/N8G
	zL7GYV5mY9jhveOsAmvYsA=
X-Received: by 2002:a17:90a:d2cb:b0:3a0:dfb6:aec7 with SMTP id 98e67ed59e1d1-3a0dfb6d466mr2689565a91.67.1790469583048;
        Sat, 26 Sep 2026 17:39:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 7/11] python3-tornado: patch CVE-2026-91991
Date: Sun, 27 Sep 2026 13:39:17 +1300
Message-ID: <20260927003921.746786-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130326

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from v6.5.8 matching CVE description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-91991

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2026-91991.patch      | 57 +++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91991.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91991.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91991.patch
new file mode 100644
index 0000000000..6bd755af57
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91991.patch
@@ -0,0 +1,57 @@
+From 566a5ff64a530dfbc6bb6afbb1615c3e7addfd8d Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 5 Aug 2026 21:33:26 -0400
+Subject: [PATCH] web: Also check for semicolons in deprecated mixed-case
+ cookie args
+
+(cherry picked from commit da284767eae8e1f0484f123b8c3225f6465b09c7)
+
+CVE: CVE-2026-91991
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/da284767eae8e1f0484f123b8c3225f6465b09c7]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/test/web_test.py | 12 ++++++++++++
+ tornado/web.py           |  6 ++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 9bd1d49c..27e7fcfe 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -329,6 +329,18 @@ class CookieTest(WebTestCase):
+                                 "unexpected exception for char %r in domain: %s\n"
+                                 % (char, e)
+                             )
++                    try:
++                        self.set_cookie("foo", "bar", DoMaIn="example" + char + ".com")
++                        self.write(
++                            "Didn't get expected exception for char %r in DoMaIn\n"
++                            % char
++                        )
++                    except http.cookies.CookieError as e:
++                        if "Invalid cookie attribute DoMaIn" not in str(e):
++                            self.write(
++                                "unexpected exception for char %r in DoMaIn: %s\n"
++                                % (char, e)
++                            )
+ 
+                     try:
+                         self.set_cookie("foo", "bar", path="/" + char)
+diff --git a/tornado/web.py b/tornado/web.py
+index ec7ec3f5..6f1ae304 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -717,6 +717,12 @@ class RequestHandler:
+                 raise http.cookies.CookieError(
+                     f"Invalid cookie attribute {attr_name}={attr_value!r} for cookie {name!r}"
+                 )
++        for k, v in kwargs.items():
++            # Also check for disallowed characters in deprecated kwargs.
++            if re.search(r"[\x00-\x20\x3b\x7f]", str(v)):
++                raise http.cookies.CookieError(
++                    f"Invalid cookie attribute {k}={v!r} for cookie {name!r}"
++                )
+         if not hasattr(self, "_new_cookie"):
+             self._new_cookie = (
+                 http.cookies.SimpleCookie()
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index ce7b903ef7..ca5b0a0470 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c
 
 SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-82397.patch \
+            file://CVE-2026-91991.patch \
 "
 
 inherit pypi python_setuptools_build_meta

