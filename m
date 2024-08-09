Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D55AC531DF
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.88283.1723221139734709773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GpZA48Q7;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368313809a4so1945164f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221138; x=1723825938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIcChNfDiuK+kopr0SgGIRFFlMKcUVTjosuLwW1lIUU=;
        b=GpZA48Q7ZOTRjYBZKfrlTZggMH+Bn5+4zjfYx1NMzS4XX5/25DXdGyvMckiNvGKM/L
         tHSI1DayGZTR8yDNeCAaOoKQHY2ljyj08gXDUQrQTBJ7QOcSwxVSBrYmk0Gditl0zx/w
         jVwC207fJmJj/AqX0X4MEqa4kX+C8PN4hrruzZtHiCstVEBbp2abwxaOFJxhml5MWzAi
         qAi52+a4hGyXT2sgXvXwXMUNKQgKuxgS0ORo6yQs/pGAcmC69VFT9HR6j8dp55M+YvrB
         EoGSd8XUKH3gNFLfDDos5+PysZkjzBfcKL8g0tMOEZgY4xS6NZ17ha84QIwejouB5LOF
         J9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221138; x=1723825938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIcChNfDiuK+kopr0SgGIRFFlMKcUVTjosuLwW1lIUU=;
        b=UXpqMbCKoKGTE06m1nSikoRUEWpsrlA64c8VWjFSv/GCN5rvtlhP9zkM+88gMDtSX5
         MzAxJYDuIsz43IdiTXi2EHx0PwG84Kk1cqfrTPeznytEaRDwvqoy41kXX93mlPANBmXA
         vcGvVVIZQhb0+7wAVii5xr5lFEq/SsbPNhyL9ufLd+AoZn+hVGPKC6lBEyLf6ohRZx/y
         EBsnlOM/65/FzUEKkoq40xAcglBpYq+23zEmWHAOP6oJ0x/4rGu4anwwK0wgafy2m8QW
         A6kfxt77qA96I2tBFLCLcLp12MljAAz5JedpDB0fgqqk/lIiGXW+HVYEXLwpT1FKf40f
         OhVg==
X-Gm-Message-State: AOJu0YzmUtnHPOj0PqsvHV5C3/RJUZRvnmXh9NsUeJ7WhHOxS2DT9aDR
	iM6E+RzUnT6TEY+u857YfA4o+TzE5n6+wjEg+CXsxH29mMud7vl4I+dPHH+s
X-Google-Smtp-Source: AGHT+IFBN0rJhdlkn2zB0bHus6cM7fyOlwBg0cmYQRmhEfOdUCENYNavY3LWYDeMcegjt/xl/1iEdg==
X-Received: by 2002:a05:6000:1051:b0:367:940b:b662 with SMTP id ffacd0b85a97d-36d6a758fd8mr1711031f8f.31.1723221137689;
        Fri, 09 Aug 2024 09:32:17 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:17 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 05/12] python3-pytest-metadata: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:54 +0300
Message-Id: <20240809163101.8416-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111716

- The project has a proper pyproject.toml which declares the poetry.core.masonry.api PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as pytest-metadata, it is by default.

Fix:

WARNING: python3-pytest-metadata-2.0.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with poetry.core.masonry.api, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-metadata_2.0.2.bb  | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
index 163a363f8..9243f6646 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI[sha256sum] = "fcd2f416f15be295943527b3c8ba16a44ae5a7141939c90c3dc5ce9d167cf2a5"
 
-PYPI_PACKAGE = "pytest-metadata"
-
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = " \
     python3-pytest \
-- 
2.25.1


