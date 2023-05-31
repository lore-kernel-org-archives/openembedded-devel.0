Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51240C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9135.1685521858521079085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=sPBlC904;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so56193825e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521861; x=1688113861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nCV5KD6XW6yTbI9PAAmsGBuiDFA7txQU9zx6dOCYnw=;
        b=sPBlC904XanGEpdQ3sDO+NC1O0XiCHFt2RHRBPUsE6XbFcd5c+gmpgNOcQTswWfD/g
         vEMANiGvstcZMWmIO3rtIIDSc1tVhdWzW9lIk75QLfFoT2sg/WVtt8kGjQHSxe8xHOaF
         CyTnJJbSK0hQVD9dFMmZI5GOvjjnaEpuIFXy5rDRcVAl7ylNExsk8q93j9uqi8J5vajH
         8JHYaEKQQCHDbaobOVdCuUBu183Qr96Ddc6Q0sdKYctucy8gGy7SM/LzUo7+5bfWBtgj
         2YL9DJYiVLUoiwEZm7hI9PnjO03InkesPooRPBOduhxd005Ou+Av2OFbLHmd1xJrnmYO
         rrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521861; x=1688113861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nCV5KD6XW6yTbI9PAAmsGBuiDFA7txQU9zx6dOCYnw=;
        b=fFQ4X1FKlH+0HUXkDWlgwJN3TNxBGrhMNHREXIzZkdvsrvuda/YRpD0431jh4od7Yq
         EPlFWRCMWmrHIkuTNFjT16CIDemkDpeAvTZaI7YKU5S+3zQrqRJaO35ErW9iNgy4T5Cn
         y/igAS2u5swwamXcfRmMdK/aYFoNSVUCjxwZ2bJ3NCCRpYkpaNgKXL169BdkcfCI2Tci
         vLw9X+TZ2nSNfPC/UrSQi13/484a4bU1D4KGZDhfvMs6tdmKuQUQJIQvOIR52Rt+Bk4I
         zGRv8fBuWVRwRH78ecZvCQXe/cTZ7GTP5LBW3C+HNFKlnHCQx9lIlNveAvnCcBZ3gUkt
         GT5w==
X-Gm-Message-State: AC+VfDysQfH0UcoPALyWmneAaPEWRhDGRf9gBqtHCjwiOfMm3FrcIqsJ
	WF19qqmJXBMP6au80VmAW37cxw==
X-Google-Smtp-Source: ACHHUZ74GkBKSFw1IS/2mbxWpvXKIN+zvE8ZyO/vgNIjoNw/CkLd4Jv25kJiUmx7KtyxmA7qSkN3yw==
X-Received: by 2002:a7b:c44a:0:b0:3f4:2c71:b9ad with SMTP id l10-20020a7bc44a000000b003f42c71b9admr4406613wmi.30.1685521860864;
        Wed, 31 May 2023 01:31:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:31:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 097/149] python3-nmap: add missing run-time dependencies
Date: Wed, 31 May 2023 10:29:12 +0200
Message-Id: <20230531083004.11083-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103023

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index 030f03348..52c62cde3 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -59,4 +59,8 @@ do_install:append() {
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
 
-RDEPENDS:${PN} += "python3-core"
+RDEPENDS:${PN} += " \
+    python3-difflib \
+    python3-asyncio \
+    python3-xml \
+"
-- 
2.39.2


