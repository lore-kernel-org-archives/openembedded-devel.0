Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C850DC9833F
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:46 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85364.1767684820276853665
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 23:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5MZ5zyt;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb5810d39so355585f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 23:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767684819; x=1768289619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ5lSmIUph9dgY9L4dUKDvJ1eTbYB6wHNtTyftNU6g8=;
        b=H5MZ5zytVF/ODLEk+oGzIDbeSitwtcZu1CWN7cq9r7ty7HqHPwedsfnwDgf5VE/RPK
         anSeIGRahZR58I0UkjCMuk7Z5gBUdjdGEFFTQUunCHW1wWW7T4v7FnA8e7xMwtziF6EP
         OO4xEwhnPWttQuZPQcCOTx6MsSvcGoGYyyjd0nNajGXTmQ1b7GSF+9y5p1pUXScEi0Ki
         UKHQRVrrJgxfRG7KkGVwuGleWhhUzLV9hBvuM+Wq53Cw2/KH6eGlfE0vS687Aa1hRq/D
         ool3eSYNN9nbm/tRMgYwafZO8fkXLCEuPDnZvu5Bnw58F+lCPtEJPbXLtAG0zje6p8s2
         vaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684819; x=1768289619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJ5lSmIUph9dgY9L4dUKDvJ1eTbYB6wHNtTyftNU6g8=;
        b=sE8DMwA1n5EBjLlfVkRoSRvTpG7Pp8VcCKIGMiRHAhCa2UiEghBuZWdKU4HUREv9rf
         HA891EmqQsZSWayKgsOLNzzryIGAdesIdtJME9tuERPur6r8m+C6WA75NS7wQWhLUb6P
         D7saQ4YT+pLTJD9r734x5hIIkfk3Orx3KsYD8DbaiJ+xnpxk7kdltVFIV10f2lU36zrw
         VcNyVqwP6Q9dDgwiKUyjxHgx54FwwfznzuSmm9VEB7D/7B49ZxY2T2ncyvFvhXgte/sN
         IeXPLe+tMVU0Va9OCAgIvXNcc14PdMZ/DTjbwSQXpnjeO3l0JwIxFGYl8ztE2n3rOZA1
         /Cnw==
X-Gm-Message-State: AOJu0YxGLiDTkBa5G4z0qXLEzKefiSWmdcTcsZQ2PPJfAaxBW8IMPNq7
	5mbGirCgdNB7iM1mgEqQN/5GVkHAqdUWeOJv/uIRttpnIMjJxj+frxf73tMFrA==
X-Gm-Gg: AY/fxX5cRUpdTK7rT/5x/oca0tGlBAKSa7axud01Xmv72SlZfkCfAqBdKc8l3c6RVvu
	ANtQmUS97oLJIlvJ6VIsgddTlQ5W8nfMhfOdQrNopZgplrnyMcQsSAL+xxhq/nQyLwXH+eIU/Jq
	Eh4pPhTtrPam/gRczYegHlWjRg3FNpnt3sOfRLH3wnZbo91TU2YpUaVXbcaMP1QtemJqgt34ADQ
	e6Eu676CVJbd+WgGsTNPyWyxIGyozO2+Jb9zqul6OnXO3fwLWksOmZrRgZgPsiVUMsypn6j3E7r
	HiPpvTJNX3OqaNMbDJcxV9gU1o5ZyoXFchZcRjRyAKShc3hkup96NsD6SFzdsyKMZCp1wNDEMqL
	xCzPk+6LZIzHGEKk4VJ3VUTbPkZxm54SUtVLaMY6W00yiyJsfobHtNma+5kguVhQK5cCk7M3q5M
	pSE25fdRj5
X-Google-Smtp-Source: AGHT+IEqldzQ/QJVA96DBCbxMkjvwYj0buPUNvYtSj0r9zp5d87rC7nWaQrmxc+RVTki5zN3du6Vug==
X-Received: by 2002:a05:6000:26cb:b0:430:fcbb:2e6b with SMTP id ffacd0b85a97d-432bca3f1c9mr3221017f8f.27.1767684818516;
        Mon, 05 Jan 2026 23:33:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm2811251f8f.11.2026.01.05.23.33.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:33:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-mpmath: patch CVE-2021-29063
Date: Tue,  6 Jan 2026 08:33:29 +0100
Message-ID: <20260106073334.3462222-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106073334.3462222-1-skandigraun@gmail.com>
References: <20260106073334.3462222-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123167

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-29063

Pick the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-mpmath/CVE-2021-29063.patch       | 51 +++++++++++++++++++
 .../python/python3-mpmath_1.2.1.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mpmath/CVE-2021-29063.patch

diff --git a/meta-python/recipes-devtools/python/python3-mpmath/CVE-2021-29063.patch b/meta-python/recipes-devtools/python/python3-mpmath/CVE-2021-29063.patch
new file mode 100644
index 0000000000..3674a32ea1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mpmath/CVE-2021-29063.patch
@@ -0,0 +1,51 @@
+From 2e196ba7e41a46b8cafa5971e559ca55171414dc Mon Sep 17 00:00:00 2001
+From: Vinzent Steinberg <Vinzent.Steinberg@gmail.com>
+Date: Wed, 10 Feb 2021 16:45:04 +0100
+Subject: [PATCH] Fix ReDOS vulnerability
+
+Fixes #548, with the workaround suggested by @yetingli.
+
+CVE: CVE-2021-29063
+Upstream-Status: Backport [https://github.com/mpmath/mpmath/commit/46d44c3c8f3244017fe1eb102d564eb4ab8ef750]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ mpmath/ctx_mp.py             |  4 ++--
+ mpmath/tests/test_convert.py | 10 ++++++++++
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/mpmath/ctx_mp.py b/mpmath/ctx_mp.py
+index 39fc941..93594dd 100644
+--- a/mpmath/ctx_mp.py
++++ b/mpmath/ctx_mp.py
+@@ -42,8 +42,8 @@
+ 
+ new = object.__new__
+ 
+-get_complex = re.compile(r'^\(?(?P<re>[\+\-]?\d*\.?\d*(e[\+\-]?\d+)?)??'
+-                         r'(?P<im>[\+\-]?\d*\.?\d*(e[\+\-]?\d+)?j)?\)?$')
++get_complex = re.compile(r'^\(?(?P<re>[\+\-]?\d*(\.\d*)?(e[\+\-]?\d+)?)??'
++                         r'(?P<im>[\+\-]?\d*(\.\d*)?(e[\+\-]?\d+)?j)?\)?$')
+ 
+ if BACKEND == 'sage':
+     from sage.libs.mpmath.ext_main import Context as BaseMPContext
+diff --git a/mpmath/tests/test_convert.py b/mpmath/tests/test_convert.py
+index 3e2f555..cf1a91d 100644
+--- a/mpmath/tests/test_convert.py
++++ b/mpmath/tests/test_convert.py
+@@ -194,6 +194,16 @@ def test_mpmathify():
+     assert mpmathify('(1.2e-10 - 3.4e5j)') == mpc('1.2e-10', '-3.4e5')
+     assert mpmathify('1j') == mpc(1j)
+ 
++def test_issue548():
++    try:
++        # This expression is invalid, but may trigger the ReDOS vulnerability
++        # in the regular expression.
++        mpmathify('(' + '1' * 5000 + '!j')
++    except:
++        return
++    # The expression is invalid and should raise an exception.
++    assert False
++
+ def test_compatibility():
+     try:
+         import numpy as np
diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
index 3337df4903..bf883e0e9f 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "https://pypi.org/project/mpmath/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a"
 
+SRC_URI += "file://CVE-2021-29063.patch"
 SRC_URI[sha256sum] = "79ffb45cf9f4b101a807595bcb3e72e0396202e0b1d25d689134b48c4216a81a"
 
 inherit pypi setuptools3

