Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.2368.1613440708134624639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S1RNU6fK;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id o63so5280051pgo.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FnXi2Dnm6KRS/004aqlaGqgRidUtthhDs6/DkuQagCk=;
        b=S1RNU6fK14o3JWPaHxID0QGf616FjBc7uiIQDyOIkwDlSXkYlTFmdC9oN9jm8TSQRK
         8mc/gSylQg9OruKH1TpyM6Viz1to1agiK+y2+xwLA4igGqMyWFX9kH0tWJ+CIFhpYtMQ
         9+jhsHHuAyGV2DWHEwOXa3p4ZBkj1d3UXY9yIBkhMrSlWX0PVJlb+CKoNetFfTNRP1HS
         p5a5ZHYHGjrNxUWnDyX+uiRmAhpIO1qwcp7IFLuEmtjyWk2GWz1+H0Rn48IhbuCDupah
         FvoroOnovH6q9YF/eyjaRcvZpvLGWBz+Ir/umXzC9Eoh2QRdI6ePS+3lmCT0Lu3/WSAf
         91xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FnXi2Dnm6KRS/004aqlaGqgRidUtthhDs6/DkuQagCk=;
        b=NGqloCTBG3G6LPxmhPK0M3QIr+EvcrH4MCi5/CQO5DphEBYCZKjot1iV6yKO9+qdke
         KXfE83p0tYbYMQV3e72N6Eov07pWt7i1Fn0a6UC83F9B7dfCEW/M9ihPUfCYnzi6ksaz
         EyEaw9w3AFY56mnSGVC6WG6AFN4rhzp2D2uBnl4fzc7vIjTMaNTcLkvQrC355tZNhRiW
         IzmTxytj3nWMureD3RKhbEWyDat4Oqc2V98xVUFTvljPRFHzqNW8OBGNJQmgP3snwGXf
         qVF1M9lRQ4dWp4F82s7BbOBwE5GIFCD+1LbQw7FbZyMrPFRUoKj54XKd4dlz5oF0ygSH
         +GwA==
X-Gm-Message-State: AOAM531x/u7129bo6OTo6LtBQ1DL6HYCNVOnzxBNcBz7Lx7ugAzPJrvu
	RH5NywTWnHaUGm7wXf5zlYz2xhiwfqWXHw==
X-Google-Smtp-Source: ABdhPJzElZR+VG4Pv6/dXbNdXc36dCzDoVg8Y7VIeGVC3+ILxmTReho6sscd660wMdadxU7PDgV4tQ==
X-Received: by 2002:a62:3246:0:b029:1d5:db64:4b06 with SMTP id y67-20020a6232460000b02901d5db644b06mr17767979pfy.64.1613440707545;
        Mon, 15 Feb 2021 17:58:27 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:27 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/11] python-urllib3/python3-urllib3: fix CVE-2020-7212
Date: Mon, 15 Feb 2021 17:58:13 -0800
Message-Id: <55f71e0a18f3fcea14b4ee6ac526cf391632a7f6.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Optimize _encode_invalid_chars for a denial of service (CPU consumption)

CVE: CVE-2020-7212

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
[Add CVE: CVE-2020-7212 to the patch itself]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python3-urllib3/CVE-2020-7212.patch       | 55 +++++++++++++++++++
 .../python/python3-urllib3_1.25.7.bb          |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch

diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
new file mode 100644
index 0000000000..df234e442b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
@@ -0,0 +1,55 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+CVE: CVE-2020-7212
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
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
index 34c15b6c24..8d987a1f30 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e4
 
 inherit pypi setuptools3
 
+SRC_URI += "file://CVE-2020-7212.patch"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
-- 
2.17.1

