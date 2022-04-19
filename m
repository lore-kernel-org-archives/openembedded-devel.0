Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682CAC4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.394.1650392430149488529
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dwbyKlSH;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so2748690pjf.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pMYDdxxTNRFZCa1sDnJ7pTymBq5pLtKpl0IDTGCe2E4=;
        b=dwbyKlSHbrvSWkyNS9yNBjPy1VzpvUDa/OgXzoEdBV4L24TygxJ8Aip1CWx68TkhGy
         w8KeuJjBcGxsT5h/a5SrP3gIMRMGckZdEuTr6cpdoqzmmfihicCqq2vDjNTgTIIeZz86
         n9WcsyX2N+Z2E/VWMnXOAVvxLyRNDyCg+VOGKo6WGvaEuFfVOoiAcu1iASnWWhbXQcsG
         x7m4zL73N/0f6PUqiya7KrilrEKgG2702F01PZ4SjIYOnqLQiSIZGRw7BrVPoGhgFf3q
         Y4MZ3MDzC/xkQC6fNF95/T37NkTQzVJsPiSO0CFz3GA7vlZWA5ko327UZmC75GyBL1Zl
         F27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMYDdxxTNRFZCa1sDnJ7pTymBq5pLtKpl0IDTGCe2E4=;
        b=feUAKv6U4qEoPPzE6MGPhA3Zq94DtYwMU4Nb9VsSrYrtc/pHJ5qfQHTp/ewzlvbFJs
         CP9fBGS1LR997IONOGnYdFVTdErhDggHQoAdeTM6EKKmn5JvmCwIJQVF5KGVhfhrpfd+
         4KTfUjzGMBtQBjtlH8DYRUGXJZe6yglsovr/5/EaY+saRW6Aus1H6ksoXyiI9gygeEaS
         J4E9AW/l8EFmYwMQfH5DsOk/ss0XCQgX7Giq+gAyGYr3Sp2eYBaIDvSpGZUtz5Ih/PqH
         6KUjm8FSDAczXd74HaUKDsqNWOCjsMNFCXlnwib18kLZhVWGJcwYivsknuxSZQiGywgA
         zpsQ==
X-Gm-Message-State: AOAM530X4foz2FZsngnRMq0yG69uDLrbpSLPa1eozT17oH5vhkPSCZ3x
	+GGfBQ3PXVSEGrbt32M1kgQoXV2vDPdpUQ==
X-Google-Smtp-Source: 
 ABdhPJzhnUP8U0R7kt8Ayf5h6bo0QarwU5AXaPWQfDZUJUXmrBJpPiW0rMBMM2ER20Pq3lJ36F+2Xg==
X-Received: by 2002:a17:902:b7c1:b0:158:9a1b:31d6 with SMTP id
 v1-20020a170902b7c100b001589a1b31d6mr16758111plz.94.1650392429474;
        Tue, 19 Apr 2022 11:20:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 19-20020aa79113000000b00505d5d15d80sm17170699pfh.14.2022.04.19.11.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:20:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] mozjs-78: Switch to system libicu
Date: Tue, 19 Apr 2022 11:20:25 -0700
Message-Id: <20220419182025.1368634-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220419182025.1368634-1-raj.khem@gmail.com>
References: <20220419182025.1368634-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96701

Fixes build with gcc-12
intl/icu/source/common/stringtriebuilder.cpp:388: more undefined references to `std::type_info::operator==(std::type_info const&) const' follow
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
index 3700d88c24..c23950301e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
@@ -27,6 +27,7 @@ S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 DEPENDS = " \
     autoconf-2.13-native \
     icu-native \
+    icu \
     cargo-native \
     zlib \
     python3-six \
@@ -48,6 +49,7 @@ EXTRA_OECONF = " \
     --without-system-icu \
     --disable-tests --disable-strip --disable-optimize \
     --disable-jemalloc \
+    --with-system-icu \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
     ${JIT} \
 "
-- 
2.36.0


