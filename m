Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCF9EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.215.1687531219817975765
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=PzmJ7eyX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f90b8acefdso8218445e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531218; x=1690123218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn/EdUsGtb3p5TDTeblzFPabIHQpK1kWXEsORjaaWLc=;
        b=PzmJ7eyXJlvsID14X6O8j48OtkP29tFJzmEo6Yt4DjLMsuZkM8A1WmTBlz9kAZchQb
         ec3RV5gEmFax7lUJ/Nl1WL6g0+TqRZc8+gjsVrAJFUJan0Fgm3iY9cu+iVPvhJXJweqy
         205DIkzRo+UOWEIb32iyn+Sb9ilXqSwDcpwXP0QRXEOy2Pp/l2+q+TqDCnQzjEf2sA5s
         tgvGIFmowCO6B9CQydPohlO0/moD7vgDq4ttPS6Lfy/ZzTRi1MUjz/QP+p0QNYaqgw9w
         2nAYswDX4WhP4EB/3Fb7lX9Fvaus01xQDXxbx6+ChgleesMINMkyzRIsEgEYgIxToW51
         LH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531218; x=1690123218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn/EdUsGtb3p5TDTeblzFPabIHQpK1kWXEsORjaaWLc=;
        b=cZgkB/JuimA3AggeVSz3d3TSKqDJq/a391Ybw4ETHNozsNCeCMywNqxYDQY0NNL3my
         X6BZ9/mZaamCg64B0ZxlAxNlrw68r0iCs9QB3MA9gBup+0PoGtgKIsigZjMz33Pz1eBy
         QF84fu4uuGe+9t83Fgre/P8fhhigBI7wFc5Ym34Lu7CxjtAyG04RTz7kl+FRkUImpJEe
         crKUmCvgXQxpRNBHwJMLpdJVdgWK7B4x51wu14gQ9ggcFbHyUQ4twCg7Yd/BG3qI/hxW
         aGT2MhSCvHbMCVDzz8EdmGA42qEDoEejhcrWeJYvKydc47G/KxEFOLJHkx50gHVTKGHT
         xB1g==
X-Gm-Message-State: AC+VfDxColUODhMFQ8A0+x7N+b5JlFaOMFVij2/x+51RPzV/WtypfVT9
	l/BfWkcbSc0PU9SH4AhMNeRIFTkI0vBpzFIHyNM=
X-Google-Smtp-Source: ACHHUZ4OE/oFjKrifNdyruP7+nuzNrg38F9nq8tCJ3mU6ciTPoN+XuclO3KgHFlqfF/FYpRg+8oIiQ==
X-Received: by 2002:a05:600c:d7:b0:3f9:b1e7:8a47 with SMTP id u23-20020a05600c00d700b003f9b1e78a47mr10317263wmm.1.1687531218404;
        Fri, 23 Jun 2023 07:40:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 45/55] python3-configobj: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:11 +0200
Message-Id: <20230623143921.146338-46-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103541

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
index fa9424a51..8dc706fdf 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-pprint \
     python3-six \
 "
-- 
2.39.2


