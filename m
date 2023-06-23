Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B47C001DF
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.184.1687531194968783952
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=QaeaQaYt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f90b8acefdso8213995e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531193; x=1690123193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBJQwLw41lnnf4j9n85tizdA5x7KTwMGFRs2qPVLS6M=;
        b=QaeaQaYtXcDHNBVHY0sGzwMzkINFd3XU/vHKCBjK66mz6x5kupj2X4n6xpp7rDLadc
         hEwcZzbYT4/e4/OX+22PWZlTMNpa6ecGbUARBwzElozJXxG0MJDl2dyvgKGdiI66rNR5
         F7/130/dELAtxVTSR+4m8z6ITPPHlV7QEAs0u0pKPr5ijHYWOnBWiwEPrwB4eO7GCTx7
         z2xJePQMSRm5KnUiaXT9BMAuxte5tNggVnNx4DB/VpO9Wj7fO/Zd0Stn7Zjh8F5FyQHM
         RprmfD4MHjeESxSIpZpeABLi0486Zba8w6XekVuc8xTyJQLrpsRWFv84KLYxeIitj/fx
         0uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531193; x=1690123193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBJQwLw41lnnf4j9n85tizdA5x7KTwMGFRs2qPVLS6M=;
        b=S+alRS7oloG+x2yLQCgL7Xx7gcnpkPQz3HQouxTgOKQU4xrCm6mfWaiyThrieyURNQ
         OjRFmWh7vUKrKNvtLPi0ojmNc/L1Gcr+I1X/hk88Aa2HILqQiMkOI3GOIeNDHx7EZ5tl
         /Fp/e09jIGkiAbwO3nbrlJzzIO4ePjy3d1vNC8ew3ex97RH2OcghTd/dVsexQmd6KmQR
         Ob0ITwB2VnSy/TCL9NOfHPDowkoVHaASuajQUSUc1x3HxGvLS1sMTFXftdFltE0S6C7i
         t1ji0CkMcBzSJq00/P/4o8I0MEQtCPhZMwtfdgjXvvjZ+mg/7KqcDDubJsWGzRXcv9b6
         543w==
X-Gm-Message-State: AC+VfDy7WDKCOCohAV28Q+y/1un4uQH/QbZjMw8yD3tMlSbtpa/2cgej
	BO1mJlqoUhjJrujIAILxKmbrlw==
X-Google-Smtp-Source: ACHHUZ7ayBLjmHKKcHc71CVJ3I0Fv5G0Kk6+vXEildARVN+aUz+U3rKq9+NJqpIPRCAlguvFJ06kMw==
X-Received: by 2002:a7b:cd97:0:b0:3f9:a6f3:f23d with SMTP id y23-20020a7bcd97000000b003f9a6f3f23dmr11409726wmj.13.1687531193546;
        Fri, 23 Jun 2023 07:39:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 22/55] python3-hpack: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:48 +0200
Message-Id: <20230623143921.146338-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103518

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
index afba98e4b..0297cb8c2 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "27e01514ef06dc9fa0798d3dcb7de47c"
 SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-logging"
-- 
2.39.2


