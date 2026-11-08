Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2897.1794165956553940320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1472495e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165955; x=1794770755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ayw/BR7J1q2euo7qw+1et9TQ+pmOrZLfn8hE3m9SZsY=;
        b=pnNgft/yDBleErB1gheK6Ph8WjKLuNmkRY0DNGmLxq204xyY9nlvKlv2SzPuiOGuOn
         NxwMH725UhZL+4Z2ybztgdjNqNpyTS2ZK7K0ZRemMzkwEN8ZRQWXkso4Se7oV5XhQbkY
         AxJVzHA1lpiXsB94HucuHKkiYJYH/dyx7vXrImMEv5R2ZeA+R/7hq7QcTnyKbn1kLNRo
         ZuOEGBhzHK4CyyOq9vhi6Sur3YZUdFwbPd3/nVgtJ8ssdzTE76kT8nSZNkPYw4de9bwz
         UHTTpsmGZHYTfIUtkWjbj2Slpqxd6znyPUwR5jY85QBik7o137Yuw5x8I/2/jTtL/Mvs
         8wdg==
X-Gm-Message-State: APuU4Z+WasW6RdkEcPSEO2boHIr7kfhJnBaqkrurKd2uie4jZ/V1qF3M
	4Z04Dwr9lHxke9LkFlwyRQfjAZtrJIhmCclLXs+iUKBma+w4J8byr4HNY0H3AQ==
X-Gm-Gg: AYBFou2CgcXqFp1lm/+eMTv7bcdnNPTp2h8xhQqa/1eL/+k55c914lDdNtKB8jgPdFD
	xDETydBQV5zIzdVYJ+Ogxgb/VVupNOomB0ootYpeVLiYa68PgAhG2k101UFt29ZZavjs0aBCafL
	UOEx/b9q3Q3qwj3HSN8YAuD234M30YP5VOvtURDbfZLuScwA/orRI5X1WZIvPmCT9chSPocpV1s
	QNdxfQBe78WXVonLVjyMtN9/wv9bqNspGfoi5ykSCk5kBcV7flv3/8m0IwVcER/u37Mkq+WKvkZ
	cO32BU1f5eynRq4V+jpI4ZuxhU7CYfn6TBeevHV6yPMfiHpXFhncxDOLjCAiIK8E9ocZDPcz6c0
	yqjYNHB6IkT71TFcSYThqJFfhrIad/SFYCCpe77QKPMlmRqV9H3SdTKg/MNn4soB149YZR6QrAc
	vMVqM2REyjSR9OIVWE8Tpd4hPQc1ocj6grm5zQhj8GwS7NDeqj6BoF2k3jRqXyIm9x4uYyFTDPk
	dF5qOjQMuRFUl5sSYHIbmt3gUq8cChzGk3SSEC8DGIevAwtCKNPHc3kB7//pDuXRWAgjVi0HzN3
	uT/s7GogBsH1qUH7eHN/LVsnoZJSsXCF8dqGQ7TxiDU9nagzejUMyvOmDP1UeYYpErhbvCI/T36
	Fi5zSKgB9NcrS/X5B6tKg452ipT/aTWYx9jXcVaCdfYynwLVOAnZxHTEOTA==
X-Received: by 2002:a05:600c:34cd:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b960d9c587mr41198265e9.3.1794165954719;
        Sun, 08 Nov 2026 11:25:54 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:54 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 3/6] python3-haversine: keep working when numba fails to import
Date: Sun,  8 Nov 2026 20:25:46 +0100
Message-ID: <20261108192549.1082715-4-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192549.1082715-1-thomas@roosesweb.de>
References: <20261108192549.1082715-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132018
Content-Type: text/plain; charset="utf-8"

numba is optional for haversine, but haversine only catches
ModuleNotFoundError. With the NumPy 2.5 from OE-Core, numba 0.66 (as in
meta-python-ai) raises

  ImportError: Numba needs NumPy 2.4 or less. Got NumPy 2.5.

which makes "import haversine" fail. Catch ImportError instead.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...-pure-Python-kernels-if-numba-fails-.patch | 40 +++++++++++++++++++
 .../python/python3-haversine_2.9.0.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-haversine/0001-Fall-back-to-the-pure-Python-kernels-if-numba-fails-.patch

diff --git a/meta-python/recipes-devtools/python/python3-haversine/0001-Fall-back-to-the-pure-Python-kernels-if-numba-fails-.patch b/meta-python/recipes-devtools/python/python3-haversine/0001-Fall-back-to-the-pure-Python-kernels-if-numba-fails-.patch
new file mode 100644
index 0000000000..6e20534799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-haversine/0001-Fall-back-to-the-pure-Python-kernels-if-numba-fails-.patch
@@ -0,0 +1,40 @@
+From 5f199ca92d651d653cb26b4fb6c48ba91137bec5 Mon Sep 17 00:00:00 2001
+From: Thomas Roos <thomas@roosesweb.de>
+Date: Sat, 7 Nov 2026 11:45:31 +0100
+Subject: [PATCH] Fall back to the pure Python kernels if numba fails to import
+
+numba is an optional accelerator, but importing it can fail with an
+ImportError other than ModuleNotFoundError, for instance when the
+installed NumPy is newer than numba supports:
+
+  ImportError: Numba needs NumPy 2.4 or less. Got NumPy 2.5.
+
+That error escaped and made "import haversine" fail. Catch ImportError,
+which also covers ModuleNotFoundError, so haversine keeps working
+without numba.
+
+Upstream-Status: Submitted [https://github.com/mapado/haversine/pull/91]
+AI-Generated: Claude Code, Claude Opus 5.5
+Signed-off-by: Thomas Roos <thomas@roosesweb.de>
+---
+ haversine/haversine.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/haversine/haversine.py b/haversine/haversine.py
+index a731188..687b602 100755
+--- a/haversine/haversine.py
++++ b/haversine/haversine.py
+@@ -176,7 +176,9 @@ try:
+         _inverse_haversine_kernel_vector = numba.njit(fastmath=True)(_inverse_haversine_kernel_vector)
+     _haversine_kernel = numba.njit(_haversine_kernel)
+     _inverse_haversine_kernel = numba.njit(_inverse_haversine_kernel)
+-except ModuleNotFoundError:
++except ImportError:
++    # numba is optional. Besides being absent, it can refuse to import, e.g.
++    # "Numba needs NumPy 2.4 or less", which must not break haversine.
+     pass
+ 
+ 
+-- 
+2.56.0
+
diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb
index 2dfb3356a7..439ff98371 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb
@@ -2,6 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20a52d2c688975e989fcbee3e6c8d1a1"
 
+SRC_URI += "file://0001-Fall-back-to-the-pure-Python-kernels-if-numba-fails-.patch"
 SRC_URI[sha256sum] = "1103d7e1f0f108c25b31b63452c54d9d6f29389a70de7dd75fd4b908329b6fcf"
 
 inherit pypi setuptools3
-- 
2.56.0

