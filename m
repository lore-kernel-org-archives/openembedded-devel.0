Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6F6C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 19:41:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.36723.1743363656062679069
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 12:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FFTHtisD;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so25829275e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 12:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743363654; x=1743968454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUFiHTna46shMAqPwT1BSaZ7C14dsNumCQ+GZnErym4=;
        b=FFTHtisDxmRshK8M7rqhyfcxEC4iYx1gGmNoi3pLeFA1n6GDYTYIwLUYpcHvHHs3j5
         fNIeRP0AFvJJhiJQcEErRDc5xHlBU5fgqygcs5cOtC97YQN43JbakEa1gyr+TeA65CYA
         incIsLC85Iv9zvufxuD4ItZMwnOV4fR2r5N/es40O1D+aJoc7+/kZ/fkFUSaAeftXJLs
         lDkOk0pw+7vLGn0Taw7XphYbDhHMLEylITEMEdl8PXVNrZEP6Cr/8L+T1KLcYKCaEQU7
         OcVgeStH5zbdxVl6rf7plIl6PUqgSgwEhyCW5oqLgXUbIXQOF508Lk4nB8Ht5FJ4qRFw
         vBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743363654; x=1743968454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUFiHTna46shMAqPwT1BSaZ7C14dsNumCQ+GZnErym4=;
        b=JcBLgPMtWD2KXU/b7jLLHVMNrvfrgv2lZrlCyDFo6kcmiI7SarZJfL3FvzjjhZw4UI
         JKsf003k89NKq1j5OQw5tGb2gZV29QhIVgCcWaF1ZcHd2h8M9BlsMFb9r6zfJFmOSqvB
         pBwgSGOlYS+x1vQVCNfBPaTiG/5DqvRfsQg9MiZ3VhwY+8dH3tqJMvomtf3J6PpyoT8j
         jkNY3wnuh5pGz1l8PPBw8SQv2ivQVrlewsGg8FHtPaF2HqN4C6wdwy4Vkl0rykixsGMn
         5vd9o0TYTtOReVVCocln1WsfPNn7XbBsV2xP3pM7aLxsWF5mJslGPs4Xi8V7nMGJeqQe
         LP5A==
X-Gm-Message-State: AOJu0Yz/siPXPWoEaqE9T08fA0fhjyG43oNGO7RJXdWvqHWMu1eJ9JFm
	acF1Y05fLOkbdZJroW7jGFBN4DNp1D23zKT9U3jIvhdWXu0yuBPZl5oytg==
X-Gm-Gg: ASbGnctK1DK973A4qlsSaq1JROvdBwAC6L9307kmLnWIqxSW3vTIcFwi612c2d/oKVZ
	HJ1JWd+4C083jOf3ZYRmG0B6YjtizjoOrlEj8YgGehmwFAYcKkzdCh1lN5eSBXXugyoQ3f9X51I
	OmWfhQtLcAuMX34SNqc4a/QMMDmb4PsrvmcJV2m23c3C6dHn090fnnoO0yJ1eloLFAo1zb63vRH
	iPzO3tN+tN6mWwqHYe8JcIS+TCHZuddyE7RN5Xzh/Ulqtx1NQPAnzAn8CVnUt77+scir1Kk6DRu
	eUZdAe8bFWZp0ixK5fPjw2joSC8wA1yWjgbgyG+s0/JBG54HsI7zN7qb4xbd/KjrpUP0MTRxSWS
	cABgvfOjkEuzFH2SbTvNrokcXIrr7TkuC/fLwDXY2ON7ckr8sy3eVE6FlEl1yvA==
X-Google-Smtp-Source: AGHT+IGUUMb+gkQumD4HmswUu9YJflo9NTimKW/B41bYqaCrQ5OzSwNS7psDSLl4GdYSPnLQF0z1RA==
X-Received: by 2002:a05:600c:470f:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43db6289ce1mr58312565e9.24.1743363654032;
        Sun, 30 Mar 2025 12:40:54 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90000f48sm98940435e9.37.2025.03.30.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:40:52 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-breathe: new recipe version 4.36.0
Date: Sun, 30 Mar 2025 21:40:34 +0200
Message-Id: <20250330194034.371789-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 19:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116391

Breathe is a Sphinx plugin providing beautifully integrated Doxygen output in your user-facing documentation

Added to ptest list.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../recipes/devtool/python3-breathe/run-ptest |  3 +++
 .../recipes/devtool/python3-breathe_4.36.0.bb | 22 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes/devtool/python3-breathe/run-ptest
 create mode 100644 meta-python/recipes/devtool/python3-breathe_4.36.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 101d39d969..fc71eb4003 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -14,6 +14,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-aspectlib \
     python3-bleak \
     python3-blinker \
+    python3-breathe \
     python3-cachetools \
     python3-cbor2 \
     python3-configobj \
diff --git a/meta-python/recipes/devtool/python3-breathe/run-ptest b/meta-python/recipes/devtool/python3-breathe/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes/devtool/python3-breathe/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes/devtool/python3-breathe_4.36.0.bb b/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
new file mode 100644
index 0000000000..dc14f1ce1c
--- /dev/null
+++ b/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Sphinx Doxygen renderer"
+DESCRIPTION = "Breathe is a Sphinx plugin providing beautifully integrated Doxygen output in your user-facing documentation."
+HOMEPAGE = "https://www.breathe-doc.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9e49eecf36fc015de7c61a0247df75d6"
+
+SRC_URI[sha256sum] = "14860b73118ac140b7a3f55446890c777d1b67149cb024279fe3710dad7f535c"
+
+inherit pypi python_flit_core ptest
+
+SRC_URI:append = " file://run-ptest"
+
+RDEPENDS:${PN} = "python3-sphinx"
+
+PYPI_PACKAGE = "breathe"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND =+ "native"
-- 
2.39.5


