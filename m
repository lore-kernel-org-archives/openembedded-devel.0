Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6404.1794871579998212515
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 15:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RDCCupqB;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so5897676eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 15:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871579; x=1795476379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYWwLBDAqh0aIgMxPTeIuScIEMO93A0W7L9AR3PPR+s=;
        b=RDCCupqBCf4Mkg1Zc4kfkpdR3qYe0HpvS9t1MjBeZiDbtpJDtarNnGvtTc++HWptru
         Kfc9jElz8oj3hw8NmwtJ56alSyClOes2bZEugoyXELfMLk4Ru7H8rSy8+G3l+bBskA99
         8ujkgY5MSgV0nrg6WgA5bWcWSZAGagVTjFy8tMheXxPDGtI9eavIrWNhKcpHZR5cpSPC
         XYKQm6u3w+WcPvXZR8JCaPadLsQjFQL0FpTURR2g/Q9zmlv05zn3rEdZDLicrRxz+hpz
         4fp3ZkoldLxY2kQyYDCzN+g4D2rceLNHi5F3PtXb9Z9jpnS0c9AdPZxQVoLnuplNW0rZ
         3eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871579; x=1795476379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYWwLBDAqh0aIgMxPTeIuScIEMO93A0W7L9AR3PPR+s=;
        b=LM9TOlO5ZkinhDs+K+k46vsBueZZZCi2KOwEAKZ2Al15fnqtGZNyIpLUCy1nAgWTy7
         HttDrzLyPWvf2jLNgNqn8YbCwOTCndbFCDSjAqxj3StWbDz89qNd5zeQ1e1D9+rrCE3s
         LJs+S4VQU+yIlb8TGCtCB/FjcKMcrCR1GaOuYGPM7enkE1Y9lC1eo1I5n50adArxTaYz
         1W6Eb4FQCRP7Lz0uKFKGS3oIQRNzwZePWeHNxkm6r/FyXMSADwTG3zQaD1A+Jy0/JV3H
         jeAhTf74cxPPi0sG8lZpqR+FNbA03BEmrSVpA4d64yd0E8WTmiwSiAb6URImgEO2GACp
         N9hQ==
X-Gm-Message-State: APuU4Z+1kgDteJxNGzSRcbdZ90Nk9oLLgRtKVyVx9bEh3gFVO6ZQy8U/
	b6u22lu4nse7PLvfzjgCPhI3f2qodgz3DsFpynnF0EdjhozGhncebbGh2Gm9qlfx
X-Gm-Gg: AZFdTZfbdtclidaJBPVnrSCGDVeeNkvQul5dGxZtxHVihutzpNN4L7ySBPTX8xM1SaO
	D56wtMvrE35Qzw9e3g2xEyGu4wNtQS6xzSjJTv/sCYCXzzrvXKtDvdDwzdXOnpk5OqHlOiFTh4+
	uCil0oB3xJ1n5fmqmdwNgTTFWzq9d2cqAlFxYUUAxFhz4TCTYasao0LP5hPEhQgXdXjccZLJpPn
	Xq6wljzT5UAiyYOtcjSPach7lwhj2IzpjKblGZrqq67nCV/FFWXMwXkJyTThcNE7YnHITsxBjfl
	NFAhWKIlG2FJmKwn/VkekhwkvTUAcEDSivxK9ZZtHH1xK28bdWgpcsOASlJpbM5zeSrxTiv5LqN
	z6FgNs1yw704QfPu8BxV3m5fd36XrtxP6IAviwwgHuffm/WyKvhfrdVaawJDSdkt2XnnELrjibt
	/ZCapf0RRGIWln13uimTDFhHoa9rccnZT63M28SaZBXYdv7RJJiHYfOh4lF5ox7QEdlMXaNNlJo
	IYd4BaTOdJASOJ7/yqNaMXBTF8X+D+k+dk67U7KuHS9kZjt9YizLW/iLdMnHt4oAUjrfJ/gupoF
	TCixYXqpwSlP1V/le0yZ05FqTniTg7ymR1L/I3E11O7bfuoEv/rykVM7Ml8WBwBYDbblMAYFktJ
	C4qRqR1wlnXGjJZSAxWMbUIz1OXZh3gkVO2hai4RQjQEAEzE6h3eTK+QEaTJE5KXO/UcxGF9YbU
	D5jrdorHim6pwlsfSC1QHRZ622a/tG8IoW/3eI8D3P3k/z32G3gm0/O2HnenBWWpNh4YaS8zqBd
	EG8Y4k4bZ25cE3X6zjYkRQ7ZsHAt4GdXakVt09PhXSdR5dnIymoGqD4HVCuyyRN3fH8GHjRjq04
	lwCa
X-Received: by 2002:a05:7301:182a:b0:377:d6e5:e64a with SMTP id 5a478bee46e88-37965f9bfdamr11945544eec.7.1794871579238;
        Mon, 16 Nov 2026 15:26:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm37002186eec.16.2026.11.16.15.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:26:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-zopeevent: Use python_setuptools_build_meta
Date: Mon, 16 Nov 2026 15:26:16 -0800
Message-ID: <20261116232616.1966432-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 23:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132570
Content-Type: text/plain; charset="utf-8"

zope.event 6.x ships a pyproject.toml with build-backend
setuptools.build_meta, so inheriting setuptools3 triggers the
pep517-backend QA warning. Switch to python_setuptools_build_meta
and add python3-wheel-native, which is listed in build-system.requires.

The pyproject.toml caps setuptools below 82, but oe-core ships 84.x,
so add a patch that drops the upper bound.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...toml-Drop-the-setuptools-upper-bound.patch | 27 +++++++++++++++++++
 .../python/python3-zopeevent_6.2.bb           |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent/0001-pyproject.toml-Drop-the-setuptools-upper-bound.patch

diff --git a/meta-python/recipes-devtools/python/python3-zopeevent/0001-pyproject.toml-Drop-the-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-zopeevent/0001-pyproject.toml-Drop-the-setuptools-upper-bound.patch
new file mode 100644
index 0000000000..2e344941f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zopeevent/0001-pyproject.toml-Drop-the-setuptools-upper-bound.patch
@@ -0,0 +1,27 @@
+From 28dd5e6f6c60970c1e6b0a06b04f627a9d104c97 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Nov 2026 12:01:23 -0800
+Subject: [PATCH] pyproject.toml: Drop the setuptools upper bound
+
+OE builds without build isolation against the setuptools from
+oe-core, which is newer than the upper bound.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 1ee7782..cfe1e75 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -2,7 +2,7 @@
+ # https://github.com/zopefoundation/meta/tree/master/src/zope/meta/pure-python
+ [build-system]
+ requires = [
+-    "setuptools >= 78.1.1,< 82",
++    "setuptools >= 78.1.1",
+     "wheel",
+ ]
+ build-backend = "setuptools.build_meta"
diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb b/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb
index eace9d0e2a..de00abf231 100644
--- a/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb
@@ -3,9 +3,12 @@ DESCRIPTION = "The zope.event package provides a simple event system"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"

+SRC_URI += "file://0001-pyproject.toml-Drop-the-setuptools-upper-bound.patch"
 SRC_URI[sha256sum] = "b97d5d6327067ee6b9dfcbdf606ade9ade70991e19c162e808ea39e5fcf0f8d3"

 PYPI_PACKAGE = "zope.event"
 PYPI_PACKAGE_SDIST = "zope_event"

-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"
