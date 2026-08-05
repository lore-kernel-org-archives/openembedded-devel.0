Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF34C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:44:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34668.1785912236180538648
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QdLhAA6J;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so737367b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912235; x=1786517035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQWpfoekk1Gkqlfu0D7DBsgOOVeazmmy4g49UdE/IWg=;
        b=QdLhAA6Jtb16oYqTFYLDPEHK/ThZfFmRr6iwzyiRD+ZRJ77MNtBrycq83jRgo7pfKP
         KxtAh+fjxHPMDrgkDR/cvLURmdpktR2WRGhxTKrWIruOfu6/xJOq3cE7rbZqOCDuo17D
         djbtvb19bcu+04l53C9unc/hPtEm0Whr62u5jcZzBV0Cip3xWwruaAdzeJQCdg/tju4S
         x64N8QE4vGSClN39jmRbinmlS/BLow31fu4QSXHNlWW5nB0EIGQUSIn5Lyc9+hE6ZQ/q
         aX/KbtufBDKpLLeEpwWbJa6mqiQp/j6HhHajGcoqKLVCLdf+60RmsvlMZ/jR/x5zkTDg
         8qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912235; x=1786517035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQWpfoekk1Gkqlfu0D7DBsgOOVeazmmy4g49UdE/IWg=;
        b=Qgj9T4B+fAZxs4qXIpAVt5XWJR7h2KfojAbVfL5/SMwE1/kUxHjmF+ZtmgyX7HWy2i
         0pq0q0si1n0P3sO9AZ8i7BFH0Cc1t0XzQTXaFUjCKK5KVLEx2avoa+onZ2SSZKt/HLvv
         qTRnE0QP5oliWWMVPFirxGamorFK8pCOYKhSUUXCzwRBGTOfLl8AYJCQ81xmdinlB+Lt
         Zxkd+BJ5nlO0xSLT/+Su5EYmNNDfxEIp0JT7zCSIwL6dE2cktf5j/Yj5Cl68UR8f2+5C
         cp2R3CuiLd6y95hwkJMqHgeJL5T4faUL9YutH9QPcgbntUwrgmWreyu3wlce831TeFku
         /1mA==
X-Gm-Message-State: AOJu0YxueXrvQVZWH31p+suzN82guOUxQQbKTBeJkOxMZaSUVQoV9O5F
	rd4/EYfQorJVf3FCihFzZjG43BWYrkpoLhvCZZGKIOPwv95B5msExH2HhpRGV5wM
X-Gm-Gg: AR+sD11LDXsGxN4C28rCf7X7LgIUqYkzms3zDwOEz4aEd8cBzRcslWVtEK2E0ywtic/
	3szv8gnYy6Fz8+snbVttuEkIwW7EOzUeFwzHkGKulaLoDnWR2Z+eyi+ff54bp9FDBz28wo9HWpD
	YsYPxNJUDAwrpSp5md6K25e5cTmnJB8SwG6fAcKanHtxf1a86OCN2sy5DE0qtrKiMW6OysAhBQx
	FHOorTEp3bK4AqG+ESLkY+bQF60y0xCOyaGOYxYXsyMujFiW6+pn/wEXIE1LY500I6yYdAlDVbm
	mEjcIZcIuW5K87lH4buZAAfmmlJqDQDw4oGDnyvVHh6eSlhwsPjJp+qSevQh4QrzHfbWdN7Fri5
	InwvnGoZ5T3YtgICi9OpGYdzqoLIYDjY/XpxsQps7D4ZwyUzCISMlBDdJ+fF2ovCFJUN8auVKyy
	6UludTiVgT9Rg/3TWuY3jiwSfbhk0Wji+//VgRe5akwLQgkxeg4bgI0pbjZnXWjRjXcZzg3ws02
	bKNso9LAu5x2QvVyDBxrnBPlBompOf9coVCV9KdaHWiNA0C/SUKQ1en2k5VLOL7yLxBIybpbppe
	lXASJM7M5z7HaBmi7jW+ShItY0IRo0pUC/PddF3SPAa1hiqVNmJMRhkrmsbuYUYaE5FFBTdrbBL
	ARA==
X-Received: by 2002:a05:6a20:c5a7:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cb85e6c950mr5379866637.19.1785912235358;
        Tue, 04 Aug 2026 23:43:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm9892246c88.12.2026.08.04.23.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:43:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/2] python3-bleak: Use python_uv_build and drop the uv_build upper bound
Date: Tue,  4 Aug 2026 23:43:51 -0700
Message-ID: <20260805064352.2945950-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 06:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128799

bleak's build backend is uv_build, but the recipe inherited
python_poetry_core and then added python3-uv-build-native to DEPENDS by
hand. Both classes are thin wrappers over python_pep517 that differ only
in the native backend they pull in, and python_pep517 takes the backend
from pyproject.toml, so inherit python_uv_build instead and drop the
manual DEPENDS along with the unused poetry-core dependency.

The patch capped uv_build at <0.12.0, which the 0.11.32 -> 0.12.1
upgrade in oe-core invalidated:

  ERROR Unmet dependencies (checked against .../nativepython3):
  	uv_build<0.12.0,>=0.10.9

This bound has now broken twice, and there is only ever one uv-build in
the sysroot, so drop the upper bound rather than raise it again.

Verified on aarch64 for qemuarm64: do_compile fails before the change
with the error above and both do_compile and do_package succeed after.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...leak-Support-newer-uv_build-versions.patch | 23 +++++++++++++++----
 .../python/python3-bleak_3.0.2.bb             |  6 +----
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch b/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
index bead8f3be6..043d7887c0 100644
--- a/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
@@ -1,11 +1,26 @@
 From 2e0994321b57e547a3c1f7e1f225e55ca007e45f Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 15 Jun 2026 17:53:47 +0300
-Subject: [PATCH] bleak: Support newer uv_build versions
+Subject: [PATCH] bleak: Drop the uv_build upper version bound

-Support newer uv_build versions
+bleak 3.0.2 requires uv_build<0.11.0. OE builds wheels with
+"pyproject-build --no-isolation" against whatever python3-uv-build is in
+the sysroot, and that check is enforced:

-Upstream-Status: Submitted [https://github.com/hbldh/bleak/pull/2001]
+| * Getting build dependencies for wheel...
+|
+| ERROR Missing dependencies:
+|       uv_build>=0.10.9,<0.11.0
+
+Raising the bound just moves the problem to the next uv-build upgrade --
+it has already been hit twice, most recently by the 0.11.32 -> 0.12.1
+upgrade in oe-core. Since there is only ever one uv-build in the
+sysroot, drop the upper bound instead.
+
+Upstream merged a bump to <0.12.0 (https://github.com/hbldh/bleak/pull/2001)
+which will be in the next release, but that would need raising again too.
+
+Upstream-Status: Inappropriate [OE specific]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
@@ -21,7 +36,7 @@ index 3224afc..4be6da7 100644

  [build-system]
 -requires = ["uv_build>=0.10.9,<0.11.0"]
-+requires = ["uv_build>=0.10.9,<0.12.0"]
++requires = ["uv_build>=0.10.9"]
  build-backend = "uv_build"

  [tool.uv.build-backend]
diff --git a/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb b/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
index c84b6bbc8d..022582e0e9 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
@@ -8,14 +8,10 @@ SRC_URI:append = " \
 	file://0001-bleak-Support-newer-uv_build-versions.patch \
 "

-inherit pypi python_poetry_core ptest-python-pytest
+inherit pypi python_uv_build ptest-python-pytest

 SRC_URI[sha256sum] = "c2229cb8238d5876b4bd05c74bf7a1aea1f88da39d2e51ac9dfd5cc319d5265f"

-DEPENDS += "\
-	python3-uv-build-native \
-"
-
 RDEPENDS:${PN}-ptest += " \
 	python3-asyncio \
 	python3-pytest-asyncio \

