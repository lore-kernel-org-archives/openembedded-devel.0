Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFED7C5AD49
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 23:18:33 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3719.1748387906571249295
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 16:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a9+2NttM;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74264d1832eso4193056b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748387906; x=1748992706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7Sx6SUIScBgzZihbgqSF3UL3mtYw4HejCA+hNnJldI=;
        b=a9+2NttM4l6TgBQStHslGQtd27no/Lo16VL0MRZ8W8zWn5G3biK5b3hlMXmDMAuzVX
         WPreO+YDj4n+K+KWBQFFXLjHVyP+U8GF0ACyy3C/JhpKMyRmV5n3UJ+N7WpxAfOmPEjf
         yJwu5HZW0pvBQeDtAT1tXxdVPK91gl2jxK0oXKS2O220ZkUlo1rK/Q8E2F/qAlU6pNAD
         hnn3A8ZGuafn3jEeo7HuuWDqsYw5/cegrGeROAWpAM1lygcfWikXQaxCPRvDK4xaWN4h
         anPgqdDkJsZHFkmzCTAYpgH4yMarz8dVbZxROIOVC8TiDY+p1htLA5ey5Bfkios/xL+y
         Gd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748387906; x=1748992706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7Sx6SUIScBgzZihbgqSF3UL3mtYw4HejCA+hNnJldI=;
        b=a7ngR3WLfdWzD4iuou67wOQAYYR3e1MzsvP3HDRsrRLWc7uE3yke1AhpisGkVeyu7L
         RlpIXMcOpCGMD7QCMLfwYcp6EVo6FhPmWsaKfpliVNM1e/HOYKzeScVZUVxjMJ/eL5sJ
         oBpHmdocQakRBlZmDBisluL+JI92QGVUsEx4KWbUJkq0mYhSo832VEZx7VaGfUV00PVS
         cC+lHdKpgMnkJw8iOFnkHqdDml8lPqBaLqDv9uqIWRS21MiIaDajgipGkrFxf0BTsTsN
         hsjYMCbixfFk8m/ZWQbdOgcF1wJhbsuIMV1hzFKq6Jf6p3XBefo9Ntf5O7jHu5LS6xNl
         NX1w==
X-Gm-Message-State: AOJu0YwXg3Uxg3RXvUy8lVIvGz+aD1OkgllHZ/numOB7l5Va1xhE7IZ3
	k3K+4W25La0Ong62zFCSNV4BFw9pRpJt9NQbfpP3L//DtpEEzIkL+O8BytA12EZq
X-Gm-Gg: ASbGncuECLqe3GDbH/DkXtsOjx1fxCytbSaU09kSeU7jqgz+BO/Us/tBl+Lw9uJkiwD
	zeFDVGmhadSBThpE1vPkCwEjhG29TBUFQOwObn++Oa9U0i9WBiJb1c4N9mBBJcMh9/X1iB4P8zt
	ZWgV2yXNfWW8TTUoTolJtOxyiBikb1WOF0eRLET8iV4mMu2Of8MTVe7FqM5Z+dH/SdGUVCNMqPB
	s0yzmo5Y+Nq4CMycBYr8qkpyg/4N8/UE5oALqeMk0wgBlB4BaDDopmHCDNMxuHvzuC0pDiLUy/N
	XaVXwsvrDA5+6PamQqiVSY+JOynHw28GlTYDMBVdpYw=
X-Google-Smtp-Source: AGHT+IFnL47mwKByOShYJp4y4pEMz2InUZFgISellEia0A56Ac9DYB8Xx7vsxekLH3xadifrFdTmJg==
X-Received: by 2002:a05:6a21:6e41:b0:206:a9bd:a186 with SMTP id adf61e73a8af0-2188c1f8c7bmr23408209637.3.1748387905632;
        Tue, 27 May 2025 16:18:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e34103c7sm9981b3a.119.2025.05.27.16.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:18:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xmlstarlet: Fix build with libxml2 2.14+
Date: Tue, 27 May 2025 16:18:22 -0700
Message-ID: <20250527231822.1570430-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 23:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117640

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-ATTRIBUTE_UNUSED-if-its-not-defined.patch | 37 +++++++++++++++++++
 .../xmlstarlet/xmlstarlet_1.6.1.bb            |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/xmlstarlet/files/0001-Define-ATTRIBUTE_UNUSED-if-its-not-defined.patch

diff --git a/meta-oe/recipes-support/xmlstarlet/files/0001-Define-ATTRIBUTE_UNUSED-if-its-not-defined.patch b/meta-oe/recipes-support/xmlstarlet/files/0001-Define-ATTRIBUTE_UNUSED-if-its-not-defined.patch
new file mode 100644
index 0000000000..1468559e7f
--- /dev/null
+++ b/meta-oe/recipes-support/xmlstarlet/files/0001-Define-ATTRIBUTE_UNUSED-if-its-not-defined.patch
@@ -0,0 +1,37 @@
+From 4e94034e9231f5d8312497b7504f21b7a6062bf4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 May 2025 16:12:01 -0700
+Subject: [PATCH] Define ATTRIBUTE_UNUSED if its not defined
+
+ATTRIBUTE_UNUSED is not defined in libxml2 2.14+, so check if the define is
+not there then define it.
+
+Fixes build errors e.g.
+../xmlstarlet-1.6.1/src/xml_pyx.c:203:36: error: expected ')'
+  203 | pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
+      |                                    ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/xml_pyx.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/xml_pyx.c b/src/xml_pyx.c
+index ab295f1..f1a1884 100644
+--- a/src/xml_pyx.c
++++ b/src/xml_pyx.c
+@@ -21,6 +21,13 @@
+ 
+ #include "xmlstar.h"
+ 
++/**
++ * Unbreak build with libxml2 2.14
++ */
++#ifndef ATTRIBUTE_UNUSED
++#define ATTRIBUTE_UNUSED __attribute__((unused))
++#endif
++
+ /**
+  *  Output newline and tab characters as escapes
+  *  Required both for attribute values and character data (#PCDATA)
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index 80fbe537e5..c8cfd884e2 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -16,7 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
            file://configure.ac.patch \
            file://0001-usage2c.awk-fix-wrong-basename-regexp.patch \
            file://0001-Make-xmlError-struct-constant.patch \
-           file://0001-Fix-hash_key_put-signature.patch"
+           file://0001-Fix-hash_key_put-signature.patch \
+		   file://0001-Define-ATTRIBUTE_UNUSED-if-its-not-defined.patch"
 SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca"
 
 inherit autotools

