Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD72CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 10:05:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10223.1762941897779267564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 02:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDxmp33/;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b2dc17965so540235f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762941896; x=1763546696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amf785e1WeylEBMWp0x+Sk6aP8cDHXLJ8vWPtouAwIQ=;
        b=XDxmp33/SHGfoEPcrOtuzOOgXONsRPC8y/gAAljimh7cXXA3wHdfyFf2Z/ejlDwXaw
         9Egk9MgD5LydaBsFqXD4wCjhPJzuO2vuu1Ex67lcSQ1OsgAy0bdThFtaapzxejLltrwM
         eG4aZWMCjc/9lYlNZCB/I0gruDDiR7nD5LPSDPFTRwuUeZzRPfNzJR2j3KsAgmYRQcBQ
         HAO6X+MSgRzO//08wOmgYU9qkmC5Rdb9Fe90Lix7tKHTHjauAY5napNypKQo6mYMYQKh
         /pwamxqm7/wp6wX24r3Pt//FuycbxtsL//rCzjcTYtIFdpswqqa25aR8W0HYN7wHydth
         3/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941896; x=1763546696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amf785e1WeylEBMWp0x+Sk6aP8cDHXLJ8vWPtouAwIQ=;
        b=Er3WUTl/G/gjqcDwYAkdOy5E/lJLzKtnp6lwLjbncuZFdx+xYxmfXCGj3vKR+c7Tmn
         LvFB+Vqwv4TJFc3tzRvIemIqqh0vPbUxHoizbCA6by8X4qjnUw5q0jiPVi3wGNsu6Ei4
         Hq4bMbTcsD04eLCRNtZbBAjPYwsJG0w1P2hUMOzbaruI1suHrdZ5SUAx30dawZmqova2
         hkaJq4yF7wAtZTnMVBVIu5AunL7KX9Nh+xhgAxZ0uzgGxHzzjLIRmoLxDfJe1AssnMg4
         tDDJwVZU6JGsWNKOZwLuSJbvhb4YrW49ukrs4FceK8MhVgYipOxM/LMXg1Qvim0wUHBa
         YoIg==
X-Gm-Message-State: AOJu0YyvfDd9AmVZZwc7I0UwL/+yyoSecDoy9u6JC5cRVdPyx3zQRWA/
	bto2Q2gWnK+jSpgTZ/fd3uBh5u9Zw/0lsHvI0XpGQYrzqtJRSPcLTMxd8E6/3g==
X-Gm-Gg: ASbGncsAr4zbkD7fN0lbLjgCnYUhGPsmdRkQy5cxe8iDYnRMPRVA4AmdimqJZwcWoQy
	Cd3mwyrtKf9YAp0P41b5vfkEuk+fAMlrKSPNhu2rfC1xfvlW/4hLWm+lobXilaiOUpeuCoXArCR
	2UIss94s4iDbOkhFmHyM57TpuvmhzCY+4+BRRmZmuNEz53MTfG0Bs3M65W151sExthdj1ie7ATM
	V3BNzyeeIW7jJPT47SqVSZYZtWzqRq2prkH3ozPynA7sfZraTBLjMOkfdZCKvIbHqG38M3EecmG
	ljCP6yEroxyIg6U6u0EMekg4PYS2kGxlI8pa6X1+OpdDXKn0GGz//9SMxQKkqxL15CdaBhzdGBc
	xlt9WrHb9+iGcUNtIbuJYPiC3jf5Nlrjkf17nnEdifNmlQHdGOkyec3yME6Mo4LbeJUxuO4EpCF
	TeDRoJZ3cqopGrMg2vx7x8Zw==
X-Google-Smtp-Source: AGHT+IHZbh1eyCHKo37b/K+S/rb33C7vWKFNyfzLK8TMRLgMbeFbPbkSEPcmdrXINxysc5JT9E9AUQ==
X-Received: by 2002:a05:6000:1863:b0:429:bac1:c7f5 with SMTP id ffacd0b85a97d-42b4bda4fa6mr2153148f8f.44.1762941895721;
        Wed, 12 Nov 2025 02:04:55 -0800 (PST)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm37276170f8f.44.2025.11.12.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:04:55 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 1/2] python3-scikit-build-core: Use cmake from PATH
Date: Wed, 12 Nov 2025 11:04:53 +0100
Message-ID: <20251112100454.589682-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 10:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121528

Added a patch to remove using CMAKE_BIN_DIR. Instead, use
the fallback to find cmake from PATH.

It's a pre-requisite for building python3-nanobind correctly.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...e-from-PATH-instead-of-CMAKE_BIN_DIR.patch | 47 +++++++++++++++++++
 .../python3-scikit-build-core_0.11.6.bb       |  5 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch
new file mode 100644
index 0000000000..71319c0245
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch
@@ -0,0 +1,47 @@
+From deb225d2aaeb44f6a4c01eab25624193351f7f58 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 12 Nov 2025 09:56:59 +0100
+Subject: [PATCH] Find cmake from PATH instead of CMAKE_BIN_DIR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+python3-cmake is patched to run cmake from PATH.
+
+Another detail called CMAKE_BIN_DIR is not patched out, but
+scikit-build-core prefers using it in its program_search.py.
+It also has a fallback to find cmake from PATH.
+
+Remove using CMAKE_BIN_DIR and keep the fallback.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [oe specific]
+---
+ src/scikit_build_core/program_search.py | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/src/scikit_build_core/program_search.py b/src/scikit_build_core/program_search.py
+index 7995c14..f82cad3 100644
+--- a/src/scikit_build_core/program_search.py
++++ b/src/scikit_build_core/program_search.py
+@@ -90,16 +90,6 @@ class Program(NamedTuple):
+ 
+ 
+ def _get_cmake_path(*, module: bool = True) -> Generator[Path, None, None]:
+-    """
+-    Get the path to CMake.
+-    """
+-    if module:
+-        with contextlib.suppress(ImportError):
+-            # If a "cmake" directory exists, this will also ImportError
+-            from cmake import CMAKE_BIN_DIR
+-
+-            yield Path(CMAKE_BIN_DIR) / "cmake"
+-
+     candidates = ("cmake3", "cmake")
+     for candidate in candidates:
+         cmake_path = shutil.which(candidate)
+-- 
+2.51.1
+
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
index 73cbf2a3f9..93a83ead65 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
@@ -9,7 +9,10 @@ DEPENDS = "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
+SRC_URI += " \
+	file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch \
+	file://0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch \
+"
 SRC_URI[sha256sum] = "5982ccd839735be99cfd3b92a8847c6c196692f476c215da84b79d2ad12f9f1b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.51.1


