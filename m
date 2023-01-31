Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A480CC636D7
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.2808.1675129928236320996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J1G6Dkfi;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e6so5361139plg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEcMu8ITyjxj8wWvTNn5DDcydKE3Eu7dgnKbd03IPHE=;
        b=J1G6DkfiEqEty4QI/w9YaZIhWCQVaLSeQ1TroT8XorKM89Zq1hFZDaEJK5wpNsDlkH
         rj303Lb2FhdrZmv0Mcuxod7HeHPlxEgDPPWJYPeCVWjDe7OKVL7/VD/NIgTxDetSn0MD
         IEQu2Yp73D0mwDvJBpgBkszhahlfSsDCSKjtGEKMWzhjL/40gaum+z71pDGd0UmbBfo6
         xx7eQ1fUtghvYsveRXLmfxaKOvyJMPtmkDXHNKChVH0MYKeobQhr+HurrMQSmLlBPyAN
         nfNhNsDOVdzwWLu86CBi2ayC2dzdRUZVpq0ZPeo1LA1D4SohY1vGxfCAlTzn7+QUhyfX
         T+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEcMu8ITyjxj8wWvTNn5DDcydKE3Eu7dgnKbd03IPHE=;
        b=F8IjKGDxhDRZ1ZB/g8WBjjHG5jF2rhZcOj5k/k2Nr1uEsUkP/cG/aadlJwVDIUIP7j
         GlD1RqdOd1wi2LF55sBzNuG4/GQgCXS5JIn0XeymVd4cziDi10Kfg1Jxb8vtkOSNSQqG
         msk19guzUG8kxN9MOQZo53Sp4BkpY/QFVegtZhJiIsPcmfWtiNwOrK9EC+vVwno65h9d
         uhfm3FkmUyEyDb7dNDGPBRjHxOUlQhh3sXwb3+nw/5O/QusaBGOlMjbArFDOQfNKaBVQ
         D2+WeUCQCcc1Q/bRQiGpYAQ4HB9GDXdNAbctc9ys/8g3HTiMIh7GsVv0OIkehyYCaLYq
         i+vw==
X-Gm-Message-State: AO0yUKVshMDmW4I7SS8bzfMFwaRVXuOpLnipkAIgY0Fjdg8WLp9mqAqt
	oe4WkMrP6yIcPM9F3dDSIZfNjW2elnkreQ==
X-Google-Smtp-Source: AK7set+RP9kMWHADRR1HMtdVyx60/nSf7Uv1mHfie6Hx4V3HXruBXm/1QQN98CmF+nIvLYMj+LhvzQ==
X-Received: by 2002:a17:90a:1a15:b0:22c:912:b80d with SMTP id 21-20020a17090a1a1500b0022c0912b80dmr23679310pjk.33.1675129927413;
        Mon, 30 Jan 2023 17:52:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/8] python3-grpcio: Fix build with gcc13
Date: Mon, 30 Jan 2023 17:51:58 -0800
Message-Id: <20230131015200.3862532-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100867

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-missing-cstdint-header.patch | 32 +++++++++++++++++++
 .../python/python3-grpcio_1.51.1.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
new file mode 100644
index 0000000000..f970cf3c3c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
@@ -0,0 +1,32 @@
+From 752e30eebe5b91c323bafcbea8d450dd5683701a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 30 Jan 2023 10:31:10 -0800
+Subject: [PATCH] Include missing <cstdint> header
+
+gcc 13 moved some includes around and as a result <cstdint> is
+no longer transitively included [1]. Explicitly include it for
+int32_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://code-review.googlesource.com/c/re2/+/60970]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/re2/util/pcre.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/third_party/re2/util/pcre.h b/third_party/re2/util/pcre.h
+index 896b0bd..271a005 100644
+--- a/third_party/re2/util/pcre.h
++++ b/third_party/re2/util/pcre.h
+@@ -163,6 +163,7 @@
+ 
+ #include "util/util.h"
+ #include "re2/stringpiece.h"
++#include <cstdint>
+ 
+ #ifdef USEPCRE
+ #include <pcre.h>
+-- 
+2.39.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
index b0971db1cc..3d45c56b0a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://boring_ssl.patch \
                                 file://mips_bigendian.patch \
+                                file://0001-Include-missing-cstdint-header.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
 SRC_URI[sha256sum] = "e6dfc2b6567b1c261739b43d9c59d201c1b89e017afd9e684d85aa7a186c9f7a"
-- 
2.39.1


