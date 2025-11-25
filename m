Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F86D0EE13
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 18:09:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.731.1764094148917602682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 10:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gP5ZJLv9;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b566859ecso5159047f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 10:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764094147; x=1764698947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o6kPZx5ETwOH0T3cnCAXtYAzbIutpmG+HR33V7JtR/o=;
        b=gP5ZJLv93JWH1mZBlDET7Rb8Lt02af9XHXtiSCU5/Q/eEWd80rmHmRc+RU1gwUVZWi
         Hce71bf9naVBd4SYhXq8qI6auLHuEDMkS0MGeoLoddr8mPFT3xsgl+locNHr8XXRH0L0
         B5IvMYdKS722EulimSCk+enm5s7eYs9aUi/bhRTOopxmHrPyVAnj3ZqkRGU6waET9wYk
         x4UTExIixPWejyhnt7u4YWTvwf+q+gI5WSqZUQgWWDtMJkOEgNs0HmzqNeIDb9QpcQm+
         Ou0f/A1RxEpaLTJKOHJfLresQWVr7EL20x1vjFayGq3hRVnYzdvr3PyyHECokwfnMluj
         dwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094147; x=1764698947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6kPZx5ETwOH0T3cnCAXtYAzbIutpmG+HR33V7JtR/o=;
        b=N1O20xxG2VZ/uZxU5Ki8GUHtMbihNaqQVeT94aMLCHdyrBtGI+32XKO2TooLPkNMps
         zKwO/W4qYEfxkOR34Ysgg319Hub63ses8JT2CY7XU/aiiPRe7oO+sR36pAM01erhR8H1
         14pBu7IjNo14EEPZrTinB99325PVJo83XlSL+hdURLPIrhxvcd3F76UIVSj9XorzgvD2
         H+4Pcz4WqMks4mN/OvMrr9bnYJ41Q8krs6eEHLpHjfP3DxVmxepUoD+LEUtL7mf9wg+y
         CCtdNQ50Fr0/fUmQwpp1K2fe5Lk4E+aJXCR6S5dRpJ2gfF/3BBTbgYVavK4fD4KRMAxS
         uTow==
X-Gm-Message-State: AOJu0YzSgcM7iqXu8DQA2lIfHnvusIfMqnthtBCrbRZR92kHp5knGnRT
	3Ve1w426pazPZP6soA8Y641z7zZttn/7PVaDvow5Ntwf3ho8A029hRqoiPJYEZRu
X-Gm-Gg: ASbGncvbjZaW/G64mqgqULmg7J+vY0vqSlRvXjCSA6xLrZ/xC4m/nLdP8RLO0nsykD5
	9QR5MIGYyYj1g20jjr1SP79s59eSyjFaBMcR79Sr9epOXjwegBtqnL3T4IL2nv9Tr94HrhizbuU
	+DI0KBemiNhNXpyGRl94R2BQ4YGT2YFLOMwH9+KaNkq5Iwp0bsFTXWAt54ZXu4Fd949pVz0+w3k
	/JC/ua6f58SmNDNAYfdDdieXszo9vGgM3KhfdqS4hdbnt2vhldtX4MDDyyJonPtIexNF8FKGkFF
	OI7NalT4eRIQWzUePkXKbpaIaAix4+5wAkPhZYBlQ0GNOoryffJGUe8orO1yLJBXNqRszr2Ijr5
	xlLKW2mu9qHzEjX0E0Sy9NjKR9/ByOxa6pqNRTa5EDAZbdB+UssTcbhFkTKATsGwWU+9h5g+jos
	/XJ2TAUbUdFpMJPO9QOC5fy6jNwdu6HECOX3gS+01xGXT7LPveLBO/Btgnb41a9WwWb2NNw5Ru0
	4iEBO0Z1P+l6xV4aMROKYXoEV5Gv+xDfbiAos1l6mjQ
X-Google-Smtp-Source: AGHT+IHz5q4KyJPqMPxBPdsvCoad5b1uFvNflYUYxp3fValSSry2oKb0sOuxxAr6OJK4tsHjfH2jJg==
X-Received: by 2002:a05:6000:2401:b0:42b:3963:d08d with SMTP id ffacd0b85a97d-42e0f22738bmr3440971f8f.21.1764094146897;
        Tue, 25 Nov 2025 10:09:06 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-30e-f95e-1c9a-8ddd.ip6.access.telenet.be. [2a02:1812:512:2c00:30e:f95e:1c9a:8ddd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5a3sm35560212f8f.6.2025.11.25.10.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:09:06 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: t.f.g.geelen@gmail.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-tenacity: new recipe version 9.1.2
Date: Tue, 25 Nov 2025 19:08:43 +0100
Message-ID: <20251125180844.40549-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 18:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122060

Moved the recipe from meta-homeassistant
  - all credits to them
Added ptest
  - skip one test that fails on qemu

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 ...ip-a-test-that-does-not-pass-on-qemu.patch | 27 +++++++++++++++++++
 .../python/python3-tenacity_9.1.2.bb          | 19 +++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a172f8c676..7e8ab54639 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -96,6 +96,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-soupsieve \
     python3-sqlparse \
     python3-starlette \
+    python3-tenacity \
     python3-tomli-w \
     python3-tomlkit \
     python3-trustme \
diff --git a/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch b/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch
new file mode 100644
index 0000000000..7fb9458a32
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch
@@ -0,0 +1,27 @@
+From 8895af81a672bb8aad2aa8e32b93cb9ca96cac63 Mon Sep 17 00:00:00 2001
+From: Jan Vermaete <jan.vermaete@oip.be>
+Date: Tue, 25 Nov 2025 10:52:15 +0100
+Subject: [PATCH 1/1] ptest: skip a test that does not pass on qemu
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Jan Vermaete <jan.vermaete@oip.be>
+---
+ tests/test_asyncio.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
+index 0b74476..2da0784 100644
+--- a/tests/test_asyncio.py
++++ b/tests/test_asyncio.py
+@@ -192,6 +192,7 @@ class TestContextManager(unittest.TestCase):
+         else:
+             raise Exception
+ 
++    @unittest.skip("Failing in ptest with qemu")
+     @asynctest
+     async def test_sleeps(self):
+         start = current_time_ms()
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb b/meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb
new file mode 100644
index 0000000000..76d23aee40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Retry code until it succeeds"
+HOMEPAGE = "https://github.com/jd/tenacity"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
+
+SRC_URI[sha256sum] = "1169d376c297e7de388d18b4481760d478b0e99a777cad3a9c86e556f4b697cb"
+
+SRC_URI:append = "file://0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "tenacity"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-tornado \
+    python3-typeguard \
+"
-- 
2.47.3


