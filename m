Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.160.1593141284366735085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=faB62KYm;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id m2so4351002pjv.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8l6XZgO1z76wuj/wN+6UYGj3c3zNCcZsn+v4y3bkJwg=;
        b=faB62KYmGnDvXYjnKKj794G5V0K0CpdhWV91EvhIQVz4g0dQt0hdP2WkNnzYKY/gZF
         MGtrRplXoYRN1gHr4xaKWdzHx88xBo6EeJdwtsKLRTRbaN3wRXZQdy6+4evVTr04+BIt
         LBJMEHbZnlpVw/t37b9pdbLfdY/r5951HO2PWMUEgd4V51EI9omdyq6r1e5UQDryEOty
         mv6XcnSWrMWsZc4TsKjERDAl2VXE9582Mq+ZQwwY6Hb1nTJsq6nQR4dFKyO4cjYFCqbX
         ua+UoPw6yUdqw0CG0YOF/xhNpiuvJ2+Vx7Y83MOVnlWf5TficLOS5OxwQGcqHao5Ih/y
         ad1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8l6XZgO1z76wuj/wN+6UYGj3c3zNCcZsn+v4y3bkJwg=;
        b=pdpAeqv+kXcvJGjh8OwaazHe1v1Ld9ItaZFbj2nqqJ/i5sGIFgiUnlkjzsRA/Rn2yK
         +JmcEHoiKJCnQ/wPtxe/mFlTX3hf/S+bvZ8Zppib4YXWx1+jj2wEsYZoMoSZowx/vzdl
         ccDu4O8XiU/IfCpUSzdcazrc/rSwXTaPYKKBwB+oCFEdAGo2rDc5WgVfo8qTx0x5q3GZ
         C3+MAA0gpJ23WlHyB5ioifCHXjgIBLO5XiWOw6lz+N419kN3D3G0vgqbQkJ2smtqxzOU
         /TTNzo+ZICFERQlbmjvUdLqpxkR9i+ODR2Lpey3eAhi2fckxLLU4tnqOkGiIFB5oXned
         8IBw==
X-Gm-Message-State: AOAM531gtcAwL++ceQ2szXDM1FQqY1BGuwEIqqkQcoSVi8O1gegTVJHA
	eplDtoFeBGDua4h6MuXh3ln34Ygl
X-Google-Smtp-Source: ABdhPJyHCAGrnl2kX0y1KsnsUqjakalzOmAegqkurkyDZ5T1jlH/EZ8giB0TH/OVM9bYl8KO+QTjgQ==
X-Received: by 2002:a17:90b:3809:: with SMTP id mq9mr1121404pjb.156.1593141283636;
        Thu, 25 Jun 2020 20:14:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id z1sm24506070pfr.88.2020.06.25.20.14.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:14:43 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 2/6] python-urllib3/python3-urllib3: fix CVE-2020-7212
Date: Thu, 25 Jun 2020 20:14:34 -0700
Message-Id: <6d38a12f165445a7b47f784d705ab6692c93a6b0.1593141198.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593141198.git.akuster808@gmail.com>
References: <cover.1593141198.git.akuster808@gmail.com>

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Optimize _encode_invalid_chars for a denial of service (CPU consumption)

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python-urllib3/CVE-2020-7212.patch | 54 +++++++++++++++++++
 .../python/python-urllib3_1.25.6.bb           |  2 +
 .../python3-urllib3/CVE-2020-7212.patch       | 54 +++++++++++++++++++
 .../python/python3-urllib3_1.25.6.bb          |  2 +
 4 files changed, 112 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch

diff --git a/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
new file mode 100644
index 0000000000..a2bb0fb5be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
@@ -0,0 +1,54 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/urllib3/util/url.py | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 9675f74..e353937 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+ 
+     component = six.ensure_text(component)
+ 
++    # Normalize existing percent-encoded bytes.
+     # Try to see if the component we're encoding is already percent-encoded
+     # so we can skip all '%' characters but still encode all others.
+-    percent_encodings = PERCENT_RE.findall(component)
+-
+-    # Normalize existing percent-encoded bytes.
+-    for enc in percent_encodings:
+-        if not enc.isupper():
+-            component = component.replace(enc, enc.upper())
++    component, percent_encodings = PERCENT_RE.subn(
++        lambda match: match.group(0).upper(), component
++    )
+ 
+     uri_bytes = component.encode("utf-8", "surrogatepass")
+-    is_percent_encoded = len(percent_encodings) == uri_bytes.count(b"%")
+-
++    is_percent_encoded = percent_encodings == uri_bytes.count(b"%")
+     encoded_component = bytearray()
+ 
+     for i in range(0, len(uri_bytes)):
+@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+         if (is_percent_encoded and byte == b"%") or (
+             byte_ord < 128 and byte.decode() in allowed_chars
+         ):
+-            encoded_component.extend(byte)
++            encoded_component += byte
+             continue
+         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill(2).upper()))
+ 
+-- 
+2.23.0
+
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
index 6c81f1db9b..9f2d2c8496 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools
 require python-urllib3.inc
+
+SRC_URI += "file://CVE-2020-7212.patch"
diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
new file mode 100644
index 0000000000..a2bb0fb5be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
@@ -0,0 +1,54 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/urllib3/util/url.py | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 9675f74..e353937 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+ 
+     component = six.ensure_text(component)
+ 
++    # Normalize existing percent-encoded bytes.
+     # Try to see if the component we're encoding is already percent-encoded
+     # so we can skip all '%' characters but still encode all others.
+-    percent_encodings = PERCENT_RE.findall(component)
+-
+-    # Normalize existing percent-encoded bytes.
+-    for enc in percent_encodings:
+-        if not enc.isupper():
+-            component = component.replace(enc, enc.upper())
++    component, percent_encodings = PERCENT_RE.subn(
++        lambda match: match.group(0).upper(), component
++    )
+ 
+     uri_bytes = component.encode("utf-8", "surrogatepass")
+-    is_percent_encoded = len(percent_encodings) == uri_bytes.count(b"%")
+-
++    is_percent_encoded = percent_encodings == uri_bytes.count(b"%")
+     encoded_component = bytearray()
+ 
+     for i in range(0, len(uri_bytes)):
+@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+         if (is_percent_encoded and byte == b"%") or (
+             byte_ord < 128 and byte.decode() in allowed_chars
+         ):
+-            encoded_component.extend(byte)
++            encoded_component += byte
+             continue
+         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill(2).upper()))
+ 
+-- 
+2.23.0
+
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
index 19eb7025b2..e3583a057d 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-urllib3.inc
+
+SRC_URI += "file://CVE-2020-7212.patch"
-- 
2.17.1

