Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC77CCFA1E
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 09:52:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10078.1762941145726558686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 01:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhF9G2U4;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b379cd896so333118f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 01:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762941144; x=1763545944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amf785e1WeylEBMWp0x+Sk6aP8cDHXLJ8vWPtouAwIQ=;
        b=LhF9G2U43DC+xfpiwF0oxVdGODQJ1qflnCBE4kbG1fm3a+JYWhE4L7jC+wjuv99n3J
         A+o7SzefdzAzmdyn/c/g83TOZc3BsBgdRd6vIuxeF6QeY324fi/qBbMV+uVES2PNt/6P
         QNQr44d/fxe+xRyDVzJNtg1aexPSxcn6V+9gbwR3bZmHACqWR00ez/AMlb7yrtpPxjOW
         COnOroGTG45vb/1qerKkWqdcngInhyLdocwcYOQi61CBzGKtO6k4WO8pe9AFCwH3zhRF
         lsS+41vI4/4njpcg9JYw2aQsmLNlLCIrM5BXdhJvLaDH0y4VEfQU8bVWpQxgukwdJA6e
         jdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941144; x=1763545944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amf785e1WeylEBMWp0x+Sk6aP8cDHXLJ8vWPtouAwIQ=;
        b=rGV06+853VR31rX/Bm3oH7Qatj7FI/bzSXKw28ub1YjGzGdMzBmYRHGBIr5zZs2kll
         p2BZUMb/KudBJoLrXUfXHfnGuwbiv2Dt6tC4hYxnONcATdpSzQs2405g34HTaeu3Pq74
         EDfkDCoVBXtYvs0NPi4hg2oRQeGwwqr6nZ5GleGCvCsUwGmf+BKY6qx2LjGWjpKumDzQ
         1zsI72C5p6DhnL3pDUdk+XwOY5u1t8WwCIUIjYObHUtLQ235oFp7pq45ZCuuv+2NXGqI
         eD43kq1AvigHuHUSHX8TfAOYXW5wbQznXm0GT1q48vej/YYGmheuP1WKTYU+naDys05E
         04Pw==
X-Gm-Message-State: AOJu0Yx1eHWdirFqfCzFVYSUzZoYbWintalNdn49biL7om1D08x0utxy
	9yEanQtvHaV5Kd8ww1TaVHg64q4ANaYoe5RZXX4OqLpWNkaR8oAqi9q6pBEFDA==
X-Gm-Gg: ASbGncsm1oZ7JmZOgpyOgcM4EvS/SOUnVSDg9CWprx4SxBeTde3vcclcnyo8RO/1yPs
	JlRjgJIDZDxgEX4FdKPx44qAhsEoNv0iqhsOpA3Uy6m+25VIKqyedlnz+/lStPmF6/DtGA5fWkC
	UQ+BkajpNwrv8hlNqotJKl9m+zTqYZlDaB6fDpn/nrt/G39sbsf1vjNcbygR9CNFhSUHhle+tXp
	jyetImseBM/7iZb5lmYM5HOmE0nwmlXIS8KFpIMV8pwqgfET2GW5SqtezYQl3JO1soKcF7d1/NN
	IOBEvaxGFN9nE1X9xLQlcP2KEgQs1A7vY8o5PTCqSTGIdfSIg0WdSv8nVKTR3taXtjXMxkdULWU
	b5nQDeh9Je7UbzBaA4mVirrg/SeR7Sf3OlvvWueU+o+ZdJnCrnExOi6x0C/N5hRrqnM/5GpVvYo
	CYf0g3YhgR19sOp3LHZbwu2w==
X-Google-Smtp-Source: AGHT+IHDm06ftChAbHSuTsan/cdqQ9M4zNaStPLGAsYt0sBhKNtDHtypD3IrNvnq6Xn1qQZ4ELrwDA==
X-Received: by 2002:a05:6000:2892:b0:429:c774:dc08 with SMTP id ffacd0b85a97d-42b4bdd3e92mr2217020f8f.53.1762941143509;
        Wed, 12 Nov 2025 01:52:23 -0800 (PST)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63ba87sm33892185f8f.14.2025.11.12.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:52:23 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-scikit-build-core: Use cmake from PATH
Date: Wed, 12 Nov 2025 10:52:20 +0100
Message-ID: <20251112095221.587048-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 09:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121526

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


