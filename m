Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20.1794851775567437417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EBCHHHmI;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3652000c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851775; x=1795456575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NATQhGCz5+bPtrfhyFHCW13uSzV1q/DyUH1H56RNpw=;
        b=EBCHHHmIzDR6mIvJ1A8itv4pPVHjnUeaRJ5XJLDQ8rReUZYD+cJu1mbNYqt2KKzbHm
         3A2lkU5rZH7MVx5SlGnTt5f1+yJGN+eqlcnNKcJ19gaT///B8DJAg/YGFoAEXu9s33XK
         kMzwixGzjIFaMJfsmwNPwSkUO7MhbCon/0yJiHQGLRE0ENwhFE3tSCTMsVeN9I2CaNbl
         nSGBj/1VhCCi6gtR9IIQBKvIYjdcGKs76TfaxV4GtTLuP1/FztOJR2nri3sc8z7uKfbL
         EjOgarogLCkkTteMtzyHH7h9uwMBHUTBxKv2Tg2hdDOvP0oGc9ncZQtdL+LyCtpluzl/
         eoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851775; x=1795456575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NATQhGCz5+bPtrfhyFHCW13uSzV1q/DyUH1H56RNpw=;
        b=DnFsDAjA8jCqJUj1RmJ349lDtIUewPRkCcQvIkXAJ6AhdVqnOJ5OUwDgPuMFJDlwkm
         lrdhZGeixG5+zw052A+O6vRsNVL/0eJwZY2aJVa0vYpU9r3UMTbTq1Q5BXx1uCmCvhcw
         lcRYh3CIDMUGmH37wDrlsVkO5+IMeCuGv/H177B6qrxSi1rTyOw6cT3cAxXGWzIXewcN
         FqO+s7bdVnzDernF+JpGOheeJOVSJUN4+PjYML8t0DIiRJA/XnZVqxxaMWqcqyphX9lR
         g7v9dZuqb/CDBEaTb+dXueUUIHllwbBDeZwob8URc3m4DRMaKJ0UWLBjSDiJW35oSkZE
         6rPw==
X-Gm-Message-State: APuU4Z/R00w3eDMdcQz21cy88v8uyOC1I0PFtL3h4OsF8fQnZBs/dJJ8
	2uh+u6+Bky6mLHwVj19Hlx5TdZerhpyy6RyyPGKtiNXz48TDaxwBWLMuI4kr7n1z
X-Gm-Gg: AYBFou1weWJvF62EboqZAVBUl5aW5CEVjw/GeZgNQAR5XhIgsVAEgiRhRbMD9/IQzfT
	vmDMZ7qudMACybY4cdlKFEXkDh6pjUw84XMsTCOFaKpbP5JBrrX1PFkIMIrbBjOb8mDb/P6mH7k
	AP3ShUzuru/6uZ28c1Pq3xlXFDMlJsp8LOKLBeuG32BYVzRmwoLYzQLKqwHXRN7li40AEH5eUgP
	NU6Xss/x0+jlcPcY7/c2ALGT+q3y0xf4sFhIJQWMh9Z2HBKfKqXswTPgQrRNHLj3JUwmp/E/J3G
	ZgIK50ss0kyXnIEhjCL3rVXfSoXSwSxMTc7T8SKQkMrREKYxWl4EpdpX05JXDLrsMlR1PP5nRXp
	ciRrGDPKiCJUhwITEAtY7v+0dLHZkaaDW0ma/R7DqtOCUhK61afrPUeNJtR68RRxdDHalQ1xOg0
	kqct+3xDRgnIrKpQUMC96glqTTS5Af3ofBlMEODD153n5ykxOYx3JyLQXgVJ9S5HjxN5pP1QWhJ
	Ery0mw5MiGe5EacVa6q90ClF2Bm1c8FPut1c+Uzmk1hAKpYEedtVIbxycpowo56P39fmsXjZ6SX
	SO+lS6f/jzcoUIJXOydlZO+0BGR/K9i4effED0KDCC8q0RYs+Ft4cuapga/bxTnvEUHxy0zvM+E
	BndCSPxYSMfZuQtBCcAZGOqCh26gU7Huy8aoJNocexfE/44GrxuuofuMc6mm6kcxKaXS6hAnHYJ
	TnvcP6Dx1wWO+it9ulXD9iK2Eh6/hQRQtr3pisX4nPNsehVURIcB8mknaq/yVmPNzJ7Wz7PjCNn
	o60mUyJJ9hOFK4UBnpwL0cY2ijpIm5tdsqKXgm15M7+rbcJ06cW7w9jDCYIRdO56A1iuIpLghcZ
	aQi5
X-Received: by 2002:a05:7022:c89:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b5030d765dmr9448732c88.11.1794851774657;
        Mon, 16 Nov 2026 09:56:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 098/105] python3-u-msgpack-python: upgrade 2.8.0 -> 2.9.0
Date: Mon, 16 Nov 2026 09:53:50 -0800
Message-ID: <20261116175359.342679-98-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132553
Content-Type: text/plain; charset="utf-8"

License-Update: Copyright year bump.

Changes:
- New max_depth option for unpacking functions to cap array/map
  nesting depth.
- A RecursionError on deeply nested input is now caught and re-raised
  as the new MaximumDepthException (subclass of UnpackException),
  which hardens unpacking of untrusted data.
- Improved type stubs (py.typed added); documentation typo fixes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ack-python_2.8.0.bb => python3-u-msgpack-python_2.9.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.8.0.bb => python3-u-msgpack-python_2.9.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.9.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.9.0.bb
index 7538e8a88b..3705bf3f49 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.9.0.bb
@@ -1,13 +1,12 @@
 DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer written in pure Python."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=17df11353545c53a2df0ce7655859306"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ace2615eae557604711137d1c751d524"
 
-SRC_URI[sha256sum] = "b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a"
+SRC_URI[sha256sum] = "3f632940c2db108d71210795463e249b47e89a08eec0d54a5cdc1a202505ede9"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-PYPI_PACKAGE_SDIST = "u-msgpack-python"
 
 do_install_ptest:append() {
        cp -f ${S}/test_umsgpack.py ${D}${PTEST_PATH}/
