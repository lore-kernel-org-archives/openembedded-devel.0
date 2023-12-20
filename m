Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F70C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 23:06:34 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.35051.1703113586157524694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 15:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35d72bc5cf2so722995ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703113584; x=1703718384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKA1H5PWCW2brXdTMwDN+M5SKVEln3kYjrZi60vVHJs=;
        b=rRWDy7UuSgpit6l1osZmYIFcY32sLyqe4VURRfQVPqeLJHJzh1j1RhGRxxcRBDspZ8
         kXwo3uuOI/S7IaOsambweqmc/uASfhy8QIAugYHt/QIBH7JcN7F7pQhiM9p4ShQrCj9l
         gXHPfKKBakEaIypIPB+7xoFKDatD8QJGmfbOStS9jwGlr7v/dP7yVidpO3ZQa3j6FT6/
         0IaFGVH1iYnjIFhjmSVB20IYIOakwU1zsflEqdcDQsYll0R1HR6xyBzomMCD3YZFl45O
         DygVZfjLExNOgTvFxHNuOxcfzzWfun6Z747rkj51UBD9rI7M9i7cb35Z1owY7A7VQYG2
         4+JQ==
X-Gm-Message-State: AOJu0YxLcc3XcKL6Stjch5cGqDGyjPCbgcXUBT3idCIBIdDwPdrDTPqK
	alS5pK+kju/2MVc5B4DlvOk87l1GhkBbRw==
X-Google-Smtp-Source: AGHT+IFtFPIR04QDEySwBYStnQO78H+WaMtJ5uTWkTOfXJbnI/T6e35vLtnu9R8rmmmFfxRnkgkJMA==
X-Received: by 2002:a05:6e02:1bad:b0:35d:62f2:1f45 with SMTP id n13-20020a056e021bad00b0035d62f21f45mr33682714ili.20.1703113584587;
        Wed, 20 Dec 2023 15:06:24 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw15-20020a056638460f00b0046ce740b187sm82516jab.21.2023.12.20.15.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:06:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cantools: update to version 39.4.0
Date: Wed, 20 Dec 2023 23:06:18 +0000
Message-Id: <20231220230618.3833009-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 23:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107688

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-cantools_39.3.0.bb => python3-cantools_39.4.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.3.0.bb => python3-cantools_39.4.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.3.0.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-cantools_39.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.0.bb
index 0b590d258..e7cafe14b 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.0.bb
@@ -3,12 +3,14 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "2c3d081922591bc1611c9f1ff52d6c8af1d03314f8c724cc114d856cc555cc28"
+SRC_URI[sha256sum] = "e38cf3972388436aa8e19ab985bfb19c2cb400d9ba882a5c070c3497629674cb"
 
 PYPI_PACKAGE = "cantools"
 
 inherit pypi python_poetry_core
 
+DEPENDS += "python3-setuptools-scm-native"
+
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-can \
     ${PYTHON_PN}-bitstruct \
-- 
2.34.1


