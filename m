Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8078.1795669143637349870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 20:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eboYb5FS;
 spf=pass (domain: mvista.com, ip: 74.125.82.51, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so9806767c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 20:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795669143; x=1796273943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQRxv/Gv7HQuwTb1Gnz/DxYaRWCbXMusu9k/thT2UNQ=;
        b=eboYb5FSjUcE/6p6KqSJnGYA8nPaaieVtvX3XoW7QAUhI/N3favlOC1Y2HtxbLt+vA
         fXLiEh0uTpialddmBYbw/pkYBh7XI7VJ0wilUjqMV6CHKcBucEQZvTNFVOt4F0AZYIqm
         DXjw5mXBlfs+vL4TXv7q+2qUM8Ga1BFQQ0+ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669143; x=1796273943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQRxv/Gv7HQuwTb1Gnz/DxYaRWCbXMusu9k/thT2UNQ=;
        b=faIcEqS1R4GaZ0Ph/LVFG47OWIE0eZhzle8ACQhPSCZc6ciHvkahyRivni76+NretM
         U9VNvh5TDcjw7WETRkPmJoMRTAwFeJ6TfiaCjwlQ+vbtUUbCGLRXY7hf+H1MrGDuOYUl
         85/GpCG6SDi2PgxkD7kEEpemj7EToyl3ZzlRLAeLDU/UJfP0WEs2UIfD+ueqW+MJxU0P
         L9GvMceo9ZJQF7IZiJvPh1aEe7XVE0V0HFo+idGqMZCcyCGpNukzzQr/vbCfjHyAnSOO
         N/zNcU3WKjoqMoXPSpaMtD5ofCltBSezrlkCbYQvxnqFffMJF7GMmh/OxwuGyBMLnwKX
         rJSA==
X-Gm-Message-State: APuU4Z/IoPb8CRloqM6i+0tKdNRDz88iAs80cOhpROCpyhQxP6VIjego
	YUeqewdsd+BZ/VrG+LHne1XZ41fts7zykXIfgCDYlwYo/CPnrqeh5ZomQ5v+u65DMft2a2HAnlN
	vjmRX2cY=
X-Gm-Gg: AZFdTZf5VfC186SGQTcGsez+cYZfzOccnOpHD4SiIhdNMfLztCJlu0pJ5hd3a0UIQqz
	QVwLVotqPmDpp6v2j8I4lMwZR/eaE4LGF3RNUudDez8CYp7TtMDOG+SgIuhP/D+XaLHJmOZYbIN
	Etp2lSukhrwZrGISriyWf4jBDVfGq//mX9js0F3AIYITuF6iLMpwCiYfzsr5dwEviWfLfbzjEtr
	8rdCjTHuQ6q7W6BDESOmpdwKYraLjTQoPxqDUauan7An8ge/lQckUie7Ja34TudVDg5nQ0QA7bH
	XdYBXg4e2JUBf5KVZg7xiCVJrgZ2uNG71kb7AkulY3S4e2erDL0aNxRlyigLRa4mhtBxpxWHX3+
	znIkrSKY8zGJbRtAdb1p7i2w+mMUWTPXp2sfWn584VFDpVRX0KcyRpsWcrK1jOtGii2LfutDfk3
	z+y6fMj17VVz7Hk6UcX3YP3F8uSAwgQ+V3Y2kAqm1F8LbvxGbn3oANjvHa4grrbLsUDCTqzs4Vh
	jJeX5ufPTzXXAS4mW4iDSiYt9ryJBfwxrc+AdrfpyUj6I+9hXSkJX2OEhvTKWeqABiPvE8D0Jbs
	L8OWCL87YtHumAKerq76VZL08iqkyNCQHsjAusg8rcDNzKVk69bEK/x4S0/e74M=
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr21921895eec.13.1795669142746;
        Wed, 25 Nov 2026 20:59:02 -0800 (PST)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([43.249.234.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm55197905eec.16.2026.11.25.20.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:02 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH 2/2] python3-pillow: Fix CVE-2026-55380
Date: Thu, 26 Nov 2026 10:28:48 +0530
Message-ID: <20261126045850.28407-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126045850.28407-1-hprajapati@mvista.com>
References: <20261126045850.28407-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 04:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133086
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/f39b0ae6624eb2d7c5c5d651d9bb5fdbd96a8675
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-phj9-mv4w-65pm

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-pillow/CVE-2026-55380.patch       | 66 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
new file mode 100644
index 0000000000..0c4ef9658c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
@@ -0,0 +1,66 @@
+From 176781ac99ebf9aa5486384e6e2e4896b30d95b5 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Sun, 21 Jun 2026 14:06:24 +1000
+Subject: [PATCH] Add decompression bomb check to GdImageFile (#9693)
+
+CVE: CVE-2026-55380
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/f39b0ae6624eb2d7c5c5d651d9bb5fdbd96a8675]
+
+(cherry picked from commit f39b0ae6624eb2d7c5c5d651d9bb5fdbd96a8675)
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Tests/test_file_gd.py  | 8 +++++++-
+ src/PIL/GdImageFile.py | 3 ++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/Tests/test_file_gd.py b/Tests/test_file_gd.py
+index d512df284..3db71463c 100644
+--- a/Tests/test_file_gd.py
++++ b/Tests/test_file_gd.py
+@@ -2,7 +2,7 @@ from __future__ import annotations
+ 
+ import pytest
+ 
+-from PIL import GdImageFile, UnidentifiedImageError
++from PIL import GdImageFile, Image, UnidentifiedImageError, _binary
+ 
+ TEST_GD_FILE = "Tests/images/hopper.gd"
+ 
+@@ -18,6 +18,12 @@ def test_bad_mode() -> None:
+         GdImageFile.open(TEST_GD_FILE, "bad mode")
+ 
+ 
++def test_decompression_bomb() -> None:
++    b = BytesIO(_binary.o16be(65535) + _binary.o16be(50000) + _binary.o16be(50000))
++    with pytest.raises(Image.DecompressionBombError):
++        GdImageFile.open(b)
++
++
+ def test_invalid_file() -> None:
+     invalid_file = "Tests/images/flower.jpg"
+ 
+diff --git a/src/PIL/GdImageFile.py b/src/PIL/GdImageFile.py
+index 88b87a22c..9dd79de3f 100644
+--- a/src/PIL/GdImageFile.py
++++ b/src/PIL/GdImageFile.py
+@@ -29,7 +29,7 @@ from __future__ import annotations
+ 
+ from typing import IO
+ 
+-from . import ImageFile, ImagePalette, UnidentifiedImageError
++from . import Image, ImageFile, ImagePalette, UnidentifiedImageError
+ from ._binary import i16be as i16
+ from ._binary import i32be as i32
+ from ._typing import StrOrBytesPath
+@@ -58,6 +58,7 @@ class GdImageFile(ImageFile.ImageFile):
+ 
+         self._mode = "L"  # FIXME: "P"
+         self._size = i16(s, 2), i16(s, 4)
++        Image._decompression_bomb_check(self.size)
+ 
+         true_color = s[6]
+         true_color_offset = 2 if true_color else 0
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 55df58ef4b..f27bcac7d2 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-59204.patch \
            file://CVE-2026-112393.patch \
            file://CVE-2026-54059-CVE-2026-54060-CVE-2026-55379.patch \
+           file://CVE-2026-55380.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.50.1

