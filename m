Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53630C3DA40
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.218.1687531223584084288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=alVwjJRY;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.47, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so967487e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531222; x=1690123222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KDapf7ZOWRQnic/fdbmpYeQrbSlSsL1XexP0upGyZA=;
        b=alVwjJRYlJrBIjTpuQgpTNictMo2Dtvt3CUYKFCMONxmsySCtqXIamYcNzlimGO6u+
         PTXABwXotJikUngLsKzHf1+f7ZMtektP/SnjN0Bpzr37PuRhvOhdkd/Ubj/uWSQmTLdN
         I2Vg3NZ/fda/z26EHv7NVz7SEtsF29n58el6jiWnWbM1sTC7t/ZT8l5jyY1t4+oIVp+U
         d3Oo1OZUnYpm67CtyvvY5OsIP32TTll1pqWoPp9sz8xZbUgtiu+3nQV2E9QSRRZhqb3+
         RcJWKisuxZDh/8dGj2fH0skO5IXglOF4WEQA0zDoilwDGgIEtShfYHb3zno7bkefXngG
         sVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531222; x=1690123222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KDapf7ZOWRQnic/fdbmpYeQrbSlSsL1XexP0upGyZA=;
        b=iFHib26thj8L/Hxzu510laAOKnO38VQCCylqSDJKVlKU1fydoFaUzfBczFfEfUXImL
         0VJ8Im8B0nyvlaPTl7iMb4elx0BOrHk/FIYpdVharUrbh4g/89dMWovWJrq6h4fUeNd0
         y/KncAv1cuc1XhThcsEEAffNpYhc1gKQuxpXiLG/iK9CswnsfKqEGSfzSR397vX+VDyE
         Nn6xpRKARvu59ZH6c3IZmkumBkrr3irmq3qfpBdA9PV3/FLKSpTrxFQkmFakdR738biA
         frjl1QCcoTjf/CLK0YhSb7EXnLUFXwkSuNQD9BGDNdXKFgFNL5yIZTXYIW77EPtSdduQ
         cTLw==
X-Gm-Message-State: AC+VfDz8GJJg9aGO1VmQ2mojMu2jAi1uPVdctKdn8QF5lbe/j1VQv2d7
	n+XMz99ZPBQkckQmfZEBGoC+QcvtRf+aRWy55t4=
X-Google-Smtp-Source: ACHHUZ4vAfQlmJ7RM5hpa9lfhQmwODVOz8ZrLcbg67FYoZxRyEjg0GHHAYRoKRFW/0UTADg9ocwanQ==
X-Received: by 2002:a05:6512:551:b0:4f8:675c:3667 with SMTP id h17-20020a056512055100b004f8675c3667mr10591312lfl.21.1687531221826;
        Fri, 23 Jun 2023 07:40:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 48/55] python3-custom-inherit: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:14 +0200
Message-Id: <20230623143921.146338-49-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103544

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-custom-inherit_2.3.1.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
index c0e10448e..8ff3b9e3d 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
@@ -8,3 +8,8 @@ PYPI_PACKAGE = "custom_inherit"
 SRC_URI[sha256sum] = "a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-json \
+    python3-stringold \
+"
-- 
2.39.2


