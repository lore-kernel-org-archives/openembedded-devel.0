Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1D6C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 18:52:50 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.14915.1700160762798673912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 10:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjdLLxev;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso157486066b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700160760; x=1700765560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jKb0TIpSX6rXCyCAqXzTwIoDu2gLpVJuPV43ZYBKD4=;
        b=LjdLLxevaRH+h4uno03FAdgf81IhpsgsqyRwFywbIBQRBd6lDULs0mPUC83bffWcNV
         smAQstw6NYgPGfO2eEtqJ1oMbHUN8w7BN8cpgXCp0PBFUdY4TblYbmCsSOj5eVQn4HuC
         4SHWODN9kKBHQGQmFPbOC+ukIt6sxFIEAwtuRzMFZ1UVHjPvSkrfl1qsmXmOQbzUGhNT
         +DViDxKtWf5FedUUDuBUTnrDCeqXUs3Ehs8fjSmoHRaROIVIPhIvG6qeGijo7t2JMmRp
         5sFopD3RmD0tIKB/J6Jd74bzTlKEjykvvTrBNm3Hwc0yo5HXKwOhdBGgeP9fKlj1a5wp
         qHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700160760; x=1700765560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jKb0TIpSX6rXCyCAqXzTwIoDu2gLpVJuPV43ZYBKD4=;
        b=qfdTSLRxfpSDxLA9M3tv7ZEegXsxiTi7MomRMk1FrHeMcBUsiLfRGWApJZ9ABwiEfr
         LdZ5PvCKe4pbVwWz8xWH1GHuUblk7vK0xefSA4dFbmR5zKYhrjN58wGCjYtsstO92Alv
         x9SsLj0rt0cM+vU5xqqesZhhQmrjrHrK95LHO8cn79B+uzl2mCvGuxC+WZ4xDGB6upA/
         6W83rAEt+e8mh+5MjI/fXeNMdqwSB4u8tT7ISUPhooD3puVYKV6vE1mbOHqh856DxAYJ
         nWg7lGPASwz+JPrbaxw59cbRTi+yhy7fM2+UOYn4oCOm0h9KeWDZDxI8RMfHFMAGdwom
         Z6jg==
X-Gm-Message-State: AOJu0Yx+uwmbnB+hNkMvjZ7Ee+luOcIQiT8bVEeO3mUTcAFHtnCJEpKP
	+Il3Mlsooqpuodn1EV58reT9pGod/+6hdQ==
X-Google-Smtp-Source: AGHT+IESK2BEHXXrzHvSN1AegNJAJpJ/FGv6Nty4VfQmMZK3+23NV9wyXzc6kOBm2bofw+daV6NrHw==
X-Received: by 2002:a17:906:6b87:b0:9e3:5c27:8862 with SMTP id l7-20020a1709066b8700b009e35c278862mr13451661ejr.27.1700160760356;
        Thu, 16 Nov 2023 10:52:40 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id ov3-20020a170906fc0300b00977cad140a8sm8762217ejb.218.2023.11.16.10.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 10:52:39 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] gst-editing-services: upgrade 1.20.5 -> 1.22.7
Date: Thu, 16 Nov 2023 21:52:30 +0300
Message-Id: <20231116185230.1445287-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 18:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106825

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...ting-services_1.20.5.bb => gst-editing-services_1.22.7.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.20.5.bb => gst-editing-services_1.22.7.bb} (88%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
similarity index 88%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
index 6b7775c1c..50d45ef57 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
@@ -18,9 +18,11 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "363f2b13675877b926b4be5259dbbeea8cc976805b40c871fc254bb8f382017d"
+SRC_URI[sha256sum] = "fec56a2c37a253cd048d288d4c7eda6eff191022b09db975e07a2c105d1b521e"
 
 PACKAGES += "gst-validate-launcher libges"
 
 FILES:gst-validate-launcher = "${nonarch_libdir}/gst-validate-launcher ${datadir}/gstreamer-1.0/validate"
 FILES:libges = "${libdir}/gstreamer-1.0/*.so"
+
+FILES:${PN} += "/usr/lib/python${PYTHON_BASEVERSION}"
-- 
2.25.1


