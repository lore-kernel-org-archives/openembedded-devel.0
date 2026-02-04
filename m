Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A306AE9D40F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24635.1770222568580983750
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P+raeoPa;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so66449715e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222567; x=1770827367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7r3Ze8S3SadA4IJrQNtDbJYaAqnxV1n+YAV1JDwgpB4=;
        b=P+raeoPaIdsR4drN0oRK71kXRx6h+3Pa8FtbOWtlzyrDw3WDLcFi/jYJMOn94ywrwj
         m8UNIL4wFHNAPNwAW7VNwvVyHIhmjb8Z8NOzeEiqJcecJxXxyP0mUMIRToD1xsmdvV2m
         qVISSPALfoBEnXjXEO0x7DEMZfh/EqyPQUBZhNpMW6JDdKoFKCPzKnJEkBqffmqJ4Y5i
         ZV5x1sn2XcJLY72uu8U2l79Dm8mJkTJh+tB+fG+mqD/T9RbDIMiudUL483Eu/Z5KXRWv
         PP/6Z2mcHR15N1/xeGPDJlEOMuEOVmbPJ+tTf/UWWdG7LbJnhS1/cmSacDrfdJ2CWGiu
         43QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222567; x=1770827367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7r3Ze8S3SadA4IJrQNtDbJYaAqnxV1n+YAV1JDwgpB4=;
        b=gFhSMZMI+JI8heM64XWsdHEPRC+xkdLRN/jdmNCV4ABPCjQ5v0dh/R8b3u9UMXei++
         J9VB+LDRrGp1yW3DfwQCK5kcvjDel29jvxdrb70WIEmNYVhBCbX5X5tt/hW4sGngasB9
         rA8KnLTeG7i+/14RHRPpl7f6t+IZ6AIyQhDfl0VT5pzQD/t1oQbt0sZaJjdid5wqkoSs
         BE+izYHBifRfROzHDC3txeNSxmAMhYDf1ecthteIVem6KrZMUH8GGKATNMexKdqG7tSs
         XJqqFX3k7BNfv8sLcscaF21UCaPNspTvNgrQDJOe5UVoZkWrI1OD/1k2e0KShuLV6dch
         1w3Q==
X-Gm-Message-State: AOJu0YzrQeNW/444giM38zGl2Six7WSzVvojvVfqanNqiFWu0ILLLC9U
	0dJmw2jtWU/0S9FL1nhmdqN9TlFVSUIEBTWp+XhM2WQZHvnmksnblerSJvADPg==
X-Gm-Gg: AZuq6aK+Cw8TYfa7j+iMMg4UpFvZuwsBSgqQRhyQZvXR4N8DTynmHT12x/1zceuM68S
	rf15Y2yuaOKqP+ApkDcWRBG5UaVfMwFxAy218YnIgzz+8mQ+1DqCyF9vSGbk1h+K7PzlkGVMlNi
	6hcOT7vcTKpKWelY6LUZHnrmvmlQW5iDpESLkx8ckfXWdmSsBfbb2mcoofVolWo6hV4vWjCijcU
	vxk44rBU7dKxgBjJ6s4xChioUCQoUHBwwBClujFhF0wl6+JW0R1RMaJuA68zOrUgheFoYKSjEln
	3XBTdhktk9hmfaukS6dyOtpcnlqjHzRGoSHvU7YDqtm1J6semKyKlaV9ArTcbhBK0jfvBre/r2A
	c+Cl4Z92mMH9Zy8cLi4ZY0iKmzC1MaewSzjtfyO/XCzSUBP4AyF56pajM62Ea0mei+hpn+FAaKk
	PlHEc4jKcakYGKpQOxeXs=
X-Received: by 2002:a05:600c:19cd:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-4830e9402f8mr49885075e9.10.1770222566749;
        Wed, 04 Feb 2026 08:29:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 2/7] python3-aiohttp: patch CVE-2025-69225
Date: Wed,  4 Feb 2026 17:29:17 +0100
Message-ID: <20260204162924.3042284-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204162924.3042284-1-skandigraun@gmail.com>
References: <20260204162924.3042284-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124137

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69225

Backport the patch that is referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69225.patch      | 49 +++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
new file mode 100644
index 0000000000..77b39d22dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
@@ -0,0 +1,49 @@
+From a4be27fe28e6cd833fa3045cca10404472d6878d Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sat, 3 Jan 2026 00:39:41 +0000
+Subject: [PATCH] Reject non-ascii digits in Range header (#11903)
+
+**This is a backport of PR #11887 as merged into master
+(7a067d1905e1eeb921a50010dd0004990dbb3bf0).**
+
+Co-authored-by: Sam Bull <git@sambull.org>
+
+CVE: CVE-2025-69225
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/c7b7a044f88c71cefda95ec75cdcfaa4792b3b96]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/web_request.py    | 2 +-
+ tests/test_web_request.py | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index 0bc69b7..6e09027 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -607,7 +607,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         if rng is not None:
+             try:
+                 pattern = r"^bytes=(\d*)-(\d*)$"
+-                start, end = re.findall(pattern, rng)[0]
++                start, end = re.findall(pattern, rng, re.ASCII)[0]
+             except IndexError:  # pattern was not found in header
+                 raise ValueError("range not in acceptable format")
+ 
+diff --git a/tests/test_web_request.py b/tests/test_web_request.py
+index e706e18..da80ca9 100644
+--- a/tests/test_web_request.py
++++ b/tests/test_web_request.py
+@@ -243,6 +243,13 @@ def test_range_to_slice_tail_stop() -> None:
+     assert req.content[req.http_range] == payload[-500:]
+ 
+ 
++def test_range_non_ascii() -> None:
++    # ५ = DEVANAGARI DIGIT FIVE
++    req = make_mocked_request("GET", "/", headers=CIMultiDict([("RANGE", "bytes=4-५")]))
++    with pytest.raises(ValueError, match="range not in acceptable format"):
++        req.http_range
++
++
+ def test_non_keepalive_on_http10() -> None:
+     req = make_mocked_request("GET", "/", version=HttpVersion(1, 0))
+     assert not req.keep_alive
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 4341e128a5..9a45eecb8c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI += "file://CVE-2025-69224.patch"
+SRC_URI += "file://CVE-2025-69224.patch \
+            file://CVE-2025-69225.patch \
+"
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 
 inherit python_setuptools_build_meta pypi

