Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DE5CCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 08:40:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.38159.1727340009073857961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 01:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JMGxI4MM;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so5605625e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727340007; x=1727944807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxnBemimoqHve4tGWHYUJFJ+DvPvRs8WaLoe0xm4PAA=;
        b=JMGxI4MM26fwWezmOv2vyFYj44a9/h44LJYmlgfNUBHLPUDcwmlgCWaj5XRDe3j3zw
         FQP+WseC3ipQ4J1L2xDTta8wPDbbT+gFT85unP+8JOa7fnNdelpR+KFvPqCQP31v32gJ
         Q3+0iwPU7PK0t4Tt6ep4n9CE5L4yF9uTKY6HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727340007; x=1727944807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxnBemimoqHve4tGWHYUJFJ+DvPvRs8WaLoe0xm4PAA=;
        b=QBqu+7y2cEYDE1Fru3V/5fTNPJfC+bjkyaJFN/Vy8/cm1YXP7aOcMif3TRYhIS3Dd7
         4eZ0zSH9U9dNSlgzdXd+UVEib+darwNtMq6Brl2JsfXlj0SP3EBMvTAk5eyevGwQDebb
         NJ14MMlNERoRl6dWTIJBYZrV+vle5+Sk/bzRs0mxqDE18e2Z1B0IJP6S7N9M/U5Q3jDD
         lb0vI/aeugl8z8ydc6NF6FQ0vpM3G3Aqq8V3rmfpvuuaVaeN1aos9IL2WrSO2TPkGQTG
         YwDLnbU5XCDKfuiI9ov6jBImhB3Ow1L3mDtVIEQF62x/S62RdBXmSGxYj1L2C2au8pIk
         Cf3w==
X-Gm-Message-State: AOJu0YzMba3eGjKirk6ywJAyOO0aWoQ8pasJ/qmLQJ42JsMFlheHgosZ
	5jeZrhETKIXXQOmapFb/N79Bya2DX5DL5HpbmVzTsKR7G6gmJn/7d275RLGWPN0bMnv+7ontyq1
	E
X-Google-Smtp-Source: AGHT+IHl1nyk5cXoEI3Yfg+iqvouIDX8nnk5Sku5aOODe8lnKOKeN37KQU5nUHJcC//8Q0lBcirRPA==
X-Received: by 2002:a05:600c:1c05:b0:426:6158:962d with SMTP id 5b1f17b1804b1-42e961445d3mr35888735e9.23.1727340006864;
        Thu, 26 Sep 2024 01:40:06 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e902560cfsm73389375e9.0.2024.09.26.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 01:40:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] polkit: Update Upstream-Status of a merged patch
Date: Thu, 26 Sep 2024 10:39:46 +0200
Message-Id: <20240926083946.3733569-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 08:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112511

From: Yoann Congal <yoann.congal@smile.fr>

https://github.com/polkit-org/polkit/pull/497 was merged as
https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../meson-build-Support-openembedded-OS-for-PAM-config.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
index cc396dfa3b..54c0fb040f 100644
--- a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
+++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
@@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not mentioned in the
 code.
 
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Submitted [https://github.com/polkit-org/polkit/pull/497]
+Upstream-Status: Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2]
 ---
  meson.build       | 2 +-
  meson_options.txt | 2 +-

