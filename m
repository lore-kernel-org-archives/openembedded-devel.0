Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9C7EE0AD8
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2756.1770460448036489790
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQ9BhFUx;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359a302794so976192f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460446; x=1771065246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnF4Y74p53hifhhwZNzm96a8e1Dmrt6Jbonl+2NB5a0=;
        b=fQ9BhFUxsNs4iU6YOyLBUwqAlFe+trccLQth4ALT8F7JUxcHglqXfoT3aIayCLdPf2
         kcG5zOSX5GV5pmeV9Tye9TCXL5fa5BjQbQqyJv+5oGtAX0gyhRRfsXolO4hXxWV8uLo7
         dMHNqtQXRz0U/KuNrkAzjYrhZmn12xnZ3b++cE4/d+cpSYSiZFsSpIqaqYGcjaSZtEiz
         wIHDcNaH2P8FxS92kkpAL7YbQoLaQGUiq2cXi+JKqhhD0RDFb7F+8Nj/JYTMZ/+RoBXq
         FpAOWaHg0mLwY8Wlu1Gq7AcrOMLkxI3jcSyFm+nRZ8+04sgdOtRGWpWvdddxO9ORKWz6
         u6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460446; x=1771065246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HnF4Y74p53hifhhwZNzm96a8e1Dmrt6Jbonl+2NB5a0=;
        b=Em61DIVL/uDf5l/vaRbF0zyhTxaLENDvtAw+F4QyO6eU7l76tr3hpcgeRx74h6Quhh
         TIg0r1+c4VCqGjlXwOHdelPlpE586tIAPPAPMf4gGyz8eokHGLZlu+YkfE9GGMUmN5Sd
         GmHsT2LVp3AzYZpIIMgf2ioaUitvke2f0VrbIG8f1vWZHj4vREFrmAvQPhqWSfI9jwS+
         L8waWd60w33LAUEAEhUnqdR5PbpkoAqILQbM7ecCjHgd+CPgzf1bRfojpb2EZKBP+m43
         0Q4iSnhntrwAToa3DVzwFRvQ0mCelPBwVGAzSze17U5wdN9JML+0vsJUpzImbAdvZK7e
         yFBQ==
X-Gm-Message-State: AOJu0YzD0L8q51bqYkzLDDuunQ89+PsEpV8iSN+D5ZaUXqQgL6PUP9jC
	D+i8UxVYwK2rS8KkoygsTkFdtgcSro/aV5i6aNxjbiF8o/3STSU4hRRoY19tuA==
X-Gm-Gg: AZuq6aJFrZgGHS+FH+6uDBF8ZyCC+sqrrNVl7eJ1SZAbZi+0JBdzb2DH1VzkXSnt2xp
	oQGAY0H0oay1OxPhlf6WMg9t7gP891avor3KsF8NOGDw/f54I/D6uOeuPcw61WbVrUPRBEEfm6e
	yULZ+IpJPog9sPsK1Rr7B3TFDfMN5BFK1jWCF9NzgD/u8THeCj64mFFe8b0mcpQk4Thef5hc7ZF
	JCLPwrFjlbCVY7k/KhpkYiKvazWU5HMG18HV93xY5fANdM4PtAG9RtbhPSEYYav4UeBPWDwRgbK
	JbhMNm/Oxt2LPPOBIQWVPeJ1UOwBjHz7HTv+MeCl7BMkRNsVOAxFk3ccO9WDAkHJsGBoZgQ8WIN
	pMcDb89cJUlSxn1Ukzq3lxr2YcGEqjGVZDI+LbZD9NzCZ3GOfW4nhpkvB259izd/v4jZ4a/i7Vf
	YxpLphJWGT
X-Received: by 2002:a05:6000:22c4:b0:436:1517:aec7 with SMTP id ffacd0b85a97d-4362933efb8mr8004728f8f.17.1770460446175;
        Sat, 07 Feb 2026 02:34:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 08/15] python3-aiohttp: patch CVE-2025-69225
Date: Sat,  7 Feb 2026 11:33:50 +0100
Message-ID: <20260207103359.4177243-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124249

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69225

Backport the patch that is referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69225.patch      | 49 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  5 +-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
new file mode 100644
index 0000000000..cadfe27adc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
@@ -0,0 +1,49 @@
+From 9ef3eb4a9f79c106b8a5518fc600412ad81dff5c Mon Sep 17 00:00:00 2001
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
+index 4bc670a..d565557 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -598,7 +598,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         if rng is not None:
+             try:
+                 pattern = r"^bytes=(\d*)-(\d*)$"
+-                start, end = re.findall(pattern, rng)[0]
++                start, end = re.findall(pattern, rng, re.ASCII)[0]
+             except IndexError:  # pattern was not found in header
+                 raise ValueError("range not in acceptable format")
+ 
+diff --git a/tests/test_web_request.py b/tests/test_web_request.py
+index c6398ac..704fc18 100644
+--- a/tests/test_web_request.py
++++ b/tests/test_web_request.py
+@@ -227,6 +227,13 @@ def test_range_to_slice_tail_stop() -> None:
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index d3782f2d48..43482db392 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551"
 
 SRC_URI += "file://CVE-2024-52304.patch \
-            file://CVE-2025-53643.patch \
-"
+           file://CVE-2025-53643.patch \
+           file://CVE-2025-69225.patch \
+           "
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi

