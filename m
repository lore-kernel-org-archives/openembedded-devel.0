Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.1304.1591500308663981843
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YXp6OouC;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id ga6so4306978pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pjNUzcfapJZUOdWe7YonBSaeSsJJfMpAV6IOqkQgIlU=;
        b=YXp6OouCaz3AAM68QYbLA58bb1vkN/akwnmjM7oPZMMEW3/F6htZBa334SYqZdaadh
         H2hCwxISB8oynVZyvWlUOZG/XwCzSh//u8+zW7ovP7TCdiEOt5xb6Y3ASRf0oPduoTmP
         kFMCeYuDrc9hLWuTJmDQYjiNgmFItyN2CAO5IULLSMu2Rs/5fw/Anr20G19gebB9pijd
         6nceWIXsFvWeRiHGnjmMlKBz66q1aqkW1loxWwYEaJZuv8rXb+LEyJgE8rdfEGKY+iGD
         LSy7lSHQeFSRzlSwNHKDGAdCCfyWw6KS8EvaBCu0B+VacDnHjykHnTcdUR1TS1Wvml6X
         t0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pjNUzcfapJZUOdWe7YonBSaeSsJJfMpAV6IOqkQgIlU=;
        b=UN+RcV46ekamaj47G2s4nFIaPEO0Hi4zYaH0hNFm2SMsjIbQgnD2yLdPybogkb4sgd
         GW2fUJvTbRx84HLOiovumckDbNwD2I/KqCu5aDHgwpIX10/3lJzv9BR8vN2ypNtWSeeg
         aWgrOD4w2w3FO6Kxh/6rajGhhZPcrv1XX0T0o5B6tVILvXVXTzhjyTIEqsNCAcgN/Dxm
         SrNslsABR5tqr4XRpwO9VjlixTBicNcg/41++Y3l+tCDg1a/n5qHwaQXOqJ1U2/0IMz5
         cS4oOVz4aOJLhGlxjcV8oUT9YNXcyok3ZiIO9lPHi2gyqQrceWPEHsHnVqLs82v1/tMp
         YiGg==
X-Gm-Message-State: AOAM533Ida1MjPLgE26Shu4gP/eDQtnhxj0EgspRdpi366j6KXtv9OX+
	+pMkZ/IRmVVlv2tQkem46wsiWCUq
X-Google-Smtp-Source: ABdhPJyTDaMEvNX0AU2FIxyFylIMt8hHh2E0UuYI3dZ7Blo5JwwRam76m/i7TdmfnOMQTgJEuXfhfA==
X-Received: by 2002:a17:90a:fe10:: with SMTP id ck16mr11247285pjb.147.1591500307961;
        Sat, 06 Jun 2020 20:25:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 24/26] python3-pycryptodome(x): moved to OE-Core, remove from meta-python
Date: Sat,  6 Jun 2020 20:24:34 -0700
Message-Id: <9e2686e3d1a7a7e0126657ea81246ee9f52d080b.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a8f3c00d8d113b46a49584682e10435157d516ca)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python-pycryptodome.inc            | 29 -------------------
 .../python/python3-pycryptodome_3.9.4.bb      |  2 --
 .../python/python3-pycryptodomex_3.9.4.bb     | 10 -------
 3 files changed, 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
deleted file mode 100644
index 63b4a4abb4..0000000000
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Cryptographic library for Python"
-DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
- cryptographic primitives."
-HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
-
-SRC_URI[md5sum] = "f990716b49add7b14ea8b8a961fb3746"
-SRC_URI[sha256sum] = "a168e73879619b467072509a223282a02c8047d932a48b74fbd498f27224aa04"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
-"
-
-RDEPENDS_${PN}-tests += " \
-    ${PYTHON_PN}-unittest \
-"
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests = " \
-    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/ \
-    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/__pycache__/ \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
deleted file mode 100644
index 0c062dddf8..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
deleted file mode 100644
index e41c14b142..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
-SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
-
-FILES_${PN}-tests = " \
-    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-"
-- 
2.17.1

