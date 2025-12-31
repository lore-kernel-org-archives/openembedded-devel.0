Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC06EEB575
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 23:58:55 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96383.1767225525592144116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 15:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5GCknAd;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c3259da34so11518804a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 15:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767225525; x=1767830325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7Ks0cmLd62vVgXyga7Raqw4AALnLDbp0rylOCBekj4=;
        b=C5GCknAdcyt0pg+Q8iOdn3ag04VWCTo4VCdqZDgUH/2g7C10rJbTfLwvi+A3OM6oBR
         xX7JIdqFvoXKRdlirKlw56ZDVFySuOv9wkcyZFt5BNj6+TOikOW+djAmWUbyhZmCDZeB
         lMTYCOHZ9UU6yDRZ5iNCyXqXVqJSye4HklPzVN2wfFXvhqlbUqjMjXN7QzEQE6W2O6pQ
         6gw4K4bfsVXBfTjh/QEwoQGI8n1ZDr6kd+N77af6sYGQOx4k4L7fQdHbPoeho0xNcu1L
         vZ8yMyp5ltyUIlfx4zIldSpcO01ekjXLzTApZO0QbdSLe2Sq7QxbKfIVlwDlW3Ssf8s2
         YKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767225525; x=1767830325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7Ks0cmLd62vVgXyga7Raqw4AALnLDbp0rylOCBekj4=;
        b=klZTOiQUiPorW5MTKGidSf5QeX3PX6rNuI24Po4toHWK+gB7O1TzL3wh1ZOzzgwd/3
         4meXoW1QMXgWiuuaTxQN5rq+Arig4Y2p2UCg9ekkK32Oe8TAKddSzHREK2Qgjbv/rn65
         jOCrmNKzdSs7gBdLihQ/tAzDsJD0MNc7QWcgWdEzc1xZhe1kCYfi1u9jX0bSfTSCQnUF
         SnLocqy6rnqCtHdaMEdy2YCy5st1QY2GxcSpul8gMuj85Ame3IEhS0R/+1AjvsUfHCrm
         qqy5XoAdLBU9HXI/gnFWz6PZuviJhsdOSkvPUpHUITBC5qYWRMK11iszJno0KM2eOfdg
         wEpQ==
X-Gm-Message-State: AOJu0YzjztSqW04wwVzr1+g0xmBOcQ6aGevOa5v9uc/LODBnJDOho6zn
	0uzYe3LBHSNwd5qw51NmzzVQYVXlw6Vbrxg+xElKgW/MuaAF9P+RlLjNOEFiNQ==
X-Gm-Gg: AY/fxX6tFWXXW+wTqFdf7sIeNfq+NwFhC7qZdQdAgp6qnpdDLF7vftdw01Ftsc3R6ud
	uqOGf4Jdz7i000Pt8i/vhtRaev8lQa3YC/hjM4/v53D8UrR0cne//MR2yQFOtkp0g8BUKGp2iqJ
	poHPbM9XJk1mpKL1hl4/t/13Y7j4e3ph/NR/QTji7Um2Med3h9w4qSuXzASfnPB3HrwA1Oe5nDu
	fHWQMBl26gY4tNBmNyWq574koAArjxlnVAiXqH7kmNyoZKpyyJFax2JMP4ILjmDHmFpVQAoLF0H
	8SCwc90vVwZeAh+bfXaINFQwKPCgxIoBxHK4NOIWQPOmBEqT5WrRWt/KGu+jq9NXhXF2tLxF2Z2
	NkUDEMT+4S5LKTDHa7tDvEBZ3Cm/HzS4VSeKBfo3ykNGDD9mcL9wrNAKgGz2G27hp37FO/pqdWn
	Lmp4lIldAcukyQCqZ29OPI25S2+lF1bfHBmK+bXwUn7OnDvWlRJRkiPw1jskEXXXmrgIf6QgHK9
	Dn+FDST9vB+1YXATsyT5qqr/IZTEBk=
X-Google-Smtp-Source: AGHT+IHIugkZB4XO4Cn46BFBb0QWa9X/VCCPT2JPK2gobf/qf/G6ly3ZJ7ZhIe61TKh2DVb9gVTBfg==
X-Received: by 2002:a05:7022:7e8e:b0:11b:89f3:aaf8 with SMTP id a92af1059eb24-121722ac270mr41399197c88.4.1767225524568;
        Wed, 31 Dec 2025 15:58:44 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm138921245c88.15.2025.12.31.15.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:58:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-propcache: Update Cython to version 3.2.3
Date: Wed, 31 Dec 2025 15:58:42 -0800
Message-ID: <20251231235842.1414205-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 23:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123083

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Update-Cython-to-version-3.2.3-184.patch | 33 +++++++++++++++++++
 .../python/python3-propcache_0.4.1.bb         |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch

diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch
new file mode 100644
index 0000000000..26c4a2b20a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch
@@ -0,0 +1,33 @@
+From 049909ed3db8527aaae86a15d3c7998988ea77a0 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 29 Dec 2025 13:21:12 -0700
+Subject: [PATCH] Update Cython to version 3.2.3 (#184)
+
+Upstream-Status: Backport [https://github.com/aio-libs/propcache/pull/184]
+Co-authored-by: J. Nick Koston <nick@koston.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ packaging/pep517_backend/_backend.py | 2 +-
+ requirements/cython.txt              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
+index ce79c4e..e05a9dd 100644
+--- a/packaging/pep517_backend/_backend.py
++++ b/packaging/pep517_backend/_backend.py
+@@ -376,7 +376,7 @@ def get_requires_for_build_wheel(
+     if is_pure_python_build:
+         c_ext_build_deps = []
+     else:
+-        c_ext_build_deps = ['Cython ~= 3.1.0']
++        c_ext_build_deps = ['Cython ~= 3.2.0']
+
+     return _setuptools_get_requires_for_build_wheel(
+         config_settings=config_settings,
+diff --git a/requirements/cython.txt b/requirements/cython.txt
+index 97dc5a1..209c15a 100644
+--- a/requirements/cython.txt
++++ b/requirements/cython.txt
+@@ -1 +1 @@
+-cython==3.1.4
++cython==3.2.3
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
index 53ec5b33b9..0a681ac6c8 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
@@ -9,6 +9,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest cython

 SRC_URI += " \
     file://0001-build-wheel-in-place.patch \
+	file://0001-Update-Cython-to-version-3.2.3-184.patch \
 "

 DEPENDS += " \

